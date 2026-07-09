# Changelog — ORACLE Suite

## 2.1.0 — 2026-07-09

**fable-mode v2: the full Fable behavioral contract.**

- Beyond the loop and hard rules, fable-mode now carries: **THE FABLE DIFFERENCE** (eight
  instinct→fable-move reflex swaps), a **consumer-side verification cookbook** (prove it at
  the surface that serves it — registry re-lists, UI structured-probes-before-pixels,
  run-the-generator-and-grep-its-output, both-sides checksums), a seven-step **outage
  playbook** (map the failure domain by experiment, reroute, chunk-stage-assemble,
  canary-with-value retries — distilled live from shipping v2.0.0 through a flapping
  tool-gate), **tool-graph craft** (failure-domain- and cost-aware tool choice; compose
  missing tools), and eight **situational profiles** (debugging, shipping, live-ops,
  research, data, long-horizon, multi-agent, degraded harness).
- **SessionStart anchor** gains the reroute clause (reroute instead of stalling; smallest
  probes; stage-then-assemble; keep unblocked lanes moving).

## 2.0.0 — 2026-07-09

**The public release: token-lean, verified, model-agnostic — and natural-language invocable.**

- **Three new skills fill the suite's own vision-verbs:**
  - **`explainer`** — genuine understanding of any topic/system/document: a correct mental model
    (analogies must state where they break), three depth layers (plain → working → expert), the
    standard misconceptions, and verify-it-yourself checks on the load-bearing claims.
  - **`decider`** — structured decisions: options incl. do-nothing/wait, user-weighted criteria
    (must-haves vs tradeables), evidence per option, a reasoned scoring matrix with a sensitivity
    check that names the hinge assumption, a pre-mortem on the front-runner, and a
    reversibility-aware recommendation (two-way vs one-way doors).
  - **`factcheck`** — claim-by-claim verification: verbatim claim extraction, primary-source
    hunting with true independence (daisy-chains traced to their single origin), and a five-verdict
    grammar — ✅ CONFIRMED / 🟡 PLAUSIBLE / 🔴 REFUTED / 🔵 MISLEADING (technically-true-but-
    framing-lies) / ⚪ UNVERIFIABLE — plus an auditable search log.
- **Natural-language invocation everywhere (breaking-ish, hence 2.0).** All working skills dropped
  `disable-model-invocation` — "research X", "should I…", "is this true", "wrap up the session"
  now trigger the right skill without memorizing commands. This also fixes a real 1.x defect: the
  PreCompact hook told the model to run `/sessionend`, which the flag made impossible. Every
  description was rewritten tighter (the always-loaded surface stays lean) with explicit
  "not for trivial asks" guards. `director` still runs sub-skills by reading them from disk —
  now for stage-isolation reasons, stated as such.
- **Token discipline made explicit:** search budgets in researcher (~20), marketresearcher (~25),
  explainer (~8), decider (~10), factcheck (~3/claim) — expandable only for load-bearing gaps or
  on user request, and said aloud when exceeded.
- **Consistency & routing:** `[estimate]` label added to researcher (math shown, matching
  marketresearcher); cross-skill handoffs at every Finishing-up (researcher→critic/factcheck,
  marketresearcher→critic/stepbystep, stepbystep→actionplan/critic); `oracle` intake now routes
  the stated Objective to the right skill/chain and defaults a skipped Evaluation to the suite's
  reliability standard; `director` gains default chains for the new skills.
- **Public docs:** README principles (token-lean · verified · model-agnostic), full 13-skill
  tables, and `docs/TUTORIAL.md` — install → the shape of every skill → the first full loop →
  which-skill-when → chains worth knowing.

## 1.3.0 — 2026-07-09

**The orchestration release: the fable arrangement, packaged for any repo.**

- **`fable-director` skill** — seats and operates **"3 DEVS AND A RELAY"**: a metered director
  (`claude-fable-5`, latest-Opus fallback via a probing launcher) orchestrating flat dev/QC
  lanes through per-lane `FABLE-COORD*.md` blackboard files with end-anchored token-watch
  wakes. Three modes: **SEAT** (rotation landing), **OPERATE** (burst agenda + ship gate +
  rotation ritual with the observed rotation-killers checklist), **BOOTSTRAP** (a FILE-ONLY
  scaffolder stands up a new repo in minutes — every blackboard with correct absolute paths,
  tokens named for your sessions, the QC refuter checklist baked in). Bundles the protocol of
  record (`PLAN-FABLE-DIRECTOR-V4.md`: the PING system, edit authority, QC relay charter,
  rotation ritual) — a per-project copy in the repo root stays authoritative over the bundle.
  Battle-tested on tell.rest (5 shipped rounds, 6 bugs fixed, 2 live rotations). Distinct from
  `director`, which chains *skills*; this one orchestrates *sessions*.
