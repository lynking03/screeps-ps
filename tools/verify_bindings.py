#!/usr/bin/env python3
"""Static checks for the generated Screeps bindings (verification layers 1 and 2).

Run from the project root after the worker loop (and before or after facades):

  python3 verify_bindings.py [--manifest tasks/manifest.tsv] [--runs runs.jsonl]
                             [--allow-missing] [--notes-full]

Layer 1, per task in the manifest:
  coverage   every function the naming rules derive from the spec's signatures
             is exported; unexpected exports are flagged
  arity      each function takes as many arguments as its spec variant implies
  shape      Effect / ReturnCode / Either / Maybe match the doc's cost and
             "Return value" text
  ffi        every foreign import has a JS export with matching arity; curried
             multi-argument imports and thunk mistakes are flagged
  lint       ?. ?? / globals read at module top level / `arguments` /
             typeof outside Either impls / null or undefined passed as filler
Layer 2, across all tasks:
  the same doc parameter name, or the same property name, given different
  PureScript types in different places
Also collected: every `-- NOTE:` comment, and MISSING items from runs.jsonl.

Exit status 1 if any ERROR was found. Standard library only. No model involved.
The naming rules mirrored here are the ones in binding-writer.md; if you change
one, change the other.
"""
import argparse
import csv
import json
import re
import shlex
import sys
from collections import Counter, defaultdict
from pathlib import Path

TAG_RE = re.compile(r"^\{% (api_property|api_method) ")
KEYWORDS = {"ado", "as", "case", "class", "data", "derive", "do", "else",
            "false", "forall", "foreign", "hiding", "if", "import", "in",
            "infix", "infixl", "infixr", "instance", "let", "module",
            "newtype", "of", "then", "true", "type", "where"}
# docs title -> Screeps.Types name, where they differ
TYPE_NAMES = {"StructureSpawn.Spawning": "StructureSpawnSpawning",
              "Room.Terrain": "RoomTerrain",
              "PathFinder.CostMatrix": "CostMatrix"}
BASE_PARAMS = {"target", "pos", "pos1", "topLeftPos", "type"}
OBJECT_OPT_NAMES = {"opts", "style"}
# optional boolean flags that change the return type: the suffixed variant fixes
# the flag to true and takes no argument for it (lookAtAreaAsArray, getEventLogRaw)
RETURN_FLAGS = {"asArray", "raw"}
GLOBALS = r"(Game|Memory|RawMemory|InterShardMemory|PathFinder)"


# ---------------------------------------------------------------- reporting

class Report:
    def __init__(self):
        self.items = []  # (level, where, message)

    def add(self, level, where, msg):
        self.items.append((level, where, msg))

    def count(self, level):
        return sum(1 for l, _, _ in self.items if l == level)


# ---------------------------------------------------------------- spec side

class Member:
    def __init__(self, block):
        lines = block.splitlines()
        tag = lines[0]
        inner = tag.strip()[2:].rstrip("%} ").strip()
        try:
            toks = shlex.split(inner)
        except ValueError:
            toks = inner.split()
        self.kind = toks[0]
        self.name = toks[1] if len(toks) > 1 else "?"
        rest = toks[2:]
        self.sig, self.cost = "", None
        if self.kind == "api_method":
            if len(rest) >= 2:
                self.sig, self.cost = rest[0], rest[1]
            elif len(rest) == 1:
                self.cost = rest[0]
        self.param_types = {}
        m = re.search(r"\{% api_method_params %\}(.*?)\{% endapi_method_params %\}",
                      block, re.S)
        if m:
            for entry in re.split(r"\n===\n", "\n" + m.group(1).strip() + "\n"):
                first = entry.strip().splitlines()[0] if entry.strip() else ""
                pm = re.match(r"(\w+)(?: \(optional\))? : (.*)", first)
                if pm:
                    self.param_types[pm.group(1)] = pm.group(2).strip()
        ret = block.split("### Return value", 1)
        self.returns = ret[1] if len(ret) > 1 else ""
        self.has_codes = "{% api_return_codes %}" in self.returns
        self.value_or_error = bool(re.search(r"or one of the following error codes",
                                             self.returns, re.I))
        self.nullable = bool(re.search(r"(?<!false )\bor (`?null`?|`?undefined`?)\b",
                                       self.returns, re.I))

    @property
    def is_static(self):
        return "." in self.name or self.base_js == "constructor"

    @property
    def base_js(self):
        return self.name.split(".")[-1]


