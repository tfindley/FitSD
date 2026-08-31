# Findings — Stage 3a, architect (Elena Vasquez, lead/principal architect; led the Gate 2 design)

Perspective: org-wide design authority, accountable in practice (though not on paper — see below)
for CertHub's architecture being right. Work done: closed the PoC conclusion on FRM-01 §7 and
produced the full FRM-02 for a Tier 1 service eight teams will build on.

### [S3a-ARCH-1] Architecture rationale has no home that survives into live service
- **Kind:** gap
- **What I needed:** a durable place to record *why* the architecture is shaped as it is — why step-ca and not Vault, why an offline root, why metadata-only inventory — findable by the engineer who inherits CertHub in three years.
- **What the standard gave me:** the RAIDD Decision row (FSD-FRM-02 §6) — a single free-text Description cell — and nothing else. FitSD has no ADR or decision-record concept. Worse, per *Information Stores* (the catalogue), the RAIDD log's lifecycle stage is **"Delivery"**: it formally closes when the project does. The Documentation SAC criterion mandates an HLD but nowhere requires it to carry decision rationale. So the standard's only rationale store dies at exactly the moment the operate phase begins.
- **What I did about it:** wrote full rationale into RAIDD Decision rows anyway, then invented DEC7 — a decision *about decisions* — mandating that DEC1–6 be replicated into the HLD as a standing "Design decisions & rationale" section. That's me patching the framework from inside a form.
- **Severity:** major
- **FitSD doc & section:** FSD-FRM-02 §6; reference/FitSD — Information Stores (RAIDD row, lifecycle column); reference/FitSD — Service Acceptance Criteria (Documentation row)
- **Suggested fix:** either extend the RAIDD/decision store's lifecycle to "All" for Decisions, or add "key design decisions and their rationale" to the Documentation criterion's mandatory HLD content.

### [S3a-ARCH-2] The "evaluation / research reference" points nowhere the standard names
- **Kind:** gap
- **What I needed:** a home for the PoC scorecard — the actual evidence behind the selected option — that FRM-02 §1's "Selected option" field could cite.
- **What the standard gave me:** the field asks for "the evaluation / research reference" (FSD-FRM-02 §1), which is the right question — but FRM-01 §7's "Result / conclusion" is a summary cell, and *Information Stores* names no store for PoC outputs, scorecards or evaluation evidence. The reference is demanded; its referent is unprovided-for.
- **What I did about it:** local convention — filed the scorecard as a Confluence child page of the Gate 1 record, linked from the intake ticket, and said so in both artifacts so successors can find it.
- **Severity:** major
- **FitSD doc & section:** FSD-FRM-02 §1; FSD-FRM-01 §7; reference/FitSD — Information Stores
- **Suggested fix:** one line in Information Stores folding PoC/evaluation evidence into the Gate records store ("attachments/children of the gate record").

### [S3a-ARCH-3] Design authority is not a role — the person who led the design is invisible on the record
- **Kind:** gap
- **What I needed:** a way to record that I — not the Solution Owner — led and stand behind this design. The role model gives Solution Owner / Approver / Contributor (FSD-PRO §3), with "Consulted SME" in the Charter's role table. All of those are advisory or accountable-for-delivery; none is accountable-for-the-design.
- **What the standard gave me:** Contributor status. FRM-02's header has Solution Owner and Contributors; the org-wide architect who shaped every section appears in a comma-separated list next to the service-desk analyst who supplied ticket counts. In three years, the record won't show who to ask — or who to blame.
- **What I did about it:** bolded my name in the Contributors cell with "(lead architect — led this design)" and noted the local convention on the form. That is cosmetics, not accountability.
- **Severity:** major
- **FitSD doc & section:** FSD-PRO §3; FitSD — Framework Charter §6; FSD-FRM-02 header
- **Suggested fix:** an optional named "Design lead / design authority" field on FRM-02 — even without adding a formal role, naming the accountable designer on the record costs one row.

### [S3a-ARCH-4] Nothing requires the design to be *reviewed* by anyone qualified
- **Kind:** gap
- **What I needed:** assurance that a Gate 2 design for a Tier 1, estate-wide service gets qualified technical scrutiny before build effort is committed.
- **What the standard gave me:** a single accountable Approver (FSD-SD-6, FSD-PRO §6) — deliberately lightweight, and at Fernbrook that Approver happens to be a CTO who can read a CA hierarchy. But the requirement is satisfied identically by any manager signing any §3 (three free-text fields and a diagram) unreviewed. FSD-SD-3 says the design decision must cover "how it will be operated" — nothing says the *technical* design must be checked by anyone competent to check it. The builder rule in the Implementation Guide crosses one line (builder ≠ sole acceptance approver) but there is no equivalent at Gate 2: here the design's author (me) could also have been its only technical reader.
- **What I did about it:** nothing structural — Fernbrook got lucky with its Approver. Flagged only.
- **Severity:** major
- **FitSD doc & section:** FSD-SD-3/6; FSD-PRO §6; FSD-FRM-02 §8
- **Suggested fix:** a thin shall or note: for solutions above a bar the org sets (tier, spend, cross-team), Gate 2 is reviewed by a named person other than its author with relevant competence, recorded on the form.

