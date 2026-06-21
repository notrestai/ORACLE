---
name: oracle
disable-model-invocation: false
description: Use when the user says "hey oracle", "/oracle", or wants to start an ORACLE session: first load any existing CLAUDE.md foundation and offer to resume from a prior START-HERE.md, then ask six context-setup questions one at a time (Objective, Role, Architecture, Content, Leverage, Evaluation), each skippable, then proceed using the answers — scaffolding a starter CLAUDE.md if none exists yet. Not for ordinary questions.
---

# ORACLE — Session Intake

When invoked, walk the user through six quick questions that load good context before the real work, then proceed using their answers. The six spell **ORACLE**: **O**bjective, **R**ole, **A**rchitecture, **C**ontent, **L**everage, **E**valuation.

## When to run
Run **only** when the user says **hey oracle**, **/oracle**, or clearly asks to start an ORACLE session. Otherwise ignore this skill and help normally — never run the intake on an ordinary question.

## Foundation & resume (do this first, before the questions)
When invoked, glance at the working directory for two files a prior session may have left:
- **`CLAUDE.md`** — the foundation (how you work, tooling, conventions, infrastructure). If it exists, it's already your loaded context (Claude Code auto-reads it at the repo root; elsewhere, read it). Treat it as the baseline and **do not recreate or overwrite it** — upkeep happens at session end via `sessionend`.
- **`START-HERE.md`** — a prior session's resume instructions. If it exists, tell the user a previous session left off here and offer to **resume from it** (read it, continue in its order) or start fresh.

If there's **no `CLAUDE.md`**, you'll **always** scaffold one after the intake (see When done) — no matter how much was answered or skipped. The intake answers are foundation material: **Architecture** → how you work, **Leverage** → tooling, **Content** → the project/situation.

## How to run it
- **Ask one question at a time.** Send the question, then stop and wait for the answer. Never show all six at once.
- **Offer Skip and Skip the rest as answer options on every question.** Each time you ask, give three ways to respond: answer it, **[Skip]** this slot, or **[Skip the rest]** to jump straight to the summary. Where the interface supports tappable choices, show **[Skip]** and **[Skip the rest]** as buttons alongside the question every time; otherwise note they can type "skip" or "skip the rest". They're part of the answer set for every question — not a one-time aside.
- Keep each question to 1–2 lines. Don't lecture. A short answer is fine.
- If a slot is skipped, don't push — move on and use a sensible default later.
- Remember the answers as you go.

## The six questions (ask in this order)
*Each is presented with **[Skip]** and **[Skip the rest]** as options (see How to run it).*

1. **Objective** — "What do you want to achieve this session? What would make it a win?"
2. **Role** — "Who should I be while I help? (e.g., blunt reviewer, patient teacher, expert in ___). Skip and I'll just be direct and helpful."
3. **Architecture** — "How should I work, and what should the output look like? Any rules (ask before assuming, cite sources, no fluff) or format (length, bullets vs prose)?"
4. **Content** — "What should I work from? Paste or attach any documents, the key facts about your situation, and 2–5 examples of what 'good' looks like. *This one matters most — paste real material if you have it.*"
5. **Leverage** — "Any tools or skills I should use or avoid? (web search, a specific Skill, work offline, etc.)"
6. **Evaluation** — "How will you judge a good result, and how should I check my own work? (e.g., cite every claim, flag anything unverified, end with the one thing most likely to be wrong.)"

## When done (all answered, or "skip rest")
- Reflect back a one-line summary per slot, "—" for anything skipped:
  > **O:** … **R:** … **A:** … **C:** … **L:** … **E:** …
- Ask: "Ready to go, or want to change anything?"
- **Foundation file — always create on a new session:** if no `CLAUDE.md` exists, **always scaffold one** from the bundled **`references/claude-foundation-template.md`** — no matter how many slots were answered or skipped (even an all-skipped/test intake still gets the file). Seed it with whatever answers you have (Architecture → protocol, Leverage → tooling, Content → the project section) and keep the template's placeholders for anything unanswered, so the structure is ready for `sessionend` to fill from real work. Keep it a *base*, not comprehensive. Write it where it persists: repo root in Claude Code (so it's auto-read), the working dir in Cowork, or the outputs area in a chat (present it for download). If `CLAUDE.md` already exists, leave it untouched — you loaded it; updates happen at session end.
- Then do the work, applying the answers. Internally follow the loading rule: **use their Content first and keep their actual ask last; put the most important facts at the start or end, never buried in the middle.**
- For any skipped slot, pick a sensible default and note in one line what you assumed.

## Note
This is a setup ritual for a real working session. For a quick one-off, the user can answer just **Objective** (and maybe **Content**) and skip the rest.

Bookend: `oracle` brings up the foundation (`CLAUDE.md`) and resumes from `START-HERE.md` at session start; **`sessionend`** updates them at session end. Together they make sessions continuous.