def parse_spec(path):
    text = Path(path).read_text(encoding="utf-8")
    body = text.split("## Members", 1)[-1]
    blocks, cur = [], None
    for line in body.splitlines():
        if TAG_RE.match(line):
            cur = [line]
            blocks.append(cur)
        elif cur is not None:
            cur.append(line)
    return [Member("\n".join(b)) for b in blocks]


def pascal(s):
    return s[:1].upper() + s[1:]


def parse_variant(v):
    params = []
    for p in v.split(","):
        p = p.strip()
        if not p:
            continue
        opt = p.startswith("[") and p.endswith("]")
        params.append((p.strip("[]").strip(), opt))
    return params


def expected_functions(m, title):
    """[(name, [param names] or None for properties)] per binding-writer.md rules."""
    base = m.base_js
    if base == "constructor":
        base = "new" + TYPE_NAMES.get(title, title.replace(".", ""))
    if base in KEYWORDS:
        base += "_"
    if m.kind == "api_property":
        return [(base, None)]
    variants = [parse_variant(v) for v in m.sig.split("|")] if m.sig.strip() else [[]]
    out = []
    for params in variants:
        names = [p for p, _ in params]
        suffix = ""
        if len(variants) > 1:
            if "x" in names or "x1" in names:
                suffix = "XY"
            elif BASE_PARAMS & set(names):
                suffix = ""
            else:
                common = set.intersection(*[{p for p, _ in v} for v in variants])
                distinct = [p for p in names if p not in common]
                suffix = pascal(distinct[0]) if distinct else ""
        required = [p for p, opt in params if not opt]
        optionals = [p for p, opt in params if opt]
        opts_param = None
        if optionals and params[-1][1]:
            last = params[-1][0]
            ptype = m.param_types.get(last, "").strip()
            # only a plain `object` counts; `object, function` (a filter) is a
            # positional optional whose function form is bound (nameFilter)
            if last in OBJECT_OPT_NAMES or re.fullmatch(r"object(<[^>]*>)?", ptype):
                opts_param = last
        positional = [p for p in optionals if p != opts_param]
        stem = base + suffix
        for i in range(len(positional) + 1):
            name = stem + "".join(pascal(o) for o in positional[:i])
            plist = required + [o for o in positional[:i] if o not in RETURN_FLAGS]
            out.append((name, plist))
            if opts_param:
                out.append((name + "'", plist + [opts_param]))
    return out


# ---------------------------------------------------------------- purs side

def split_top(s, sep):
    parts, depth, cur, i = [], 0, [], 0
    while i < len(s):
        c = s[i]
        if c in "([{":
            depth += 1
        elif c in ")]}":
            depth -= 1
        if depth == 0 and s.startswith(sep, i):
            parts.append("".join(cur))
            cur = []
            i += len(sep)
            continue
        cur.append(c)
        i += 1
    parts.append("".join(cur))
    return parts


def strip_parens(t):
    t = t.strip()
    while t.startswith("(") and t.endswith(")") and len(split_top(t[1:-1], "->")) >= 1 \
            and balanced(t[1:-1]):
        t = t[1:-1].strip()
    return t


def balanced(s):
    d = 0
    for c in s:
        d += c in "([{"
        d -= c in ")]}"
        if d < 0:
            return False
    return d == 0


def analyse_type(t):
    """-> (constraints {var: label}, [arg types], result type)"""
    t = " ".join(t.split())
    m = re.match(r"forall\s+[^.]*\.\s*", t)
    if m:
        t = t[m.end():]
    *cons, body = split_top(t, "=>")
    constraints = {}
    for c in cons:
        toks = c.strip().strip("()").split()
        if not toks:
            continue
        if toks[0] == "Union" and len(toks) >= 4:
            constraints[toks[1]] = "opts"
        else:
            for v in toks[1:]:
                constraints.setdefault(v, toks[0])
    pieces = [p.strip() for p in split_top(body, "->")]
    return constraints, pieces[:-1], pieces[-1]


def norm_arg(a, constraints):
    a = strip_parens(a)
    if a in constraints:
        return "<" + constraints[a] + ">"
    if re.fullmatch(r"[a-z]\w*", a):
        return "<unconstrained>"
    m = re.fullmatch(r"Record (\w+)", a)
    if m and constraints.get(m.group(1)) == "opts":
        return "Record<opts>"
    return a


