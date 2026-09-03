# Fernbrook Software

> **TL;DR** — A fictional ~150-person B2B SaaS company, used as the setting for validation
> runs. Non-normative. This profile is **reusable**: any scenario can be set here, and it is
> deliberately version-neutral so the same organisation can be run against any version of the
> standard. Which version a given run tested is recorded in that run's `RUN.md`.

## The company

**Fernbrook Software** — a fictional ~150-person B2B SaaS company selling a logistics
analytics platform. Engineering is ~60 people across eight product teams, plus a
5-person **Platform & Infrastructure team** that runs shared services (CI/CD, Kubernetes,
observability, DNS, artefact registry).

Fernbrook adopted **FitSD** for the Platform team's intake and service management three
months before the scenario opens, prompted by two years of tool sprawl and a run of "who
owns this?" incidents. The adoption pack it produced — scope, roles, SAC baseline, the
net-new line — is an output of Stage 0 of a run, not a property of the company: see the
run's `artifacts/S0-adoption-pack.md`.

## The people (all fictional)

These are the company's staff and their day jobs. **Which FitSD hat each one wears is a
property of the scenario, not of the company** — a different scenario at Fernbrook may cast
the same people differently. See the scenario's casting table.

| Name | Role in company |
|---|---|
| **Priya Chandra** | Platform engineer (Engineer 1) |
| **Marcus Webb** | Platform team manager |
| **Elena Vasquez** | Lead / principal architect (org-wide) |
| **Dana Okafor** | CTO |
| **Sam Reyes** | Product manager, developer-experience |
| **Owen Gallagher** | Service delivery manager |
| **Rafi Osman** | Service desk analyst (tier 1/2) |
| **Jordan Blake** | Platform engineer (Engineer 2) |

## Why this shape

Fernbrook is sized to be the hard case for FitSD's target audience: big enough to have real
internal customers, a service desk and an executive approver, small enough that one person
owns a service and their leaving is an existential risk to it. A profile much smaller loses
the approval and support seats; much larger and a dedicated service-management function would
absorb the work FitSD is trying to make legible.
