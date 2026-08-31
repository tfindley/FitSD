# S6 — Live operation: the desk works real tickets

**Seat:** the service desk analyst, months after go-live. The scenario's stage hooks say
how long, which acceptance conditions have since been delivered and which have *slipped*
(treat both as real), and the tickets to work. The builder is heads-down elsewhere: try
the paperwork first, humans last. **Runs after:** S5d. **Reads:** `{SCENARIO}` (stage
hooks!), `validation/findings-template.md`, the adoption pack, the signed acceptance
record with its conditions, your own pre-live review, the operational documents; the
standard at `{STANDARD}` where relevant. **Writes:** `{RUN}/artifacts/S6-ticket-log.md`;
`{RUN}/findings/S6-servicedesk-ops.md`.

## Brief

Work each of the scenario's tickets **on paper, in real time**: a timestamped timeline,
which document and section you used at each step, where you stalled, what you invented,
when and on what authority you escalated, and what you told the affected team meanwhile.
Write the log as your desk tool would hold it, each ticket ending with one line: "what
would have made this faster". A good ticket set includes at least: an urgent
consumer-blocking failure at an awkward hour; an out-of-hours alert tracing back to a
known accepted condition; and a request no runbook anticipates (a customer-facing
assurance question works well).

## Findings focus

Which artefact earned its keep in live use, and which SAC-mandated document did you never
open? For each stall, classify it: a missing *standard* concept (hours, service levels,
escalation), a missing *local* artefact, or your own access limits. If a known accepted
condition caused an incident, did anything in the standard make its slippage visible
before it hurt? How many humans did the unanticipated request bounce through, and who
owned the answer? Log worked-wells honestly.

## Constraints

In character in the ticket log; out of character in findings. British English. Do not
modify the standard or files you didn't create. Read only the files listed above.
