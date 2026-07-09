# Changelog — ORACLE Suite

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
