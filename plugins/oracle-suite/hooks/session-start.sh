#!/bin/bash
# oracle-suite SessionStart hook — continuity nudge + self-update.

# ── self-update: if this plugin lives in a git clone, quietly pull latest.
# Fire-and-forget: never blocks session start; --ff-only never clobbers local
# edits (dirty/diverged clones are silently left alone). Updates apply from
# the NEXT session. Note: this executes whatever the origin repo ships —
# point it only at a repo you control.
PLUGIN_GIT_ROOT="$(git -C "$(cd "$(dirname "$0")" && pwd)" rev-parse --show-toplevel 2>/dev/null)"
if [ -n "$PLUGIN_GIT_ROOT" ]; then
  ( cd "$PLUGIN_GIT_ROOT" && git pull --ff-only --quiet >/dev/null 2>&1 & ) 2>/dev/null
fi

# ── fable discipline: bolted to the metal. Unconditional every session so the
# working posture is present without anyone typing /fable-mode. The anchor is
# always in context; the full contract is one skill-load away. Trivial single-
# question turns may skip. stdout is injected as session context.
echo "[oracle-suite] Fable discipline is active this session. Run substantive work (building, debugging, deploying, multi-step tasks) through the loop: ORIENT (read the project's state docs first) -> PROBE (inspect the live system before reasoning — read-only inspection is free, arguing from priors when a command could answer is a violation) -> ACT (smallest verifiable step; show-before-run on any mutating/production/irreversible action, then wait for explicit go) -> PROVE (a 'done/works/fixed' claim requires observable evidence in-transcript — exit code, HTTP status, pid, diff, log line; otherwise say 'unverified'; 'should work' is banned) -> BANK (checkpoint state + the exact resume payload; assume the session can die any minute). Also: verify handed-down claims (docs/memory go stale) against the live system before building on them; surface conflicts, never silently smooth; secrets never enter context. When tools or permissions degrade mid-session, reroute instead of stalling — smallest probes, stage-then-assemble, keep unblocked lanes moving (the fable-mode contract carries the full outage playbook). Load the full contract with the fable-mode skill (oracle-suite:fable-mode). Skip only for trivial single-question turns."

# ── subagent model routing: the single biggest token saver. Unconditional, so it
# reaches every fan-out surface (Agent tool, Workflow/ultracode, deep-research,
# review panels) even when no oracle-suite skill is loaded.
echo "[oracle-suite] HARD RULE — subagent model routing: Fable never rides in a subagent. If this session runs on Fable (claude-fable-5), every spawned agent/subagent (Agent tool, Workflow agent() calls, deep-research and review fan-outs, pipeline stages) MUST set an explicit cheaper model — sonnet by default (exploration, search fan-outs, reading/summarizing, drafting); opus only for judgment-heavy lanes (adversarial verification, architecture, complex debugging, final synthesis); haiku for trivial mechanical sweeps. Omitting the model silently inherits Fable and bills Fable credit for work a cheaper model does identically — that omission is a violation, not a default. Fable is the orchestrator seat, not the fan-out."

# ── continuity nudge: stdout is injected as session context.
if [ -f "START-HERE.md" ]; then
  echo "[oracle-suite] START-HERE.md exists in this directory — a previous session left resume instructions (and possibly a 'Live line:' to a predecessor session that can answer setup questions). Suggest /oracle to the user to resume properly, or read START-HERE.md before starting work."
fi
if [ -f "HANDOFF.md" ] && [ ! -f "START-HERE.md" ]; then
  echo "[oracle-suite] HANDOFF.md exists here — prior session state is available; consider reading it before starting work."
fi
if ls FABLE-COORD*.md >/dev/null 2>&1; then
  echo "[oracle-suite] FABLE-COORD*.md blackboards exist in this directory — a fable-director arrangement lives in this repo. If this session is meant to direct (or rejoin) it, load the fable-director skill (oracle-suite:fable-director): it reads the repo's PLAN-FABLE-DIRECTOR-V4.md + blackboards and re-arms watches before anything else."
fi
exit 0
