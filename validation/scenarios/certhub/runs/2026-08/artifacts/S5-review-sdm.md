# CertHub — Service Acceptance review: service delivery

**Fernbrook Software — internal.** Confluence `PLAT` → Solution Development → child of S5-FRM-03 (PLAT-341).

| | |
|---|---|
| **From** | Owen Gallagher, Service Delivery Manager |
| **To** | Marcus Webb (Approver, Service Acceptance) |
| **Date** | 2026-11-24 |
| **Re** | FRM-03 CertHub, submitted 2026-11-20 — operator-side review of the Supportability/handover, Availability and Incident-profile rows, as requested |
| **Basis** | SAC baseline (Adoption Pack §4); [FRM-03](S5-FRM-03-acceptance-record.md); [runbook](S4-runbook.md); [monitoring & incident profile](S4-monitoring-incident-profile.md); [user guide](S4-user-guide.md); [HLD](S4-HLD.md); [recovery procedure](S4-recovery-procedure.md); the 2026-11-17 operator review I chaired |

## Summary

| Criterion | My verdict |
|---|---|
| **Incident profile** | **Accept.** I counter-signed the registration on 17 Nov; the record reflects it accurately. Nothing further. |
| **Availability** | **Accept with conditions** (C2). Evidence is strong; what's missing is anyone telling the customers what the number means for them. |
| **Supportability / handover** | **Accept with conditions** (C1, C3). The handover work is the best I've seen from this team; the customer-facing half of the support model is the gap. |

Nothing here should hold your signature. All three conditions are post-acceptance actions with dates; I'd ask you to carry them in the FRM-03 §3 conditions field so they don't evaporate.

## 1. Incident profile — accept

This row is done properly and I'll say so on the record. The per-service triggers are exactly what the desk needs and never normally gets: Rafi can classify a CertHub ticket against a table instead of guessing, and the deliberate **"any inventoried cert <7 days from expiry with no renewal in flight = Sev2"** trigger turns the INC-4211 failure mode into an incident *before* anything falls over. That trigger alone justifies the row. Registration was real, not paperwork: JSM service entry, IM-02 annex, triage guide, tier-1 briefing — I signed it on 2026-11-17 and stand by it.

One small thing folded into C2: the baseline sets a "reportable bar" of Sev1–2, but IM-02's comms path only covers major incidents. A team whose issuance failed for an afternoon should hear about it from us, not from their pipeline. The monthly summary (C2) covers the routine end; a Sev2 affecting a team should also get a closing note on the ticket to that team as a matter of habit.

## 2. Availability — accept with conditions

The evidence itself is good, and honestly presented: 99.5% Tier 1 target, measured on the right thing (a synthetic *certificate*, not green pods), DR proven with a dated restore inside RTO, and the record flags — rather than buries — the fact that there are only five weeks of live history. The graceful-degradation property (an outage blocks new issuance only; nothing already issued stops) is the single most important service-delivery fact about CertHub and it is stated everywhere it should be.

What I pressed, and where it gave way:

- **Is 99.5% a commitment or an aspiration?** As recorded, it is an internal objective in our baseline — which is fine, but nobody has told the eight teams either the number or its status. If a team lead reads "99.5%" off the register they will plan against it as a promise. It also needs the arithmetic said aloud: 99.5% monthly is ~3 h 40 m; our own RTO is 4 working hours; one invoked DR can legitimately breach a month. "Met or accepted" — I accept it; the teams should be told it's a target, not a guarantee.
- **The Friday 17:30 test.** A single team blocked on a deploy at 17:30 Friday is, per the profile, a Sev2 — desk hours end at 17:30, so first response lands around Monday lunchtime. Given the degradation property, that is a *defensible* position: a blocked deploy is an inconvenience, not an expiry risk, and a genuine emergency has SOP-4 break-glass. But today a team lead can only derive that answer by cross-reading the runbook, the profile and the user guide. Defensible positions must be stated in advance, not discovered at the point of failure — that's C1.
- **How does the portal count?** The SLO is "measured on canary issuance + portal", yet portal-down is Sev3 precisely because issuance is unaffected. Before the first monthly report goes out, state the composition (my preference: headline SLO on issuance; portal reported separately). Folded into C2.

## 3. Supportability / handover — accept with conditions

Credit first, because it's due. The continuity work is exemplary: named primary and deputy, dated walk-throughs (including a hands-on with break-glass), a live revocation rehearsal, the ceremony gap declared rather than hidden and a drill booked. The 2026-11-17 operator review was a genuine review — Rafi and I worked the triage guide against real portal error states, and the SOPs were adopted, not waved through. Priya has handed this over the way the baseline intended.

What I pressed:

- **The support model, as recorded, faces inward.** Every element — desk hours, response targets, rota — is agreed *between us*: Platform, the desk, me. Nothing states any of it *to the eight teams* who will depend on it. The user guide §7 comes closest (routes, Rafi's hours, "out-of-hours Sev1s page the rota") but it is a how-to, not a statement of what teams can rely on; it carries no response targets and no availability position. Eight internal customers deserve one page that says what they get. That's C1, and I want it up before the remaining six teams migrate on 2026-12-18 — they should be able to read what they're moving onto.
- **First-line continuity.** The baseline's continuity rule ("no single-person dependency") has been applied rigorously to the operating team — and not at all to the support layer, where tier 1/2 is one named analyst. Some of that is my own row's wording, so I'm flagging my own homework: when Rafi is on leave, what happens to a CertHub queue ticket, and where is that written? Also, the runbook §7 escalation table says who — not *when*: at what point does an unresolved Sev2 leave tier 1/2 for the on-call? C3.

## Conditions

| # | Condition | Owner | Date |
|---|---|---|---|
| **C1** | A one-page **CertHub service statement** published to product teams (user guide child page, linked from the register): availability target and its status (objective, not guarantee), the outage-≠-expiry property, support hours, response targets by severity, the out-of-hours position (Sev1 only), break-glass in a genuine emergency. Reviewed by me before publication. | Priya Chandra, with Owen Gallagher | Before 2026-12-18 migrations |
| **C2** | A standing **monthly service summary** to team leads riding the SOP-6 review output: SLO attainment (composition stated at first issue), Sev1/2 count with one-line closures, expiring/unowned-cert posture, migration state until complete. First issue after November closes. | Owen Gallagher (format); Priya Chandra (data) | First issue by 2026-12-05 |
| **C3** | **First-line cover recorded**: what happens to the CertHub queue when Rafi is absent (named cover or routing to the rota), plus an escalation *time* in runbook §7 for an unresolved Sev2 leaving tier 1/2. Written into the triage guide and runbook. | Owen Gallagher / Rafi Osman | 2026-12-04 |

## A closing admission

The gaps above are not Priya's — she met every word the baseline asked of her, and then some. The baseline row that defines the support model is *mine*, and it never asked for a customer-facing statement or any reporting to the teams; the framework we adopted doesn't ask for one either. I'll bring a wording amendment for the Supportability row to the June 2027 baseline review so the next service doesn't need an SDM memo to close the same hole.

**Owen Gallagher**
Service Delivery Manager
