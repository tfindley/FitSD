# Validation protocol

> **TL;DR** — One scenario, thirteen seats, eight stages, strict sequencing, a hard
> information firewall, and a findings log from every seat. The output is a classified
> findings register and a fitness report; the standard is only changed afterwards, through
> its normal streams.

## The shape of a run

A run simulates the whole life of one solution under FitSD, at a fictional organisation
defined in the scenario file. Stages run in order; within a stage, independent seats may
run in parallel. Placeholders used in the agent briefs:

- `{STANDARD}` — path to the FitSD standard under test (this repo, at the ref recorded in `RUN.md`)
- `{SCENARIO}` — path to `scenarios/<name>/scenario.md`
- `{RUN}` — path to `scenarios/<name>/runs/<id>/`

| Stage | Brief(s) in `agents/` | Seat | Produces (in `{RUN}/artifacts/`) | Depends on |
|---|---|---|---|---|
| S0 | `s0-standup.md` | Manager (MSO) + executive, jointly | `S0-adoption-pack.md` — scope, roles, net-new line, ratified SAC baseline, implementation profile, registers, cadence | — |
| S1–2a | `s1-engineer-submitter.md` | Engineer 1 (submitter) | `S1-FRM-00-idea-brief.md`, `S2-FRM-01-gate1.md` (submitted, unsigned) | S0 |
| S2b | `s2-approver-gate1.md` | Manager as Gate 1 Approver | Gate 1 §8 sign-off (edits the form) | S2a |
| S3a | `s3a-architect-gate2.md` | Lead architect (+ Engineer 1 contributing) | PoC close-out; `S3-FRM-02-gate2.md` (submitted, unsigned) | S2b |
| S3b | `s3b-executive-gate2.md` | Executive as Gate 2 Approver | Gate 2 §8 sign-off | S3a |
| S4 | `s4-builder.md` | Engineer 1 | The operational artefact set (HLD, runbook, recovery, user guide, monitoring + incident profile) and the draft acceptance record | S3b |
| S5 | `s5a-sdm-review.md`, `s5b-servicedesk-review.md`, `s5c-product-review.md` — **parallel** | SDM; service desk; product manager | Three review memos | S4 |
| S5d | `s5d-approver-acceptance.md` | Manager as acceptance Approver | Acceptance sign-off, conditions, register entry (edits the record) | S5 |
| S6 | `s6-servicedesk-operations.md` | Service desk, months post-live | `S6-ticket-log.md` — tickets worked from the documents alone | S5d |
| S7 | `s7-successor.md` | Engineer 2, **firewalled** | Takeover assessment; new front-door submission | S6 |
| S8 | `s8-governance-retro.md` | MSO + executive | Management-review minutes | S7 |

Every seat also writes one findings file to `{RUN}/findings/`, in the
`findings-template.md` format.

## The three hard rules

1. **The standard is what's in `{STANDARD}`.** A participant uses only what FitSD
   actually provides. Where it runs out — a missing template, rule, role or number — the
   participant does what a real team does: makes a sensible, *declared* local call,
   proceeds, and logs it as a finding. Participants never modify the standard.
2. **Artifacts are the only shared memory.** Later seats read the in-world records in
   `{RUN}/artifacts/`, never another participant's findings or reasoning. Findings files
   are out-of-world; briefs must not grant access to them (the retro included — it reads
   records, not findings). The firewall is strictest at S7: the successor gets the
   artefact set, the scenario, and the standard. Nothing else. If the successor's brief
   leaks history, the run's central result is void.
3. **In character in artifacts; out of character in findings.** Artifacts read like a real
   team's paperwork — concrete, dated on the scenario's in-world timeline, complete enough
   to stand alone (later seats depend on their quality). Findings read like a reviewer's
   notes, and **must log worked-wells as well as failures** — a register with no praise
   column is as suspect as one with no gaps.

## Findings discipline

Use `findings-template.md` exactly: kind (gap / friction / ambiguity / worked-well),
what was needed, what the standard gave (with doc + section), the local call made,
severity (blocker / major / minor / praise), and an optional one-line fix. Cite documents
precisely — a finding that can't be checked against the standard's text is an opinion.

## Synthesis (after S8)

1. **Consolidate**: group all findings by theme; count independent seats per theme
   (convergence is the signal — a gap three seats hit unprompted outranks any single
   strong opinion). Write `{RUN}/findings/CONSOLIDATED.md`.
2. **Classify** every theme and residual item:
   - *reference-tier fix* — non-normative (forms, reference process, guidance, stores):
     may be applied directly, logged in `CHANGELOG.md`;
   - *normative candidate* — draft the precise `shall`, its owning capability, ID, and
     ripple (cards, forms, alignment tables) in `{RUN}/findings/NORMATIVE-CANDIDATES.md`;
     the maintainer decides, per the Versioning Policy (a new shall = MINOR; a tightened
     one = MAJOR — prefer new);
   - *deferred* — record in `BACKLOG.md` / the Roadmap with the evidence attached;
   - *out of scope by design* — say so, and check the boundary is stated somewhere a
     reader will find it.
3. **Report**: verdict, method, promise grades (grade the pitch's own claims against the
   record — it makes an excellent Check structure), per-seat coverage, what worked, what
   failed with dispositions, and the decision package. Store it in `{RUN}/`.
4. Run the repo guards (`scripts/check-sac-drift.sh`, `scripts/check-version-drift.sh`)
   before committing any change the synthesis applies.

## Honesty notes

- Record the **git ref of the standard under test** in `RUN.md` before S0. Findings
  against a moving tree are unusable.
- Disclose **who or what played the seats** (humans, AI agents, a mix) in `RUN.md`. AI
  role-play is fast and consistent but shares blind spots across seats; a human in even
  one seat (especially S5b or S7) is a valuable control.
- Scenario realism beats scenario drama. The most valuable findings came from mundane
  events: a slipped condition, a Friday-afternoon ticket, a resignation.
- One run is an existence proof, not a survey. Converged findings are strong evidence a
  gap exists; absence of findings is weak evidence one doesn't.
