# S6 findings — service desk in live operation (Rafi Osman, tier 1/2)

Ten weeks post-acceptance, three tickets worked on paper from the artefact set alone
(`S6-ticket-log.md`). Context that matters for fairness: the FRM-03 §2 conditions dated
2026-12-04 for the desk (access pack, tier-1 lanes, escalation addendum — rows 4–6) had
landed; rows 1 (cert ownership) and 9 (canned comms, ticket taxonomy, triage-guide
regime) had slipped. Stall classification across the three tickets: **zero stalls were
access stalls** (the pre-live review fixed that class); the live stalls split into
missing-standard concepts (findings 4–6) and missing local artefacts riding an
untracked-conditions hole (finding 8).

### [S6-DESK-1] The incident profile earned its keep — twice, mechanically
- **Kind:** worked-well
- **What I needed:** a severity call at 17:40 on a Friday (one team blocked, deadline pressure) and a correct 02:07 routing decision for an expiring unowned cert.
- **What the standard gave me:** FSD-RR-6's per-service incident profile, defined at acceptance (SAC Incident-profile row) and registered with the incident process. Both calls were reads of a table, not judgement: "one team, no workaround = Sev2; ≥2 = Sev1", and "cert <7 d, no renewal in flight = Sev2 → Opsgenie". The 02:07 page woke exactly the person the documents said it would.
- **What I did about it:** nothing — that is the praise. Ten weeks in, the desk has never had to guess a CertHub severity against the central policy's abstractions.
- **Severity:** praise
- **FitSD doc & section:** FitSD — Requirements FSD-RR-6; reference/FitSD — Service Acceptance Criteria (Incident profile row); FSD-PRO §7
- **Suggested fix:** none — this is the framework's single most desk-valuable idea, working as designed.

### [S6-DESK-2] Operator acceptance produced the artefacts that made live use workable
- **Kind:** worked-well
- **What I needed:** to run runbook §5.1/§5.2 lanes with tier-1/2 access only.
- **What the standard gave me:** the SAC Supportability row's "runbook and SOPs accepted by operators" forced the pre-live operator review, which produced the access pack and tier-1 lane conditions — and those, once delivered, worked exactly as specified. Ticket 1's whole triage (portal order view, dig, register check) and Ticket 2's step-1 inventory lookup ran without touching a human. My pre-live dry-runs stalled inside a minute; the live tickets never stalled on access at all.
- **What I did about it:** nothing; noting the contrast deliberately — the acceptance machinery demonstrably changed the live outcome.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability/handover row); FSD-PRO §7
- **Suggested fix:** none.

### [S6-DESK-3] The SAC monitoring row was the backstop that actually caught the slipped condition
- **Kind:** worked-well
- **What I needed:** for a known risk (unowned legacy cert) not to become an outage while its remediation slipped.
- **What the standard gave me:** the baseline's "expiry-style dates always monitored" (SAC Monitoring row, meeting FSD-RR-4's spirit estate-wide) meant the failure of the ownership drive surfaced as a 02:07 page **seven days before expiry**, not as a 4-hour Saturday outage — the INC-4211 failure mode, caught by the control built from its lesson. The escalating 30 d → 14 d → 7 d ladder behaved exactly as registered.
- **What I did about it:** worked the lane; the renewal was calm and done inside the window.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Monitoring & alerting row); FitSD — Requirements FSD-RR-4
- **Suggested fix:** none — but see S6-DESK-4 for what let it get to the pager at all.

### [S6-DESK-4] Acceptance conditions have no existence in the standard, so their slippage has no tripwire
- **Kind:** gap
- **What I needed:** something to make the 2026-12-04 ownership condition's nine-week slippage visible before it woke an engineer at 02:07.
- **What the standard gave me:** FSD-PRO §7 offers exactly two outcomes — *Accepted* or *Remediation required*. "Accepted with conditions", the §2 condition table, owners, dates and the monthly-review standing item were all local inventions (the acceptance record itself flags the repurposing). The standard's only chase mechanisms are FSD-GV-4 (registers current) and FSD-GV-5 (review cadence) — a monthly agenda item at best. So the condition was *visible* (on an agenda every month) but *unforced*: nothing distinguished "reviewed and re-dated" from "closed". The first forcing function was the pager.
- **What I did about it:** logged on the ticket that the condition predated the incident by nine weeks; escalated to the Management System Owner. The desk cannot do more.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (Outcomes); FSD-FRM-03 (no conditions field); FitSD — Requirements FSD-GV-4/5
- **Suggested fix:** a third §7 outcome — *accepted with conditions* — each condition carrying owner, date and recorded closure, overdue conditions surfacing as risks (FSD-SA-1) rather than agenda lines.

### [S6-DESK-5] The framework has no support-hours/SLA/service-statement concept; the desk's most-quoted document is a local invention
- **Kind:** gap
- **What I needed:** an authoritative answer to "what response is a team entitled to at 17:40 on a Friday, and where does it say so?" (Ticket 1).
- **What the standard gave me:** the SAC Supportability row requires that "a support model exists" — which is why hours and response targets were written down *anywhere* — but nothing in FitSD requires the model be **published to the people it binds**. The quotable answer lived solely in the service statement, which exists only because the SDM's acceptance-review memo forced it (FRM-03 §2 rows 7/11). Without that local invention I would have been quoting a governance page (the Adoption Pack §4 baseline) at a blocked team, ten minutes before their freeze.
- **What I did about it:** quoted the service statement; noted it is the single most-used document on the desk and the framework doesn't know it exists.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability/handover row); FitSD — Requirements FSD-SD-5
- **Suggested fix:** one clause in the Supportability criterion: the support model (hours, response targets, out-of-hours position) is published to service consumers, not just agreed with operators.

