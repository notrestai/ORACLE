---
name: fable-swarm
description: The fast delegation arrangement (Oracle family) — Fable stays the seat (decompose, judge, apply, gate) and instantly offloads everything else to in-session background Opus agents and Workflow pipelines; the harness is the wire (no blackboards, no watches, no rotation choreography). Use on "/fable-swarm", "swarm this", "offload this", "fable swarm", or BY DEFAULT whenever a Fable session delegates substantial work on this machine. OWNER MODEL POLICY (2026-07-15) — every offloaded job runs on OPUS: no sonnet, no haiku, never Fable. For multi-day / multi-machine / owner-watchable arrangements, use fable-director instead.
---

# fable-swarm — the seat and the swarm

Fable-director's blackboard-and-watch machinery exists for one constraint: a metered
API-key director whose in-session subagents would bill Fable-priced credit. Where that
constraint doesn't hold — a Fable session in Claude Code with the Agent and Workflow
tools — the machinery is pure drag. This skill is the fast arrangement for that case:
same roles, same discipline, **the harness as the wire**. It deletes fable-director's
three worst failure classes by construction: deaf lanes (no watches to re-arm —
completion notifications are guaranteed), queued ≠ delivered (no message hops), and
split-brain rotation (no successor sessions). A round trip that took minutes and owner
confirm-clicks becomes: one message spawns N concurrent lanes, results return in
seconds to minutes, zero clicks.

## The model rule (owner-set 2026-07-15, absolute)

**Every offloaded job runs on Opus.** Set `model: "opus"` explicitly on every Agent
call and every Workflow `agent()` call — no sonnet, no haiku, and never an inherited
Fable. The owner chose closest-to-Fable quality on all delegated work over per-token
savings; this supersedes the earlier sonnet/haiku difficulty ladder wherever the swarm
operates. Two guards stay on:

- **Never Fable below the seat.** An omitted `model` silently inherits Fable — the
  omission is the violation. The spend report's exit-4 gate makes this checkable.
- **Never spawn `subagent_type: "fork"` from a Fable seat.** Forks IGNORE the `model`
  parameter and always inherit the parent model — a fork with `model: "opus"` silently
  rides Fable while the ledger records the intended opus, a violation the exit-4 gate
  cannot catch. Use a fresh non-fork Opus agent and hand it the context it needs.
- **Receipts, not vibes.** Opus fan-out costs real tokens; the spend ledger receipts
  every lane so the policy can be revisited with numbers, not guesses.

