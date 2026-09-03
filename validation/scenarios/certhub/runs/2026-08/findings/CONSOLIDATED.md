# Consolidated findings register

~110 findings from 12 role runs (S0–S8), consolidated by theme. Individual files carry the
full entries; this is the classification. **Applied** = fixed in keystone on `readability`
(commits 8bbe8ee, db7da1b, 2c88669, d5c977b). **Candidate** = drafted in
`NORMATIVE-CANDIDATES.md`, awaiting the maintainer's decision. **Deferred** = recorded in
keystone's BACKLOG/Roadmap with evidence. **By design** = defensible scope choice, recorded.

## Themes (multiple independent role hits)

| # | Theme | Hits (roles) | Disposition |
|---|---|---|---|
| T1 | **Conditions have no machinery** — every real decision was "with conditions"; no field, store, tracking or escalation existed; 3 of 11 acceptance conditions silently died (one → the 02:07 page, one → the un-drilled successor) | S2b-7, S3a-8, S4-9/10, S5C-1/4, S6-4, S7-4, S8-4 (6 roles) | **Applied** (form fields, FSD-PRO "accepted with conditions" + tracking language) + **Candidate N3** (the tracking *shall*) |
| T2 | **Continuity proven once, never re-tested; no owner-transition trigger** — the standard re-tests backups, never people; nothing fires between "owner named" (GV-2) and "leaver's access revoked" (SA-2) | S4-6, S7-2/3/5/12/13, S8-5/6 (3 roles, incl. the successor's "one change" verdict) | **Applied** (SAC decay note, cross-training sufficiency prompt) + **Candidate N1** (owner-transition shall — the headline) |
| T3 | **No service levels, no reporting to customers** — only normative SLA mention is withdrawing them at retirement; a customer-audit request bounced through four people | S5-SDM-1/4, S6-5/6, S5-PM-4, S3b-5, S8-2 (4 roles) | **Applied** (support-model publication prompts) + **Candidate N2** (the BACKLOG's own SLM/SR thin shalls, promoted) |
| T4 | **Decision rationale has no surviving home** — RAIDD dies at delivery; the standing decision log existed only because an approver invented DEC7 | S3a-1/2, S4-7, S7-1 (3 roles) | **Applied** (RAIDD transfer note, per-service-docs store incl. "HLD carrying decisions", evaluation-evidence home) + **Candidate N5** (SAC Documentation row wording) |
| T5 | **What a signature commits is stated nowhere** — three approvers independently invented the answer | S2b-1/2, S3b-1, S5C-5 (2 roles, 3 gates) | **Applied** (commitment statements per gate in FSD-PRO + form preambles) |
| T6 | **Role gaps**: sponsor, Operator-in-process, first line, design authority, product/value owner, review independence, approver risk tiers | S0-2/3, S1-3, S2b-3, S3a-3/4, S5-SDM-3, S5-SD-1, S5-PM-1, S8-7 (7 roles) | **Applied** (Operator defined; escalation-line + alternate-approver stand-up prompts; ratify-above-author) + **Deferred** (5 new calls on the Tier 3 roles guidepost — the standard's own chosen vehicle) |
| T7 | **Documents: existence mandated, content not; SOP circular; docs homeless; operator-executability unasked; bespoke-code maintainability unasked** | S4-1/2/3, S5-SD-4/5, S7-8 (3 roles) | **Applied** (SOP fixed; per-service-docs store; dated operator acceptance) + **Deferred** (content-guidance appendix → BACKLOG, to ride with the v0.4 worked example) |
| T8 | **Portfolio/WIP promise has no mechanism at the gate** | S2b-4, S3b-2, S5-PM-2/3 (3 roles) | **Applied** (decide-with-register-open; enhancement queue named in Information Stores) |
| T9 | **Ongoing people-cost invisible** — run-cost read as cash everywhere | S3b-3, S4-8 (2 roles) | **Applied** (operating-effort line on FRM-02 §7.1; FRM-03 cost row "cash and operating effort") |
| T10 | **GV-5 review: no per-service scope, no inputs, no independence, no missed-review tripwire** — sat behind the entire failure curve, then failed silently itself | S8-1/2/3/7, S3b-5 (2 roles) | **Applied** (Implementation Guide step 7 agenda + hold-to-date) + **Candidate N4** (note-level per-service scope) |

## Smaller items — all applied

Status enum vs §8 outcomes; per-dependency §6 due diligence; related-demands-may-share-a-brief;
forms point at Definitions; Solution Owner confirmed at sign-off; raise-the-risk-record hint;
Quickstart timing honesty; design-principles-or-security-baseline reword; ratified-with-this-
decision row; T-shirt anchors; adoption record named; no-central-severity-scheme line;
monitoring/support-hours coherence prompt; Owner-column semantics; cite-don't-copy;
FSD-RR-7 "not retire — routed to the front door" phrasing → *left for the maintainer* (edits
the Requirements Note column; see NORMATIVE-CANDIDATES.md postscript).

## By design (defensible, now recorded)

- No CRM / customer-satisfaction measurement (declared non-goal; PM findings accept the
  boundary, the miss is the *reporting* half → N2).
- Verbal per-team promises, operational folklore — no framework captures these (S7's
  "just life" column).
- The build itself hands to FSD-CH — the seam held (S4-5, praise).

## The praise column (what demonstrably worked)

The SAC baseline mechanism (5 roles; "the most valuable hour of the workshop", "made the
decision near-mechanical"); FSD-RR-6 incident profile (the desk's best tool — two mechanical
severity calls, a pre-outage Sev2); the tested-restore and end-to-end-alert evidence bars
(each caught a real defect pre-live); FSD-SC-4's exit-path question (paid out in full — the
2027 supplier exit was a config swap because 2026's due diligence forced DEC2); the gate
chain (decidable, defensible, "heard and funded" delivered); the four Gate 1 outcomes + PoC
box; the driver rule protecting risk cases; §4 cross-process prompts; the builder rule; the
scope test; "don't design anything yet"; Definitions; the seven-step stand-up; the
"material change" review arm; and — the succession verdict — a record set that carried a
no-handover takeover "far better than any real-world inheritance", credited to the standard.
