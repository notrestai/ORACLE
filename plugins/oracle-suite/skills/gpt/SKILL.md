---
name: gpt
description: Ask GPT as a second-opinion subagent — one-shot questions to the GPT-5.6 family via Codex CLI on the user's ChatGPT account, at a chosen thinking level (--think minimal|low|medium|high), with --vs blind-comparison mode (Claude seals its own answer BEFORE GPT speaks, then both are compared) and --here for repo-aware runs. Use on /gpt, "ask gpt", "ask chatgpt", "second opinion from gpt", "what does gpt think", "compare answers with gpt". Opinions, never sources — answers carry [model-opinion] and zero evidentiary weight; prompts leave the machine to OpenAI, so never include secrets or sensitive code.
---

# gpt — the cross-model second-opinion lane

One line of bash turns the user's ChatGPT subscription into a callable subagent. This
skill wraps that lane with the discipline that makes a rival model useful instead of
noisy: verified flags, sealed-order comparisons, isolation defaults, and a hard
opinion-not-source boundary. Born from introspect's Run 5, where a GPT context-only
control produced the suite's first cross-family predictive-lift measurement.

## Prerequisites (probe, don't assume)

`which codex` and `ls ~/.codex/auth.json` — Codex CLI installed and logged in via the
user's ChatGPT account. Missing → hand the user this block and stop:

```bash
npm install -g @openai/codex && codex login && codex exec "reply with exactly: READY"
```

Login is browser-OAuth on the user's side; credentials never enter the session.

## The command (verified against codex-cli 0.144.1)

Run in an EMPTY scratch directory by default — codex is agentic and reads its cwd, so
isolation is what keeps a "second opinion" from quietly becoming "read the repo":

```bash
mkdir -p <scratch>/gpt-lane && cd <scratch>/gpt-lane && \
codex exec --skip-git-repo-check --sandbox read-only \
  -c model_reasoning_effort="<LEVEL>" \
  "<PROMPT>" </dev/null 2>&1
```

- The header echoes `model:` and `reasoning effort:` — CHECK both took effect; a silently
  ignored flag is a wrong experiment. The answer follows the `codex` marker line; report
  `tokens used` to the user (quota awareness).
- `--skip-git-repo-check` is mandatory outside trusted dirs; `</dev/null` prevents the
  stdin wait. Both failure modes were observed live before landing here.
- Model override: add `-m <model>` only if the user names a variant; default resolves to
  the account's GPT-5.6 family model.

## Thinking levels (`--think`, default medium)

Maps to `model_reasoning_effort`: **minimal** (classification, extraction, one-liners) ·
**low** (routine questions) · **medium** (default — real questions) · **high** (hard
reasoning, math, tricky design tradeoffs — noticeably slower and heavier on the user's
plan quota). Pass through exactly; the header echo is the proof it applied.

## Modes

**Default — one-shot opinion.** Send the question, relay the answer clearly quoted and
labeled `[model-opinion]`, with the tokens-used line. No editorializing between the
user and the quote; your commentary goes after, separately.

**`--vs` — blind comparison (the honest way to disagree).** Order is the integrity:
1. Write YOUR complete answer to a scratch file FIRST — sealed, before GPT is called.
2. Call GPT with the same question (never with your answer).
3. Present both answers side by side, then a short delta verdict: where they agree
   (likely robust), where they diverge (flag which one you'd bet on and why), what
   neither addressed. Agreement between two models is comfort, not evidence.

**`--here` — repo-aware run (explicit opt-in only).** Run in the current directory so
GPT can read the code it's opining on. ⚠ Before running: confirm the directory holds no
secrets (.env, keys, credentials) — codex reads files and sends content to OpenAI. Never
use `--here` in a directory containing material the prompt is supposed to be blind to
(introspection ledgers, answer keys, unpublished dossiers).

## Hard boundaries (each one load-bearing)

- **Opinion ≠ source.** In factcheck/researcher flows a GPT answer is `[model-opinion]`
  with zero evidentiary weight — models agreeing is not two sources, it is one guess
  echoed. Real verification still requires real documents.
- **Prompts leave the machine.** Everything in the prompt (and in `--here` mode, file
  contents) goes to OpenAI's servers under the user's account. No secrets, no keys, no
  private data the user hasn't already decided to share there.
- **Quota is the user's.** Each call draws the ChatGPT plan's Codex limits. Batch
  questions where sensible; say when a high-effort call is worth it and when it isn't.
- **Failure modes:** untrusted-dir refusal → the skip flag; stdin hang → `</dev/null`;
  auth expired → the user re-runs `codex login` (never attempt auth repair yourself);
  unknown `-m` model → drop the override and say so.

## Self-check before finishing

- Header echo matched the requested effort (and model, if overridden).
- The answer is quoted faithfully and labeled `[model-opinion]`; tokens reported.
- `--vs`: your answer was provably sealed before the GPT call (file written first).
- `--here`: the secrets check happened and is stated in one line.
- Nothing in the prompt was sensitive; if the user asked you to send something that is,
  you flagged it instead of sending.

## Notes

- Introspect uses this lane for cross-model context-only controls (empty dir, always).
- Critic `--panel` and decider can each take one GPT seat — a genuinely foreign prior is
  worth more than another Claude voice; label it like any other panelist.
- Headless/cloud sessions have no Codex CLI — that environment needs the API-key route
  (an MCP server or script); different setup, different billing, not this skill.
