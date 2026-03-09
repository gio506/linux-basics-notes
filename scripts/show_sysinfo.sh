#!/usr/bin/env bash
# show_sysinfo.sh
# Usage: ./scripts/show_sysinfo.sh
# Example: ./scripts/show_sysinfo.sh

set -euo pipefail

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  echo "Usage: ./scripts/show_sysinfo.sh"
  echo "Print read-only host information for learning and diagnostics."
  exit 0
fi

echo "Hostname: $(hostname)"
echo "OS: $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "CPU model: $(awk -F: '/model name/ {gsub(/^ /, "", $2); print $2; exit}' /proc/cpuinfo)"
echo "Memory: $(free -h | awk 'NR==2 {print $3"/"$2}')"
echo "Disk (/): $(df -h / | awk 'NR==2 {print $3"/"$2" ("$5")"}')"