def parse_purs(text):
    exports = []
    m = re.search(r"^module\s+[\w.]+\s*\((.*?)\)\s*where", text, re.S | re.M)
    if m:
        for e in split_top(m.group(1), ","):
            e = e.strip()
            if re.fullmatch(r"[a-z_][\w']*", e):
                exports.append(e)
    decls, foreign = {}, {}
    lines = text.splitlines()
    i = 0
    while i < len(lines):
        dm = re.match(r"^(foreign import\s+)?([a-z_][\w']*)\s*::\s*(.*)$", lines[i])
        if dm:
            t = dm.group(3)
            j = i + 1
            while j < len(lines) and lines[j].startswith((" ", "\t")) and lines[j].strip() \
                    and not lines[j].strip().startswith("--"):
                t += " " + lines[j].strip()
                j += 1
            (foreign if dm.group(1) else decls)[dm.group(2)] = (t, i + 1)
            if dm.group(1):
                decls[dm.group(2)] = (t, i + 1)
            i = j
            continue
        i += 1
    return exports, decls, foreign


# ---------------------------------------------------------------- js side

JS_FN_RES = [
    re.compile(r"^export const (\w+)\s*=\s*(?:async\s+)?function\s*\w*\s*\(([^)]*)\)"),
    re.compile(r"^export const (\w+)\s*=\s*\(([^)]*)\)\s*=>"),
    re.compile(r"^export const (\w+)\s*=\s*(\w+)\s*=>"),
    re.compile(r"^export function (\w+)\s*\(([^)]*)\)"),
]


def parse_js(text):
    """{name: (arity or None for a non-function value, line no, full def line)}"""
    out = {}
    for n, line in enumerate(text.splitlines(), 1):
        for rx in JS_FN_RES:
            m = rx.match(line)
            if m:
                params = [p for p in m.group(2).split(",") if p.strip()]
                out[m.group(1)] = (len(params), n, line)
                break
        else:
            m = re.match(r"^export const (\w+)\s*=", line)
            if m:
                out[m.group(1)] = (None, n, line)
    return out


# ---------------------------------------------------------------- checks

def load_skip(values):
    """Same format as split_specs.py plan --skip: Title:member entries or files of them."""
    skip = set()
    for value in values or []:
        lines = Path(value).read_text(encoding="utf-8").splitlines() \
            if Path(value).is_file() else [value]
        for line in lines:
            line = line.split("#", 1)[0].strip()
            if line:
                skip.add(line)
    return skip


def is_skipped(title, member_name, skip):
    return (f"{title}:{member_name}" in skip
            or f"{title}:{member_name.split('.')[-1]}" in skip)


