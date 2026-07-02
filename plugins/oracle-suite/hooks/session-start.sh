#!/bin/bash
# oracle-suite SessionStart hook — the continuity nudge, automated.
# stdout is injected as session context: if a prior session left resume
# instructions here, the new session learns about them without being told.
if [ -f "START-HERE.md" ]; then
  echo "[oracle-suite] START-HERE.md exists in this directory — a previous session left resume instructions (and possibly a 'Live line:' to a predecessor session that can answer setup questions). Suggest /oracle to the user to resume properly, or read START-HERE.md before starting work."
fi
if [ -f "HANDOFF.md" ] && [ ! -f "START-HERE.md" ]; then
  echo "[oracle-suite] HANDOFF.md exists here — prior session state is available; consider reading it before starting work."
fi
exit 0
