#!/usr/bin/env bash
# show_sysinfo.sh
# Usage: ./scripts/show_sysinfo.sh [--json] [--output FILE]
# Example: ./scripts/show_sysinfo.sh --json --output /tmp/sysinfo.json

set -euo pipefail

JSON_MODE=0
OUT_FILE=""

usage() {
  cat <<'USAGE'
Usage: ./scripts/show_sysinfo.sh [--json] [--output FILE]

Options:
  --json          Print output as a JSON object.
  --output FILE   Also write output to FILE.
  -h, --help      Show help.
USAGE
}

while (($# > 0)); do
  case "$1" in
    --json)
      JSON_MODE=1
      ;;
    --output)
      OUT_FILE="${2:-}"
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage
      exit 1
      ;;
  esac
  shift
done

hostname_v="$(hostname)"
os_v="$(grep '^PRETTY_NAME=' /etc/os-release | cut -d= -f2- | tr -d '"')"
kernel_v="$(uname -r)"
uptime_v="$(uptime -p)"
cpu_v="$(awk -F: '/model name/ {gsub(/^ /, "", $2); print $2; exit}' /proc/cpuinfo)"
memory_v="$(free -h | awk 'NR==2 {print $3"/"$2}')"
disk_v="$(df -h / | awk 'NR==2 {print $3"/"$2" ("$5")"}')"

if [[ "$JSON_MODE" -eq 1 ]]; then
  output="$(cat <<JSON
{
  "hostname": "${hostname_v}",
  "os": "${os_v}",
  "kernel": "${kernel_v}",
  "uptime": "${uptime_v}",
  "cpu_model": "${cpu_v}",
  "memory": "${memory_v}",
  "disk_root": "${disk_v}"
}
JSON
)"
else
  output="$(cat <<TEXT
Hostname: ${hostname_v}
OS: ${os_v}
Kernel: ${kernel_v}
Uptime: ${uptime_v}
CPU model: ${cpu_v}
Memory: ${memory_v}
Disk (/): ${disk_v}
TEXT
)"
fi

printf '%s\n' "$output"

if [[ -n "$OUT_FILE" ]]; then
  mkdir -p "$(dirname "$OUT_FILE")"
  printf '%s\n' "$output" >"$OUT_FILE"
  echo "Saved output to $OUT_FILE" >&2
fi