def check_task(row, rep, observations, notes, skip=frozenset()):
    key, title, purs, js = row["key"], row["title"], row["purs"], row["js"]
    members = [m for m in parse_spec(row["spec"])
               if not is_skipped(row["title"], m.name, skip)]
    ppath, jpath = Path(purs), Path(js)
    if not ppath.exists():
        rep.add("MISSING", key, f"{purs} not generated")
        return
    ptext = ppath.read_text(encoding="utf-8")
    jtext = jpath.read_text(encoding="utf-8") if jpath.exists() else ""
    if not jpath.exists():
        rep.add("ERROR", key, f"{js} missing")
    exports, decls, foreign = parse_purs(ptext)
    jsdefs = parse_js(jtext)
    for n, line in enumerate(ptext.splitlines(), 1):
        nm = re.search(r"--\s*NOTE:\s*(.*)", line)
        if nm:
            notes.append((f"{purs}:{n}", nm.group(1).strip()))

    # coverage, arity, shape
    expected_all, bases = set(), set()
    for m in members:
        exp = expected_functions(m, title)
        bases.add(exp[0][0].rstrip("'"))
        for name, plist in exp:
            expected_all.add(name)
            where = f"{key} {m.name}"
            if name not in exports:
                rep.add("ERROR", where, f"missing export `{name}`"
                        + (f" for ({', '.join(plist)})" if plist is not None else ""))
                continue
            if name not in decls:
                rep.add("WARN", where, f"`{name}` exported but no type signature found")
                continue
            t, _ = decls[name]
            cons, args, result = analyse_type(t)
            obj = 0 if m.is_static else 1
            if m.kind == "api_property":
                if len(args) != obj:
                    rep.add("WARN", where, f"`{name}` takes {len(args)} args; "
                            f"a {'static' if obj == 0 else 'object'} property implies {obj}")
                eff = result.startswith("Effect")
                if m.is_static and not eff:
                    rep.add("WARN", where, f"global property `{name}` is not Effect")
                if not m.is_static and eff and m.base_js != "memory":
                    rep.add("WARN", where, f"object property `{name}` is Effect (rules say pure)")
                observations["prop"][m.base_js].append((norm_arg(result, cons), where))
                continue
            want = len(plist) + obj
            if len(args) != want:
                rep.add("ERROR", where, f"`{name}` takes {len(args)} args; spec variant "
                        f"({', '.join(plist)}) implies {want}")
            else:
                for pname, a in zip(plist, args[obj:]):
                    observations["param"][pname].append((norm_arg(a, cons), f"{where} `{name}`"))
            needs_eff = (m.cost == "A" or m.has_codes or m.is_static) and name != "newRoomPosition"
            if needs_eff and not result.startswith("Effect"):
                lvl = "ERROR" if (m.cost == "A" or m.has_codes) else "WARN"
                rep.add(lvl, where, f"`{name}` returns `{result}`, expected Effect")
            if m.value_or_error and "Either ReturnCode" not in result:
                rep.add("ERROR", where, f"`{name}` returns `{result}`; doc says value or "
                        "error code -> Either ReturnCode")
            elif m.has_codes and not m.value_or_error and not result.endswith("ReturnCode"):
                rep.add("WARN", where, f"`{name}` returns `{result}`; doc lists only return codes")
            if m.nullable and "Maybe" not in result and "Nullable" not in result:
                rep.add("WARN", where, f"`{name}` returns `{result}`; doc says it can be null")
    for e in exports:
        if e in expected_all:
            continue
        if e.endswith("Impl") and e in foreign:
            rep.add("ERROR", key, f"exports internal FFI import `{e}` (remove it from the export list)")
            continue
        if any(e.startswith(b) and len(e) > len(b) and e[len(b)].isupper() for b in bases):
            rep.add("WARN", key, f"extra export `{e}` (a union split? check it)")
        else:
            rep.add("WARN", key, f"unexpected export `{e}`")

    # ffi
    for name, (t, ln) in foreign.items():
        where = f"{purs}:{ln}"
        if name not in jsdefs:
            rep.add("ERROR", where, f"foreign import `{name}` has no JS export")
            continue
        jar, jln, jline = jsdefs[name]
        cons, args, result = analyse_type(t)
        head = strip_parens(result).split(" ")[0]
        fm = re.fullmatch(r"(Effect)?Fn(\d+)", head)
        if not args and fm:
            want = int(fm.group(2))
        elif not args and head == "Effect":
            want = 0
        elif not args:
            want = None
        else:
            want = 1
            if len(args) >= 2:
                rep.add("ERROR", where, f"`{name}` is curried with {len(args)} args; "
                        "use FnN / EffectFnN")
            if result.startswith("Effect"):
                rep.add("WARN", where, f"`{name}` is `... -> Effect`; rules say EffectFn1")
                if not re.search(r"=>\s*(\(\)\s*=>|function\s*\(\s*\))", jline):
                    rep.add("ERROR", f"{js}:{jln}", f"`{name}` is `... -> Effect` but its JS "
                            "doesn't return a thunk (`x => () => ...`): crashes at runtime")
        if want is not None and jar != want:
            rep.add("ERROR", f"{js}:{jln}", f"`{name}` takes {jar} JS params; "
                    f"PureScript type implies {want}")
    for name, (_, jln, _) in jsdefs.items():
        if name not in foreign:
            rep.add("WARN", f"{js}:{jln}", f"JS export `{name}` has no foreign import")

    # lint
    either_impls = {n for n, (t, _) in foreign.items() if "Either" in t}
    current = None
    for n, line in enumerate(jtext.splitlines(), 1):
        em = re.match(r"^export (?:const|function) (\w+)", line)
        if em:
            current = em.group(1)
        where = f"{js}:{n}"
        code = re.sub(r"(\"[^\"]*\"|'[^']*'|`[^`]*`|//.*$)", "", line)
        if re.search(r"\?\.(?!\d)", code):
            rep.add("ERROR", where, "optional chaining `?.` (not allowed)")
        if "??" in code:
            rep.add("ERROR", where, "nullish coalescing `??` (not allowed)")
        if re.match(rf"^export const \w+\s*=\s*{GLOBALS}\b", code):
            rep.add("ERROR", where, "global read at module top level (stale after the first tick)")
        if re.search(r"\barguments\b", code):
            rep.add("WARN", where, "`arguments` used (overload branching?)")
        if re.search(r"\btypeof\b", code) and current not in either_impls:
            rep.add("WARN", where, "`typeof` outside an Either impl (overload branching?)")
        if re.search(r"[(,]\s*(undefined|null)\s*[,)]", code):
            rep.add("WARN", where, "null/undefined passed as an argument")


