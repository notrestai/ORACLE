#!/bin/bash
# oracle-suite PreCompact hook — fires when context is about to auto-compact.
# This is exactly the moment session state is at risk of lossy compression:
# remind that a deliberate handoff beats an automatic summary.
echo "[oracle-suite] Context is auto-compacting. If this session is near its natural end, run /sessionend first — a deliberate handoff (files + live line) preserves more than compaction will. If mid-task, carry on; compaction is safe."
exit 0
