# COORD.md — session coordination ledger

Append-only, newest at the bottom, one line per substantive prompt when its work
lands: `- [YYYY-MM-DD HH:MMZ] [session-or-lane] <what was asked> -> <what landed> | evidence: <exit code / commit / path / status>`.
Honest entries only: in-progress is "in progress", untested is "untested". Compact
to COORD-ARCHIVE.md at ~40 ledger lines. In a fable-director arrangement, lane
blackboards live beside this file as COORD-<LANE>.md; this file is the ship/main ledger.

## LEDGER
- [2026-07-15 19:59Z] [hook] COORD.md scaffolded by oracle-suite SessionStart
- [2026-07-15 19:18Z] [fable-main] update plugin window broken -> root-caused stale marketplace clone; CLI-updated 2.2.0->2.8.1 | evidence: installed_plugins.json sha 0e3059a
- [2026-07-15 19:45Z] [fable-main] build fable-swarm + opus-only offload policy -> v2.9.0 shipped, hardcoded in hook/fable-mode/fable-director/templates/global+repo CLAUDE.md | evidence: commit 9522ded, plugin updated
- [2026-07-15 19:54Z] [fable-main] swarm live test (2 opus lanes) -> fork loophole CONFIRMED + 6 ladder residues fixed, v2.9.1 shipped | evidence: commit e281ede, spend report CLEAN 61/39 opus/sonnet
- [2026-07-15 20:02Z] [fable-main] COORD.md generalized (rename + auto-create + per-prompt hook) -> v2.10.0 shipped, fixture-proven | evidence: commit 09aa9b0, scaffolder emits COORD-*.md, plugin updated 2.10.0
- [2026-07-15 20:10Z] [fable-main] owner ruling: keep all five continuity files (CLAUDE/COORD/START-HERE/HANDOFF/STATE) — redundancy is a deliberate safety cushion; do NOT consolidate | evidence: owner message this session
- [2026-07-15 20:16Z] [fable-main] START-HERE read order now includes COORD tail (pos 2, crash-tiebreaker) -> v2.10.1 | evidence: sessionend SKILL lines 102-107