The **gpt lane** is unaffected (it bills the owner's ChatGPT plan, not this session).

## The seat contract — what Fable keeps

The seat keeps exactly the work where its judgment earns its price, nothing else:

1. **Decompose** — cut the objective into lane-sized jobs with grep-able done-whens.
2. **Judge** — read lane briefs adversarially; a lane's "done" is a claim, not a fact.
3. **Apply** — all edits land by the seat's hands, verify-before-apply unchanged:
   read the target region, grep the claim including tests and route/dispatch layers.
4. **Gate** — ships, secrets, DNS, billing, anything irreversible: seat + owner only.
5. **Talk to the owner** — one voice; lanes never address the owner.

Two standing prohibitions at the seat: never `/model`-switch (a model switch burns the
seat's prompt cache — delegation via subagents costs no cache at all), and never do
lane-work inline that a lane could do concurrently (the seat's context is the scarcest
resource in the arrangement).

## The wire — how lanes run

- **Agent tool, background by default.** Batch independent spawns in ONE message so
  they run concurrently. The harness notifies on completion — no polling, no watches.
- **Tight returns.** Every lane prompt ends with an explicit return contract:
  conclusions, paths, and evidence — never file dumps. The seat consumes results, not
  raw material a lane already read.
- **Workflow for structured fan-outs** — reviews, sweeps, migrations, research
  pipelines. Every `agent()` call carries `model: "opus"`. Schema-forced outputs keep
  returns machine-tight.
- **Blocked ≠ stopped.** A lane hitting a wall doesn't idle the swarm: the seat keeps
  every unblocked lane moving and re-probes the blocked path cheaply next turn.

## Persistent builder lanes — the seat-builder ritual (owner-ratified 2026-07-21)

For substantive BUILDS, the swarm runs one level deeper than fire-and-forget lanes.
The seat never hand-builds a feature; it specs, gates, and ships:

1. **Spec at the seat** — objective, constraints, exact deliverables, grep-able
   done-when. The spec is the lane's whole onboarding; write it like a directive.
2. **One persistent Opus builder lane per domain** — spawn it once; it builds and
   returns tight (paths + what changed + how verified, never dumps).
3. **Feedback rounds RESUME THE SAME LANE** (SendMessage to its id/name) — never a
   fresh spawn. The lane's accumulated context of the code it wrote is both the
   token saving (round N costs the delta, not a re-onboarding) and the quality
   keeper (proven across 6+ rounds live). A fresh lane per round forfeits both.
4. **The seat gates every round:** verification commands exit-code-checked — never
   piped through `| tail`/`| head` (they eat the exit code); grep the actual
   bundle/artifact for the claimed change; bank the round as a ledger line.
5. **Scope the lanes by domain** — two domains = two builder lanes, not one
   mega-lane; diagnosis and exploration stay parallel one-shot lanes (fan out,
   consume conclusions, discard).

## QC — the refuter, as code

Fable-director's QC relay becomes a verification stage that runs automatically, not a
session you hope pings back. Before the seat acts on any lane finding graded
CONFIRMED, an independent Opus refuter lane attacks it (V4 §6, inlined):

- "never called / never passed" claims → check route/dispatch layers, string-keyed
  handlers (onclick / event maps / `window.*`), AND test harnesses in scope.
- External claims → two independent sources, labeled.
- Every finding needs a **concrete failure scenario** (inputs → wrong outcome) or it
  is downgraded to PLAUSIBLE.
- **Review-the-fix by a different lane than the finder.**

In Workflow form this is one verify stage after every find stage — the refuter runs
while other lanes still work; no barrier unless dedup genuinely needs one.

## Receipts and estate

- **spend** — log every completed lane at the moment the notification shows its count:
  `python3 <spend-skill>/scripts/spend.py log --lane subagent --model claude-opus-4-8
  --tokens <N> --grade observed --purpose "..."`. Close with `spend.py report`; exit 4
  is surfaced verbatim, never smoothed.
- **archivist** — before any research fan-out, consult `oracle-index.md`; a question
  the estate already answered costs one grep, not a lane.
- **Estate files (STATE / HANDOFF / coord) are banking and crash insurance, NOT a
  message bus.** Lanes die with the app — so the seat BANKs at every seam: what's
  dispatched, what's landed, the exact resume payload. A cold session re-seats the
  swarm from the estate in one read.

## When fable-director instead

Honest boundary: the swarm's lanes live inside this session. Reach for fable-director
when the arrangement must **survive the machine sleeping** (multi-day builds), span
**multiple machines or accounts**, or when the owner wants **watchable lanes in app
panes**. Otherwise the swarm is faster, cheaper to coordinate, and has strictly fewer
failure modes.

## Self-check before finishing

- Every spawned lane carried `model: "opus"` — transcript-verifiable, and logged to
  the spend ledger with its observed token count (or named as unobservable and why).
- The seat never `/model`-switched and never rode a lane's workload inline.
- Every CONFIRMED finding the seat acted on survived an independent refuter lane.
- The estate was banked at every seam; a cold session could re-seat the swarm from it.
- `spend.py report` ran at close; the verdict line is in the transcript.

## Finishing up

Chains: `/spend` (the receipts are the policy's audit trail), `/archivist` (index
before fan-out), `/critic --panel` (its lenses run as swarm lanes), `/sessionend`
(banks the estate and reports the spend). Fable-director remains the sibling for the
multi-session case — and its V4 discipline (edit specs, refuter checklist, ship gates)
is exactly what this skill runs, minus the sessions.
