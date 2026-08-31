# Findings — Stage 4 (build & acceptance preparation), Engineer 1 / Solution Owner (Priya)

Perspective: building CertHub Sept–Nov 2026 and producing the operational artefact set + FRM-03. The docs I wrote are the only thing that outlives my involvement; the findings below are about whether the standard helped me write the *right* things.

### [S4-ENG1-1] The standard says the documents must exist, not what they must contain
- **Kind:** gap
- **What I needed:** a content bar for the HLD, runbook and recovery procedure — even a checklist of headings — so a busy engineer writing from an insider's head produces something a stranger can operate from. FSD-PRO §7 says "HLD, runbook, recovery procedure… published; links recorded"; the SAC reference gives one stage-neutral line per criterion ("the service can be understood and operated from written material").
- **What the standard gave me:** existence + publication + links. Nothing on contents. Our baseline row added only "runbook (including the incident profile)".
- **What I did about it:** invented the structure (quick facts, health checks, per-failure-mode steps, escalation, walk-through log) from professional experience, and cross-pollinated from the other SAC rows (the test-alert and test-restore evidence rows *implied* sections). A weaker or busier engineer would ship a wiki stub titled "Runbook" and pass the letter of acceptance.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7; reference/FitSD — Service Acceptance Criteria (Documentation row)
- **Suggested fix:** a non-normative "what a runbook/HLD/recovery procedure minimally answers" appendix in the SAC reference — questions, not a template, matching the baseline's questions-not-answers style.

### [S4-ENG1-2] The SOP definition is circular and it did bite at acceptance
- **Kind:** ambiguity
- **What I needed:** to know whether "operating procedures (SOPs)" is a *third artefact* alongside runbook and recovery procedure, because the criterion is "no document, no acceptance".
- **What the standard gave me:** a contradiction. Definitions: "a service's SOPs **are** its runbook and recovery procedure". FSD-PRO §7 / FRM-03 §1: "HLD, runbook, recovery procedure, **operating procedures (SOPs)**, user/how-to" — four items where the definition says two of them already *are* the third. Meanwhile Gate 2 §4 asks for "new/changed standing procedures" as if SOPs were a separate, listable set (and ours were: onboarding, ceremony, revocation, break-glass, false-positive handling).
- **What I did about it:** folded the SOPs into runbook §6 as named procedures and flagged the choice on the FRM-03 row so the Approver can't be surprised. Two reasonable reviewers could count our document set as complete or one-short.
- **Severity:** major
- **FitSD doc & section:** FitSD — Definitions ("SOP"); FSD-PRO §7; FSD-FRM-03 §1
- **Suggested fix:** pick one model: either drop "SOPs" from the §7 list (runbook + recovery *are* the SOPs) or define SOP as "a standing procedure beyond incident response" and stop defining it as the other two documents.

### [S4-ENG1-3] Per-service operational docs are homeless in the information model
- **Kind:** gap
- **What I needed:** a named store, owner and review cycle for the HLD/runbook/recovery/user-guide set — *Information Stores* is exactly the document that should say where they live and who reviews them next year.
- **What the standard gave me:** fifteen stores, none of which is "per-service operational documentation". The Document register explicitly covers *governing* documents (FSD-GV-3); incident *profiles* get a store row but the runbooks they live in do not. Nothing anywhere gives service docs a review cycle — so nobody reviews my runbook in 2027, and by 2028 it describes a service that no longer exists. That's the exact "quiet failure mode" the Information Stores doc says it exists to prevent.
- **What I did about it:** our baseline named a home (Confluence Service Docs, linked from the register) but no cycle — the standard never prompted for one. I wrote "Review cycle: proposed annually — MSO to confirm" into my own doc headers, which is an engineer inventing governance.
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Information Stores (catalogue); FSD-GV-3/4
- **Suggested fix:** an Information Stores row "Per-service operational documentation — runbook, recovery, HLD, user docs; owned by the Service Owner; reviewed on a stated cycle", and a matching prompt in the SAC Documentation row ("…and how often they're reviewed").

