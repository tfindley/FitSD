# CertHub — Service desk ticket log extract, w/c 2027-02-01 and 2027-02-08

**Fernbrook Software — internal.** JSM queue **CertHub** — export of three records, annotated by Rafi Osman (tier 1/2) for the February service summary. CertHub live since 2026-10-16; accepted 2026-11-27 (FRM-03); six of eight teams migrated. FRM-03 §2 conditions: rows 4–6 (desk access pack, tier-1 lanes, escalation addendum) landed 2026-12-04; rows 1 and 9 (cert ownership; canned comms / ticket taxonomy / triage-guide regime) **still open** — both bit us this fortnight, see below.

---

## CERTHUB-1201 — Atlas release blocked: `acme: authorization failed` on new `*.atlas-eu` wildcard

| | |
|---|---|
| **Raised** | Fri 2027-02-05 17:40, Atlas team lead, request type *Certificate issue or failure* (order URL attached) |
| **Classification** | Reclassified: **service request** (onboarding) — not an incident. Linked SR: CERTHUB-1202 |
| **Status** | Resolved Wed 2027-02-10 (cert issued post-onboarding) |

**Timeline**

- **17:40** Ticket lands. Desk hours ended 17:30 (service statement); I was still logged in clearing migration questions. Ticket: release stuck, cert-manager reports `acme: authorization failed` for new `*.atlas-eu.fernbrook.io`; Atlas deploy freeze at 18:00.
- **17:43** Runbook §5.1, tier-1 lane (opening block, landed 2026-12-04): start at the **portal order view**, not kubectl. Order shows DNS-01 challenge for `atlas-eu.fernbrook.io` failing — "challenge record not found", in plain English as user guide §5 promises.
- **17:46** `dig +short TXT _acme-challenge.atlas-eu.fernbrook.io @8.8.8.8` → **NXDOMAIN**. Not propagation delay (runbook §5.1: <5 min is normal; a missing delegation is not).
- **17:49** Portal, `certhub-support` read-only view: Atlas's onboarded domains = `atlas.fernbrook.io` only. **`atlas-eu` is a brand-new zone, never onboarded.** User guide §3: new zone = onboarding request + a DNS change our side, allow **2 working days**.
- **17:51** Severity call. Runbook §5.1 step 3 covers `403 namespace not onboarded` → "not an incident"; my error string differs (a wildcard forces DNS-01 against a zone with no `_acme-challenge` delegation, so it surfaces as `authorization failed`) but the root cause is the same. **Extended step 3 by analogy** — the triage guide has no entry for this (FRM-03 §2 row 9 still open). Not an incident; SOP-1 territory.
- **17:53** Entitlement check before I reply, from the **service statement** (user guide child page, per FRM-03 §2 row 7): desk 09:00–17:30 Mon–Fri; Sev2 = 4 working hours; **out of hours is Sev1 only** (issuance down for ≥2 teams). Same numbers in the SAC baseline Supportability row (Adoption Pack §4) and user guide §7. So at 17:40 on a Friday, formally: **nothing until Mon 09:00; even a Sev2 is due a response by Mon 13:00**. One blocked team does not page the rota.
- **17:55** Comms to Atlas (composed on the spot — no canned line for §5.1, row 9 open): *"Nothing already issued is affected — all your existing certs are fine. The failure is that `atlas-eu` is a new domain that hasn't been onboarded to CertHub, so validation can't succeed; that's a request, not a fault, and it needs a DNS change on our side with a 2-working-day lead (user guide §3). Nothing can land before your 18:00 freeze. Options: ship tonight without the EU hostname and add it next week, or hold the release. I've raised the onboarding request for you so the clock starts Monday 09:00. For the record, out-of-hours support is Sev1 only (two or more teams blocked) — this doesn't qualify, and honestly no severity would beat a 2-day DNS lead."*
- **17:58** Raised CERTHUB-1202 (*Domain/namespace onboarding*) on their behalf. Noted SOP-4 break-glass is **not** applicable — CertHub is healthy; break-glass is for "CertHub down and a deploy genuinely cannot wait", and it is Platform's call, not the desk's.
- **18:04** Atlas confirm: shipping without the EU hostname, will add post-freeze. Ticket parked to the SR.
- **Mon 09:12** Platform approve onboarding; CH-01 DNS change raised. **Wed 10:31** delegation live, wildcard issued first attempt. Closed.

