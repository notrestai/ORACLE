# Live Handoff — the cross-session line (template)

The continuity files are layer 1. This is **layer 2: the live line** — the ending session stays
alive and answers the successor's questions directly, so nothing is lost to doc compression.
Proven in production 2026-07-02 (not.rest → "not.rest dev3 fable"): the successor read START-HERE,
received the orientation message, resolved an unknown the docs couldn't cover, asked exactly one
history question, and got it answered with full context.

## When this applies
Only in environments with session-to-session tools (Claude Code desktop with session management:
`list_sessions`, `send_message`, `search_session_transcripts`). In plain chats, skip — the files
are the whole handoff (but note the successor can often still SEARCH old transcripts).

## The protocol (three steps)

**1. The ending session does NOT close after writing the files.** Tell the user plainly:
> "Keep this session alive until the new one confirms it's oriented. I'll answer its questions."

**2. The user starts the successor with this opener** (paste-ready, fill the brackets):
```
Read START-HERE.md first and follow it (its read order routes through the COORD.md
ledger tail — the per-prompt trail with evidence; when my prose and the ledger disagree,
the ledger wins: it was written when the work landed). The previous session
"<old session title>" is still alive with full context — use list_sessions to find it
and send_message it your setup questions BEFORE building anything. If an estate/memory
MCP is available, also ask it what's live. Your build: <one line naming the next build>.
```

**3. The ending session sends the ORIENTATION MESSAGE** — proactively, the moment the successor
exists (don't wait to be asked; its questions are predictable). Structure, six parts:

```
I'm the previous <project> session (full context still loaded). Answers to your setup
questions, plus what the docs can't tell you. Reply to this session with anything else —
I'm alive until the user closes the tab.

**STATE IN 3 LINES:** <what is live/true right now · what was just finished · what your
build is>

**PREDICTABLE QUESTIONS, ANSWERED:**
<numbered — the questions ANY fresh session on this project hits:>
- deploy/build flow and its non-obvious failure modes (validators, checks that gate deploys)
- access paths (hosts, URLs, login users — never secrets)
- the don't-break list (things that look editable but are load-bearing)
- landmines with their recipe locations (point at STATE/docs sections, don't restate)
- the COORD.md ledger tail — which of my claimed-landed items carry evidence there
  (anything I claim that has no ledger line is [unverified]; write your own discoveries
  back as ledger lines too — the line is the patch channel, the ledger is the receipt)

**HONEST UNKNOWNS:** <what the docs could NOT cover — things never located, never decided,
never verified — each with a suggested first probe. This is the highest-value section:
it's exactly what a confident-sounding doc would have papered over.>

**DECISIONS THAT ARE THE USER'S:** <each genuinely open decision + the ONE question to ask
the user about it + your recommendation if you have one. The successor should ask, not guess.>

**GATED ACTIONS:** <what requires the user's explicit words in THIS project/harness —
learned examples: public ingress/DNS changes, secrets/.env writes, Claude-config
self-modification, live DB catalog edits, production restarts. The successor must not
infer consent from the plan's existence.>

**OPEN LINE:** Ask me anything — decision rationale, code paths, why something is the way
it is. I watched all of it happen.
```

## Answering the successor's replies
- Answer from FULL context — this is the one place the old session outperforms every doc.
- Distinguish crisply: **fact** (it happened) vs **recommendation** (my read) vs **user's call**
  (don't decide for them). The successor inherits your authority — don't launder opinions as history.
- If the successor discovers something (it will), tell it to write the finding back into the
  continuity files — the docs stay the source of truth; the live line is a patch channel.

## Mechanics (Claude Code)
- `list_sessions` → find the target by title; messages arrive as a user-turn labeled
  "From <sender title>" with a linkback.
- `send_message` always prompts the user for confirmation — that's the consent gate, expected.
- After the old session closes, its transcript remains searchable via
  `search_session_transcripts` — the line degrades gracefully, it never fully dies.
- Layer 3 (if the project has one): a memory/estate MCP the successor can query directly —
  point at it in the opener.