### [S4-ENG1-4] "Registered with the incident-management process" has no mechanics
- **Kind:** ambiguity
- **What I needed:** what registering the incident profile actually *is* — what artefact changes hands, and what counts as evidence on FRM-03.
- **What the standard gave me:** the requirement (FSD-RR-6) and the criterion ("registered with the incident-management process"), which I genuinely rate as one of FitSD's best ideas — but "registered" is undefined. Registered *where*, accepted *by whom*?
- **What I did about it:** invented the mechanics: trigger table into the service-desk tool's service entry, profile appended to the incident policy's per-service annex, tier-1 briefing, and the service-delivery manager's dated sign-off recorded on the monitoring page. Four local calls; a lazier version is a Slack message saying "FYI".
- **Severity:** minor
- **FitSD doc & section:** FSD-RR-6; FSD-PRO §7 (Incident profile row); FSD-FRM-03 §1
- **Suggested fix:** one sentence: "registration means the incident process's owner has accepted the profile, evidenced by name and date."

### [S4-ENG1-5] The Change & Release seam held — because Gate 2 §4 asked the right question early
- **Kind:** worked-well
- **What I needed:** a clean boundary between the delivery project and the change process, including for a service that *makes changes by itself* (automatic renewals).
- **What the standard gave me:** FSD-PRO §1/§4 is unambiguous that build changes are raised through FSD-CH, and — the part that actually earned its keep — FSD-FRM-02 §4's prompt for "changes the service forces on your change or incident processes" surfaced at *design* time that machine-driven renewals can't queue for a weekly CAB. The pre-approved standard-change class (SC-CERT-01) was agreed with the CAB in September instead of being discovered as a blocker in November. The FSD-CH card's mention of pre-approved standard changes gave the CAB conversation a shared vocabulary.
- **What I did about it:** nothing corrective — this is praise. One small local call: change *granularity* (one CHG per milestone + GitOps auto-records, per-team CHGs for migrations) is ours; the standard is rightly silent but a hint wouldn't hurt.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §1/§4; FSD-FRM-02 §4; FSD-CH card

### [S4-ENG1-6] Nobody can say how much cross-training is enough, or who judges it
- **Kind:** ambiguity
- **What I needed:** a sufficiency test for "knowledge transfer / cross-training delivered… continuity assured". Our deputy joined five weeks before acceptance. He has done one dated walk-through. Is that continuity?
- **What the standard gave me:** the criterion delegates the threshold to the baseline (correct in principle), and our baseline operationalised it as "deputy has completed a dated runbook walk-through" — which is an *event*, not a competence. The walk-through proves attendance; it doesn't prove the deputy can run the intermediate ceremony at 2 a.m. And no role judges sufficiency: the Approver signs the row, but the standard never says the *operator* or deputy themselves attests readiness.
- **What I did about it:** met the letter (dated walk-throughs ×2, revocation rehearsal), disclosed the depth gap honestly on the FRM-03, and scheduled a ceremony shadow drill beyond the bar. A team under schedule pressure does only the first of those three.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (Supportability row); reference/SAC (Supportability "what your baseline sets")
- **Suggested fix:** the SAC baseline prompt should ask two questions, not one: "what evidences sufficient cross-training (which procedures must the deputy have *performed*), and who attests it" — pushing baselines from event-based to competence-based continuity.

### [S4-ENG1-7] The RAIDD dies at delivery and decisions have no standing home — DEC7 was a rescue, not a rule
- **Kind:** gap
- **What I needed:** somewhere the *why* (step-ca not Vault, offline root, metadata-only inventory) lives after the project closes. Information Stores lists the RAIDD's lifecycle as "Delivery" — it ends. No store holds standing design decisions.
- **What the standard gave me:** a Decisions column in the RAIDD (good — it made us write DEC1–6 at all) and then silence. Our decision log survives only because the CTO made "carry it into the HLD" a condition of funding (DEC7). That was Dana's instinct, not FitSD's instruction; most approvers wouldn't think of it, and the engineer inheriting the service in three years re-litigates everything.
- **What I did about it:** HLD §9 is the standing decision log, extended with build-time decisions (DEC8–12).
- **Severity:** major
- **FitSD doc & section:** reference/FitSD — Information Stores (RAIDD row); FSD-FRM-02 §6
- **Suggested fix:** one line in FSD-PRO §7's Documentation row or the SAC reference: "the design doc carries the decisions and rationale from delivery (the RAIDD's D column) forward".

