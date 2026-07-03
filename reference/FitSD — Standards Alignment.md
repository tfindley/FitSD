---
title: FitSD — Standards Alignment
framework: FitSD
document: Standards Alignment
tier: 0
version: 0.2
status: draft
owner: Tristan Findley
date: 2026-06-23
tags:
  - fitsd
  - reference
  - standards
  - fitsm
  - itil
  - iso27001
  - nis2
  - usm
---

# FitSD — Standards Alignment

Reference mapping of FitSD to the established frameworks and standards it distils from or supports: **FitSM**, **ITIL 4**, **USM**, **ISO/IEC 27001:2022**, and the **NIS2 Directive**.

> **Purpose.** FitSD is an opinionated *distillation* of mainstream service-management and security practice for small teams. It does not conflict with any of these standards; it maps onto sections of each. This document records those mappings so adopters can (a) see FitSD is well-grounded, (b) use it as an on-ramp toward ISO 27001 / NIS2, and (c) reuse the tables as audit evidence.
>
> **Caveat.** Mappings are indicative, not certified. Clause and control numbers are correct as of the standard versions cited in §7. Always verify against the current authoritative text before relying on this for compliance.

## 1. Summary

| Standard               | Type                                    | FitSD's relationship                                                                          |
| ---------------------- | --------------------------------------- | ------------------------------------------------------------------------------------------------ |
| **FitSM**              | Lightweight ITSM standard (free, ITEMO) | Closest cousin; FitSD is a re-grouping/further distillation. No conflict.                     |
| **ITIL 4**             | Best-practice framework                 | FitSD is a small-team subset of ITIL practices. No conflict.                                  |
| **USM**                | Service-management *method*             | Complementary; different organising axis.                                                        |
| **ISO/IEC 27001:2022** | Certifiable ISMS standard               | FitSD is a credible on-ramp (stage 0–1), strong on Annex A, light on the management clauses.  |
| **NIS2 Directive**     | EU law (risk-management obligations)    | FitSD operationalises several Article 21(2) measures; signature strength on secure-by-design. |

## 2. FitSM

FitSD re-groups FitSM's 14 processes (PR1–PR14) and General Requirements (GR1–GR9) into its lifecycle-shaped capabilities. Everything done under FitSD is FitSM-conformant-shaped.

| FitSD capability              | FitSM process / requirement                                                                            |
| -------------------------------- | ------------------------------------------------------------------------------------------------------ |
| Govern (FSD-GV)                   | GR1–GR9 (management commitment, documentation, scope, PDCA) + PR14 Continual Service Improvement       |
| **Solution Development (FSD-SD)** | PR1 Service Portfolio Mgmt + PR13 Release & Deployment Mgmt (+ a *design* step FitSM does not isolate) |
| Change & release (FSD-CH)         | PR12 Change Mgmt + PR13 Release & Deployment Mgmt                                                      |
| Run & restore (FSD-RR)            | PR9 Incident & Service Request, PR10 Problem, PR4 Availability & Continuity, PR5 Capacity              |
| Secure & assure (FSD-SA)          | PR6 Information Security Mgmt, PR4 Continuity                                                           |
| Supplier & supply chain (FSD-SC)  | PR8 Supplier Relationship Mgmt                                                                          |

**Only divergence:** FitSM has no single intake/Service-Design process; FitSD consolidates portfolio decision + design + release-readiness into one Solution Development capability with the Service Acceptance Criteria (SAC). A FitSM assessor would see FitSD's SD records satisfying PR1 and PR13 together.

## 3. ITIL 4

Pure subset relationship. FitSD maps onto ITIL 4 practices and Service Value Chain (SVC) activities.

| FitSD                             | ITIL 4                                                                                                                                                                                                 |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| FSD-SD (intake → design → acceptance) | SVC *Design & transition*, *Obtain/build*; practices *Service design*, *Service validation & testing* (= the SAC), *Release management*, *Change enablement*, *Service catalogue/portfolio management* |
| FSD-CH                                | *Change enablement*, *Deployment management*, *Release management*                                                                                                                                     |
| FSD-RR                                | *Incident*, *Problem*, *Monitoring & event*, *Availability*, *Capacity & performance* management                                                                                                       |
| FSD-SA                                | *Information security management*, *Risk management*, *Service continuity management*                                                                                                                  |
| FSD-GV                                | SVS governance + *Continual improvement* + *Service level management*                                                                                                                                  |
| FSD-SC                                | *Supplier management*                                                                                                                                                                                  |

