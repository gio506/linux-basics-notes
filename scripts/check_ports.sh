#!/usr/bin/env bash
set -euo pipefail

# check_ports.sh
# Display listening TCP/UDP ports and owning process details.
# Usage: ./scripts/check_ports.sh
#
# Example output:
# Active listeners (ss):
# tcp LISTEN 0 4096 0.0.0.0:22 0.0.0.0:* users:(("sshd",pid=722,fd=3))
# udp UNCONN 0 0 127.0.0.53:53 0.0.0.0:* users:(("systemd-resolve",pid=611,fd=12))

if command -v ss >/dev/null 2>&1; then
  echo 'Active listeners (ss):'
  ss -tulpen
elif command -v netstat >/dev/null 2>&1; then
  echo 'Active listeners (netstat):'
  netstat -tulpen
elif command -v lsof >/dev/null 2>&1; then
  echo 'Active listeners (lsof):'
  lsof -nP -iTCP -sTCP:LISTEN
else
  echo 'Error: no port inspection tool found (ss/netstat/lsof).' >&2
  exit 1
fi
