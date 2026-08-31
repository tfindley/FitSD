# CertHub — User Guide for Product Teams

**Fernbrook Software — internal.** Confluence `PLAT` → Service Docs → CertHub. *This is the page to link in your team's pipeline docs.*

| | |
|---|---|
| **Audience** | Product-team engineers and leads |
| **Owner** | Priya Chandra (Platform) · questions → `#platform-help` |
| **Date** | 2026-11-19 |

## 1. What CertHub gives you

- **Public TLS certs** (your `*.fernbrook.io` / product domains) — issued and **auto-renewed**, no expiry spreadsheets, ever.
- **Internal service-to-service certs** (mTLS) — 24-hour certs, rotated automatically.
- **An inventory** — every cert on your domains, with expiry alerting, at `https://certhub.internal.fernbrook.io` (Okta login → your team's view).

You do **not** get: raw private keys from us (your cluster generates them and they never leave your namespace), certs for customer-managed domains, or code-signing.

## 2. Quickstart — you probably just need this

Your cluster already runs cert-manager. Once your team/namespace is onboarded (§3), a cert is one resource:

**Public cert (Let's Encrypt):**

```yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: api-tls
  namespace: my-service
spec:
  secretName: api-tls
  dnsNames: ["api.myproduct.fernbrook.io"]
  issuerRef:
    kind: ClusterIssuer
    name: letsencrypt-prod
```

**Internal (mTLS) cert:** same thing with `name: certhub-internal` and your internal DNS name. Renewal is automatic (public at 60 days; internal every ~16 h). Most Ingress annotations (`cert-manager.io/cluster-issuer: letsencrypt-prod`) work too.

**OV certs** use `name: sectigo-ov` (checkout and anyone with compliance needs). **EV** is manual — raise the JSM request and we drive it with the vendor.

## 3. Onboarding a new domain or namespace (once per team/domain)

1. Raise **JSM → CertHub → Domain/namespace onboarding** with: the domain(s), the cluster/namespace, and your team name.
2. Platform verifies ownership and approves in the portal. A brand-new zone needs a small DNS change on our side — allow **2 working days**; a new namespace on an existing domain is usually same-day.
3. You'll get: membership of `certhub-team-<yourteam>` in Okta (portal access) and issuance rights scoped to your domains/namespaces. You can only request certs for what your team owns — a `403 namespace not onboarded` means this step was skipped.

## 4. Migrating off your own renewal automation

If your team still runs its own Let's Encrypt scripts/certbot cron/manual purchases: there's a scheduled migration slot for every team (Marcus has the schedule; all teams done by 2026-12-18). Migration = swap your issuer to the ClusterIssuers above + we decommission your old automation as a recorded change. Please don't run both against the same domain — you'll hit rate limits and the inventory will nag you about the duplicates.

## 5. Common errors

| What you see | What it means | What to do |
|---|---|---|
| `Certificate` stuck `Ready: False`, order `pending` >10 min | DNS-01 validation still propagating, or challenge record blocked | Wait 10 min; then `kubectl describe challenge -n <ns>` and check the portal order view — it shows the failing step in plain English. Still stuck → raise *Certificate issue or failure* (include the order URL). |
| `403 namespace not onboarded` | Your namespace isn't mapped to your team | §3. |
| `urn:ietf:params:acme:error:rateLimited` | Let's Encrypt rate limit — usually duplicate certs (old automation still running?) | Check §4; the portal's posture page shows duplicate issuance sources. Ask us to switch that domain to `sectigo-ov` if urgent. |
| `CAA record forbids issuance` | Your domain's CAA doesn't allow the CA | Raise onboarding request — we manage CAA centrally, takes minutes. |
| Portal says a cert you own expires soon and “no renewal in flight” | Your cert isn't CertHub-managed yet (we found it by scanning) | That alert is real — renew it your current way *and* book migration (§4). |
| Portal login loops | Okta group missing | §3 step 3, or `#platform-help`. |

## 6. Rules of the road

- **Don't** create your own `Issuer`/`ClusterIssuer` pointing at public CAs — that's the sprawl that caused INC-4211. The three ClusterIssuers cover everything; if they don't, tell us, don't route around us.
- **Don't** copy cert secrets between namespaces or clusters — request a cert where it's used.
- **Do** put an owner label on anything unusual: the inventory alert for an expiring cert goes to the **owning team** first.
- Staging works identically against the dev instance (`ca.dev.internal.fernbrook.io`, Let's Encrypt staging) — your staging clusters already have the issuers.

## 7. Support

| Need | Route |
|---|---|
| Onboarding / new domain | JSM → *CertHub — Domain/namespace onboarding* |
| Issuance failing, errors | JSM → *CertHub — Certificate issue or failure* (Rafi triages 09:00–17:30 Mon–Fri) |
| Deploy blocked for ≥1 team, no workaround | That's a Sev2 — say so on the ticket; out of hours Sev1s page the Platform rota |
| Questions | `#platform-help` |