**Resolution:** no fault. New zone not onboarded; wildcard DNS-01 with no delegation. Response entitlement question answered from the service statement — the one document that states hours, targets and the OOH position in one place.

**What would have made this faster:** a user-guide §5 row and a canned §5.1 line for "authorization failed on a not-yet-onboarded domain" — this exact shape will recur every time a team invents a zone on a Friday.

---

## CERTHUB-1219 — `CertHubCertExpiry7dNoRenewal`: legacy billing gateway cert, unowned (Opsgenie #52107)

| | |
|---|---|
| **Raised** | Tue 2027-02-09 02:07, Alertmanager → Opsgenie (Sev2 per registered incident profile, runbook §4) |
| **Classification** | **Sev2 incident** — "any inventoried cert <7 days from expiry with no renewal in flight, whatever the cause" |
| **Status** | Resolved Wed 2027-02-10 12:00 (cert renewed). **Ownership NOT resolved** — with Marcus Webb for the Feb ops review |

**Timeline** *(02:07–02:12 reconstructed from the Opsgenie timeline; desk was closed)*

- **02:07** `CertHubCertExpiry7dNoRenewal` fires: `cn=billing-gw.fernbrook.io`, `source=discovered`, `owner_team=unknown`, `auto_renew=false`, expiry 2027-02-16. **Woken: Jordan Blake, Opsgenie Platform rota** — per the Monitoring & Incident Profile §2 alert catalogue (Sev2 → Opsgenie) and the SAC baseline Monitoring row. Not the desk (hours per service statement), not Marcus.
- **02:12** JB acknowledges. Notes ~6.9 days of fuse, nothing down (runbook banner: an expiry alert is the emergency *class*, but outage ≠ expiry — nothing already issued stops working), Sev2 target is 4 *working* hours; defers action to business hours with a note. Reasonable — though it's worth someone asking why a working-hours-target severity routes to a 2 a.m. pager at all.
- **09:02** I open the queue and find two things: the overnight Opsgenie link, **and CERTHUB-1183 — the 14-day auto-ticket for this same cert, raised Tue 2027-02-02, unassigned in the catch-all for seven days. In my own queue.** The auto-expiry tickets have no request type of their own (row 9 open) and this one had no owning team to be addressed to (row 1 open), so it sat looking like user noise behind a week of migration questions. Recording that plainly because it is the point.
- **09:05** Runbook §5.2, tier-1 lane. Step 1: portal **Inventory → search CN** — works, on the `certhub-support` read-only view (the access pack doing exactly what it was granted for). Confirmed labels; endpoint scan shows it served at 10.20.4.31:443, SNI `billing-gw.fernbrook.io` — the legacy billing gateway VM. No renewal in flight.
- **09:09** Step 2, route by `source`: **`discovered` + unowned → on-call adopts it** (§5.2 step 2c). That is my stop line — the lane marks renewal (SOP-4 / CA accounts / bastion) as Platform-only. Handed to JB with the lookup pack: CN, expiry, serving endpoint, no renewal in flight, links to both prior alerts (30-day warn fired to `#platform-alerts` in January too).
- **09:15** Escalation per §7 (hours/cover addendum, landed 12-04): *unowned-cert adoption → Marcus Webb*. Raised with Marcus: **this is one of the four unowned certs from FRM-03 §2 row 1, target date 2026-12-04 — nine weeks past.** Asked for a named owner so the next alert on it isn't ownerless.
- **09:30** Comms: none to send — there is no owning team, which is the whole problem. Noted for the monthly service summary instead.
- **Wed 11:40** JB renewed via the Sectigo account (dual control, vault); new expiry 2028-02. I confirmed `certhub_cert_expiry_seconds` for the fingerprint moved out past 30 days on the posture dashboard (§5.2 step 4 — Grafana viewer confirmed under the access pack).
- **Wed 12:00** Incident resolved within target (response: ack 02:12 / triage from 09:00; Sev2 4 wh met). Ownership carried to Marcus; row 1 stays open, three unowned certs remain, each of which will do exactly this again. Flagged as a problem candidate per IM-02.

