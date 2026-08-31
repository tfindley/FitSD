# Findings — Stage 3b, Dana Okafor (CTO, Gate 2 Approver)

Perspective: the executive who signs Gate 2. My questions were a CTO's — what does my
signature commit, how does this weigh against everything else the team carries, who answers
for it in year 3, and will it survive a customer's NIS2 questionnaire.

### [S3b-CTO-1] What a Gate 2 signature commits is stated nowhere normative
- **Kind:** ambiguity
- **What I needed:** a statement of what my approval legally/financially commits — does it release budget, accept the multi-year run-cost, accept the residual risk posture, or merely permit build effort?
- **What the standard gave me:** the non-normative pitch says leadership "funds the build at Gate 2" (Adoption & Positioning §4), but the normative text says only "Approved for delivery: work moves into delivery" (FSD-PRO §6) and "Sign-off authorises progression to delivery" (FSD-FRM-02 §8). FSD-SD-6 requires a single accountable approver and a record — it never says what the record binds.
- **What I did about it:** wrote the commitment scope into the Decision cell myself: effort authorised, run-cost accepted onto the cost centre, two named ratifications, and the boundary ("funds delivery to Service Acceptance only").
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §6; FSD-FRM-02 §8; Adoption & Positioning §4
- **Suggested fix:** one line in FSD-PRO §6 / the form's §8 preamble: "the approval states what it commits — effort, run-cost accepted, and any exceptions or classifications ratified".

### [S3b-CTO-2] The promised portfolio view has no mechanism at the gate
- **Kind:** gap
- **What I needed:** something directing me to weigh CertHub against the rest of the demand register and the team's in-flight load before committing 30 person-days — roughly a quarter of one engineer's year on a 5-person team that also carries a rota.
- **What the standard gave me:** Adoption & Positioning §4 promises leadership a portfolio view ("stack the Gate records up"); Definitions calls the gates "a WIP limit on intake"; FSD-GV-4 mandates the demand register. But nothing in FSD-PRO §5–§6 or the forms asks the Approver to consult the register at the gate, and no field asks "what does this displace?". The WIP limit is asserted, not mechanised — each gate decision is made item-by-item, blind to the queue.
- **What I did about it:** eyeballed the front-door board myself (nothing else in flight tripped me) and added a condition protecting the rota against the build allocation.
- **Severity:** major
- **FitSD doc & section:** Adoption & Positioning §4; FSD-PRO §5–§6; FSD-GV-4; FitSD — Definitions ("Kanban / WIP limit")
- **Suggested fix:** an Approver prompt on FRM-01/02 §8: "considered against the demand register and current in-flight work — yes/no".

### [S3b-CTO-3] Ongoing people-cost is invisible in the effort/cost model
- **Kind:** gap
- **What I needed:** the steady-state operating effort — person-days/month of patching, ops, support and portal upkeep — which on a 5-person team is the dominant run-cost, dwarfing the £1.9k cash OPEX.
- **What the standard gave me:** FSD-PRO §1 recognises "a material new ongoing operating burden" as an *intake trigger*, but FRM-02 §7.1 has only People (build), CAPEX and OPEX rows, and the SAC cost row asks that run-cost be "owned", with guidance reading "expected run-cost and licences" — cash-shaped throughout. Nothing asks the burden that triggered intake to be *quantified* at design.
- **What I did about it:** condition 1 — FRM-03 must state estimated steady-state operating effort alongside cash run-cost, with a threshold (~2 pd/month) routing it back to me at headcount time.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §1; FSD-FRM-02 §7.1; reference/FitSD — Service Acceptance Criteria (Cost / licensing row)
- **Suggested fix:** an "ongoing operating effort (est. person-days/month)" line in FRM-02 §7.1, proven/refined on FRM-03.

### [S3b-CTO-4] Who answers to me in year 3 — the Solution Owner / Service Owner seam is open
- **Kind:** gap
- **What I needed:** a chain from the project's Solution Owner to an ongoing accountability I recognise — someone with defined duties (to a budget, to a review, to me) once the project closes; especially pointed here, since the named Solution Owner's departure is the scenario's known future and single-person dependency is the very risk CertHub exists to kill.
- **What the standard gave me:** FSD-GV-2 requires a single named owner per live service, and the register records it — but no duty attaches to that name beyond existing. The Roadmap ("Tier 3 — Roles model") openly admits the reconciliation is an unresolved design question ("Is the Solution Owner… the same accountability as the Service Owner…?") and that the lifecycle hand-off at acceptance is yet to be written. The team's own R6 (product ownership, Sam Reyes) had nowhere to land except a RAIDD row "deferred to acceptance".
- **What I did about it:** condition 3 — ownership (Service Owner + deputy on the register, and the product-ownership decision) resolved *on* the FRM-03, not after it.
- **Severity:** major
- **FitSD doc & section:** FSD-GV-2/4; FSD-PRO §3; FitSD — Roadmap (Tier 3 — Roles model); Implementation Guide ("Roles on a small team")
- **Suggested fix:** land the planned Tier 3 roles doc; minimally, one line at FSD-PRO §7: "acceptance names the live Service Owner on the register, and that owner carries the service's reporting and review duties".

