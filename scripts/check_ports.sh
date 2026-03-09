#!/usr/bin/env bash
# check_ports.sh
# Usage: ./scripts/check_ports.sh
# Example: ./scripts/check_ports.sh

set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Usage: ./scripts/check_ports.sh"
  echo "List listening TCP and UDP ports using ss or netstat."
  exit 0
fi

if command -v ss >/dev/null 2>&1; then
  echo "=== TCP listening ports ==="
  ss -ltn
  echo
  echo "=== UDP listening ports ==="
  ss -lun
elif command -v netstat >/dev/null 2>&1; then
  echo "=== TCP listening ports ==="
  netstat -ltn
  echo
  echo "=== UDP listening ports ==="
  netstat -lun
else
  echo "Neither 'ss' nor 'netstat' is available on this system." >&2
  echo "Install iproute2 (ss) or net-tools (netstat), then re-run." >&2
  exit 1
fi
