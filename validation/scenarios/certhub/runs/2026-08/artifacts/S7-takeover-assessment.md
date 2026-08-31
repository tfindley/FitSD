# CertHub — Takeover assessment and 30-day plan

**Fernbrook Software — internal.** Confluence `PLAT` → Service Docs → CertHub (linked from the service register entry).

| | |
|---|---|
| **From** | Jordan Blake, Platform & Infrastructure — Service Owner, CertHub (transfer confirmed by Marcus Webb, w/c 2027-08-09) |
| **To** | Marcus Webb (cc: Elena Vasquez, Owen Gallagher) |
| **Date** | 2027-08-16 |
| **Re** | State of CertHub as found by the incoming Service Owner; the FSD-RR-7 end-of-life review of the step-ca dependency (§7); risks raised; 30-day plan |
| **Basis** | The full CertHub record set: FRM-03 acceptance record + the three acceptance reviews; HLD (as built); runbook + SOPs; recovery procedure; monitoring & incident profile; user guide; Gate 1 and Gate 2 records + PoC scorecard; service/risk/supplier register entries; Restore Test Log; JSM CertHub queue and the Feb 2027 annotated extract; my own rota experience since Nov 2026 |

Marcus — you asked me to get on top of the service, run the end-of-life review the smallstep
announcement forces, and bring the successor through the front door. This is the first of
those, with the EOL review at §7 and the front-door submission attached separately
(Idea Brief, PLAT-512). I have written it the way I would want to read it if I were the
next person in this chair: what the records gave me, what they could not, and what I am
carrying.

Plain statement up front: **there was no handover.** Priya's last weeks went to the
datacentre migration, and her last day was 2027-06-12. Everything below comes from the
record set and from my own reps on the rota. That the answer is still mostly "I can run
this" is a fact about the quality of the records, and I say so where it is earned.

## 1. How I read in

