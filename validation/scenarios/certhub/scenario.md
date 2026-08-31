# Scenario — "CertHub" at Fernbrook Software

**Purpose (out of character).** A fitness-for-purpose stress-test of the FitSD standard.
A fictional team runs a real-shaped project through every FitSD phase; each participant
logs where the standard helped, where it was silent, and where it got in the way.
Everything below is invented and organisation-neutral. Run per `validation/PROTOCOL.md`
with the briefs in `validation/agents/`.

## The company

**Fernbrook Software** — a fictional ~150-person B2B SaaS company selling a logistics
analytics platform. Engineering is ~60 people across eight product teams, plus a
5-person **Platform & Infrastructure team** that runs shared services (CI/CD, Kubernetes,
observability, DNS, artefact registry).

Fernbrook adopted **FitSD v0.3** three months ago for the Platform team's intake and
service management, prompted by two years of tool sprawl and a run of "who owns this?"
incidents. The adoption pack (scope, roles, SAC baseline, net-new line) is in
`artifacts/S0-adoption-pack.md` once Stage 0 has run.

## The people (all fictional)

| Name | Role in company | FitSD hat(s) |
|---|---|---|
| **Priya Chandra** | Platform engineer (Engineer 1) | Solution Owner for CertHub; Contributor |
| **Marcus Webb** | Platform team manager | Approver (Gate 1, Service Acceptance); Management System Owner |
| **Elena Vasquez** | Lead / principal architect (org-wide) | Consulted SME (architecture); leads the Gate 2 design |
| **Dana Okafor** | CTO | Approver at Gate 2 (funds the build); governance |
| **Sam Reyes** | Product manager, developer-experience | Asked to own CertHub as a *product* long term |
| **Owen Gallagher** | Service delivery manager | Owns the support model conversation; operator side of acceptance |
| **Rafi Osman** | Service desk analyst (tier 1/2) | Front-line support for internal services |
| **Jordan Blake** | Platform engineer (Engineer 2) | Joins later; inherits CertHub after Priya leaves |

## The trigger

Three weeks ago the TLS certificate on Fernbrook's **checkout API** expired at 02:10 on a
Saturday. Renewals are ad hoc: some teams use Let's Encrypt with per-team automation,
some buy annual certs and track expiry in a spreadsheet, two wildcard certs are "owned"
by people who left last year. The outage lasted 4 hours; an enterprise customer escalated
to the CTO. The post-incident review's top action: **"centralise and automate certificate
management."** Priya volunteered to propose a solution.

## The proposed solution (what Priya has in mind — Stage 1 refines it)

**CertHub**: an internal self-service certificate service for all Fernbrook teams —

- issues and auto-renews public TLS certs via ACME (Let's Encrypt / a paid CA account
  for EV needs);
- runs an internal CA for service-to-service certs (candidate backends: smallstep
  `step-ca`, or HashiCorp Vault's PKI engine — a genuine option decision);
- keeps a certificate inventory with expiry monitoring and alerting;
- exposes a small self-service portal + API used by the eight product teams.

Internal customers are real: product teams will *depend* on CertHub in their deploy
pipelines, and will file support tickets when issuance fails. There are third-party
dependencies (the CA software, the public CA account) and an obvious "what if the person
who built it leaves?" risk. That is the point.

## Stage hooks (the orchestrator feeds each to its stage only)

- **Timeline:** adoption workshop 2026-06-05 · Idea Brief 2026-08-10 · Gate 1 decision
  ~2026-08-19 · PoC week of 2026-08-24 · Gate 2 submit 2026-09-04, decision 2026-09-08 ·
  build Sept–Nov · acceptance submitted 2026-11-20, decided 2026-11-27 · consumer
  migrations from 2026-12-18 · live-operation stage February 2027 · succession August
  2027 · retro 2027-09-01.
- **S4 build events:** one milestone slips a week (DNS-01 delegation fights the
  registrar); the estate scanner finds 212 certificates, 31 unknown to anyone; the first
  test restore **fails** (inconsistent CA datastore) and the backup scheme is redesigned
  before a passing re-test.
- **S6 state (Feb 2027, ~10 weeks live, 6 of 8 teams migrated):** acceptance conditions
  dated ≤ 2026-12-18 were delivered (desk access pack, tier-1 lanes, escalation
  addendum); the later ones (canned comms, ticket taxonomy, triage-guide regime)
  slipped and remain open. **Tickets:** (1) Friday 17:40 — a team's release is stuck,
  `acme: authorization failed` on a new hostname, their deploy freeze starts at 18:00;
  what response are they entitled to, and where does it say so? (2) Tuesday 02:07 — the
  7-day expiry alert fires for a legacy cert that is one of the "unknown owner" set from
  acceptance; who is woken, per what document? (3) Wednesday 10:00 — a consuming team's
  account manager forwards an enterprise customer's audit request: "your SLA for the
  certificate service and evidence of DR testing", due Friday.
- **S7 succession (Aug 2027):** Priya resigned in May 2027, last day 2027-06-12, final
  weeks consumed by an unrelated migration — no CertHub handover; the deputy key-ceremony
  drill (an open acceptance condition) never ran; Jordan, named deputy in Nov 2026, never
  worked on the internals. Forcing event, 2027-08-11: smallstep announces (fictionally)
  the open-source `step-ca` edition stops receiving security patches in 12 months;
  meanwhile three teams press for SSH-certificate support and a second region.
- **S8 (2027-09-01):** an extraordinary review triggered by three stacked events — the
  ownership transfer, the pending CertHub 2.0 Gate 1, and an executive condition that the
  service be a named line at the (missed) June 2027 annual review.

## Ground rules for every participant

1. **The standard is what's in `keystone/`.** Use only what FitSD actually provides. If
   you need something it doesn't provide (a template, a rule, a role, a number), do what a
   real team does — make a sensible local call and proceed — but **log it as a finding**.
2. **Stay in character in artifacts; step out of character in findings.** Artifacts read
   like real records; findings read like a reviewer's notes.
3. **Artifacts are the only shared memory.** Later participants see the artifact files,
   never your reasoning. Write artifacts complete enough to stand alone.
4. British English. Keep artifacts concise and realistic — a real team's paperwork, not
   an essay.
