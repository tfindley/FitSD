# Platform & Infrastructure — Extraordinary Management Review (FSD-GV-5)

**Fernbrook Software — internal.** Confluence `PLAT` → Governance. Minutes filed per Adoption Pack §7.

| | |
|---|---|
| **Date** | 2027-09-01, 09:30–13:00, Meeting Room 2 |
| **Chair** | Marcus Webb (Management System Owner) |
| **Attending** | Dana Okafor (CTO); Jordan Blake (Service Owner, CertHub); Owen Gallagher (SDM); Elena Vasquez (architecture/security). Part: Rafi Osman (items 1b, 2.2), Sam Reyes (item 2.4, action A9) |
| **Status** | Minutes ratified by Dana Okafor, 2027-09-03 |
| **Basis** | The full CertHub record set (PLAT-341: FRM-00/01/02/03 + acceptance reviews; service docs; Feb 2027 ticket extract; takeover assessment 2027-08-16; PLAT-512 Idea Brief); the Adoption Pack; the registers; FitSD v0.3 (FSD-GV; *Requirements*; *Adoption & Positioning* §2–4; *Quickstart*) |

## 0. Why this review is extraordinary, and one admission first

This is the FSD-GV-5 Plan-Do-Check-Act review of the Platform management system, held out of cycle under the Adoption Pack §7 "material change" arm. Three triggers, taken together: **(1)** the transfer of CertHub ownership following Priya Chandra's departure (2027-06-12; transfer completed w/c 2027-08-09); **(2)** the pending Gate 1 for CertHub 2.0 (PLAT-512 — the smallstep patch cliff, 2028-08); **(3)** Dana's standing Gate 2 condition 5, which made CertHub a named line at the June 2027 management review.

The admission, mine, on the record before anything else: **the June 2027 annual review did not take place.** The Q2 planning day it was folded into was consumed by the datacentre migration and Priya's notice period, and I did not reconvene it. No minutes exist because there was no meeting. Everything that annual review was due to do — re-ratify the SAC baseline, review the registers and the implementation profile, take Dana's named CertHub line, run the annual root-custody check — went undone, and nothing in our system flagged the omission. This review stands in for it (decision D1, §5), and the failure itself is treated as evidence at §2 and finding-fodder at A12. — MW

CertHub is taken as the system's first full test case: one solution, idea to gates to build to acceptance to ten months of live operation to an unplanned succession, entirely inside the management system. The review asks two questions: did the system deliver what we adopted it for, and is the system itself healthy?

## 1. Check — did the system deliver its promises?

When we adopted FitSD (2026-06-05) the case made to Dana rested on the framework's own pitch (*Adoption & Positioning* §2–3; *Quickstart*). Four claims, each walked against the record. Graded honestly; Dana held the pen on the grades.

### 1a. "It gets technical teams heard and funded" — **MET, fully**

The record: corridor volunteer at a PIR (2026-07) → Idea Brief 2026-08-10 → Gate 1 approved in nine days (2026-08-19) → evidence-first PoC inside a hard time-box → Gate 2 funded by the CTO 2026-09-08 → delivered and accepted 2026-11-27. An engineer's idea went from "someone should" to a CTO-funded build in under a month of paperwork, and the paperwork *was* the pitch — Dana confirmed she funded the Gate 2 record as written, and her sign-off says why. Corroboration from outside the team: Sam Reyes's memo calls Gate 1 "the best business-case template in this building" and says he intends to steal it. Second data point: the succession case (PLAT-512) came through the same door from a nine-week-old owner with no handover, and it is a fundable document. This promise is delivered and repeatable.

### 1b. "Readiness built in — no 2 a.m. page for something nobody wrote down" — **MET on its exact wording, with a finding attached**

