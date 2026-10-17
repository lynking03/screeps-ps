PureScript bindings for the Screeps API. Bindings were generated with a Claude Haiku 5.5 subagent loop (see `/run_bindings.sh` and `/tools/binding-writer.md`); use this code at your own risk.

The bindings are provided in multiple files per top level API namespace. To generate façades for these files, run `python3 tools/split_specs.py facades tasks/manifest.tsv` in the project root; façades will be placed in `./src/Screeps`.