### [S3b-CTO-5] No service reporting — nothing brings a live service back to leadership
- **Kind:** gap
- **What I needed:** assurance I will hear about CertHub again after acceptance — run-cost drift, supplier health, availability against the Tier-1 target — without an incident being the messenger.
- **What the standard gave me:** the only leadership-visible loop is the FSD-GV-5 management-system review (annual, at Fernbrook), and the Govern card's note that the cadence "catches services that have drifted". The Roadmap is candid that Service Level Management and Service Reporting have "no clean FitSD home today". Nothing requires a service, once live, to report anything to anyone.
- **What I did about it:** condition 5 — migration progress at the monthly ops review, and CertHub as a named line at the June 2027 management review. Both are local inventions layered on Fernbrook's Adoption Pack §7, not the standard.
- **Severity:** major
- **FitSD doc & section:** FSD-GV-5; capabilities/govern/FSD-GV; FitSD — Roadmap ("Honest gaps vs FitSM")
- **Suggested fix:** the thin `shall` the Roadmap already plans — e.g. "each live service shall be reviewed against its accepted SAC at the management-system review".

### [S3b-CTO-6] Standing risks die with the RAIDD; the team spotted it for decisions, not risks
- **Kind:** gap
- **What I needed:** R1 (supplier stall), R2 (migration drag) and R6 (unowned portal) to survive the project — they are *service* risks, and FSD-SA-1 says risks are treated or accepted by an accountable owner in a register.
- **What the standard gave me:** Information Stores lists the RAIDD log as a Delivery-stage store and the risk register as always-on, but nothing directs surviving RAIDD risks to transfer at acceptance. The team half-found the same hole themselves — DEC7 (carry decisions into the HLD) is their local invention for the *decision* rows; nobody thought to do it for the risk rows until I conditioned it.
- **What I did about it:** condition 4 — R1/R2/R6 transfer to the Platform Risk Register at acceptance with named owners.
- **Severity:** minor
- **FitSD doc & section:** reference/FitSD — Information Stores (RAIDD log row); FSD-PRO §7; FSD-SA-1
- **Suggested fix:** one line at FSD-PRO §7: "open RAIDD items transfer to the standing registers (risks → risk register, decisions → service documentation) at acceptance".

### [S3b-CTO-7] Ratification requests have no home in the sign-off block
- **Kind:** friction
- **What I needed:** a structured place to ratify the two items the design correctly escalated to me — the key-material classification and the root-key backup design exception.
- **What the standard gave me:** FRM-02 §8 has Decision / Approver / Conditions / Date only; the submitters had to write "called out for explicit ratification within the decision" as a workaround, and I had to embed the ratifications in prose.
- **What I did about it:** ratified both inside the Decision cell, explicitly labelled.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-02 §8
- **Suggested fix:** an optional "Ratified with this decision" row in §8 (exceptions, classifications, deviations the design asks the Approver to own).

### [S3b-CTO-8] The vendor due-diligence table gave a CTO exactly the right supplier answer
- **Kind:** worked-well
- **What I needed:** to test the step-ca exposure — Apache-2.0 but VC-backed, community support, no published EOL — before committing a Tier-1 service to it for 3–5 years.
- **What the standard gave me:** Gate 1 §6's forced fields (vendor & licensing, upgrade path, EOL horizon, **exit / alternatives**) meant the "how would we get off it?" answer was already on record and load-bearing by the time it reached me: standard X.509 + ACME throughout, CA swappable without consumer change. FSD-SC-2/4 then keep the question alive via the supplier register. I approved the supplier exposure *because* the exit path existed in writing — that is the intake control doing precisely its job.
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-01 §6; FSD-SC-2/SC-4; FSD-SD-1 (new-technology trigger)
- **Suggested fix:** —

### [S3b-CTO-9] The gate chain produced a decidable, defensible pack
- **Kind:** worked-well
- **What I needed:** to make a funding decision in one sitting that I could defend to the board.
- **What the standard gave me:** the Gate 1 → PoC → Gate 2 chain delivered an evidence trail — a scored PoC settling a genuine build choice, an estimate that grew from 15–25 to 30 days *with the delta explained*, conditions from the previous gate discharged line by line, and a why-not-Vault rationale (DEC1) I could hand to an auditor. The "one-page proposal with a yes/no at the bottom" claim (Adoption & Positioning §3) held for the person doing the funding, and the adoption pack's risk-tier routing put the decision at the right desk. This is what the pitch promised leadership, delivered.
- **Severity:** praise
- **FitSD doc & section:** FSD-PRO §5–§6; FSD-FRM-01/02; Adoption & Positioning §3–§4
- **Suggested fix:** —

### [S3b-CTO-10] The NIS2 mapping is honest enough to hand to a customer — with an irony
- **Kind:** worked-well
- **What I needed:** to know whether the gate records + SAC evidence would satisfy the NIS2-shaped customer due-diligence questionnaires that land on my desk, and where the holes are.
- **What the standard gave me:** Standards Alignment §6 maps Article 21(2) measure by measure and *admits its gaps* rather than compliance-washing: solves (a)–(f), partial (g)/(i), gaps at (h) cryptography, (j) MFA, and Article 23 statutory reporting. The evidence FitSD forces into existence — supplier register with exit paths (21(2)(d)), tested restores (c), per-service incident profiles (b), secure-by-design gate records (e) — answers most questionnaire rows directly, and I can crib the table itself. The irony worth logging: I just approved a *cryptography service* under a framework whose admitted control-level gap is cryptography — the SAC security row plus the architect's design carried it locally, but a crypto/key-management line in the SAC or FSD-SA would close the loop. Article 23 reporting remains ours to solve.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Standards Alignment §6; FSD-SC-1…4; FSD-SD-5
- **Suggested fix:** a thin cryptography/key-management criterion or FSD-SA requirement, closing the self-identified 21(2)(h) gap.
