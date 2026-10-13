#!/usr/bin/env bash
# One binding-writer run per row of tasks/manifest.tsv, committing each success.
# Run from the project root on a clean git tree. Requires jq.
# Usage: ./run_bindings.sh [manifest]   (default tasks/manifest.tsv)
# For a trial, give it a manifest with a few rows:
#   head -n 4 tasks/manifest.tsv > tasks/trial.tsv && ./run_bindings.sh tasks/trial.tsv
set -u
manifest=${1:-tasks/manifest.tsv}
mkdir -p .done failed

# manifest is read on fd 3 so `claude` can't swallow it from stdin
while IFS=$'\t' read -r key title module purs js spec <&3; do
  [ "$key" = "key" ] && continue          # header row
  [ -f ".done/$key" ] && continue
  # the worker may only write its two files and can't run mkdir, so create the dir here
  mkdir -p "$(dirname "$purs")"

  out=$(claude -p "Implement the bindings described in this spec.

$(cat "$spec")" \
    --agent binding-writer \
    --permission-mode dontAsk \
    --permission-prompts none \
    --allowedTools "Edit(/$purs),Edit(/$js),Bash(spago build)" \
    --output-format json < /dev/null)
  echo "$out" >> runs.jsonl
  report=$(jq -r '.result' <<<"$out" | tail -n 1)
  echo "$key: $report"

  if grep -q ' OK |' <<<"$report"; then
    git add -- "$purs" "$js"
    git commit -q -m "Bind $key" -m "$report"
    touch ".done/$key"
  else
    # keep the failed attempt for inspection, out of the build
    for f in "$purs" "$js"; do
      [ -f "$f" ] && mkdir -p "failed/$(dirname "$f")" && mv "$f" "failed/$f"
    done
  fi

  # tripwire: nothing else should have changed
  if [ -n "$(git status --porcelain)" ]; then
    echo "Unexpected changes after $key, stopping:"
    git status --short
    exit 1
  fi
done 3< "$manifest"

echo "Loop finished. Next: python3 tools/split_specs.py facades $manifest && spago build && python3 tools/verify_bindings.py --manifest $manifest"