## 4. USM (Unified Service Management)

USM is a *method* (how to architect a management system) built on five fixed processes — **Agree, Change, Recover, Operate, Improve**. FitSD is a *framework* (what to implement). They are complementary but organise on **different axes**: USM groups by activity type; FitSD by lifecycle stage. Adopting USM strictly would re-slice FitSD's capability groups into USM's five processes (e.g. FSD-RR splits across USM's *Recover* + *Operate*). They do not conflict in substance, but you would not run both organising schemes at once.

## 5. ISO/IEC 27001:2022 — on-ramp

FitSD can be a genuine starting point toward ISO/IEC 27001:2022, covering one of two layers well.

### 5.1 Management clauses (4–10) — partial (the gap)

| ISO 27001 clause                                      | FitSD coverage                                          |
| ----------------------------------------------------- | ---------------------------------------------------------- |
| 4.3 Scope of the ISMS                                 | FSD-GV (scope defined) ✅                                   |
| 5 Leadership & roles                                  | FSD-GV (roles, accountable owner) ✅                        |
| 7.5 Documented information                            | FSD-GV (document control) ✅                                |
| 10 Improvement                                        | FSD-GV (PDCA, continual improvement) ✅                     |
| 6.1.2 / 6.1.3 Risk assessment & treatment methodology | Partial — FSD-SA-1 register, but no formal methodology ⚠️ |
| 6.1.3(d) Statement of Applicability                   | Not covered ❌                                             |
| 9.2 Internal audit                                    | Not covered ❌                                             |
| 9.3 Management review                                 | Partial (review cadence) ⚠️                              |

The gap is the certification apparatus: a formal risk methodology, the SoA, internal audit, and management review.

### 5.2 Annex A controls (93 controls, 4 themes) — strong

FitSD's Service Acceptance Criteria (defined in *FitSD — Service Acceptance Criteria*) and FSD-SA operationalise specific controls and produce the evidence auditors ask for.

| FitSD element                              | ISO 27001:2022 Annex A control                                                       |
| --------------------------------------------- | ------------------------------------------------------------------------------------ |
| SAC: Backup (tested restore)                | A.8.13 Information backup                                                            |
| SAC: Monitoring & alerting                  | A.8.15 Logging, A.8.16 Monitoring activities                                         |
| Gate 2 secure-by-design intake                | A.8.25–A.8.31 Secure development lifecycle (incl. A.8.31 separation of environments) |
| FSD-CH Change & release                        | A.8.32 Change management                                                             |
| SAC: Access (least privilege, JML) / FSD-SA-2 | A.5.15, A.5.18, A.8.2, A.8.3                                                         |
| SAC: Availability / DR                      | A.5.29, A.5.30 (ICT readiness for continuity), A.8.14 Redundancy                     |
| FSD-SA-1 Risk register                         | Clause 6.1 + A.5.x organisational controls                                           |
| SAC: Supportability, continuity & training  | A.6.3 Awareness & training                                                           |
| FSD-SC Supplier & supply chain                 | A.5.19–A.5.22 Supplier relationships                                                 |

**Framing:** FitSD provides the operational muscle memory and evidence artefacts (Service Acceptance Records, risk register, change records). The journey to certification adds the ISMS management layer on top — FitSD is ISO 27001 "stage 0–1". Controlled retirement (FSD-RR-7) also maps to A.8.10 information deletion and A.5.11 return of assets, and continuity (FSD-SD-5) reinforces A.6.3.

## 6. NIS2 Directive — what FitSD solves / complements / misses

Mapping FitSD to **NIS2 Article 21(2)** minimum measures. (NIS2 is a *law* — outcome obligations — not a management-system standard; its measures map heavily onto ISO 27001 Annex A, which is the usual way to demonstrate them.)

| Art. 21(2) measure                                                              | FitSD                                                      | Verdict                             |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------- |
| (a) Risk analysis & infosec policies                                            | FSD-SA-1, FSD-GV                                                | ✅ Solves                           |
| (b) Incident handling                                                           | FSD-RR-1/2/3 + **SAC Incident profile** (FSD-RR-6)                                                   | ✅ Solves                           |
| (c) Business continuity — backup, DR, crisis                                    | SAC Backup (tested), SAC Availability, FSD-SA-3                       | ✅ Strong                           |
| (d) Supply chain security                                                       | FSD-SC-1…4 — supplier register, pre-adoption assessment, agreements, review & exit | ✅ Solves (conditional capability)  |
| (e) Security in acquisition, development & maintenance + vulnerability handling | FSD-SD intake + SAC Security (secure-by-design, patch path) | ✅ Signature strength               |
| (f) Policies to assess effectiveness                                            | FSD-GV PDCA, maturity self-check, metrics                      | ✅ Solves                           |
| (g) Cyber hygiene & training                                                    | SAC Supportability/handover + **continuity** (FSD-SD-5)          | 🟡 Partial (improving)             |
| (h) Cryptography / encryption                                                   | —                                                             | ❌ Gap (control-level)              |
| (i) HR security, access control, asset mgmt                                     | FSD-SA-2 (access); register (assets)                           | 🟡 Partial (HR security missing)   |
| (j) MFA / secure comms                                                          | —                                                             | ❌ Gap                              |

Also: **Article 20** (management-body accountability) aligns with FitSD's single-accountable-owner + Approver model; **Article 23** (24-hour / 72-hour / 1-month incident *reporting* timelines) is a gap — FitSD has incident *management*, not the statutory reporting cadence.

**One line:** FitSD's distinctive NIS2 contribution is measure **(e) secure-by-design at intake**, plus (a), (b), (c) — and (d) supply chain via FSD-SC. Gaps to close: (h) cryptography, (j) MFA, and Article 23 reporting.

## 7. Sources

Web sources retrieved June 2026 (secondary references — verify against primary text):

- ISO 27001 Annex A controls reference — https://hightable.io/iso-27001-annex-a-controls-reference-guide/
- ISO 27001:2022 Annex A controls (Advisera) — https://advisera.com/iso27001/annex-a-controls/
- ISO 27001 Annex A overview (DataGuard) — https://www.dataguard.com/iso-27001/annex-a/
- NIS2 Directive, Article 21 (full text mirror) — https://www.nis-2-directive.com/NIS_2_Directive_Article_21.html
- NIS2 Article 21 — all 10 measures explained (GloCert) — https://www.glocertinternational.com/resources/guides/nis2-article-21-risk-management-measures-explained/
- ENISA technical implementation guidance on cybersecurity risk-management measures (2025) — https://www.enisa.europa.eu/sites/default/files/2025-06/ENISA_Technical_implementation_guidance_on_cybersecurity_risk_management_measures_version_1.0.pdf
- Comparing ITSM frameworks: ITIL, FitSM, alternatives (ITU Online) — https://www.ituonline.com/blogs/comparing-itsm-frameworks-itil-v4-v5-and-alternative-approaches/
- USM versus ITIL, FitSM, COBIT — key differences (Jan van Bon) — https://www.linkedin.com/pulse/usm-versus-itil-fitsm-cobit-key-differences-jan-van-bon
- Beyond ITIL — alternative ITSM frameworks (Seibert Group) — https://seibert.group/blog/en/itil-itsm-frameworks/
- ITSM frameworks overview (Giva) — https://www.givainc.com/blog/itsm-frameworks/
- IT service management (Wikipedia) — https://en.wikipedia.org/wiki/IT_service_management

Primary / canonical standards (authoritative; consult directly):

- **NIS2** — Directive (EU) 2022/2555, EUR-Lex CELEX:32022L2555 — https://eur-lex.europa.eu/legal-content/EN/TXT/HTML/?uri=CELEX:32022L2555
- **ISO/IEC 27001:2022** — Information security management systems — Requirements. Published by ISO (iso.org); standard text is paywalled.
- **FitSM** — published free by ITEMO (the FitSM standard family, parts 0–6). Retrieve the current release from the official ITEMO / FitSM site.
- **ITIL 4** — published by PeopleCert / Axelos.
- **USM** — the Unified Service Management method (USM Foundation / Jan van Bon).
