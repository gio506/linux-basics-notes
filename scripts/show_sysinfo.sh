#!/usr/bin/env bash
# show_sysinfo.sh
# Safe system snapshot for troubleshooting and learning.

set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/show_sysinfo.sh [--top N]

Options:
  --top N   Show top N CPU processes (default: 5)
  -h, --help

Example output:
  OS: Ubuntu 24.04 LTS
  Kernel: 6.8.0-45-generic
  Uptime: up 3 hours, 12 minutes
  Load: 0.10 0.22 0.35
  Memory: 1.3Gi/7.7Gi
  Disk (/): 9.2G used / 98G total
USAGE
}

top_n=5
while [[ $# -gt 0 ]]; do
  case "$1" in
    --top)
      if [[ $# -lt 2 ]]; then
        echo "Error: --top requires a value." >&2
        usage
        exit 1
      fi
      top_n="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Error: unknown argument '$1'" >&2
      usage
      exit 1
      ;;
  esac
done

if ! [[ "$top_n" =~ ^[0-9]+$ ]] || [[ "$top_n" -eq 0 ]]; then
  echo "Error: --top must be a positive integer (>= 1)." >&2
  exit 1
fi

if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  echo "OS: ${PRETTY_NAME:-unknown}"
else
  echo "OS: unknown"
fi

echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Load: $(awk '{print $1, $2, $3}' /proc/loadavg)"
echo "CPU model: $(awk -F ': ' '/model name/ {print $2; exit}' /proc/cpuinfo 2>/dev/null || echo unknown)"
echo "Memory: $(free -h | awk '/^Mem:/ {print $3"/"$2}')"
echo "Disk (/): $(df -h / | awk 'NR==2 {print $3" used / "$2" total"}')"

echo
echo "Top ${top_n} CPU processes:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n "$((top_n + 1))"
