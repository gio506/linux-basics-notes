#!/usr/bin/env bash
# check_ports.sh
# Show listening TCP and UDP ports in a safe read-only way.
# Usage: ./scripts/check_ports.sh
# Example output:
#   === TCP listening ports ===
#   LISTEN 0 128 0.0.0.0:22 0.0.0.0:*
#   === UDP listening ports ===
#   UNCONN 0 0 127.0.0.53:53 0.0.0.0:*

set -euo pipefail

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
  echo "Install iproute2 (for ss) or net-tools (for netstat), then re-run." >&2
fi
