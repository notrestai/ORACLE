# The ORACLE Suite in 10 minutes

Thirteen skills that make any Claude session **token-lean, verified, and continuous** — on any topic, with any model. This is the shortest path from install to your first full working loop.

## 1. Install (once)

```
/plugin marketplace add notrestai/ORACLE
/plugin install oracle-suite@notrest
```

That's it. Two hooks come alive immediately:
- **SessionStart** injects the fable-discipline anchor (verification-first working habits) into every session, detects `START-HERE.md` / `HANDOFF.md` resume files, and self-updates the plugin from git.
- **PreCompact** reminds you to run `/sessionend` before context compaction eats your session state.

## 2. The shape of every skill

Every working skill follows the same contract, so you only learn it once:
- **Natural language triggers it** — "research the best X", "help me decide", "is this true?", "explain Y" — or invoke explicitly: `/researcher`, `/decider`, `/factcheck`, `/explainer`…
- **Two files out:** a `background.md` (all the working-out, auditable) and a `Dossier.md` (the answer — self-contained, plain-language "Read Me First" up top).
- **`--quick` mode:** chat-only, no files, compressed — for exploration, honestly labeled as such.
- **Honesty labels everywhere:** `[cited]` (real URL, retrieved this run) · `[recall]` (training knowledge) · `[estimate]` (computed — math shown) · `[unverified]`. Confidence levels on conclusions, plus "what would change this."
- **A self-check before finishing** — every skill verifies its own output against its rules.

## 3. Your first loop (the full experience)

1. **`hey oracle`** — the intake. Six quick questions (Objective, Role, Architecture, Content, Leverage, Evaluation), each skippable. It loads/scaffolds your `CLAUDE.md` foundation and routes you to the right skill.
2. **Run the work** — say what you need in plain words; the right skill picks it up (see the map below).
3. **`/sessionend`** — before you stop. It writes `START-HERE.md`, `HANDOFF.md`, `STATE.md`, updates the foundation, and (in Claude Code desktop) keeps a live line open to answer the next session's questions.
4. **Next session: `hey oracle`** again — it finds `START-HERE.md` and resumes exactly where you left off.

## 4. Which skill, when

| You want to… | Say / invoke |
|---|---|
| Understand something properly | "explain X" → **explainer** |
| Answer an open question with evidence | "research X" → **researcher** |
| Check if something is true | "is this true?" → **factcheck** |
| Make a choice | "should I…?" → **decider** |
| Size a market / find a niche | "map this market" → **marketresearcher** |
| Get an ordered, verified plan | "plan how to X" → **stepbystep** |
| Turn the plan into exact commands | "make it copy-paste" → **actionplan** |
| Attack something before trusting it | "red-team this" → **critic** |
| Run several skills in sequence | "research X, critique it, then plan it" → **director** |
| Start / resume a session properly | "hey oracle" → **oracle** |
| Save everything before stopping | "/sessionend" → **sessionend** |
| Work with discipline all session | automatic (hook) · full contract: **/fable-mode** |
| Run a multi-SESSION dev team | "/fable-director" → **fable-director** |

## 5. Chains worth knowing

- `researcher → critic` — find the answer, then try to break it.
- `researcher → factcheck` — research, then independently verify its load-bearing claims.
- `marketresearcher → critic → stepbystep` — opportunity → stress-test → plan.
- `stepbystep → actionplan` — plan → copy-paste runbook.
- `researcher → decider` — evidence → structured choice.

Say it naturally ("research X, then critique it, then plan it") — **director** parses the chain and runs every stage for real, each in its own context.

## 6. The reliability standard (why you can trust the output)

Every skill enforces: real sources only (invented citations are banned), tiered sourcing (primary beats secondary beats blogs), disconfirmation passes (each skill actively tries to break its own answer), severity/verdict grammars instead of vibes, and honest "unverified / not found / it depends" outcomes when that's the truth. The suite's job is not to sound right — it's to be checkably right, and to show its work.

## 7. Costs, quick

Full runs search the web and write files; `--quick` variants stay in chat and cost a fraction. Search budgets are built in (a researcher run defaults to ~20 searches, factcheck ~3 per claim). You can always say "max 5 searches" or "keep it quick" — the skills honor stated caps and say what was traded away.