### [S4-ENG1-8] Acceptance never asks what the service costs in people
- **Kind:** gap
- **What I needed:** a place on FRM-03 for steady-state operating *effort*. The intake test rightly triggers on "material new ongoing operating burden" (FSD-PRO §1) — but at the other end of the lifecycle, the Cost/licensing criterion asks only for licences and run-*cost*, which every reader takes as cash.
- **What the standard gave me:** nothing; our CTO had to bolt it on as a Gate 2 condition ("the real run-cost is people, not the £1.9k"). She was right, and the standard should have been there first — ops burden is the number that decides whether a 5-person team can afford its own portfolio.
- **What I did about it:** stated 1.5–2 pd/month with a breakdown in a locally-invented conditions section (§1a).
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §7 (Cost/licensing row); FSD-FRM-03 §1
- **Suggested fix:** extend the criterion: "ongoing run-cost (cash **and estimated operating effort**) confirmed and owned".

### [S4-ENG1-9] FRM-03 has no field for discharging Gate 2 conditions — third form, same hole
- **Kind:** friction
- **What I needed:** somewhere to answer the six conditions Gate 2 approval attached (ops-effort estimate, ownership decision, risk transfer, migration reporting…). Acceptance is exactly where conditions come due.
- **What the standard gave me:** no field, on any of the three forms — the same gap our Gate 2 record noted for Gate 1's conditions. Conditions are a first-class output of every FitSD decision (§5–§7 outcomes all mention them) yet no form ever asks whether they were met.
- **What I did about it:** repeated the local convention: a "§1a Gate 2 conditions — position at acceptance" section.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-03; FSD-PRO §5–§7 (outcomes)
- **Suggested fix:** a standing "Conditions from the previous gate — position" row on FRM-02 and FRM-03.

### [S4-ENG1-10] The remediation table only speaks "criterion not met" — real acceptances carry open actions that aren't failures
- **Kind:** friction
- **What I needed:** a home for honest open items that don't unmeet a criterion: 4 still-unowned discovered certs, the six-team migration tail, a beyond-the-bar training drill. Hiding them felt dishonest; listing them under "criterion not yet met" mislabels them.
- **What the standard gave me:** §2's framing is strictly "any criterion not yet met". Binary.
- **What I did about it:** used §2 anyway with an explanatory note and "—" in the criterion column.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-03 §2
- **Suggested fix:** rename §2 "Outstanding remediation and open actions", one extra column: blocks acceptance? Y/N.

### [S4-ENG1-11] Solution Owner → Service Owner handover is invisible to the process that creates the service
- **Kind:** gap
- **What I needed:** the moment CertHub stops being my *project* and becomes someone's *service*. The lifecycle diagram ends at "Live service — register entry + owner", but FRM-03 has no field naming the live Service Owner or deputy, and FSD-PRO's role list (Solution Owner / Approver / Contributor) never mentions the operating role it hands over to. The long-term product-ownership question (our R6) similarly had no gate to force it.
- **What the standard gave me:** the adoption pack's role table (Service Owner per live service) — a Govern-side construct the Solution Development process never connects to. Again it was a CTO condition ("ownership resolved at acceptance, not after") that forced the register entry and the accept/decline decision onto the FRM-03.
- **What I did about it:** recorded owner/deputy and the declined product-ownership decision in §1a.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §3/§4 (lifecycle, roles); FSD-FRM-03 header/§1
- **Suggested fix:** an FRM-03 field: "Service Owner (and deputy) on acceptance" — the form that creates a live service should name who owns it.

### [S4-ENG1-12] "Tested restore" and "test alert observed end to end" caught a real defect each — the evidence bars work
- **Kind:** worked-well
- **What I needed:** (in hindsight) to be forced to actually do the drills.
- **What the standard gave me:** the two most concrete evidence bars in §7 — "a test restore performed, dated" and "a test alert observed end-to-end". Our first restore **failed**: the paper-compliant Velero scheme restored an inconsistent CA datastore, and we redesigned the backup (DEC9) three weeks *before* go-live instead of during a 2 a.m. incident. The end-to-end alert requirement likewise proved the whole Prometheus→Opsgenie→human path, not just that a rule exists. These two rows converted acceptance from paperwork into a rehearsal, and the per-service incident profile (FSD-RR-6) forced the one genuinely clarifying conversation of the whole close-out — "an impending expiry is an incident *before* anything is down" is now written policy. The Gate-2-designs-it / FRM-03-proves-it symmetry meant nothing at acceptance was a surprise: I spent November evidencing, not negotiating.
- **What I did about it:** nothing — this is what the standard is for. Log both restore attempts; the failed one is the best advert FitSD has.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §7 (Backup, Monitoring, Incident profile rows); FSD-FRM-02 §5 → FSD-FRM-03 §1 symmetry
