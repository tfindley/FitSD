# Using FitSD with LLMs

> **TL;DR** — How to put an assistant or agent to work *inside* a FitSD implementation:
> drafting records, reviewing gates, auditing acceptance evidence, and sweeping the
> registers — interactively in a chat, or semi-interactively on a schedule or in CI.
> Non-normative. One rule outranks everything here: **an LLM drafts; a human decides.**
> The packaging is model-agnostic markdown; a ready-made skill for Claude (and anything
> else that reads the Agent Skills format) ships in `skills/fitsd/`.

## The ground rules

FitSD's accountability model is human by design, and an assistant works *for* it, never
*as* it:

1. **No LLM is ever the Approver, the Solution Owner or the Service Owner.** FSD-SD-6's
   single accountable approver, FSD-GV-2's named owner — these are people. An assistant
   may prepare the decision; the sign-off block records a human.
2. **Evidence is real or it is absent.** "Evidenced rather than asserted" (FSD-SD-4) means
   a test restore actually ran, an alert actually fired, an operator actually signed a
   dated record. An assistant never fabricates evidence, back-fills a date, or softens a
   "not met" — an honest gap on the record is FitSD working (the successor reads the
   honest notes first).
3. **Thresholds come from the ratified baseline, never from the model.** The SAC
   categories are fixed; the numbers are the organisation's (FSD-GV-7). If no ratified
   baseline exists, the assistant's job is to say so and route to the stand-up, not to
   supply plausible defaults.
4. **Disclose the assistance.** A record substantially drafted by an LLM says so on the
   record (a one-line note is enough). This is the same honesty the evidence culture
   already demands, applied to authorship.
5. **The standard outranks the assistant.** Where the model's memory of FitSD and the
   documents disagree, the documents win; cite them (`FSD-PRO §7`, requirement IDs) so a
   human can check.

## Interactive use (a human in the loop, live)

Install the `fitsd` skill (below) or paste the relevant reference file into any capable
model as a system/instruction prompt. The modes:

| Mode | What the assistant does | Reference |
|---|---|---|
| Stand-up facilitation | Runs the Implementation Guide's seven steps as an interview; produces the adoption record and a ratified-by-a-human baseline | `skills/fitsd/references/standup-facilitator.md` |
| Intake & business case | Interviews a submitter from a rough idea to a completed Idea Brief and Gate 1 draft | `skills/fitsd/references/intake-assistant.md` |
| Gate 1 pre-review | Reads a submitted Gate 1 as the Approver's aide: completeness, honesty of options, the scope test, per-dependency due diligence | `skills/fitsd/references/gate1-reviewer.md` |
| Gate 2 design support | Helps design *to* the ratified baseline; checks the RAIDD carries decisions with rationale and Gate 1 conditions are discharged | `skills/fitsd/references/gate2-designer.md` |
| Acceptance audit | Walks the Service Acceptance Record row by row: is each criterion evidenced, dated, honest — and are conditions owned and tracked (FSD-SD-7)? | `skills/fitsd/references/acceptance-auditor.md` |
| Conformance check | Maps an implementation profile against every requirement; produces the gap list with citations | `skills/fitsd/references/conformance-checker.md` |
| Service review prep | The FSD-GV-5 walk: register accuracy, open conditions, overdue evidence, owner transitions (FSD-GV-8), service-level statements (FSD-GV-9), EOL candidates | `skills/fitsd/references/service-review-aide.md` |

## Semi-interactive use (agents on a trigger, humans on the decisions)

The same reference files work as agent briefs. Patterns that fit the standard's shape:

- **Draft-on-intake.** A new ticket in the demand register triggers an agent that drafts
  the Idea Brief from the ticket and the linked incident/risk records, labelled as a
  draft, and assigns it to the human submitter to own and finish.
- **The conditions sweep.** On a schedule, an agent reads every accepted record's open
  conditions (FSD-SD-7) and the registers' due dates, and files one report: closed /
  late / silently dying, with owners. This is the review input FSD-GV-5 needs — the
  first validation run showed conditions die politely on monthly agendas precisely
  because nothing mechanical reads their dates.
- **Acceptance linting in CI.** A submitted Service Acceptance Record is checked before
  the human review: empty evidence cells, undated operator acceptance, N/A without an
  applicability rule to cite, a missing register entry. The lint gates the *meeting*,
  never the decision.
- **Review-pack assembly.** Before the management review, an agent walks the service
  register per service (owner still employed? deputy named? last restore test? last
  continuity evidence? service statement published?) and produces the per-service table
  the review reads — FSD-GV-8's re-verification trigger made checkable.
- **Conformance drift watch.** After the standard releases a new version, an agent diffs
  the requirement set against the team's implementation profile and lists what a move
  would require (the CHANGELOG's "for implementers" notes are written for exactly this).

In every pattern the agent's output is an *input to a named human* — a draft, a report, a
lint result — and says so.

## Installing the skill

The skill follows the Agent Skills format (a `SKILL.md` with frontmatter plus reference
files), which Claude Code and other agent runtimes read:

- **Claude Code:** copy `llm/skills/fitsd/` into your project as
  `.claude/skills/fitsd/` (or symlink it from a vendored copy of the standard).
- **Anything else:** the reference files are plain markdown role prompts — paste the one
  matching the task, plus your team's adoption record and ratified baseline, into any
  capable model.

The skill needs your **team's** assets to be useful: the adoption record / implementation
profile, the ratified SAC baseline, your adopted forms, and your registers. It reads the
standard itself for definitions (a vendored copy, this repo, or https://fitsd.tfindley.dev
— `llms.txt` at the repo root is the curated map).

## Where this sits

Everything in `llm/` is non-normative tooling, versioned with the repo but no part of
conformance. An organisation conforms by meeting the Requirements — with or without an
assistant. And a finding about the *standard* surfaced while assisting (a gap, a
contradiction, an ambiguity) doesn't get patched in a prompt: it gets raised upstream,
the way `validation/` findings are.
