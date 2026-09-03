# Normative candidates — drafted wording

> **Status: APPLIED.** The maintainer approved the full package on 2026-08-31; N1–N6 and
> both postscript note-edits landed on the unreleased v0.3 (branch `readability`) as
> FSD-GV-8, FSD-GV-9, FSD-SD-7, FSD-SA-6, the GV-5/RR-6/RR-7 note additions and the SAC
> Documentation-row wording. N6 was implemented as an FSD-SA requirement (the lighter of
> the two options drafted). This file is kept as the decision record.

Per the agreed evidence-first approach: nothing below was applied before that decision. Each is a
**backward-compatible normative addition** (MINOR under the Versioning Policy) that can
ride the unreleased v0.3.0 — or wait for v0.4/v0.5. All are also recorded as candidates in
keystone's BACKLOG (commit d5c977b), so deferring loses nothing.

Ordered by evidence strength.

---

## N1 — FSD-GV-8: owner transition / continuity re-verification  ⭐ the simulation's headline

> **FSD-GV-8** | When the accountable owner of a live service changes or leaves,
> continuity **shall** be re-established and re-evidenced within a period the organisation
> defines: a handover, the successor's walk-through of the runbook and recovery procedure,
> any deputy or cover the baseline requires re-named, and the leaver's owned register
> entries transferred. | *The gap between "owner named" (FSD-GV-2) and "leaver's access
> revoked" (FSD-SA-2) is where operating knowledge lives. Continuity is proven at
> Service Acceptance (FSD-SD-5); this re-proves it on the one event that voids it.*

**Evidence:** S7 (the successor inherited an un-drilled CA nine weeks after the owner
left; the register named a leaver for ~8 weeks; every item in the successor's 30-day plan
was this rule executed by hand, late). S8-5/6. The successor's explicit "the ONE change"
verdict (S7-13). **Touches:** Requirements (new row), Govern card, Definitions
(Continuity entry gains "re-established on owner change"), SAC Supportability row note.

## N2 — FSD-GV-9: service levels & reporting (promotes the standing BACKLOG candidates; closes FitSM PR2+PR3)

> **FSD-GV-9** | Each live service **shall** have agreed, recorded service levels — or an
> explicit best-effort statement — with its customers, published to them; and performance
> against them **shall** be reported to those customers at a defined cadence. | *Thin,
> reference-out: the availability SLO already lives in the SAC; "published" is the working
> half — a support model agreed only inward passed acceptance honestly. Reporting can ride
> an existing review.*

**Evidence:** S5-SDM-1/4 (the only normative SLA mention withdraws them at retirement);
S6-5/6 (the desk's most-quoted document was a local invention; one auditor question
crossed four people); S5-PM-4; S3b-5 (nothing brings a live service back to leadership);
S8-11 (pitch promise (c) "met when asked, decaying"). **Touches:** Requirements, Govern
card, SAC Supportability row (already prompts publication after d5c977b), Standards
Alignment §2 (gap note flips to closed), Roadmap/BACKLOG (candidates satisfied).

## N3 — FSD-SD-7: conditions tracked to closure

> **FSD-SD-7** | Conditions attached to a gate or acceptance decision **shall** be
> recorded with an owner and a target date and tracked to closure; a breached condition
> **shall** be escalated to the approver who set it. | *Every real decision carries
> conditions; the v0.3 forms now have the fields — this is the duty that stops them
> silently dying. New requirement rather than a tightening of FSD-SD-6, so existing
> v0.2 conformance is unaffected.*

**Evidence:** S8-4's body count (11 conditions: 5 closed on time, 3 late, 3 silently died,
split perfectly by whether a named beneficiary was chasing); S6-4 (a dead condition's
first forcing function was the pager); S7-4 (another produced the un-drilled successor).
**Touches:** Requirements, FSD-PRO (already carries the language after d5c977b), forms
(already carry the fields).

## N4 — FSD-GV-5 note (non-normative note-column addition, not a new shall)

> Note on FSD-GV-5: *The review looks at per-service state — register accuracy, open
> conditions, overdue evidence, end-of-life candidates — not only at the system. A review
> that does not occur by its due date is escalated, not skipped.*

Deliberately note-level: tightening GV-5's shall itself would be a breaking change under
the Versioning Policy (a tightened requirement = MAJOR). The Implementation Guide step 7
already carries the agenda (d5c977b); this puts the same sentence where an auditor reads.

**Evidence:** S8-1/2/3 (the review had no required object, no inputs, and sat behind the
entire failure curve — then itself silently failed).

## N5 — SAC Documentation row: decisions survive delivery (reference-doc wording)

> Documentation row, "what it covers": "…design **(carrying the key decisions and their
> rationale from delivery)**, runbook, recovery procedure, operating procedures (SOPs),
> user/how-to."

Semi-normative in effect (it changes what acceptance proof looks like), hence queued here
rather than applied. The stores/forms side is already applied (RAIDD transfer note,
per-service-docs store row).

**Evidence:** S7-1 (the HLD's decision log was "the single most valuable page" for the
successor — and existed only because an approver invented DEC7 as a funding condition);
S3a-1, S4-7.

## N6 — Cryptography / key management (lower priority; closes the self-identified NIS2 21(2)(h) gap)

A thin SAC criterion or FSD-SA requirement ("keys and secrets are managed to a defined
standard — generation, storage, rotation, revocation — with evidence"). Logged with irony
by the CTO after approving a certificate authority under a framework whose admitted
control-level gap is cryptography (S3b-10). Fits the "new criterion is a framework change"
rule — a bigger call; fine to defer.

---

**Postscript — two Requirements *note*-level edits also awaiting your OK** (non-normative
but they edit the normative doc, so not applied unilaterally):

1. FSD-RR-7 note: add "the decision may legitimately be recorded as *not retire —
   succession routed to Solution Development*, with the renew/replace arm settled at
   Gate 1." (S7-9: the three arms arrive before an honest pick is possible.)
2. FSD-RR-6 note: add the registration-evidence sentence mirroring what FSD-PRO §7 now
   says ("registration means the incident process's owner accepted the profile, evidenced
   by name and date").
