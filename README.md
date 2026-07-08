# Not Rest Inc. — Claude Code plugins

The **`notrest`** plugin marketplace by [Not Rest Inc.](https://do.not.rest).

## Install

```
/plugin marketplace add notrestai/ORACLE
/plugin install oracle-suite@notrest
```

## Plugins

### ORACLE Suite (`oracle-suite`)
A working-session toolkit — structured thinking from intake to handoff:

| Skill | What it does |
|---|---|
| **oracle** | Session intake — six setup questions (Objective, Role, Architecture, Content, Leverage, Evaluation) + loads/creates the `CLAUDE.md` foundation. Invoke with "hey oracle" or `/oracle`. |
| **researcher** | Rigorous multi-pass research → a background doc + a decision dossier. |
| **marketresearcher** | Funnel-shaped market research → sizing, competitors, whitespace, an opportunity dossier. |
| **stepbystep** | Turns a goal/docs into a stress-tested, converged, ordered action plan. |
| **actionplan** | Expands a stepbystep plan into a copy-paste-ready runbook (exact commands per host). |
| **critic** | Adversarial red-team of any document — steelman, attack, alternatives, severity-tiered verdict. |
| **director** | Chains the other skills into a pipeline (e.g. `marketresearcher → critic → stepbystep`). |
| **sessionend** | Captures session state into START-HERE / HANDOFF / STATE / CLAUDE.md so the next session resumes seamlessly. |
| **fable-mode** | A verification-first working-discipline contract (ORIENT → PROBE → ACT → PROVE → BANK): probe before believing, prove before claiming, bank before stopping. Auto-anchored into every session by the SessionStart hook; load the full contract with `/fable-mode`. |

`oracle` + `sessionend` are bookends: ORACLE loads the foundation at the start, sessionend updates it at the end — together they make sessions continuous. **fable-mode** is the posture in between: the SessionStart hook injects its discipline anchor every session, so reliable working habits are on by default without anyone typing `/fable-mode`.

## Continuity & discipline hooks
- **SessionStart** — self-updates the plugin from git (fire-and-forget `--ff-only`); injects the **fable-discipline anchor** every session; detects `START-HERE.md` / `HANDOFF.md` and adds a resume nudge.
- **PreCompact** — reminds that a deliberate `/sessionend` handoff preserves more than automatic compaction.

## License
MIT © 2026 Not Rest Inc.
