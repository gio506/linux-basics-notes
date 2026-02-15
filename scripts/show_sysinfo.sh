#!/usr/bin/env bash
set -euo pipefail

# show_sysinfo.sh
# Safe system information snapshot for learning and troubleshooting.
# Usage: ./scripts/show_sysinfo.sh
#
# Example output:
# Hostname: devbox
# Kernel: Linux 6.8.0-31-generic
# Uptime: up 2 hours, 10 minutes
# CPU model: Intel(R) Core(TM) i7-8650U CPU @ 1.90GHz
# Memory: 15Gi total, 7.2Gi used, 6.8Gi free

printf 'Hostname: %s\n' "$(hostname)"
printf 'Kernel: %s\n' "$(uname -sr)"
printf 'Uptime: %s\n' "$(uptime -p)"

cpu_model='unknown'
if command -v lscpu >/dev/null 2>&1; then
  cpu_model="$(lscpu | awk -F: '/Model name/ {gsub(/^ +/, "", $2); print $2; exit}')"
fi
printf 'CPU model: %s\n' "$cpu_model"

if command -v free >/dev/null 2>&1; then
  mem_line="$(free -h | awk '/Mem:/ {print $2 " total, " $3 " used, " $4 " free"}')"
  printf 'Memory: %s\n' "$mem_line"
fi
