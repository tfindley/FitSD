# FitSD validation suite

> **TL;DR** — A repeatable fitness-for-purpose test for the FitSD standard: a fictional
> organisation role-plays a real-shaped project through every FitSD stage and seat — from
> the engineer with an idea to the successor who inherits the service years later — and
> every participant logs where the standard helped, where it was silent, and where it got
> in the way. Non-normative: this is test tooling and evidence, not part of the standard.

## Why this exists

A standard reads differently from every chair. The requirements can be internally
consistent and still fail the service-desk analyst at 02:07, or the engineer who inherits
a service after its builder leaves. This suite tests FitSD **in use**: each role acts only
on what the standard and the accumulated in-world records actually provide, and must make
(and log) a local call wherever the standard runs out. The gaps that three independent
seats hit are the ones worth fixing.

The first run (CertHub, 2026-08) produced ~110 findings, 27 applied reference-tier fixes,
and four new requirements (FSD-GV-8, FSD-GV-9, FSD-SD-7, FSD-SA-6). Its complete record —
every artefact, finding, register and the final report — is under
`scenarios/certhub/runs/2026-08/`.

## Layout

| Path | What it is |
|---|---|
| `PROTOCOL.md` | How a run works: stages, sequencing, the information firewall, findings rules, synthesis |
| `findings-template.md` | The entry format every participant logs findings in |
| `agents/` | Thirteen role briefs, one per stage-seat, scenario-agnostic |
| `scenarios/<name>/scenario.md` | A fictional world: organisation, people, trigger, proposed solution, stage hooks |
| `scenarios/<name>/runs/<id>/` | One run's complete output: `artifacts/` (in-world records), `findings/` (out-of-character logs, consolidated register, decision record), `RUN.md` (metadata), `REPORT.html` |

## Running it

1. Read `PROTOCOL.md`.
2. Pick (or write) a scenario. A scenario must be **wholly fictional and
   organisation-neutral** — FitSD carries no organisation's fingerprints, and that
   includes its test material.
3. Create `scenarios/<name>/runs/<id>/` with empty `artifacts/` and `findings/` dirs, and
   a `RUN.md` recording the date, the git ref of the standard under test, and who/what is
   playing the roles.
4. Execute the stages in `PROTOCOL.md` order. Each stage = one participant working from
   its brief in `agents/`, the scenario, and the run's artefacts so far — **nothing else**
   (the firewall matters most at S7). Participants can be AI agents, humans, or a mix;
   the first run used AI role-play throughout, which `RUN.md` should always disclose.
5. Synthesise: consolidate the findings, classify each (fix now / normative candidate /
   deferred / out-of-scope by design), and write the report. The first run's
   `findings/CONSOLIDATED.md` and `findings/NORMATIVE-CANDIDATES.md` are the shape to copy.

## Adding scenarios

New scenarios should stress what CertHub didn't. Ideas: a compliance-driven project (a
regulator deadline, not an outage); a third-party/customer-raised demand (the
source-agnostic front door under real pressure); a team-of-one adoption; a project that
*should* be rejected at Gate 1 (does the standard help you say no?); a retirement
(FSD-RR-7 end to end). Keep the shape: real internal customers, at least one third-party
dependency, and a succession event — those are what expose the operate-phase seams.

## Status of results

Findings and reports here are **evidence, not rulings**. What changes the standard is the
normal stream: errata or a versioned release, logged in `CHANGELOG.md`, decided by the
maintainer. A run's findings register should end classified, with the normative candidates
drafted for that decision — not applied by the run itself.
