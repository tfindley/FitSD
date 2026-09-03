# Findings — Stage 5, service delivery manager (Owen Gallagher perspective)

Reviewer's notes, out of character. Context: asked to review the Supportability/handover,
Availability and Incident-profile rows of the CertHub FRM-03 before the Approver signs.
The review memo is `artifacts/S5-review-sdm.md`.

### [S5-SDM-1] No obligation anywhere in FitSD to state service levels to customers
- **Kind:** gap
- **What I needed:** a rule obliging a live service to tell its customers what it commits to — availability, support hours, response — or at least an explicit "best effort" statement. Eight teams depend on CertHub; the record contains an availability number and response targets, all agreed internally, none stated to any consumer.
- **What the standard gave me:** grep-level honesty: the *only* normative "shall" mentioning SLAs is **FSD-RR-7** — "SLAs withdrawn" at retirement. The framework requires you to withdraw at death a commitment it never required you to make in life. *Definitions* has the vocabulary exactly right ("**SLA** — a commitment to a customer / **SLO** — an internal target") and then the framework only ever uses the SLO half (SAC Availability row: "availability target / SLO"). To the standard's real credit, it *knows*: *Standards Alignment* §2 names FitSM **PR2 Service Level Management** as a known gap, and `BACKLOG.md` carries the exact candidate thin shall ("each live service has agreed, recorded service levels (or an explicit 'best effort' statement) with its customer"). But an adopter reading only the normative docs and the SAC reference never sees BACKLOG.
- **What I did about it:** invented acceptance condition C1 (a published service statement to the product teams) as a local call, and an amendment to Fernbrook's own baseline row.
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements FSD-RR-7; FitSD — Definitions ("SLA / SLO"); reference/FitSD — Standards Alignment §2; BACKLOG (SLM candidate)
- **Suggested fix:** promote the BACKLOG candidate to a thin shall (FSD-RR or FSD-GV): "each live service has agreed, recorded service levels — or an explicit best-effort statement — with its customers."

### [S5-SDM-2] "Support model agreed" — agreed with whom, covering what, at minimum?
- **Kind:** ambiguity
- **What I needed:** enough definition to review a support model against. Minimum content (hours? response targets? first-line ownership? escalation? out-of-hours position?) and a counterparty (agreed with the operators? the desk? the customers?).
- **What the standard gave me:** FRM-03 and FSD-PRO §7 say "operating and support model agreed" — no counterparty, no content floor. The SAC reference's baseline prompt is just "*Support model; the continuity rule; how operating-procedure changes are captured*". Fernbrook's baseline happened to spell out hours/response/rota/first line — but that was the adopter's skill, not the standard's prompt. A weaker adopter writes "support model: the team supports it — agreed" and passes the criterion literally. And because nothing points the "agreement" at the customer, CertHub's model was agreed entirely inward (Platform + desk + SDM) and still scored Y honestly.
- **What I did about it:** reviewed against Fernbrook's own baseline row (which I, in character, own) rather than the standard; the customer-facing half became conditions C1/C2.
- **Severity:** major
- **FitSD doc & section:** FSD-FRM-03 §1; FSD-PRO §7; reference/FitSD — Service Acceptance Criteria (Supportability row)
- **Suggested fix:** a parenthetical minimum on the SAC Supportability row: "support model (hours, response expectations, first-line ownership, escalation, and how it is communicated to the service's customers)".

### [S5-SDM-3] "Accepted by operators" — but Operator isn't a role in the process, and the desk is never a party
- **Kind:** ambiguity
- **What I needed:** to know whose acceptance the Supportability criterion requires. Am I (service delivery) a required signatory? Is the service desk?
- **What the standard gave me:** *Charter* §6 defines **Operator** ("performs the work; maintains records"), but FSD-PRO §3's roles table has only Solution Owner / Approver / Contributors — the process that demands operator acceptance at §7 never names operators among its roles. The service desk appears once in the whole solution lifecycle: an unannotated "Service desk / ITSM" row in FRM-02 §4's integration table. No SDM-shaped function exists anywhere. The Roadmap itself flags the Service Owner/Operator vs Solution Owner/Contributor naming tension as unresolved.
- **What I did about it:** Fernbrook's adoption pack §2 named its Operators (Platform engineers + the desk analyst) and made me a Consulted SME for the support-model rows, so the record had real named acceptors — again local scaffolding, not the standard's.
- **Severity:** minor
- **FitSD doc & section:** FSD-PRO §3 vs §7; FitSD — Framework Charter §6; FSD-FRM-02 §4; FitSD — Roadmap (Tier-3 guidepost note)
- **Suggested fix:** add Operator to FSD-PRO §3 (or cross-reference Charter §6) and gloss §7: "accepted by the named operators, including any first-line/support function".