def check_consistency(observations, rep):
    for kind, label in (("param", "parameter"), ("prop", "property")):
        for name, obs in sorted(observations[kind].items()):
            types = Counter(t for t, _ in obs)
            if len(types) < 2:
                continue
            detail = "; ".join(
                f"{t} x{c} (e.g. {next(w for tt, w in obs if tt == t)})"
                for t, c in types.most_common())
            rep.add("CONSISTENCY", f"{label} `{name}`", detail)


def read_runs(path):
    missing = Counter()
    p = Path(path)
    if not p.exists():
        return missing
    text = p.read_text(encoding="utf-8")
    dec, i = json.JSONDecoder(), 0
    while i < len(text):
        while i < len(text) and text[i].isspace():
            i += 1
        if i >= len(text):
            break
        try:
            obj, i = dec.raw_decode(text, i)
        except json.JSONDecodeError:
            nl = text.find("\n", i)
            i = len(text) if nl < 0 else nl + 1
            continue
        res = obj.get("result", "") if isinstance(obj, dict) else ""
        last = (res or "").strip().splitlines()[-1:] or [""]
        mm = re.search(r"MISSING:\s*([^|]*)", last[0])
        field = mm.group(1).strip().strip("`*_ ").strip() if mm else ""
        if field and field != "-":
            for item in split_top(field, ","):
                item = item.strip().strip("`").strip()
                if item and item != "-":
                    missing[item] += 1
    return missing


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--manifest", default="tasks/manifest.tsv")
    ap.add_argument("--runs", default="runs.jsonl")
    ap.add_argument("--allow-missing", action="store_true",
                    help="don't count ungenerated modules as errors")
    ap.add_argument("--skip", action="append", metavar="TITLE:MEMBER|FILE",
                    help="ignore members removed or written by hand (same format as "
                    "split_specs.py plan --skip; e.g. --skip tools/handwritten.txt)")
    ap.add_argument("--notes-full", action="store_true",
                    help="list every NOTE with its location")
    args = ap.parse_args()

    rep = Report()
    observations = {"param": defaultdict(list), "prop": defaultdict(list)}
    notes = []
    with open(args.manifest, encoding="utf-8") as f:
        rows = list(csv.DictReader(f, delimiter="\t"))
    for row in rows:
        check_task(row, rep, observations, notes, load_skip(args.skip))
    check_consistency(observations, rep)
    missing_shared = read_runs(args.runs)

    order = ["ERROR", "WARN", "CONSISTENCY", "MISSING"]
    for level in order:
        items = [(w, m) for l, w, m in rep.items if l == level]
        if not items:
            continue
        print(f"\n== {level} ({len(items)})")
        for w, m in items:
            print(f"  {w}: {m}")
    if notes:
        print(f"\n== NOTES ({len(notes)})")
        if args.notes_full:
            for w, n in notes:
                print(f"  {w}: {n}")
        else:
            for n, c in Counter(n for _, n in notes).most_common():
                print(f"  x{c}  {n}")
    if missing_shared:
        print(f"\n== MISSING from shared modules (runs.jsonl, {len(missing_shared)})")
        for item, c in missing_shared.most_common():
            print(f"  x{c}  {item}")

    errors = rep.count("ERROR") + (0 if args.allow_missing else rep.count("MISSING"))
    print(f"\n{len(rows)} tasks checked: {rep.count('ERROR')} errors, "
          f"{rep.count('WARN')} warnings, {rep.count('CONSISTENCY')} inconsistencies, "
          f"{rep.count('MISSING')} modules not generated, {len(notes)} notes")
    sys.exit(1 if errors else 0)


if __name__ == "__main__":
    main()
