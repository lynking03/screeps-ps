#!/usr/bin/env python3
"""Prepare Screeps API doc sources for per-worker binding tasks.

  split  <docs/api/source> <specs_dir>
      One file per member, in one directory per object:
        specs/Creep/_about.md          intro text + inherited parents
        specs/Creep/03-attack.md       one member, HTML converted to text
      Deprecated members and inherited-page includes are dropped.
      Edit these by hand if a doc entry is wrong; `plan` reads them as-is.

  plan   <specs_dir> <tasks_dir> [--max-members N] [--max-chars N]
      Groups each object's member files, in doc order, into worker tasks:
        tasks/Creep.part1.md ...  and  tasks/manifest.tsv
      --max-members 1 gives one worker per member.
      --skip FILE leaves out members listed as `Title:member` (hand-written).

  facades <tasks_dir>/manifest.tsv
      After the workers finish: writes one public module per object
      (e.g. Screeps.Creep) re-exporting every part module present on disk.

Standard library only. No model involved.
Tag syntax follows the docs' hexo plugins (api/scripts/tag-*.js):
  {% api_method name ['sig1|sig2'] cost ['{json opts}'] %}
  {% api_property name type ['{json opts}'] %}
"""
import argparse
import csv
import html
import json
import re
import sys
from pathlib import Path

MEMBER_RE = re.compile(r"^\{% (api_property|api_method) (\S+)")
OPTS_RE = re.compile(r"'(\{.*\})'\s*%\}\s*$")
INHERIT_RE = re.compile(r"^\{% page inherited/(\w+)\.md %\}")
SKIP_FILES = {"constants.md"}  # Screeps.Constants is written by hand
INTRO_CAP = 1500


def module_segments(title):
    """'Game.map.visual' -> ['Game', 'Map', 'Visual']"""
    return [s[:1].upper() + s[1:] for s in title.split(".")]


def is_deprecated(tag_line):
    """hexo plugin: opts.deprecated is `true` or a message string."""
    m = OPTS_RE.search(tag_line)
    if not m:
        return False
    try:
        return bool(json.loads(m.group(1)).get("deprecated"))
    except json.JSONDecodeError:
        return '"deprecated"' in m.group(1)


def html_to_text(s, drop_tables=False):
    """Convert doc HTML to plain text, leaving fenced code blocks untouched."""
    chunks = re.split(r"(```.*?```)", s, flags=re.S)
    out = []
    for i, c in enumerate(chunks):
        if i % 2 == 1:  # fenced code
            out.append(c)
            continue
        if drop_tables:
            c = re.sub(r"<table.*?</table>", "", c, flags=re.S)
        # option lists: title / type / desc divs -> "- name : type — desc"
        c = re.sub(
            r'<div class="api-arg-title">(.*?)</div>\s*'
            r'<div class="api-arg-type">(.*?)</div>\s*'
            r'<div class="api-arg-desc">',
            r"\n- \1 : \2 — ", c, flags=re.S)
        c = re.sub(r"<img[^>]*>|!\[[^\]]*\]\([^)]*\)", "", c)
        c = re.sub(r"<br\s*/?>", "\n", c)
        c = re.sub(r"</?(p|div|ul|ol|li|pre|table|tr|tbody|thead)\b[^>]*>", "\n", c)
        c = re.sub(r"<td\b[^>]*>|<th\b[^>]*>", " | ", c)
        c = re.sub(r"</?[a-zA-Z][^>]*>", "", c)  # remaining inline tags
        c = html.unescape(c)
        c = re.sub(r"[ \t]+", " ", c)
        c = re.sub(r" *\n *", "\n", c)
        out.append(c)
    text = "".join(out)
    return re.sub(r"\n{3,}", "\n\n", text).strip()


def parse(path):
    lines = path.read_text(encoding="utf-8").splitlines()
    title = next(l[2:].strip() for l in lines if l.startswith("# "))
    parents, intro, members, cur = [], [], [], None
    for line in lines:
        if line.startswith("# ") and cur is None and not intro:
            continue
        m = INHERIT_RE.match(line.strip())
        if m:
            parents.append(m.group(1))
            continue
        if MEMBER_RE.match(line):
            cur = [line]
            members.append(cur)
            continue
        (cur if cur is not None else intro).append(line)
    return title, parents, "\n".join(intro), ["\n".join(m) for m in members]


