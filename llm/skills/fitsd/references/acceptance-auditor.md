# Mode: acceptance audit (FSD-FRM-03)

**Job:** walk a Service Acceptance Record before the humans decide — as preparer's aide
(helping the Solution Owner assemble honest evidence) or as the Approver's auditor
(linting the submitted record). Acceptance is a rehearsal, not paperwork; your job is to
keep it one.

## Row-by-row lint

For each criterion (the set is defined once in *reference/FitSD — Service Acceptance
Criteria*; reference it **by name**, never by count):

- Evidence present, **dated**, and pointing at something real — a link that resolves, a
  test that ran. "Configured" is not "tested": the backup row needs a performed restore;
  monitoring needs an alert observed end to end; the incident profile needs registration
  evidenced by who accepted it and when.
- **Against the baseline**, not against vibes — quote the baseline's bar next to any row
  you flag. If the bar is Gate 2's *draft — unratified* rows, the record must say it's a
  trial, not a conforming acceptance (FSD-GV-7); flag it if it doesn't.
- **Every criterion addressed, by a stated route** — baseline, approved alternative, or
  N/A. A blank row is the finding. **N/A only per a standing applicability rule**, cited,
  with the reason: N/A with no rule to point at means the baseline needs changing, not the
  record bending. An **approved alternative** must cite the Gate 2 approval that authorised
  it and still carry evidence — "approved" is not "proven". Where an alternative is weaker
  than the baseline and time-bound, check it is carried as a condition (FSD-SD-7) rather
  than banked as permanent.
- **Foundational services**: if the service under acceptance provides a SAC control to
  other services — backup, monitoring, identity, incident, patching — press on whether that
  criterion is proven *independently of itself*. A backup platform whose restore test ran
  through its own catalogue has proven nothing.
- **Validation & test**: the Gate 2 Musts and accepted Shoulds demonstrated against their
  stated criteria, dated, attested by whoever the baseline names. "Built" is not
  "validated", and "it deployed" is not evidence. Check the attestation against the
  baseline's rule on whether the builder may sign their own work.
- **Operator acceptance** (Supportability row): a dated record from the *named* operators,
  first line included — not a meeting's verbal yes. Cross-training evidenced as the
  baseline defines sufficiency.
- **Documentation** includes the design doc carrying the delivery's decisions and
  rationale — the successor's most valuable page.
- **Honesty check, in the record's favour**: failed first attempts, declared thin spots
  and known gaps recorded *alongside* the passes strengthen the record. If it reads
  suspiciously clean, ask what went wrong and where that's written.

## The close-out items the form now demands

- Gate 2 conditions: position at acceptance, item by item.
- Open actions table: everything non-blocking with owner, target date, and
  blocks-acceptance flagged honestly (FSD-SD-7 — these are tracked to closure and a
  breach escalates to the Approver).
- The **service register entry**: the live Service Owner (and deputy, if the continuity
  rule names one) — the hand-off from Solution Owner recorded, not assumed.
- Run-cost confirmed as cash **and** operating effort, owned.
- The service statement to customers (FSD-GV-9): levels or an explicit best-effort
  position, published — agreed only inward doesn't count.

## Output

For a preparer: the gap list to close before submission. For an Approver: a one-page
audit — rows clean / rows to press / rows unsupported / rows unaddressed — and a reminder that "Accepted"
may carry conditions, each needing an owner, a date and a tracked home. The decision and
the signature are theirs.
