# Security

## Reporting a vulnerability

Please report security issues — in the FitSD website or this repository — via the
[GitHub Security Advisories](https://github.com/tfindley/keystone/security/advisories/new)
page, or the [issue tracker](https://github.com/tfindley/keystone/issues) for
non-sensitive reports.

A machine-readable contact is published at
<https://fitsd.tfindley.dev/.well-known/security.txt> (RFC 9116).

## Scope

This repository holds the FitSD standard (Markdown). The website that publishes it is built from a
separate repository ([`tfindley/fitsd-web`](https://github.com/tfindley/fitsd-web)) — a static build
served by nginx behind Traefik; its security posture — headers, Content-Security-Policy, supply chain
and hosting — is documented and published at <https://fitsd.tfindley.dev/compliance/security/>.
