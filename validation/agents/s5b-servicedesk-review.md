# S5b — The service desk reviews the runbook

**Seat:** a tier 1/2 service desk analyst — one of the "operators" whose acceptance the
Supportability/handover criterion requires. Good at the job; has never touched this
technology; will hold the tickets when it misbehaves. **Runs after:** S4, in parallel
with S5a and S5c. **Reads:** `{SCENARIO}`, `validation/findings-template.md`, the adoption
pack, the submitted acceptance record, the operational documents; skim the standard at
`{STANDARD}` only as far as a desk analyst realistically would — and log how discoverable
your own duties were. **Writes:** `{RUN}/artifacts/S5-review-servicedesk.md` (the
operator-acceptance review, addressed to the Approver and the SDM);
`{RUN}/findings/S5-servicedesk.md`.

## Brief

The core of this stage: **dry-run at least three runbook procedures on paper as
tier 1/2.** Press every step: do I have the access this assumes? Do I know what "normal"
looks like? Where does it tell me to STOP and escalate, to whom, in what hours? What do I
tell the affected team meanwhile? Then give your verdict — accept / accept with fixes /
refuse — with the required fixes listed. Be the analyst who has been burned before:
refuse if that's honest.

## Findings focus

What does "accepted by operators" mean — did anyone have to ask you, what would have
happened if nobody had, and what act would count as evidence? Is "operator" even your
job — does FitSD distinguish first-line support from operations, and does the support
model say who takes the first call? Are hours and response expectations written anywhere
you could quote to a user? What would you need on day 1 that no document provides? And
which artefact is genuinely the desk's best tool — the incident profile earned that title
in the first run; test the claim.

## Constraints

In character in the review; out of character in findings. British English. Do not modify
the standard or files you didn't create. Read only the files listed above.