def cmd_split(args):
    src, out = Path(args.source), Path(args.specs_dir)
    total = 0
    for path in sorted(src.glob("*.md")):
        if path.name in SKIP_FILES:
            continue
        title, parents, intro, raw_members = parse(path)
        d = out / title
        d.mkdir(parents=True, exist_ok=True)
        for old in d.glob("*.md"):
            old.unlink()
        about = html_to_text(intro, drop_tables=True)
        if len(about) > INTRO_CAP:
            about = about[:INTRO_CAP].rsplit(" ", 1)[0] + " …"
        if parents:
            about += (f"\n\nInherits from {', '.join(parents)}: those members "
                      "are bound elsewhere.")
        (d / "_about.md").write_text(about + "\n", encoding="utf-8")
        dropped, n = [], 0
        for m in raw_members:
            name = MEMBER_RE.match(m).group(2)
            if is_deprecated(m.splitlines()[0]):
                dropped.append(name)
                continue
            n += 1
            (d / f"{n:02d}-{name}.md").write_text(html_to_text(m) + "\n",
                                                 encoding="utf-8")
        total += n
        if dropped:
            print(f"{title}: dropped deprecated {', '.join(dropped)}",
                  file=sys.stderr)
    print(f"{total} member files written under {out}", file=sys.stderr)


def member_name(p):
    return p.stem.split("-", 1)[1]


def cmd_plan(args):
    specs, out = Path(args.specs_dir), Path(args.tasks_dir)
    out.mkdir(parents=True, exist_ok=True)
    for old in out.glob("*.md"):
        old.unlink()
    skip = set()
    if args.skip:
        for line in Path(args.skip).read_text(encoding="utf-8").splitlines():
            line = line.split("#", 1)[0].strip()
            if line:
                skip.add(line)
    rows = []
    for d in sorted(p for p in specs.iterdir() if p.is_dir()):
        title = d.name
        files = [f for f in sorted(d.glob("[0-9]*-*.md"))
                 if f"{title}:{member_name(f)}" not in skip]
        if not files:
            continue
        about = (d / "_about.md").read_text(encoding="utf-8").strip()
        groups, cur, size = [], [], 0
        for f in files:
            n = f.stat().st_size
            if cur and (len(cur) >= args.max_members or size + n > args.max_chars):
                groups.append(cur)
                cur, size = [], 0
            cur.append(f)
            size += n
        if cur:
            groups.append(cur)
        segs = module_segments(title)
        for k, group in enumerate(groups, 1):
            module = ".".join(["Screeps", "Internal", *segs, f"Part{k}"])
            base = "src/" + "/".join(["Screeps", "Internal", *segs, f"Part{k}"])
            purs, js = base + ".purs", base + ".js"
            names = [member_name(f) for f in group]
            header = [
                f"# {title}: part {k} of {len(groups)}",
                f"Module: `{module}`",
                f"Files: `{purs}` and `{js}`",
                f"Bind ONLY these members: {', '.join(names)}",
            ]
            if len(groups) > 1:
                header.append(f"Other parts bind the rest of {title}. "
                              "Do not bind anything not listed above.")
            body = ("\n".join(header) + f"\n\n## About {title}\n\n{about}"
                    "\n\n## Members\n\n"
                    + "\n\n".join(f.read_text(encoding="utf-8").strip()
                                  for f in group) + "\n")
            key = f"{title}.part{k}"
            task = out / f"{key}.md"
            task.write_text(body, encoding="utf-8")
            rows.append([key, title, module, purs, js, str(task)])
    with open(out / "manifest.tsv", "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f, delimiter="\t", lineterminator="\n")
        w.writerow(["key", "title", "module", "purs", "js", "spec"])
        w.writerows(rows)
    print(f"{len(rows)} tasks written to {out / 'manifest.tsv'}", file=sys.stderr)


def cmd_facades(args):
    by_title = {}
    with open(args.manifest, encoding="utf-8") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            by_title.setdefault(row["title"], []).append(row)
    for title, rows in by_title.items():
        present = [r for r in rows if Path(r["purs"]).exists()]
        if len(present) < len(rows):
            print(f"{title}: {len(rows) - len(present)} part(s) missing; "
                  "facade re-exports only the parts present", file=sys.stderr)
        if not present:
            continue
        segs = module_segments(title)
        module = ".".join(["Screeps", *segs])
        path = Path("src/" + "/".join(["Screeps", *segs]) + ".purs")
        path.parent.mkdir(parents=True, exist_ok=True)
        lines = ["-- Generated by split_specs.py facades. Do not edit.",
                 f"module {module} (module Exports) where", ""]
        lines += [f"import {r['module']} as Exports" for r in present]
        path.write_text("\n".join(lines) + "\n", encoding="utf-8")
        print(f"wrote {path}", file=sys.stderr)


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = ap.add_subparsers(dest="cmd", required=True)
    s = sub.add_parser("split")
    s.add_argument("source")
    s.add_argument("specs_dir")
    p = sub.add_parser("plan")
    p.add_argument("specs_dir")
    p.add_argument("tasks_dir")
    p.add_argument("--max-members", type=int, default=10)
    p.add_argument("--max-chars", type=int, default=12000)
    p.add_argument("--skip", help="file of `Title:member` lines to leave out "
                   "(hand-written bindings), e.g. `Game:Game.getObjectById`")
    f = sub.add_parser("facades")
    f.add_argument("manifest")
    args = ap.parse_args()
    {"split": cmd_split, "plan": cmd_plan, "facades": cmd_facades}[args.cmd](args)


if __name__ == "__main__":
    main()