The February 02:07 page (CERTHUB-1219, Opsgenie #52107) happened, so we walked it hard. What the record shows: the page was for a cert that was **inventoried, owned by the monitoring, alerted at 30 and 14 days, and paged at 7 days with 6.9 days of fuse left** — renewed six days before expiry. Contrast the trigger incident this system was adopted after: INC-4211 was discovered at 02:10 *after* the certificate had already failed, and cost four customer-facing hours. The February page was the written-down safety net working precisely as registered. The promise, on its exact wording, held: nobody was paged for something nobody wrote down — the on-call was paged for something written down in five documents.

The finding attached, because the grade must be honest: **the page should never have been needed.** Everything upstream of the pager had already failed quietly — the ownership drive (FRM-03 §2 row 1, due 2026-12-04) was nine weeks overdue; the 14-day auto-ticket sat unassigned in the desk's catch-all for seven days because the ticket taxonomy (row 9) was never landed. The last line of defence held while the management layers above it rotted, and the pager took the strain that governance dropped. Rafi's annotation — "everything upstream of the pager had already failed quietly" — is adopted into these minutes as the accurate summary. Secondary point (Jordan's, from the night itself): a severity whose response target is *four working hours* routes to a 02:07 pager — that is our local routing choice, not the framework's, and it goes to A10.

### 1c. "The evidence trail customers and auditors ask for" — **MET when asked — and decaying when it was asked**

The Meridian request (CERTHUB-1224, Feb 2027): a customer's auditors wanted "your SLA and evidence of DR testing" by Friday. What the trail could answer, same week: a stated availability objective with its status honestly labelled (service statement), attainment figures (monthly summary: Dec 99.97%, Jan 100%), and a **dated, passed DR restore test** (RTL-2026-014, 2 h 50 m against a 4-working-hour RTO) with a stated cadence. What it could not answer: "your SLA" — because no SLA exists, and the honest attestation of that fact satisfied the auditors in a day and a half. That is the trail doing exactly what the pitch promised, without a PMO.

Three caveats, all on the record. First, the two documents that carried the answer — the service statement and the monthly summary — were **not** produced by the framework or our baseline: they exist because Owen invented them as acceptance conditions (his own memo admits the baseline row never asked). Second, the trail was already decaying when queried: had the auditors asked in June rather than February, the "tests recur 6-monthly, next due May 2027" line would have been **false** — the May re-test was missed and sat unlogged until Jordan ran it on 2027-08-26 (RTL-2027-021, passed, 3 h 05 m). Third, it took four people and a day and a half to assemble what should be a standing page (A11).

### 1d. "A product with an owner, not a thing you'll quietly carry alone forever" — **FAILED as a system; rescued by the records**

The exact sentence (*Quickstart*): when acceptance passes, "it's a product with an owner, not a thing you'll quietly carry alone forever." Graded against the Priya→Jordan succession, in two halves.

**The knowledge half passed, remarkably.** There was no handover — none — and the incoming owner read himself in from the record set in two days, could run the entire incident surface cold, and reconstructed every load-bearing *why* (step-ca vs Vault, the offline root, the backup redesign) without re-litigating any of it. The standing decision log Dana forced at Gate 2 (DEC7) is, in Jordan's words, the single most valuable page in the estate. The takeover assessment is the best succession document this company has produced, and the system's forms are why it could exist.

**The ownership half failed.** Walk the sentence: *a product* — the product-ownership question was posed at Gate 2, deferred at acceptance, conditionally answered by Sam in November, and then row 10 died in the machinery; his terms lapsed unratified at end Q1 2027; no enhancement backlog was stood up; SSH-cert demand now arrives as "pressure, not records". *With an owner* — for roughly eight weeks the service register named as owner a person who no longer worked here; our own baseline's 10-working-day leaver rule was breached by a factor of four with nothing firing; dual-control seats Priya held were not re-seated until Jordan's audit found them in August (SEC-02 asks for one working day). *Not carried alone* — CertHub today has a primary with **no deputy**, no completed walk-through for one, and ceremony competence resting on two custodians who are not the operating engineer: RSK-041, the INC-4211 lesson recreated on the service built to kill it. Priya did, in the end, quietly carry things alone — the portal codebase, the migration folklore — and they left with her (takeover §5).

The sharp version, which these minutes adopt from the takeover assessment: **continuity was proven once, in November 2026, and nothing in our system ever asked the question again.** We re-test restores; we re-review access; the people row was tested once and left to decay. It decayed.

**Summary of grades:** (a) met fully · (b) met on its wording, upstream failure noted · (c) met when asked, decaying · (d) failed as a system, rescued by the records. Two of four promises earned their keep outright; the other two held only where a form or an alert did the work of the absent governance.

## 2. Check — the system's own health

### 2.1 Registers and records — current vs stale (verified for this review)

| Store | State at 2027-09-01 | Verdict |
|---|---|---|
| Demand / pipeline register (Jira `PLAT`) | Current — PLAT-512 at Idea; parked/rejected history intact | **Current** |
| Gate & acceptance records | Complete and honest through FRM-03; the record set survived a succession | **Current** (exemplary) |
| Service register | Corrected w/c 2027-08-16 (owner Jordan). **Was wrong for ~8 weeks** (named a leaver); deputy column empty today; EOL column gained its first entry (step-ca: replace) | **Stale until last month; deputy gap open** |
| SAC baseline | Last ratified 2026-06-05. **Re-ratification due June 2027 — missed.** Two amendment queues pending (§2.3) | **Overdue** |
| Document register | Governing docs current. Service docs have **no review cycle at all** — the HLD flagged "MSO to confirm" in Nov 2026 and I never confirmed | **Gap, 9 months old** |
| Risk register | RSK-031/032/033 present; review dates lapsed with the June review. RSK-041–044 (takeover) added w/c 2027-08-16 | **Stale, being repaired** |
| Supplier & Dependency Register | SUP-041 June review missed; overtaken by events — the EOL review (2027-08-16) is now the current entry | **Repaired by the EOL review** |
| Restore Test Log | May 2027 re-test missed, unlogged, undetected. Overdue test run 2027-08-26 (RTL-2027-021, passed) | **Cadence broke; now current** |
| Access reviews (SEC-02) | Privileged Q1 2027 ran. **April and July: no record found** — treated as missed | **Broken — A8** |
| Monthly service summary | Issued Dec–Apr; **lapsed with Priya's notice**; resumed under Jordan Sep 2027 | **Lapsed 4 months** |
| Incident/change/problem records | Current per IM-02/CH-01 (BAU held throughout) | **Current** |

Pattern, stated plainly: every store that a *process or pipeline* feeds stayed current through a leaver and a nine-week ownership gap. Every store that depended on a *person remembering a cadence* — the reviews, the re-tests, the re-ratification, the summary — broke in the same window, and nothing detected any of it. The BAU machinery is healthy; the check-and-improve machinery failed silently.

### 2.2 The accepted-with-conditions audit — the fate of FRM-03 §2

Eleven conditions were attached to the acceptance of 2026-11-27, each with owner and date, tracked as "a standing item at the monthly ops review". The record tells us what that was worth:

| Row | Condition (owner, due) | Fate |
|---|---|---|
| 1 | Unowned certs to zero (MW, 2026-12-04) | **Open, 9 months past date.** 3 unowned at Feb; one of them caused the 02:07 page |
| 2 | All teams migrated (MW/leads, 2026-12-18) | **Open, late.** 2 teams still on legacy automation past the line; the "requires a CTO decision" clause **silently died** — Dana confirms no such decision ever reached her |
| 3 | Ceremony shadow drill (PC/EV, Q1 2027) | **Silently died.** Slipped Q1 → Q2 → off the radar; being run 2027-09-10, fifteen months late |
| 4 | Desk access pack (PC, 2026-12-04) | **Closed on time** — and it worked (the Feb tickets show `certhub-support` doing its job) |
| 5 | Tier-1 lanes in runbook (PC/RO, 2026-12-04) | **Closed on time** — carried the Atlas triage |
| 6 | Escalation hours/cover (OG/RO, 2026-12-04) | **Closed on time** |
| 7 | Service statement (PC/OG, pre-migrations) | **Closed on time** — answered both the Atlas entitlement question and half of Meridian |
| 8 | Monthly service summary (OG/PC, 2026-12-05) | **Closed on time; later lapsed** (§2.1) |
| 9 | Canned comms / ticket taxonomy / triage-guide regime (PC/RO, 2026-12-18) | **Open, late** — bit twice in February (composed-on-the-spot comms; the lost 14-day ticket) |
| 10 | Product-ownership terms to Dana (MW, Dec ops review / end Q1) | **Silently died.** Never reached Dana; Sam's terms lapsed by their own sunset |
| 11 | Supportability baseline amendment (OG, 2027-06 review) | **Died with the June review** — drafted, never tabled; revived at A5 |

**Count: 5 closed on time · 3 open and long past date · 3 silently died.** The pattern is not random and the review dwelt on it: every condition that closed had a **named person waiting on the other side** — Rafi would not hold the queue without rows 4–6, Owen gated migrations on row 7. Every condition that died was **management-side with no beneficiary chasing it** — a drill, a ratification, an ownership drive. A monthly agenda line kept none of them alive; the ticket log said it exactly: "the accepted condition… slipped nine weeks with nothing watching it but a monthly agenda item." Conditions need machinery, not minutes — A4, and upstream U3.

For completeness, Dana's six Gate 2 conditions: 1–4 and 6 discharged at acceptance as recorded at FRM-03 §1a. Condition 5's two continuing arms both subsequently failed: migration reporting ran, then the split-brain estate persisted past 2026-12-18 *without* the decision from Dana the condition required; and the June 2027 named line never happened because the review didn't. Both are repaired by decisions D2 and D1 below.

### 2.3 The SAC baseline — re-ratification required

The baseline is 15 months old, its annual re-ratification was missed, and the record has logged genuine defects against it — the desk and the SDM found them in November, the succession proved them in June. Re-ratification is convened as a special session (A5), carrying at minimum:

1. **Continuity becomes a cadence, not an event** (Jordan, takeover §4): the Supportability row gains a re-verification — a dated deputy re-walk-through every 6 months, same rhythm as restore tests. "Proven at acceptance" is no longer sufficient evidence of "not reliant on one person."
2. **A leaver tripwire**: any leaver triggers, within 5 working days, a register-accuracy check plus re-verification of every dual-control seat and custody holding they touched. The 10-day reassignment rule stays; it gains a mechanism (it had none, and was breached ×4 undetected).
3. **The customer-facing half of Supportability** (Owen's row 11, drafted since November): a published service statement and routine attainment reporting to consuming teams become baseline rows, so the next service does not need an SDM memo to close the same hole.
4. **Operator access as an acceptance artefact** (Rafi's fix 1, generalised): every service names the desk's access pack — what tier 1/2 holds, and an explicit statement that no runbook step assumes more.
5. **First-line continuity**: the continuity rule extends to the support layer (cover for the named analyst), closing Owen's own C3 admission.

### 2.4 Roles in use — which local inventions held

All three of the role structures CertHub exercised were local inventions on top of the framework's five named roles. The score:

- **Approver risk tiers (Adoption Pack §2) — held, cleanly.** Gate 1 to Marcus, Gate 2 to Dana, acceptance to Marcus with the builder rule respected and operator reviews informing. Every routing decision was made without argument, including the key-material flag deferring correctly from Gate 1 to Gate 2. Keep unchanged; PLAT-512's renew arm may cross the £10k line and routes correctly by the same table.
- **Service Owner transfer — failed.** Neither the framework nor our pack has a succession procedure; the only rule (10 working days) was a baseline table cell with no tripwire. The transfer took nine weeks, ran on Jordan's initiative, and the excellent takeover assessment was improvised. Decision D3: the takeover-assessment format is adopted as our standing transfer procedure.
- **Product ownership — died in the machinery.** The role doesn't exist in the framework (Sam's memo, correct on every particular), we invented it, and then our own conditions-tracking failure (row 10) killed it. Resolved in the room — D4/A9.

## 3. Act — improvement actions (local)

Standing item at every monthly ops review; each action has one owner and a date; breach of a date is reported to Dana, not re-dated silently (that rule is itself A4).

| # | Action | Owner | Date |
|---|---|---|---|
| **A1** | CertHub deputy: name agreed with the individual, dated runbook walk-through delivered by Jordan, register deputy column filled. Closes RSK-041 first half | Jordan Blake / Marcus Webb | 2027-09-19 |
| **A2** | Ceremony shadow drill (Recovery §3.3 against CER-2026-001, dev KMS key) — booked 2027-09-10; June custody check rides on it. Closes FRM-03 row 3 | Jordan / Marcus / Elena | 2027-09-10 |
| **A3** | FRM-03 rows 1, 2, 9, 10 formally dispositioned at the September ops review: each closed with evidence, or re-dated with owner **and tripwire**, or converted to a register risk. Row 1: remaining unowned certs get owners or a decommission decision. Row 2: per D2 | Marcus Webb | 2027-09-30 |
| **A4** | Conditions machinery: every condition attached to any gate or acceptance becomes a dated Jira item, assignee set, **breach auto-escalates to the approver who set it**. Retrofit to all open items. Agenda lines are abolished as a tracking mechanism | Marcus Webb | 2027-09-12 |
| **A5** | SAC baseline re-ratification special session carrying §2.3 amendments 1–5; Dana ratifies | Marcus Webb → Dana Okafor | 2027-10-15 |
| **A6** | Document register extended to service documentation with a review cycle (annual, June-aligned). Answers the HLD's Nov 2026 "MSO to confirm" | Marcus Webb | 2027-09-30 |
| **A7** | Register hygiene: service-register accuracy (owner/deputy vs current staff) verified at every monthly ops review; risk and supplier register review dates reset from today | Marcus Webb | 2027-09-12, then standing |
| **A8** | Access-review recovery: missed April/July privileged reviews run now; calendar holds created; SEC-02 cadence reported at monthly ops review | Marcus Webb | 2027-09-12 |
| **A9** | Product ownership per decision D4: Sam's five terms revived with new dates — terms 1–3 in place by 2027-10-31, role effective Q4 2027, Dana ratifies the pack amendment; enhancement backlog stood up **before** PLAT-512 Gate 1 so SSH-cert and second-region demand arrive as records, not pressure | Sam Reyes / Marcus Webb → Dana Okafor | 2027-10-31 (backlog by Gate 1) |
| **A10** | Alert-routing review: no severity whose response target is working-hours pages out of hours unless the remaining fuse demands it (e.g. expiry Sev2 pages 08:00 next day if fuse >48 h) | Jordan Blake, with Owen Gallagher | 2027-10-15 |
| **A11** | Standing supplier-questionnaire evidence page (SDM-owned): service statement, current attainment, latest restore-test attestation, the no-SLA position — so external assurance is a link, not a four-person relay | Owen Gallagher | 2027-10-15 |
| **A12** | Review-cadence hardening: interim half-year system check added (December 2027); June 2028 annual review calendar-held now with a hard rule — **if not held within the month, the omission escalates to the CTO automatically**; the annual agenda gains a per-service line for every Tier 1 service, not only CertHub | Marcus Webb (Dana holds the tripwire) | Standing; first check 2027-12 |
| **A13** | PLAT-512 to Gate 1 in September as recommended; Elena consulted from Gate 1 (trust-chain surface); SSH-cert and second-region demand admitted only in writing | Marcus Webb (Approver routing per pack §2) | 2027-09-30 |

**Decisions taken in the room:** **D1** — this review stands as the 2027 annual review; the June failure is recorded, not papered over. **D2** — Dana's decision on the split-brain estate, on the record at last: the two straggler teams migrate by 2027-10-31 with dated CH-01 decommissions; no further extension without her signature. **D3** — the takeover assessment format is the standing Service Owner transfer procedure. **D4** — product ownership: revive Sam's terms per A9; if terms 1–3 miss 2027-10-31, the role assigns permanently to Marcus and the register says so. **D5** — RSK-042 closed (RTL-2027-021); RSK-041 closes on A1+A2 evidence.

## 4. Act — candidate feedback upstream to the FitSD standard

Separated deliberately from §3: these are not Fernbrook fixes, they are things the framework should carry so the next adopter doesn't rediscover them. Each is justified by this record set. Marcus to write these up against the framework's contribution route (*Adoption & Positioning* §8, "close the loop"), Dana to sponsor. Target: with the PLAT-512 Gate 1 papers, 2027-09-30.

1. **FSD-GV-5 should require the review to examine per-service state, not only "the management system."** As written, nothing compelled any review to look at CertHub at all: the only mechanism that put a live service on a review agenda was an approver's ad-hoc Gate 2 condition — and when the review died, so did the look. A thin shall: the review covers register accuracy, outstanding conditions, overdue evidence (re-tests, re-walk-throughs), and EOL candidates, per live service.
2. **The review needs inputs.** The standard gives acceptance a full checklist (the SAC) and gives the GV-5 review one sentence in the Implementation Guide. An agenda skeleton or minimum-inputs list would have changed what June 2027 failed to do.
3. **Conditions need machinery.** "Approved with conditions" and "accepted with conditions" are how every real decision in this record was made, yet no form has a field for discharging prior conditions (both our Gate 2 and FRM-03 invented a "§1a position" section), FSD-PRO's remediation table is reserved for unmet criteria (we repurposed it), and nothing requires conditions to be tracked or breaches escalated. Our score — 5 of 11 kept, and only the ones with a beneficiary chasing — is the evidence.
4. **Continuity should be a cadence, and ownership should survive a leaver.** FSD-SD-5 proves "not reliant on a single person" once, at acceptance; FSD-GV-2 names an owner but says nothing about the owner leaving. This record shows both: the continuity claim decayed in nine months, and the register named a leaver for eight weeks. Candidate: periodic continuity re-verification in the SAC reference, and a thin ownership-transfer requirement (reassignment plus access/dual-control re-verification within a defined period).
5. **A home for product value over time.** No role is accountable for a service's roadmap or worth; pending enhancements have no register (the demand register is net-new; change records are decided changes) and no ranking authority. Sam Reyes's memo is a complete requirements statement for the unbuilt Tier 3 role and we commend it verbatim.
6. **Service reporting deserves promotion from the backlog.** The standard already names it a gap; this record now evidences it three independent ways (the SDM's acceptance memo, the Meridian audit request, the product-ownership terms). A thin requirement: a service's targets stated to its consumers, attainment reported on a cadence.
7. **Say what a signature commits.** Both our Gate 2 and acceptance approvers had to write, unprompted, what their approval actually committed — money, run-cost, register state. One line per form would spare every approver the invention.
8. **Promote the standing decision log.** DEC7 — decisions-with-rationale carried into the HLD as a standing section — was a local condition of one CTO, and it is the single biggest reason the no-handover succession worked. It belongs in the SAC documentation row or the HLD guidance as standard practice. Send this one as praise with evidence.

## 5. Close

The system's verdict on itself, agreed by all present: **the front door and the acceptance bar work — they are the reason a service survived losing its builder. The check-and-improve loop does not work yet — it ran on individuals remembering, and when the individual was the thing that changed, every cadence broke at once and nothing noticed.** The actions above aim the repair at exactly that: tripwires instead of agenda lines, cadences instead of events, and a review that must look at the services, not only at itself.

Next reviews: interim check December 2027 (A12); annual June 2028, calendar-held, with the escalation tripwire armed. CertHub remains a named line at both, joined by a named line for every Tier 1 service.

*Minutes: Marcus Webb, Management System Owner. Ratified: Dana Okafor, CTO, 2027-09-03.*
