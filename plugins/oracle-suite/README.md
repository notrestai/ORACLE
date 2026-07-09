# ORACLE Suite

A working-session toolkit for Claude Code by [Not Rest Inc.](https://do.not.rest) — structured
thinking from intake to handoff. Ten skills that compose:

- **oracle** — session intake (the ORACLE six-question setup) + loads/scaffolds the `CLAUDE.md` foundation. Say "hey oracle" or `/oracle`.
- **researcher** — multi-pass research → background + decision dossier.
- **marketresearcher** — market sizing, competitors, whitespace → opportunity dossier.
- **stepbystep** — goal/docs → a stress-tested, converged, ordered action plan.
- **actionplan** — a stepbystep plan → a copy-paste runbook (exact commands per host).
- **critic** — adversarial red-team with a severity-tiered verdict.
- **director** — chains the skills into a pipeline (e.g. `researcher → critic → stepbystep`).
- **fable-director** — seats and runs the "3 DEVS AND A RELAY" multi-session dev arrangement
  (metered director + flat lanes over per-lane blackboard files with token-watch wakes;
  V4 protocol + repo scaffolder bundled).
- **sessionend** — writes START-HERE / HANDOFF / STATE / CLAUDE.md for a seamless next session.
- **fable-mode** — a verification-first working-discipline contract (ORIENT → PROBE → ACT →
  PROVE → BANK), auto-anchored into every session by the SessionStart hook.

Most skills also support `--quick` (chat-only, no files) and write a paired *background* +
*Dossier* file for anything substantial.

## Install
```
/plugin marketplace add notrestai/ORACLE
/plugin install oracle-suite@notrest
```
Then invoke any skill as `/oracle-suite:<name>` (e.g. `/oracle-suite:researcher`), or just
`/researcher` when unambiguous.

## Note on `director`
`director` orchestrates the sibling skills by reading their `SKILL.md` files directly. It resolves
them from `${CLAUDE_PLUGIN_ROOT}/skills/` when installed as a plugin, and falls back to
`.claude/skills/` (project) or `~/.claude/skills/` (global) — so chaining works whether the suite
is installed as a plugin or dropped in as loose skills. (`fable-director` is different: it
orchestrates *sessions*, not skills — a multi-session dev arrangement over blackboard files.)

MIT © 2026 Not Rest Inc.