**Resolution:** cert renewed manually by on-call; owner still unassigned. The alert chain worked precisely as registered — 30d warn, 14d ticket, 7d page — and caught a known risk seven days before expiry rather than four hours after, which is what the profile was built for. Everything upstream of the pager (ownership drive, ticket taxonomy) had already failed quietly.

**What would have made this faster:** an owner — the accepted condition dated 2026-12-04 that would have prevented this page slipped nine weeks with nothing watching it but a monthly agenda item.

---

## CERTHUB-1224 — Meridian: customer auditors want "your SLA and evidence of DR testing" by Friday

| | |
|---|---|
| **Raised** | Wed 2027-02-10 10:00, Meridian account manager, by email → catch-all (no request type fits; row 9 open) |
| **Classification** | Service request — information/assurance |
| **Status** | Resolved Thu 2027-02-11 15:10 (Owen-approved response sent); closed Fri |

**Timeline**

- **10:00** Email: Meridian's enterprise customer's auditors want, for a supplier questionnaire, "your SLA for the certificate service and evidence of DR testing", needed Friday.
- **10:10** What the record set actually holds (Service Docs + register, read-only): **(1)** the **service statement** — availability 99.5% monthly *stated in terms as an objective, not a guarantee*, support hours, response targets by severity, OOH position, the outage-≠-expiry property; **(2)** the **monthly service summary** (Jan issue) — SLO attainment Dec 99.97% / Jan 100%, Sev1/2 count (zero/one); **(3)** the **recovery procedure §4** and Restore Test Log — dated test restore **RTL-2026-014, 2026-11-10, PASSED, 2 h 50 m** against the 4-working-hour RTO, cadence 6-monthly, next due 2027-05; **(4)** **no SLA exists.** Nothing in the record set is a commitment *to a customer*; the availability figure is an internal objective and the service statement says so explicitly. There is nothing I could send that answers the question as asked.
- **10:25** Ownership. Not mine to release internal Confluence evidence to an external auditor, and not mine to speak for what Fernbrook commits to its customers. The escalation table (§7, even with the addendum) has no row for assurance/customer-evidence requests. Nearest document owners: **Owen Gallagher** (service statement; Supportability row) and **Marcus Webb** (Availability row; Restore Test Log). Priya not needed and heads-down. Routed to Owen with the pack pre-assembled and the Friday deadline flagged.
- **12:30** Owen: he owns the response; Marcus to word the DR attestation; raw internal evidence (S3 links, restore logs) does not leave Confluence — extract and attest instead. Owen also notes his own FRM-03 §2 row 11 baseline amendment covers publishing to *consuming teams*, not external assurance — this is a new hole.
- **Thu 15:10** Sent to the account manager, Owen-approved: the service statement as a PDF; a signed attestation — *"CertHub is an internal Fernbrook service managed to an internal availability objective of 99.5% monthly (attainment: Dec 99.97%, Jan 100%). A full disaster-recovery restore test was performed on 2026-11-10 and passed within the 4-working-hour recovery-time objective; tests recur 6-monthly, next due May 2027."* — plus a note that customer-facing commitments are contractual matters for the account/commercial team, as no standalone SLA exists for CertHub.
- **Thu 15:30** AM confirms this satisfies the questionnaire. **Closed Fri 2027-02-12.**

**Resolution:** answered with what exists — an objective, an attainment record, and a dated, passed DR test — and an honest "there is no SLA". Head-count for one question: AM → me → Owen → Marcus → Owen → me. Four people and a day and a half.

**What would have made this faster:** a standing supplier-questionnaire evidence page owned by the SDM — by the third time a customer's auditors ask, this should be a link, not a relay race.
