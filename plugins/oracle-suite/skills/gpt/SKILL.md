---
name: gpt
description: Chat-first GPT subagent — /gpt simply talks to a persistent GPT-5.6 conversation (Codex CLI on the user's ChatGPT account). First use runs a 2-question guided setup (thinking level + how agentic, each plainly explained); after that every /gpt message continues the chat with the saved settings. Extras when asked — --once one-shots, --task verified background jobs, --vs blind comparisons, --new to redo setup — and a no-questions --setup flag path so orchestrators (fable-director) can stand the lane up unattended. Use on /gpt, "ask gpt", "chat with gpt", "continue the gpt chat", "leave gpt a task", "gpt second opinion". Opinions never sources ([model-opinion]); prompts leave the machine to OpenAI — no secrets, ever.
---

# gpt — the chat-first cross-model lane

`/gpt <anything>` is a conversation with GPT that remembers. One setup moment, then it's
just talking. Everything agentic is opt-in, explained, and verified before it's trusted.

## First use — the 2-question setup

No profile at `<scratch>/gpt-lane/chats/main.profile` → run setup BEFORE sending anything.
Ask both questions in one round (AskUserQuestion where available; plain numbered questions
otherwise), each option in plain words:

**Q1 — Thinking level** (how hard GPT reasons per reply):
- **low** — fast and cheap; small talk, quick lookups, routine turns.
- **medium** (recommended) — normal questions; the sensible default.
- **high** — slow, heavy on your plan quota; keep for genuinely hard reasoning.

**Q2 — How agentic may GPT be?**
- **chat-only** (recommended) — GPT answers in text; writes nothing, reads nothing.
- **worker** — you can also hand it background jobs (`--task`): it writes real files in
  its own empty workspace, and Claude verifies every deliverable before relaying.
- **repo-aware** — additionally allows `--here` runs where GPT reads the current
  directory; every such run is preceded by a stated secrets check.

Save both answers to `main.profile` (`LEVEL=medium\nMODE=worker`), send the first
message, parse `session id: <uuid>` from the header, save to `main.id`. Greet with one
line stating the active settings so the user knows what they got.

**Non-interactive setup (orchestrators, unattended sessions):** `--setup think=<level>
mode=<chat-only|worker|repo-aware>` skips the questionnaire — REQUIRED form for
fable-director and any auto-mode session; never block an unattended session on questions.

## Every message after — the resume loop

```bash
cd <scratch>/gpt-lane && \
codex exec --sandbox read-only -c model_reasoning_effort="$LEVEL" \
  resume "$(cat chats/main.id)" --skip-git-repo-check \
  "<MESSAGE>" </dev/null 2>&1
```

Relay the answer quoted + `[model-opinion]`, tokens-used line included. `--chat <name>`
runs parallel named conversations (own `.id`/`.profile`). `--new` re-runs setup. If the
id file is lost, `resume --last` recovers the most recent session — say you did.

## Extras (each one sentence to invoke, details on use)

- **`--once "<q>"`** — a one-shot outside any chat: fresh `codex exec`, no session saved.
  The director-safe form. Optional `--think <level>` overrides the profile for this call.
- **`--task <slug> "<job>"`** (worker/repo-aware profiles only) — background job in a
  fresh EMPTY workspace `<scratch>/gpt-work/<slug>/` with `--sandbox workspace-write`,
  spawned `run_in_background`. The prompt MUST name deliverable files. On the completion
  notification: read the deliverables and check them — content, not existence — before
  relaying as `[model-artifact]`. ⚠ Hardened after GPT's own review of this design: never
  feed the workspace untrusted files (embedded instructions steer the worker), and treat
  its network posture as unknown [unverified] — nothing secret goes in, period.
  Follow-ups resume the task's session in the same workspace.
- **`--vs "<question>"`** — blind comparison, reproducible: write the canonical question
  to `question.md` FIRST; write YOUR complete answer next (sealed, before GPT sees
  anything); send GPT the file's text verbatim; present both + a delta verdict (agreement
  = comfort not evidence; note that you judged the answers knowing which was whose —
  position bias disclosed, also per GPT's review).
- **`--here "<q>"`** (repo-aware profile only) — run in the current directory after a
  one-line stated secrets check (no .env/keys/credentials present). Never in a directory
  holding material the prompt must stay blind to (ledgers, answer keys).

## For directors and orchestrators (fable-director)

This lane is NOT a metered subagent — it shells to Codex CLI on the OWNER'S ChatGPT plan,
so the director's never-spawn-subagents rule does not forbid it. Sanctioned uses: a
`--once` second opinion on a risky EDIT SPEC before applying; one extra refuter voice on
a QC brief. Always `--once`, low/medium thinking, empty dir, `--setup` flags not
questions. Never as an explorer — the lanes are the explorers.

## Verified facts (codex-cli 0.144.1 — don't relearn these)

- Effort ladder: **low | medium | high**. `minimal` → live API 400 on the 5.6 family.
  The run header echoes `reasoning effort:` — that echo is the proof the level applied.
- Resume flag ORDER: `--sandbox`/`-c` BEFORE the `resume` subcommand,
  `--skip-git-repo-check` after; other placements rejected. Memory across invocations
  verified live (token planted turn 1, recalled post-exit).
- `--skip-git-repo-check` mandatory outside trusted dirs; `</dev/null` kills the stdin
  wait; codex agentically reads its cwd → empty-dir isolation is the default everywhere.
- Session id: `session id: <uuid>` in the header. Answer follows the `codex` marker;
  `tokens used` follows the answer.

## Hard boundaries (unchanged, load-bearing)

- **Opinion ≠ source** — [model-opinion] carries zero evidentiary weight in
  factcheck/researcher; two models agreeing is one guess echoed.
- **Prompts leave the machine** — and in --here/--task, file contents do too. No secrets,
  no keys, nothing the user hasn't already decided to share with OpenAI.
- **Quota is the user's** — say when high effort is worth it and when it isn't.
- **Auth**: expired login → the user re-runs `codex login`; never attempt auth repair.
  Missing CLI → hand the install block and stop:
  `npm install -g @openai/codex && codex login && codex exec "reply with exactly: READY"`

## Self-check before finishing

- Profile honored: header's effort echo matches the saved LEVEL; mode gates respected
  (no --task on chat-only, no --here off repo-aware).
- Chat integrity: header `session id:` matches the stored id (or --last recovery stated).
- Task deliverables read and content-checked before "done"; artifacts labeled.
- --vs order provable: question.md, then your sealed answer, then the GPT call.
- Nothing sensitive entered a prompt; setup answers were saved so the user is never
  re-asked what they already chose.
