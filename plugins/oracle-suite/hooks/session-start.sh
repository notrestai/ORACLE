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

# ── continuity nudge: stdout is injected as session context.
if [ -f "START-HERE.md" ]; then
  echo "[oracle-suite] START-HERE.md exists in this directory — a previous session left resume instructions (and possibly a 'Live line:' to a predecessor session that can answer setup questions). Suggest /oracle to the user to resume properly, or read START-HERE.md before starting work."
fi
if [ -f "HANDOFF.md" ] && [ ! -f "START-HERE.md" ]; then
  echo "[oracle-suite] HANDOFF.md exists here — prior session state is available; consider reading it before starting work."
fi
exit 0
