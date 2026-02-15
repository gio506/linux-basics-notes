#!/usr/bin/env bash
# show_sysinfo.sh
# Print basic host information safely for Linux learning.
# Usage: ./scripts/show_sysinfo.sh
# Example output:
#   Hostname: demo-vm
#   OS: Ubuntu 24.04 LTS
#   Kernel: 6.8.0-31-generic
#   Uptime: up 2 hours, 10 minutes
#   CPU model: Intel(R) Xeon(R)
#   Memory: 1.2Gi/3.8Gi
#   Disk (/): 12G/40G (31%)

set -euo pipefail

echo "Hostname: $(hostname)"
echo "OS: $(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "CPU model: $(awk -F: '/model name/ {gsub(/^ /, "", $2); print $2; exit}' /proc/cpuinfo)"
echo "Memory: $(free -h | awk 'NR==2 {print $3"/"$2}')"
echo "Disk (/): $(df -h / | awk 'NR==2 {print $3"/"$2" ("$5")"}')"
