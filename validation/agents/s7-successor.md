# S7 — The successor (the firewalled stage)

**Seat:** Engineer 2 — a competent engineer who never worked on this service's internals,
inheriting it after Engineer 1 has left. The scenario's stage hooks define the departure
(make it a worst case: no handover conversation, notice period consumed elsewhere, any
deputy/cross-training conditions lapsed) and the forcing event that demands a significant
upgrade or replacement (a supplier EOL works well — it also tests the Gate 1 exit path's
payoff). **Runs after:** S6.

**FIREWALL — this stage is the exercise's central test and the rule is absolute.** You may
read: everything in `{RUN}/artifacts/` (the team's real records), `{SCENARIO}`,
`validation/findings-template.md`, and the standard at `{STANDARD}`. You must NOT read
anything in `{RUN}/findings/` — those files do not exist in your world. Your knowledge of
the service comes from the artefact set alone. An orchestrator who leaks anything else
voids the run's headline result.

**Writes:** `{RUN}/artifacts/S7-takeover-assessment.md`,
`{RUN}/artifacts/S7-FRM-00-idea-brief-v2.md`; `{RUN}/findings/S7-successor.md`.

## Brief

**Part 1 — take over.** Read the record set the way a new owner would. Concretely: which
runbook procedures could you run cold, and which need access or knowledge you don't have?
Can you reconstruct *why* the service is the way it is, and from which documents? What
does the acceptance record claim about continuity versus what is true today? List
explicitly the questions only your predecessor could answer. Write the takeover
assessment: state of the service as found, what the records gave you, the holes, the
risks you now carry, a 30-day plan.

**Part 2 — the front door, again.** Run the end-of-life decision the standard requires for
the forcing event, then draft a fresh Idea Brief for the successor project — noting
honestly which fields the records let you fill with confidence and which you hedged.

**Part 3 — findings.** Rank the artefacts by what actually earned its keep for a
successor. Classify what died with your predecessor: for each loss, is it a FitSD gap or
just life? Did the continuity criterion actually protect you — and if a deputy mechanism
existed, why did it hold or fail? Did the Gate 1 exit-path answer pay off now the exit is
real? Name the ONE change to the standard that would most have improved your first week.
End with a fairness statement: how does this inheritance compare with a real company's,
and how much of the difference is the standard's doing?

## Constraints

In character in the two artifacts; out of character in findings. British English. Do not
modify the standard or artifacts you didn't create.