- **Packaging optimizations over the field version:** the kickoff prompt is
  project-parameterized (the scaffolder stamps the repo name into `<PROJECT>` on first copy),
  stale section cross-references fixed (DIRECTOR RESUME + edit-authority pointers), and the
  QC watch token generalized to the QC lane's own session name.
- **SessionStart hook now detects `FABLE-COORD*.md` blackboards** and nudges seating the
  fable-director — alongside the existing START-HERE/HANDOFF resume detection.

## 1.2.0 — 2026-07-08

**The discipline release: reliable working posture, bolted to the metal.**

- **`fable-mode` skill** — a working-discipline contract (not a capability; a process): the loop
  **ORIENT → PROBE → ACT → PROVE → BANK**, ten hard rules (empirical-first; verify handed-down
  claims against the live system; prove-then-claim with "should work" banned; show-before-run;
  root-cause-with-a-budget; blocked ≠ stopped; surface conflicts, never smooth; secrets never in
  context; momentum + honesty; own the estate of record), and a verification cookbook
  (405-vs-404 route probe, hash + container-start-time for "deployed = latest", `kill -9`-past-the-
  throttle for supervision claims, watch the receiver's logs for a clean cutover). Distilled from
  live Fable 5 sessions; makes any model — Opus especially — convert capability into reliability.
  Invoke with `/fable-mode`, "work like fable", or "2× reliability".
- **SessionStart hook now bolts the discipline to the metal.** Beyond the START-HERE/HANDOFF resume
  nudges, the hook unconditionally injects a compact fable-discipline anchor (the loop + the
  highest-value rules + a directive to load the full `fable-mode` contract) as session context —
  every session, no `/fable-mode` needed. Trivial single-question turns may skip; substantive work
  runs the loop. This is the "bolt to the metal" upgrade over relying on a CLAUDE.md instruction.

## 1.1.1 — 2026-07-02

- **Self-updating from git.** The `SessionStart` hook now quietly `git pull --ff-only`s the plugin's
  own clone (fire-and-forget: never blocks startup, never clobbers local edits; updates apply from
  the next session). Install the plugin from a git clone once and it stays current with the repo.
  Security note: this executes what origin ships — point it only at a repo you control.

## 1.1.0 — 2026-07-02

**The continuity release: the handoff stops depending on memory and discipline.**

- **Live cross-session handoff line.** `sessionend` gains Phase 5 ("Open the live line"): in
  multi-session environments (Claude Code desktop) the ending session stays alive, records a
  "Live line:" row in `START-HERE.md`, proactively sends the successor a six-part orientation
  message, and answers its setup questions from full context. `oracle` gains the receiving end:
  when resuming a continuation it finds the predecessor (Live-line row or `list_sessions`), reads
  the docs first, then messages one consolidated batch of questions — falling back to transcript
  search if the predecessor is closed. Templates: `skills/sessionend/references/live-handoff-template.md`.
  Proven in production on a real project handoff before shipping.
- **Automated continuity hooks** (new `hooks/`): `SessionStart` detects a `START-HERE.md` /
  `HANDOFF.md` in the working directory and injects a resume nudge as context; `PreCompact` (auto)
  reminds that a deliberate `/sessionend` handoff preserves more than compaction.
- **Memory layer.** `oracle` intake queries available persistent memory (Claude Code auto-memory or
  a memory MCP) before the Content question; `sessionend` Phase 3.5 deposits a handoff digest into
  writable memory. Files stay the source of truth; memory is the finding aid.
- **`critic --panel`**: multi-lens panel mode (correctness · security · economics · adversary ·
  feasibility) with cross-lens adjudication — findings that survive multiple lenses outrank any
  single lens's severity call.

## 1.0.0 — initial release
ORACLE session intake, researcher, marketresearcher, stepbystep, actionplan, critic, director,
sessionend — bookended by a shared CLAUDE.md foundation.
