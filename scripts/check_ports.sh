#!/usr/bin/env bash
# check_ports.sh
# Show listening ports with optional protocol and process-name filtering.

set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/check_ports.sh [--tcp|--udp] [--process NAME]

Options:
  --tcp            Show only TCP listening ports
  --udp            Show only UDP listening ports
  --process NAME   Filter output by process name
  -h, --help

Example output:
  Netid State  Recv-Q Send-Q Local Address:Port Peer Address:Port Process
  tcp   LISTEN 0      4096   0.0.0.0:22       0.0.0.0:*         users:(("sshd",pid=722,fd=3))
USAGE
}

proto="both"
process_filter=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --tcp)
      proto="tcp"
      shift
      ;;
    --udp)
      proto="udp"
      shift
      ;;
    --process)
      if [[ $# -lt 2 ]]; then
        echo "Error: --process requires a value." >&2
        usage
        exit 1
      fi
      process_filter="$2"
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

if ! command -v ss >/dev/null 2>&1; then
  echo "Error: 'ss' command not found. Install iproute2 and retry." >&2
  exit 1
fi

case "$proto" in
  tcp) cmd=(ss -tlnpe) ;;
  udp) cmd=(ss -ulnpe) ;;
  both) cmd=(ss -tulnpe) ;;
esac

if [[ -n "$process_filter" ]]; then
  "${cmd[@]}" | awk 'NR==1 || tolower($0) ~ tolower(proc)' proc="$process_filter"
else
  "${cmd[@]}"
fi
