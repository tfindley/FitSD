---
title: FitSD — Diagrams
framework: FitSD
document: Diagrams
type: reference (non-normative)
version: 0.3
status: draft
owner: Tristan Findley
date: 2026-08-31
tags:
  - fitsd
  - diagrams
  - mermaid
---

# FitSD — Diagrams

> **TL;DR** — Mermaid source for the framework's process and structure diagrams. They render natively on GitHub/GitLab and in Obsidian, and are embedded in the documents noted per diagram — when a diagram changes, update the embedded copy in the same edit, or the two drift.

---

## 1. Solution Development — gate flow

*Embedded in `capabilities/solution-development/FSD-PRO` §4. The flagship process: demand in, product out, two decision gates and a service-acceptance close-out.*

```mermaid
flowchart LR
    Demand["Demand /<br/>Idea Brief (FRM-00)"] --> G1{"Gate 1<br/>worth doing?"}
    G1 -->|reject| Rej["Rejected"]
    G1 -->|park| Park["Parked"]
    G1 -->|PoC first| PoC["Proof of<br/>Concept"]
    G1 -->|proceed| G2{"Gate 2<br/>ready to build?"}
    Rework -->|resubmit| G2
    PoC --> G2
    G2 -->|rework| Rework
    G2 -->|approved| Del["Delivery<br/>build via FSD-CH"]
    Del --> SA{"Service Acceptance<br/>proven done?"}
    SA -->|remediation| Del
    SA -->|accepted| Live["Live service<br/>register entry + owner"]
```

---

## 2. Capability model

*Embedded in `FitSD — Framework Charter` §4. Govern wraps everything; Solution Development is the front door; Secure and assure runs across the lifecycle.*

```mermaid
flowchart LR
    subgraph GV["Govern (FSD-GV): scope, roles, document control, PDCA"]
      direction LR
      D["Demand"] --> SD["Solution Development<br/>FSD-SD"]
      SD --> CH["Change and release<br/>FSD-CH"]
      CH --> RR["Run and restore<br/>FSD-RR"]
      RR --> Ret["End-of-life<br/>review"]
    end
    SD -.->|secure by design| SA["Secure and assure<br/>FSD-SA"]
    RR -.->|protect and assure| SA
    SD -.->|vendor due diligence| SC["Supplier and supply chain<br/>FSD-SC (conditional)"]
```

---

## 3. Document model — Framework and Implementation

*Embedded in `FitSD — Framework Charter` §5. Tiers 0–1 are the portable Framework; tiers 2–5 are the per-team Implementation.*

```mermaid
flowchart TB
    subgraph FW["Framework (portable)"]
      T0["Tier 0 — Charter and vocabulary"]
      T1["Tier 1 — Requirements (the spine)"]
    end
    subgraph IM["Implementation (per team)"]
      T2["Tier 2 — Capabilities"]
      T3["Tier 3 — Roles"]
      T4["Tier 4 — Templates and registers"]
      T5["Tier 5 — Maturity self-check"]
    end
    T0 --> T1
    T1 --> T2
    T1 --> T3
    T2 --> T4
    T1 --> T5
```

---

## 4. Service lifecycle (status)

*The state a solution moves through, from idea to retirement, including the end-of-life fork (renew / replace / retire). Useful for tracking any one solution's position in the pipeline.*

```mermaid
stateDiagram-v2
    [*] --> Idea
    Idea --> Gate1
    Gate1 --> Parked : park
    Gate1 --> Rejected : reject
    Gate1 --> PoC : needs PoC
    Gate1 --> Gate2 : proceed
    PoC --> Gate2
    Gate2 --> Delivery : approved
    Delivery --> Acceptance
    Acceptance --> Delivery : remediation
    Acceptance --> InService : accepted
    InService --> EOLReview : end of life
    EOLReview --> InService : renew
    EOLReview --> Idea : replace as new demand
    EOLReview --> Retired : retire
    Rejected --> [*]
    Retired --> [*]
```

## 5. Context — inputs and outputs

*Where Solution Development sits between business demand and the operational disciplines. Inputs feed the requirements; outputs feed the run-state capabilities. Note the loop: run-state learnings (e.g. a major incident, a capacity limit) become new demand.*

```mermaid
flowchart LR
    subgraph IN["Demand sources → requirements"]
      direction TB
      I1["Strategy & leadership<br/>directives, OKRs, new products"]
      I2["Customer & market<br/>requests, bids, SLAs, contracts"]
      I3["Compliance & governance<br/>regulation, audit, exceptions"]
      I4["Risk & security<br/>risk register, vuln/incident findings"]
      I5["Operational & technical<br/>EOL/EOS, capacity, tech debt, cost"]
      I6["Finance & people<br/>budget pressure, cost targets, headcount/skills"]
    end
    SD{{"Solution Development<br/>Gate 1 → Gate 2 → Service Acceptance"}}
    I1 --> SD
    I2 --> SD
    I3 --> SD
    I4 --> SD
    I5 --> SD
    I6 --> SD
    subgraph OUT["Outputs → operational disciplines"]
      direction TB
      O1["Service catalogue / portfolio<br/>live service + owner"]
      O2["Change & release — FSD-CH"]
      O3["Run & restore — FSD-RR<br/>incident, problem, patching, monitoring, availability"]
      O4["Secure & assure — FSD-SA<br/>risk, exceptions, security"]
      O5["Finance & suppliers<br/>run-cost, licensing, supplier mgmt"]
    end
    SD --> O1
    SD --> O2
    SD --> O3
    SD --> O4
    SD --> O5
    O3 -.->|"learnings become new demand"| IN
```

---

## 6. Information stores

*Embedded in `reference/FitSD — Information Stores`. The registers and records FitSD relies on, shown tech-agnostically. A "store" is a register or record set, never a named tool. Each is owned by a capability and tied to a lifecycle stage.*

```mermaid
flowchart TB
    subgraph FLOW["Lifecycle"]
      direction LR
      Demand["Demand"] --> SDv["Solution<br/>Development"] --> Livev["Live service"] --> EOLv["End of life"]
    end
    Demand -.-> DR[("Demand /<br/>pipeline register")]
    SDv -.-> GR[("Gate &<br/>acceptance records")]
    Livev -.-> SRg[("Service register<br/>/ catalogue")]
    Livev -.-> CRec[("Change records")]
    Livev -.-> IRec[("Incident records<br/>+ profiles")]
    Livev -.-> PRec[("Problem records")]
    EOLv -.-> RRec[("Retirement<br/>records")]
    subgraph CROSS["Always-on — Govern, Secure & assure, Supplier & supply chain"]
      direction LR
      RKg[("Risk register")]
      EXg[("Exceptions<br/>register")]
      DCg[("Document<br/>register")]
      BKg[("Backup &<br/>restore-test records")]
      SPg[("Supplier /<br/>dependency register")]
    end
    FLOW -.->|maintained across every stage| CROSS
```
