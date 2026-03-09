#!/usr/bin/env bash
# vm_preflight.sh
# Usage: ./scripts/vm_preflight.sh [--strict]
# Example: ./scripts/vm_preflight.sh --strict

set -euo pipefail

STRICT=0
status=0

[[ "${1:-}" == "--strict" ]] && STRICT=1
[[ "${1:-}" == "-h" || "${1:-}" == "--help" ]] && {
  echo "Usage: ./scripts/vm_preflight.sh [--strict]"
  echo "Validate common VM prerequisites and tooling used by this repository."
  exit 0
}

check_cmd() {
  local cmd="$1"
  local required="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[OK] $cmd"
  else
    echo "[MISS] $cmd"
    if [[ "$required" == "required" ]]; then
      status=1
    fi
  fi
}

echo "Running VM preflight checks..."
check_cmd bash required
check_cmd find required
check_cmd awk required
check_cmd sed required
check_cmd grep required
check_cmd sort required
check_cmd xargs required
check_cmd ss optional
check_cmd netstat optional
check_cmd systemctl optional
check_cmd journalctl optional
check_cmd shellcheck optional

if [[ "$STRICT" -eq 1 ]]; then
  check_cmd ss required
fi

if [[ "$status" -eq 0 ]]; then
  echo "Preflight passed."
else
  echo "Preflight failed: missing required commands." >&2
fi

exit "$status"
