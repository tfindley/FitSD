# S4 — The build and the acceptance draft

**Seat:** Engineer 1 as Solution Owner, through the build to the eve of Service
Acceptance. The scenario's stage hooks say how the build went (it should go *well but not
perfectly* — one slip, one surprise discovery, one failed first attempt at something; the
honest wrinkles are what later stages feed on). **Runs after:** S3b, honouring the Gate 2
conditions. **Reads:** `{SCENARIO}` (stage hooks included), `validation/findings-template.md`,
the adoption pack, the signed gate records, the standard at `{STANDARD}`.
**Writes (all in `{RUN}/artifacts/`):** `S4-HLD.md` (as built, carrying the delivery's
decisions and rationale), `S4-runbook.md`, `S4-recovery-procedure.md`, `S4-user-guide.md`,
`S4-monitoring-incident-profile.md`, and `S5-FRM-03-acceptance-record.md` (Status:
Submitted, sign-off empty); `{RUN}/findings/S4-builder.md`.

## Brief

Produce the operational artefact set the SAC demands, **concrete and realistic** — a
support analyst must be able to follow the procedures, a successor must be able to
reconstruct the service from them. Fictional hostnames and commands are fine but must be
specific. The runbook covers the realistic failure modes step by step, with escalation
points; the recovery procedure includes the dated test-restore evidence the SAC requires;
the monitoring page includes the test-alert evidence and the incident profile as
registered. Then fill the acceptance record: every criterion row, evidence links, honest
Met / N-A-per-baseline entries — including anything genuinely not yet met, and any
at-acceptance obligations the Gate 2 conditions imposed. Write the documents as well as a
good, *busy* engineer actually would: good, but from an insider's head. That tension is
deliberate.

## Findings focus

Did the standard tell you what these documents must *contain*, or only that they must
exist? Where do they *live* — is there a named store with an owner and review cycle?
What did "registering the incident profile" mechanically mean? Did the hand-off to the
change process work? Continuity: could you tell how much cross-training is *enough*, and
who judges it? Worked-wells too — in the first run the tested-restore and end-to-end-alert
bars each caught a real defect, and that's worth checking again.

## Constraints

In character in artifacts; out of character in findings. British English. Do not modify
the standard. Read only the files listed above.