The register entry pointed at the FRM-03; the FRM-03's evidence column is a map of the
whole document set, so I read in this order: acceptance record → runbook (with Rafi's
triage guide) → HLD → recovery procedure → monitoring & incident profile → back through
Gate 2 and Gate 1 → the three acceptance reviews → the Feb ticket log annotations. Two
days, no guide needed. The records repeatedly flag their own local conventions ("no
standard home exists for X; child page is our convention — noted so successors can find
it") — those notes were written for me, and they worked.

Current state, verified this morning: §3 health check clean (pods 2/2, CNPG healthy,
canary green, KMS errors zero, scanners fresh); Flux reconciling `main`; SLO panel green.
The service is healthy. The management around it has decayed — that is what the rest of
this document is about.

## 2. Could I operate it tomorrow?

Honest inventory, procedure by procedure. "Cold" means from the page, today, with the
access I hold.

| Procedure | Can I run it? | Basis |
|---|---|---|
| Runbook §3 health check | **Cold** | Ran it today; ran it routinely on rota |
| §5.1 issuance triage | **Cold** | Hands-on in dev at the 2026-11-12 walk-through; live reps since |
| §5.2 expiry / renewal failure | **Cold** | Ran it for real: CERTHUB-1219 (Feb 2027), including the manual Sectigo renewal under dual control |
| §5.3 portal down | **Cold** | Straightforward; restart is stateless |
| §5.4 / SOP-5 scanner false positives | **Cold** | PR-based suppression flow; done in anger during migration |
| §5.5 step-ca / CA down | **Cold, with care** | Never had a live CA outage; the KMS failure branch I know only from the page |
| §5.6 leaf revocation | **Cold** | Live canary revocation rehearsed 2026-11-13 |
| §5.6 intermediate compromise | **Not cold** | Tabletop only (2026-11-13). Depends on the ceremony (below) |
| SOP-1 onboarding | **Cold** | Approved onboardings on rota; Atlas case (CERTHUB-1201/1202) followed my approval |
| SOP-4 break-glass | **Cold** | Dry-run at walk-through; vault access to be re-verified (§4) |
| Recovery §3.1 standard restore | **With care — never executed by me** | Tested and proven by Priya (RTL-2026-014); the procedure is command-level and the restore manifest exists in Git. I intend to run it as my first drill (§8) — not least because the 6-monthly re-test **due 2027-05 has no completion entry in the Restore Test Log that I can find** |
| Recovery §3.3 ceremony (new intermediate from root) | **No** | The scheduled deputy shadow drill (FRM-03 §2 row 3, Q1 2027) **never ran**. Mitigations: the ceremony script CER-2026-001 exists and is detailed; both passphrase custodians (you, Elena) are still here and witnessed the original. The knowledge is not lost to Fernbrook — it is lost to *the operating pair*, which is currently a pair of one |
| Recovery §3.4 root loss | **No, and acceptable** | Doomsday path; same custodian position as above. Annual custody check due at the June review — see §4 |
| Portal/API **code changes** | **No** | The one genuine wall. See §5 |

**Access I hold and have verified:** `certhub-admin` (Okta), cluster contexts, Grafana,
Opsgenie rota, JSM queue. **To re-verify with you this week:** the dual-control seats.
The break-glass provisioner password, the Sectigo account and the Let's Encrypt account
key are all vaulted under dual control, and I do not know who the second key-holder is
for any of them now Priya has gone — if she held a seat, SEC-02 says it should have been
re-seated within a day of her leaving, and I can find no record either way. Same
question for the four named root-custody holders (Recovery §3.4: a leaver among them
triggers re-seal/re-split within 10 working days).

**Verdict: yes for run-and-restore, with two exceptions.** I can hold the service's
incident surface and routine operations from the record set alone. I cannot perform a
ceremony without you and Elena beside me, and I cannot change the portal's code. Neither
is an excuse for delay on anything else.

## 3. Can I reconstruct *why* it is the way it is?

Yes — and I want on record how unusual that is. I tested myself against the questions a
successor asks, before reading the answers:

| Question | Answered by | Complete? |
|---|---|---|
| Why step-ca and not Vault? | HLD §9 DEC1; Gate 1 §5/§7; PoC scorecard (child of the Gate 1 record); Gate 2 DEC1 | **Yes** — including the evidence (19/24 vs 13/24), the seal-on-restart incident in the PoC, and the BUSL licence angle. I did not have to re-litigate Vault; the record already had |
| Why an offline root + KMS intermediate? | DEC3; Gate 2 §3; CER-2026-001 | **Yes**, including the ratified design exception for keeping the root outside Velero |
| Why metadata-only inventory, no private keys? | DEC4; Gate 2 §3 (classification, ratified at Gate 2 §8) | **Yes** |
| Why ACME everywhere and never step-ca's own APIs? | DEC2; Gate 1 §6a exit path | **Yes** — and this is the decision that makes §7 below tractable |
| Why is CNPG authoritative for backups, not Velero? | DEC9 + the *failed* restore RTL-2026-013 | **Yes** — the failure is recorded, not buried, which is why I trust the procedure |
| Why did `fernbrook-analytics.com` move to Route 53? | DEC8, CHG-2258 | **Yes**, with the cost of learning it (one week's slip) recorded |
| Why is EV manual when OV is automated? | DEC10 | **Yes** |

The standing decision log (HLD §9, kept because Dana made DEC7 a condition of Gate 2
approval) is the single most valuable page in the estate for a successor. Every one of
those answers would normally live in a leaver's head.

## 4. Continuity: what the acceptance record claims vs what is true today

The FRM-03 Supportability row was marked **Y** on 2026-11-27 with honest evidence: named
primary and deputy, dated walk-throughs, a live revocation rehearsal, and a declared gap
(no ceremony drill for me) with a drill booked for Q1 2027. Every word of that was true
on the day. Nine months later:

| Claimed at acceptance | True on 2027-08-16 |
|---|---|
| Primary: Priya Chandra | Resigned May 2027; left 2027-06-12. **No handover conversation took place** |
| Deputy: Jordan Blake, dated walk-through 2026-11-12 | Now primary. **No deputy is named.** The continuity rule in our own baseline — "every live service has a named primary and deputy, and the deputy has completed a dated runbook walk-through" — is unmet today |
| Ceremony shadow drill scheduled Q1 2027 (FRM-03 §2 row 3) | **Never ran.** Slipped Q1, then Q2, then off the radar entirely once Priya's notice landed |
| Leaver triggers reassignment within 10 working days (baseline) | Priya left 2027-06-12; ownership formally transferred to me w/c 2027-08-09 — roughly nine weeks. For eight of them the register named an owner who no longer worked here |
| 6-monthly restore re-test, next due 2027-05 | **No completion entry in the Restore Test Log.** I am treating it as missed |
| June 2027 management review: CertHub a named line (Gate 2 condition 5); SUP-041 review; root-custody annual check | I can find no CertHub minutes from a June review. Priya's notice period sat exactly across it. **Please confirm whether it ran** and what, if anything, was recorded |

I also audited the FRM-03 §2 conditions as at the last record I hold (Feb 2027) — rows
4–8 closed; **row 1 (unowned certs — three remained in Feb), row 2 (two teams still on
legacy automation past the 2026-12-18 line, which required a CTO decision I cannot find),
row 3 (my drill), row 9 (ticket taxonomy / canned comms) and row 10 (Sam's product-
ownership terms, due end Q1 2027) all show open or unknown.** I need current state from
you on each; the Feb ticket log shows rows 1 and 9 doing real damage already
(CERTHUB-1219's 14-day ticket sat unassigned for a week in the catch-all).

None of this is a complaint about the acceptance — the record was honest and the
evidence real. The point is sharper: **continuity was proven once, in November, and
nothing in our system ever re-proved it.** We re-test backups every six months; we
re-review access quarterly; the *people* row — the one this service exists because of —
was tested once and left to decay. It decayed.

## 5. Questions only Priya can answer

Listed explicitly, as asked. I have separated what is genuinely hers from what merely
looks like it (most questions I started with turned out to be answerable from the record
set or by you/Elena — itself worth recording).

1. **The portal codebase.** Where is the source repository, and what is its build/release
   pipeline? The HLD names the *deployment* repo (`fernbrook/platform-certhub`) but
   nowhere in the record set is the portal's source repo, its test state, or its
   dependency-update process written down. Beyond location (which we can find): the
   internal structure, known debt, and any half-finished branches are hers alone.
2. **Suppression judgement.** Which `expected-certs.yaml` entries were "permanent,
   verified" and which "provisional, pending a team's confirmation"? DEC11's reason/owner
   fields capture more than most shops ever write down, but the *confidence level* behind
   several reasons is hers.
3. **Per-team migration quirks.** What was verbally promised or informally worked around
   during the six migrations — odd CAA setups, rate-limit history, why the last two teams
   actually stalled (the schedule says dates; it does not say reasons).
4. **Operational calibration.** Which recurring blips are benign — known KMS error
   patterns, scanner flakiness, "that alert always flaps on the first of the month"
   folklore. The runbook's "healthy looks like" column covers the basics; the residue is
   experience.
5. **Sectigo account specifics.** EAB credential rotation gotchas, the useful vendor
   contact, anything undocumented about the OV validation flow.
6. **Dev/prod drift.** Anything applied to the `plat-dev-1` twin that was never promoted,
   or vice versa.
7. **The intended shadow-drill content.** What she meant to cover beyond the CER-2026-001
   script (largely recoverable from the script plus Elena, expensively).
8. **RSK-031 thinking.** She owned the smallstep-health risk with a June review date —
   was any renew/replace groundwork done before she left?

Of these, items 1, 3 and 4 are the truly irrecoverable ones; the rest we can rebuild
from records, vendors and drills at the cost of time. If she is willing to take a call
as a former colleague, items 1 and 3 are worth an hour of anyone's money. I will draft
the questions so one call covers it.

## 6. Risks I am carrying — register entries proposed

For the Platform Risk Register this week (numbering follows the last entry I can see):

- **RSK-041 — CertHub single-person dependency, recreated.** Primary with no deputy, no
  scheduled walk-through, ceremony competence resting entirely on two custodians who are
  not the operating engineer. This is the INC-4211 lesson inverted onto the service that
  was built to fix it. *Treat:* deputy named and walked through within 30 days (§8);
  ceremony drill within 60. *Owner:* me. *Review:* monthly until closed.
- **RSK-042 — restore-test cadence broken.** Tier 1 service, last proven restore
  2026-11-10; the 2027-05 re-test appears missed. Until re-proven, our RTO/RPO claims
  are 9 months stale. *Treat:* I run §3.1 into dev as a dated test within 2 weeks.
  *Owner:* me.
- **RSK-043 — step-ca OSS end of security patching 2028-08 (RSK-031 crystallised).**
  The standing supplier risk fired: this is no longer "vendor might stall" but a dated
  patch cliff for the estate's trust anchor. *Treat:* §7 decision + PLAT-512 through
  the front door; SEC-04 posture unaffected until the cliff. *Owner:* me (supplier entry
  SUP-041: Owen).
- **RSK-044 — bespoke portal effectively unmaintainable (RSK-033 worsened).** Unowned as
  a product (row 10 state unknown) and now unowned as *code*: no named engineer has
  worked in the codebase since its author left. Thin by design, but "thin" still needs
  patching — Trivy has been finding base-image issues since build. *Treat:* source-repo
  audit in the 30-day plan; product-ownership question back to you and Sam. *Owner:* you
  and me jointly, pending row 10.

Also for the register hygiene pile, not risks: the service register entry (owner/deputy
columns now wrong on one and empty on the other), SUP-041's review date, and the EOL
column per §7.

## 7. End-of-life review — step-ca dependency (FSD-RR-7 / FSD-SC-4)

Trigger: smallstep's announcement of 2027-08-11 — the open-source step-ca edition stops
receiving security patches in 12 months (2028-08). Review held 2027-08-16 (me, with the
supplier entry SUP-041 and the Gate 1 §6a due-diligence record as inputs).

**Decision, recorded for the service register EOL column: REPLACE the dependency, with
"renew" (moving to smallstep's supported commercial edition) retained as a delivery
option for Gate 1 to price. Retirement is rejected.**

Reasoning, briefly:

- **Retire — no.** The function is load-bearing (every team's pipeline, ~340 orders/day,
  the estate-wide inventory) and demand is growing, not shrinking. Retiring CertHub
  recreates INC-4211 by instalments.
- **Renew — possible, unproven.** A paid smallstep tier presumably keeps patches
  flowing, but we have no pricing, and anything material routes past the £10k line to
  Dana anyway (Adoption Pack §2). This is a Gate 1 option, not a decision I can take at
  a desk.
- **Replace — the default, and cheap by design.** DEC2 froze the consumer surface at
  standard X.509 + ACME: every team integration is a cert-manager `ClusterIssuer`, and
  the Gate 1 exit path ("reissue certs from a replacement — Vault PKI, OpenBao, or a
  SaaS") was written for exactly this day. A backend swap does not touch eight teams'
  configuration. The 2026 due-diligence question "how would we get off it?" is being
  answered in 2027 currency, and the answer is: without a rebuild.

**Interim safety:** the OSS edition remains patched until 2028-08; SEC-04 posture holds.
The fuse interacts with one planned event: the I1 intermediate re-sign ceremony is due
2028-09 (SOP-2; the 180-day tripwire alert will fire around 2028-03). The succession
should be sequenced so the estate rolls **once** — a successor backend signing with a
new (or the existing KMS-held) intermediate — not twice in consecutive months.

**Routing:** per FSD-RR-7 the replace arm goes back through the front door as fresh
demand. Idea Brief **PLAT-512** is attached; it also carries the accumulated demand
(SSH certificates, second region) so Gate 1 can decide the scope deliberately rather
than having it bolted on later. Register updated; RSK-043 raised as above.

## 8. 30-day plan

**Week 1 (w/c 2027-08-16)**
- Register hygiene: owner/deputy/EOL columns; risk entries §6; SUP-041 note.
- Dual-control audit with you: every vaulted CertHub credential and the four
  root-custody seats — who holds them today, re-seat anything that was Priya's.
- Submit PLAT-512 to the front-door board; ask for a Gate 1 slot in September.
- Send Priya the §5 question list (your call on the approach; an hour's paid
  consultation would be money well spent).

**Week 2**
- **Run the overdue test restore** (Recovery §3.1 into `plat-dev-1`), myself, dated,
  logged in the Restore Test Log. This closes RSK-042 and doubles as my own deep drill —
  the procedure's author is gone; the next best teacher is executing it.
- Portal source audit: locate the repo, build pipeline, dependency state; write the
  missing "how to change it" page into the HLD's companions.

**Week 3**
- Deputy: agree the name with you (one of the remaining three engineers), book the dated
  runbook walk-through I will now deliver — the record set makes this teachable; that is
  its job.
- FRM-03 open-rows audit with you and Owen: current truth on rows 1, 2, 9, 10; June
  review status; either close them or re-date them with owners at the next ops review —
  they have demonstrated (CERTHUB-1219) what quiet slippage costs.

**Week 4**
- **Ceremony shadow drill** (Recovery §3.3 walk-through, dev KMS key, no root unsealing
  needed for the drill itself): me, you, Elena, against the CER-2026-001 script. Closes
  the FRM-03 row 3 condition fifteen months late; the June custody check can ride on it.
- Monthly service summary resumed under my name; ops review carries this document's
  actions as the standing CertHub item.

One closing observation, because it belongs to whoever reads this file next: I inherited
this service with no handover from a predecessor I barely overlapped with, and the
record set carried me anyway. The gates made the *why* survive; the acceptance criteria
made the *how* survive; what nearly did not survive was the *who* — and that only
because nothing ever asked the continuity question twice. I have raised it with the June
review in mind: our baseline should re-verify continuity the way it re-verifies backups.

— Jordan Blake
