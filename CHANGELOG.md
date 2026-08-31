# FitSD — Changelog

Notable changes to the **FitSD standard**, written for implementers. Newest first.

FitSD follows its [Versioning Policy](./FitSD%20%E2%80%94%20Versioning%20Policy.md): only a **normative** change (a new or altered "shall") moves the version. Entries tagged **[normative]** can affect conformance — if you already conform to the previous version, those are the lines to read closely. Everything else is new guidance, a clarification, or errata, with no version impact.

Changes are logged under **Unreleased** as they land; at release the heading is promoted to the version and dated (see [RELEASING.md](./RELEASING.md)).

<!-- releases -->

## Unreleased — v0.3.0 (MINOR, in progress on the `v0.3` branch)

Theme: the Service Acceptance Criteria (SAC) become a **standing, organisation-owned baseline** — defined once and inherited by every solution, instead of rediscovered at each go-live. The supplier / supply-chain capability (FSD-SC) also lands, completing the capability model.

### Added
- **[normative] FSD-GV-7**: an organisation **shall define and ratify a standing Service Acceptance baseline** (its own thresholds for each SAC criterion) and apply it to every solution's Service Acceptance. This is the new conformance obligation for v0.3.0.
- **[normative] FSD-SC — Supplier & supply chain**, the conditional sixth capability: requirements **FSD-SC-1…4** (supplier register; assessment before adoption; expectations in agreements; periodic review with an exit path for critical dependencies) plus a capability card (`capabilities/supplier-supply-chain/`). Applies where services rely on suppliers or third-party dependencies the team is accountable for. Closes NIS2 Article 21(2)(d); maps ISO 27001 A.5.19–A.5.22 and FitSM PR8; adds the **supplier register** to *Information Stores*. A backward-compatible addition: existing conformance is unaffected.
- **`reference/FitSD — Service Acceptance Criteria`**, the SAC defined once, as inheritable, org-tunable principles, with a blank baseline template to ratify.
- **`FitSD — Implementation Guide`**, a business stand-up playbook: a 7-step checklist, the implementation-profile mapping (requirements → your local policies), and minimal small-team roles.
- **`FSD-FRM-00 — Idea Brief`**: the pre-Gate-1 intake is now a canonical form (numbered 00, ahead of the gates); it carries forward into Gate 1. Closes the "no Idea Brief form" gap (#6).
- **Gate 2 (`FSD-FRM-02`)**: a "Selected option + evaluation reference" field, the seam between the Gate 1 options and the Gate 2 design.
- **Tooling**: `scripts/check-sac-drift.sh` guards against a hardcoded SAC count creeping back into the docs; `scripts/check-version-drift.sh` keeps version claims out of governed docs' prose (the version lives in frontmatter, `VERSION`, this changelog, the README and the Roadmap, nowhere else).
- **`reference/FitSD — Inputs, Activities & Outputs`** — the whole framework on one page: per-capability inputs, key activities, outputs, and the records each touches. A synthesis, not new rules; the Requirements, Information Stores and FSD-PRO stay authoritative.

### Changed
- **SAC referenced by name, defined once.** `FSD-PRO §7`, `FSD-FRM-02 §5` and `FSD-FRM-03 §1` now reference the criteria from the new reference doc and carry only their stage column (design vs evidence). The criteria themselves are unchanged. A clarification, not a change to the Definition of Done.
- **`FSD-SD-5` note** now points at the SAC reference doc and names the standing baseline, including any recorded applicability rules.
- **SAC applicability: an honest N/A.** The standing baseline may define per-criterion *applicability rules*; the Service Acceptance Record (`FSD-FRM-03 §1`) gains an explicit **N/A per baseline (reason)** outcome. A recorded call against a standing rule, not a skip. A clarification of FSD-GV-7 / FSD-SD-5, not a new requirement.
- **One name for the flagship.** The capability formerly labelled "Bring in" is now **Solution Development** everywhere (Charter §4, README, Definitions, Requirements, both diagrams); "the front door" stays as its description.
- **The net-new effort line is yours.** The ~10-person-day intake trigger (`FSD-PRO §1`) is now the team's own **net-new effort line**, set once in the implementation profile; 10 person-days remains the suggested default. Set during stand-up (Implementation Guide, step 3).
- **Gate 1 lightened.** The value-lens **Total** row is gone (the lenses are a profile, not arithmetic); the form now says up front that §6–7 are conditional; `FSD-PRO §5` "what is captured" is a list instead of one long sentence.
- **Solo-operator guidance.** The Implementation Guide now says plainly what acceptance looks like on a team of one: there is no second pair of eyes, so the honest, dated, evidenced record is the control.
- **Version claims purged from prose.** Stale "v0.2" callouts removed from the Charter and Requirements; the README's status section now points at `VERSION` / this changelog. New style guard in `RELEASING.md`.
- **Requirements coverage note** aligned with the "sharp wedge" direction: the capability cards *are* the Tier 2 treatment for FSD-CH/RR/SA — FitSD builds no second full process.
- **Third-party & cross-team demand named (#10).** `FSD-PRO §1` now states the front door is **source-agnostic** — a third party, customer or another team can raise demand via the Idea Brief; the receiving team triages at Gate 1 and always holds the accountable Solution Owner. A clarification of the existing intake model (FSD-SD-1, Principle 3), not a new requirement.
- **The business case, named (#11).** Definitions gains a **Business case** entry and the Gate 1 form, `FSD-PRO §5` and *Adoption & Positioning* now name the **Gate 1 Outline Proposal as the business case**, the fundable proposal. No separate business-case document: the gate records already carry it (Principle 2).
- **House style settled and applied.** Every standard document now opens with a `> **TL;DR** —` callout (the capability cards and the four forms keep their deliberate shared openers); FSD-PRO's `§n`-prefixed headings move to the corpus-standard `n.` form; frontmatter is completed corpus-wide (`type`, `version`, `status` on every tiered document, with the semantics of each recorded in the *Versioning Policy*, "Document markers"); the callout and section-citation conventions join the style guards in `RELEASING.md`.
- **Govern card completed for v0.3.** The `FSD-GV` card now carries **FSD-GV-7** (it had stopped at GV-6) and names the SAC baseline as Govern's **service design baseline** — a standing standard every solution is designed *to* at Gate 2 and proven against at acceptance (the framing settled in the Roadmap, "Shape & scope"). The *SAC baseline* entry in Definitions gains the same framing.
- **FitSM gap note added** (*Standards Alignment* §2): PR2 Service Level Management and PR3 Service Reporting named as candidate thin requirements, PR7 and PR11 as declared non-goals — the note the Roadmap's "Honest gaps" bullet already cited.
- **Capability-count drift fixed.** The Charter TL;DR, the Roadmap's v0.2 note, the capability-card definition and the Inputs/Activities/Outputs "See also" no longer disagree over five versus six capabilities; the canonical phrasing stays the Charter §4 "five core groups, plus one conditional". Stale `version: 0.2` frontmatter bumped on the docs v0.3 touched (Information Stores, Standards Alignment, Diagrams, the GV/CH/RR/SA cards). The README's "What's in here" table gains the missing rows (Versioning Policy; `VERSION` / `RELEASING` / `SECURITY`).
- **SOPs named; forced process changes proven at acceptance.** The **Documentation** criterion now names **operating procedures (SOPs)** alongside the runbook/recovery procedure (they were always required, a runbook *is* an SOP, just unnamed; new **SOP** glossary entry). The **Supportability / handover** criterion now says **knowledge transfer / cross-training** in words and proves that any **new or changed standing procedure the service forced** (flagged at Gate 2 §4) is written and adopted before go-live, closing the design→prove gap. Non-normative: the nine SAC categories are unchanged; this works within Documentation + Supportability. Standing *policies* stay out of the per-service record (referenced out, not authored at acceptance).

### Restructured
- **The Elevator Pitch & Executive Summary is folded into *FitSD — Adoption & Positioning*** (new §2, "The pitch": spoken forms plus the one-pager; later sections renumbered, cross-references updated). The standalone file is removed and the README trimmed to point at it; the stale status section was dropped rather than moved. *(The site's vendored copy is handled in the web migration.)*

### For implementers moving from v0.2
- The SAC **categories are unchanged** — nothing you accepted under v0.2 becomes non-conformant.
- **Ratify your SAC baseline** (FSD-GV-7). You were already choosing these thresholds at acceptance; now you set them once, up front, and inherit them into every solution.
- **Stand up the supplier register** (FSD-SC, if it applies to you, and it does if your services stand on cloud, SaaS or support contracts). The pre-adoption assessment was already in Gate 1 §6; the register and a periodic review folded into a cadence you already run are the new muscle.

### Resolved issues
- **#6** Idea Brief form: added (`FSD-FRM-00`).
- **#7** SAC "eight vs nine" drift: the framework was already de-numbered in v0.2; added a drift guard so a count can't return.
- **#8** SAC as inheritable principles: delivered (FSD-GV-7 + reference doc + Implementation Guide).
- **#10** Third-party requests, clarified: the front door is source-agnostic; a third party raises demand via the Idea Brief, the delivering team owns the gates and accountability.
- **#11** Business case output, named: the Gate 1 Outline Proposal *is* the business case (no separate document).

## v0.2.0 — 2026-06-24

- Full service lifecycle: end-of-life review and controlled retirement (**FSD-RR-7**).
- **Information-stores** layer, every register and record named, described tech-agnostically.
- Demand pipeline and retained history in **FSD-GV-4**.
- Continuity added to the Definition of Done (operating knowledge captured, not reliant on a single person).
- New-technology intake trigger and Gate 1 vendor due-diligence.
- SAC "Monitoring, alerting & incident triggers" split into **Monitoring & alerting** and **Incident profile**; SAC de-numbered (referenced by name, not by count).
- Tier model reframed into Framework (portable) and Implementation (per-team) layers.

## v0.1.0 — initial framework

- The founding Charter, the Requirements spine (Tier 1), and the five-capability model — Solution Development built in full (process + gate/acceptance forms), with one-page cards for Govern, Change & Release, Run & Restore, and Secure & Assure. Supporting layer: elevator pitch, adoption & positioning, quickstart, definitions, standards alignment, diagrams, and the CC BY 4.0 licence. (See git history for detail.)