### [S5-SDM-4] No post-live reporting or review duty towards the service's customers
- **Kind:** gap
- **What I needed:** any duty to ever report back to consumers — SLO attainment, incident summaries, posture — or to review the service *with* them. Nothing obliges CertHub to tell the eight teams anything, ever, after go-live.
- **What the standard gave me:** nothing normative. FSD-RR-4 monitors availability (inward), FSD-GV-5 reviews the management system (inward), FSD-RR-2's comms path covers major incidents only. The SAC's "reportable bar" defines what counts as reportable but not to whom beyond the incident process. As with S5-SDM-1, the standard's own ledger is honest: *Standards Alignment* §2 names FitSM **PR3 Service Reporting** as a candidate thin requirement.
- **What I did about it:** condition C2 — a monthly service summary to team leads, riding an existing internal review so it costs nearly nothing.
- **Severity:** major
- **FitSD doc & section:** FitSD — Requirements FSD-RR-1…4, FSD-GV-5; reference/FitSD — Standards Alignment §2
- **Suggested fix:** fold into the same thin shall as S5-SDM-1 ("…and performance against them is periodically reported to those customers"), closing PR2 and PR3 in one sentence.

### [S5-SDM-5] The per-service incident profile (FSD-RR-6) is the best thing in the standard from this seat
- **Kind:** worked-well
- **What I needed:** for the desk to be able to classify a CertHub ticket without guessing, and for "what counts as an incident for *this* service" to exist before the first bad day.
- **What the standard gave me:** FSD-RR-6 required exactly that, registered with the incident process, proven at acceptance. The result was real: severity triggers mapped to our IM-02 scheme, a tier-1 triage guide, and the genuinely clever "cert <7 days from expiry, no renewal in flight = Sev2" trigger that turns the founding outage's failure mode into an incident before impact. Central policies never produce this; the standard's requirement did. One residual friction, visible in the artifact: *registration* has no defined record shape — the team improvised "what registering mechanically meant" (JSM entry, policy annex, sign-off) and noted "no standing form for this existed".
- **Severity:** praise
- **FitSD doc & section:** FitSD — Requirements FSD-RR-6; FSD-RR capability card ("FitSD's distinct contributions"); FSD-PRO §7
- **Suggested fix:** one sentence on what a registration record minimally shows (where registered, who accepted it for the incident process, date).

### [S5-SDM-6] The continuity rule produced a real handover, before go-live
- **Kind:** worked-well
- **What I needed:** assurance the service survives its builder leaving — the scenario's founding risk ("wildcards owned by people who left last year").
- **What the standard gave me:** "continuity assured (not reliant on one person)" as a hard acceptance criterion, designed at Gate 2 and *proven* at FRM-03. It demonstrably drove behaviour: a named deputy, dated runbook walk-throughs, a hands-on break-glass dry run, a live revocation rehearsal — all before acceptance, plus an honest declared gap (the ceremony drill) with a date. As a reviewer I could check dated evidence instead of taking "yes, we've cross-trained" on trust. This is the criterion earning its keep.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability row); FSD-SD-5; FitSD — Definitions ("Continuity")
- **Suggested fix:** none.

### [S5-SDM-7] The single-person-dependency test stops at the operating team and never reaches first line
- **Kind:** gap
- **What I needed:** the continuity principle applied to the whole support chain. CertHub's tier 1/2 is one named analyst; his absence has no recorded cover — yet the criterion scored Y, correctly, because "the service isn't reliant on a single person" was read (by us and, on its wording, by the standard) as being about the *operating* knowledge only.
- **What the standard gave me:** the Supportability row's continuity language is all operator-side ("knowledge transfer / cross-training… operating knowledge captured"). Nothing prompts the same question of the support model's own layers.
- **What I did about it:** condition C3 (named cover / routing for the first-line function, plus an escalation time-bound). Partly the adopter's fault — Fernbrook's baseline row names an individual as tier 1/2 — but the standard's prompt never invited the question.
- **Severity:** minor
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria (Supportability row); FSD-FRM-03 §1
- **Suggested fix:** extend the continuity prompt: "no single-person dependency — in the operating team *or* the support model".
