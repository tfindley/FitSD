# CertHub — product ownership: my answer

**Fernbrook Software — internal.** Confluence `PLAT` → Solution Development, child of the FRM-03 record (PLAT-341).

| | |
|---|---|
| **From** | Sam Reyes, Product Manager — Developer Experience |
| **To** | Marcus Webb (cc: Dana Okafor, Priya Chandra) |
| **Date** | 2026-11-26 |
| **Re** | Your formal request of 2026-11-24 that I reconsider long-term product ownership of CertHub (FRM-03 §1a(3); risk RSK-033) |

## The answer

**Yes — conditionally, effective Q2 2027, on the five terms below.** Until then the FRM-03 position stands: you hold the question by default, and I'll do two interim things now — quarterly roadmap sessions starting January (as already offered), and a triage seat on any CertHub-touching intake so the request queue doesn't set like concrete before I arrive.

When I declined in the corridor I said a Tier 1 operational service needs an operational owner, not a PM. Having now actually read the framework we adopted, I'd refine that: FitSD *agrees* with me, and that's precisely the problem. Before saying yes I wanted to know what machinery I'd be picking up. The honest answer is: less than you'd think, and I want us to agree what we're building locally before my name goes anywhere.

## What I'd actually hold — and what doesn't exist

**The role doesn't exist.** FitSD names five roles (Charter §6): Management System Owner, Service Owner, Approver, Operator, Consulted SME. The Service Owner is "accountable, end-to-end, for a given service" — that's Priya's operational accountability, rightly hers (then Jordan's). Nothing in the framework is accountable for a service's *value over time* — roadmap, adoption, whether it's still the right thing to be running. The Tier 3 roles model that might have settled this is explicitly unbuilt (Roadmap, "Then — the unbuilt tiers"). No register names a product owner: our service register carries owner, deputy, tier, status and EOL decision — there is no column for me. If I take this, we are inventing the role, and I'd rather invent it deliberately than discover it in an incident review.

**The backlog splits in two, and one half has no home.** Watch what happens to the three requests already in from the product teams:

- **SSH certificate support** — a new platform capability not currently offered. Trips FSD-PRO §1. That's an Idea Brief and a Gate 1 case.
- **Terraform provider** — code we ship *to* eight teams and then support forever: new ongoing burden, well over our 5-day line. Gate 1.
- **Cert transparency reporting** — the scanner already watches CT logs (Gate 2 §3); surfacing a report is plausibly under the line. That's a "minor enhancement", which FSD-PRO §1 routes to Change & Release.

So two-thirds of my nascent roadmap goes through the front door as individual business cases, decided item-by-item by the Approver — and the last third falls into FSD-CH, which is a *risk-control* capability (assess, authorise, record, deploy). It has no queue, no value test, and no prioritisation. FitSD's Information Stores name a demand register for net-new work and change records for changes already decided; **nowhere does a pending enhancement wait, and nobody is named to rank it**. Eight teams filing requests will find that out within a quarter.

**Funding follows gates, not products.** Dana's Gate 2 signature funded delivery to acceptance only; her condition 1 capped steady-state ops at ~2 pd/month. Nothing budgets *enhancement*. Under the framework as written, every improvement either fits inside the ops allowance or needs its own Gate 1 case. There is no vehicle for steady product investment.

**No instrument panel.** Nothing in FitSD measures adoption, usage or satisfaction — and to its credit it admits this: service reporting is a named gap (Standards Alignment §2; a "candidate thin requirement" in its backlog), and customer relationship management is a declared non-goal. The DORA metrics it points at measure flow; the SLO measures uptime. Neither tells me whether the eight teams are happy or whether the portal is worth another penny. The migration reporting Dana ordered was her invention, not the standard's.

## The terms

1. **The role is written down.** A one-page local addition to the adoption pack: *Product Owner (CertHub)* — accountable for roadmap, prioritisation of enhancements, and adoption/value; explicitly *not* operational (Service Owner accountability stays with Priya/Jordan, untouched). The service register gains a product-owner column. Dana ratifies it, since it amends the pack.
2. **One backlog, with a named home.** A CertHub enhancement backlog stood up next to the demand register (same Jira board, below-the-line lane), owned by me. Everything the teams raise lands there; I triage it against FSD-PRO §1 — above the line it becomes an Idea Brief with me as sponsor, below the line I rank it for the change stream. The framework's split stays intact; someone is simply, at last, standing at the fork.
3. **A standing enhancement allowance.** An agreed capacity envelope — I'd propose 2 pd/month alongside the ops allowance, reviewed at June — for below-the-line work in my priority order, capacity confirmed by you (your engineers, your rota). Anything bigger, I write the Gate 1 case. I'm comfortable that the Approver still decides at the gates: I propose, you and Dana dispose. That's the framework working as designed.
4. **A monthly service report.** Adoption (teams migrated, issuance volumes, portal usage), ticket trends, a light per-team satisfaction pulse — folded into the existing monthly ops review, no new meeting. The standard has no shape for this, so we define it; I'll draft it with Owen.
5. **A product line in the June review.** The framework's one forward-looking moment for a live service is the FSD-RR-7 renew/replace/retire decision — genuinely good lifecycle thinking, but it only asks the question at the deathbed. CertHub's June 2027 line item (Dana's condition 5) should carry a product review — adoption, demand, the investment case — alongside supplier health, with my recommendation feeding any renew/replace call.

If terms 1–3 aren't in place by end of Q1 2027, my answer reverts to the FRM-03 position: quarterly input only, and the question stays with you.

## What I'll say for the framework

So this doesn't read as a complaint: the Gate 1 form is the best business-case template in this building — primary driver, honest value lenses, cost of doing nothing, and a **case-expiry date**, which is discipline most product organisations lack; I intend to steal it for my own portfolio. The requirements workshop and MoSCoW at Gate 2 were native PM practice, already in the form. And the front door itself is a gift to whoever owns this roadmap: the net-new triggers mean no team can side-channel a pet feature into my backlog by calling it "just a change", and parked/rejected demand is *kept, with reasons* — an institutional memory most companies throw away. The gaps above are real, but they're gaps in an otherwise honest floor.

Happy to walk Dana through the terms at the next ops review.

— Sam