### [S6-DESK-6] Nothing faces "us as the supplier": one auditor question bounced through four humans
- **Kind:** gap
- **What I needed:** something to send when a customer's auditors ask for "your SLA and evidence of DR testing" (Ticket 3), and a named owner for the answer.
- **What the standard gave me:** FSD-SC faces entirely the other way — *our* suppliers, our registers, our due diligence. FitSD — Definitions defines SLA ("a commitment to a customer") but no requirement, form or SAC row ever produces one or assigns ownership of external assurance. The record set held an internal objective, an attainment summary and a dated DR test — genuinely good material — but no document answering the question *as asked*, and the escalation table had no row for it. The question travelled AM → desk → SDM → manager → SDM → desk over a day and a half.
- **What I did about it:** assembled the nearest-fit pack, routed to the SDM as de facto owner; he approved an extract-and-attest response and flagged that even his own baseline amendment (row 11) doesn't cover this.
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements FSD-SC (scope note); FitSD — Definitions ("SLA / SLO")
- **Suggested fix:** a thin acknowledgement — in FSD-SC or the SAC Availability/Supportability rows — that where consumers sit behind customers, an owner is named for supplier-facing assurance (who may state what, on what evidence).

### [S6-DESK-7] Sev2 pages a human at 02:07 against a 4-working-hour target
- **Kind:** friction
- **What I needed:** coherence between who gets woken and when a response is actually due.
- **What the standard gave me:** the SAC baseline prompts ask for alert routing (Monitoring row) and response targets (Supportability row) as separate questions; nobody was ever prompted to reconcile them. Fernbrook's answers — "Sev1/2 → Opsgenie" and "Sev2: 4 working hours" — are individually sensible and jointly mean an engineer is woken for work not due until 13:00. A local baseline bug, but one the SAC's question structure invites.
- **What I did about it:** logged it on the ticket; on-call self-triaged back to sleep, which is the informal fix nobody has ratified.
- **Severity:** minor
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Monitoring & alerting; Supportability rows)
- **Suggested fix:** one prompt in the baseline template: "do your routing, targets and support hours agree about out-of-hours?"

### [S6-DESK-8] The slipped local artefacts were exactly the ones live use needed weekly
- **Kind:** friction
- **What I needed:** a home for the auto-raised 14-day expiry tickets, canned comms lines, and a versioned triage guide (FRM-03 §2 row 9, slipped).
- **What the standard gave me:** nothing directly — these are local artefacts, correctly identified pre-live and correctly conditioned. The finding is their *consequence profile*: the 14-day ticket for the billing cert sat unassigned in the catch-all for seven days in my own queue because it had no request type and no addressee; both Ticket 1 and Ticket 3 comms were composed from scratch; my triage guide is still the October draft. Missing local artefacts, not standard gaps — but their invisible slippage rode the same untracked-conditions hole as S6-DESK-4.
- **What I did about it:** invented the comms on the spot (extending runbook §5.1 step 3 by analogy for the `authorization failed`/not-onboarded case); flagged the buried ticket in the incident record.
- **Severity:** minor
- **FitSD doc & section:** n/a (local); consequence of the FSD-PRO §7 gap in S6-DESK-4
- **Suggested fix:** covered by S6-DESK-4's condition tracking.

### [S6-DESK-9] Two SAC-mandated documents were never operated at the desk in ten weeks
- **Kind:** friction
- **What I needed:** (answering the review question honestly) which mandatory documents did live desk work actually use?
- **What the standard gave me:** the SAC Documentation row mandates five documents as one undifferentiated set. In ten weeks the desk lived out of the runbook lanes, the user guide, and the two *unmandated* documents (service statement, triage guide). The **HLD was never opened**; the **recovery procedure was opened once** — to quote its §4 evidence table for an auditor, never to operate. Not a criticism of either document (they serve design, build and DR audiences, and the recovery evidence earned its keep in Ticket 3) — but the row is audience-blind, and the desk's two daily documents are invisible to it.
- **What I did about it:** nothing to do; recorded for the June baseline review.
- **Severity:** minor
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Documentation row)
- **Suggested fix:** optional prompt in the Documentation baseline: "which document serves which audience?" — surfaces the consumer-facing gap of S6-DESK-5 for free.

### [S6-DESK-10] Deadline pressure vs impact severity: nobody's document draws the line
- **Kind:** ambiguity
- **What I needed:** an answer to "does the 18:00 deploy freeze change the severity?" (Ticket 1 — the caller certainly thought it should).
- **What the standard gave me:** FSD-RR-1 requires events "prioritised against defined targets" and leaves the scheme to the org — fair. But neither IM-02, the incident profile, nor any local artefact distinguishes business-deadline urgency from service impact, so the desk holds that line from personal authority alone. I invented: "the freeze is your constraint, not a severity input."
- **What I did about it:** held the line, wrote the sentence into my triage notes for the guide's next revision.
- **Severity:** minor
- **FitSD doc & section:** FitSD — Requirements FSD-RR-1 (arguably out of FitSD's scope — the central incident policy's job)
- **Suggested fix:** none in the standard; a one-liner in the incident-profile registration pattern ("severity measures impact, not caller urgency") would travel well.