### [S3a-ARCH-5] §3 asks for departures from "the team's design principles" — which FitSD never requires to exist
- **Kind:** ambiguity
- **What I needed:** a baseline to declare design exceptions against.
- **What the standard gave me:** FSD-FRM-02 §3's guidance: "Note any departures from the team's design principles." No FitSD requirement, capability or store establishes design principles; Fernbrook has none. The field dangles. (The §3 shape itself — three free-text fields — carried a Tier 1 estate service only because free text scales with the author; it prompts for nothing: no data classification, no trust boundaries, no failure modes, no capacity. For a service other teams build on, everything load-bearing in my §3 came from me, not from the form.)
- **What I did about it:** declared exceptions against SEC-01/02/03 and the SAC baseline as de facto principles, and said so on the form.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-02 §3
- **Suggested fix:** either reword to "…from your design principles or security baseline", or add a line to the Implementation Guide's stand-up steps: name what counts as your design principles.

### [S3a-ARCH-6] The RAIDD's single Description column can't hold what a real RAIDD needs
- **Kind:** friction
- **What I needed:** owner, mitigation, status and date per risk; rationale, decider and date per decision.
- **What the standard gave me:** Type | Description, one row per type (FSD-FRM-02 §6). I repeated rows (fine) and crammed owner/mitigation/evidence into each cell as bolded inline labels (survivable, but unqueryable — no one will ever filter these by owner or status, and "maintained through delivery" means someone edits prose cells for two months).
- **What I did about it:** the inline-label convention, declared in an italic note on the form.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-02 §6; FitSD — Definitions (RAIDD)
- **Suggested fix:** two more columns (Owner, Mitigation/Status) — still proportionate, actually usable.

### [S3a-ARCH-7] Designing to the ratified SAC baseline worked — the shift-left promise held
- **Kind:** worked-well
- **What I needed:** the non-functional bar known *before* design, not discovered at go-live.
- **What the standard gave me:** exactly that. Nine ratified rows (Adoption Pack §4 per *FitSD — Service Acceptance Criteria*) turned §5 into transcription-plus-engineering rather than negotiation: the continuity row forced a named deputy at design time (and exposed that the deputy must be interim until a hire lands — a real plan, made now); the monitoring row's "expiry-style dates always monitored" materially shaped the product (the estate scanner exists because the baseline demands it); the incident-profile row produced service-specific severities before a line of code; the applicability rules stopped me hand-waving the root-key backup as N/A — I had to argue it as an explicit design exception for ratification instead. The bar being *someone else's ratified numbers* is what made designing to it fast.
- **What I did about it:** n/a — used as intended.
- **Severity:** praise
- **FitSD doc & section:** reference/FitSD — Service Acceptance Criteria; FSD-FRM-02 §5; FSD-GV-7
- **Suggested fix:** none.

### [S3a-ARCH-8] Gate 1 conditions flowed into the design well — but the form gives them no discharge slot
- **Kind:** friction
- **What I needed:** somewhere on FRM-02 to show the Approver that the five Gate 1 conditions were met.
- **What the standard gave me:** the conditions mechanism itself is good — Marcus's five conditions (firm the estimate, name the deputy, legal read on BUSL, classification to Gate 2, contain the wildcard) each landed somewhere concrete in this design, which is the gate system working. But FRM-02 §1's carry-forward asks only for outcome/option/value/effort; nothing asks "how were the approval conditions discharged?", so a team could silently drop them.
- **What I did about it:** added an unprompted "Gate 1 conditions — position at submission" block under §1.
- **Severity:** minor
- **FitSD doc & section:** FSD-FRM-01 §8; FSD-FRM-02 §1
- **Suggested fix:** one carry-forward row: "Gate 1 conditions and how each is discharged."

### [S3a-ARCH-9] §4's cross-process prompts forced the conversation teams always skip
- **Kind:** worked-well
- **What I needed:** to take seriously that CertHub changes how eight teams deploy and what the service desk fields.
- **What the standard gave me:** FSD-FRM-02 §4's four prompts — service desk, environments, and especially "does this force changes to your change, incident or other operating processes?" — surfaced real design work: a new pre-approved standard-change class under the CAB (auto-renewals can't wait for Wednesdays), per-team decommissioning of home-grown automation as tracked changes, a permanent dev instance, tier-1 triage categories. None of that is architecture in the diagram sense, and all of it is where internal platforms actually fail. The §4→§5 link (process impact proven as adopted SOPs at acceptance) closes the loop properly.
- **What I did about it:** n/a — used as intended.
- **Severity:** praise
- **FitSD doc & section:** FSD-FRM-02 §4; FSD-PRO §6–7
- **Suggested fix:** none.
