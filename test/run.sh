#!/bin/sh
# Build, then run the smoke test with game globals stubbed.
set -e
cd "$(dirname "$0")/.."
spago build
node --import ./test/setup-globals.mjs -e 'import("./output/Test.Main/index.js").then(m => m.main())' && echo "all passed"
