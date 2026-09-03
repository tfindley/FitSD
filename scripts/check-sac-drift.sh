#!/usr/bin/env bash
#
# check-sac-drift.sh — guard against a hardcoded *count* of the Service
# Acceptance Criteria creeping back into the docs.
#
# FitSD deliberately references the SAC by NAME, never by number (the v0.2
# "de-number the SAC" decision), so the set can never drift the way GitHub
# issue #7 described. A number-word immediately before "SAC" / "criteria" /
# "criterion" is the smell this catches — e.g. "the eight SAC", "nine criteria".
#
# Run:   bash scripts/check-sac-drift.sh
# Exit:  0 = clean, 1 = a count was found (fix it: reference the criteria by name).
#
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

# A count is a spelled-out number-word or a digit run...
num='(one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|[0-9]+)'
# ...immediately followed by the SAC / criteria vocabulary.
target='(sac|acceptance criteri|criteri(on|a))'
pattern="\\b${num}[[:space:]]+${target}"

# validation/ holds run evidence (role-played records and findings) that may
# legitimately quote a count while reporting on the standard; it is not
# governed prose, so it sits outside this guard.
hits="$(grep -rInE --include='*.md' \
  --exclude-dir='node_modules' \
  --exclude-dir='.git' \
  --exclude-dir='dist' \
  --exclude-dir='validation' \
  "$pattern" "$root" || true)"

if [[ -n "$hits" ]]; then
  echo "✗ SAC drift check FAILED — a count appears before SAC/criteria."
  echo "  FitSD references the criteria by name, never by number. Offending lines:"
  echo
  echo "$hits"
  exit 1
fi

echo "✓ SAC drift check passed — no hardcoded SAC counts found."
