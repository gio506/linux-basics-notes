#!/usr/bin/env bash
# check_ports.sh
# Usage: ./scripts/check_ports.sh [--tcp|--udp|--all] [--numeric] [--json]
# Example: ./scripts/check_ports.sh --all --numeric

set -euo pipefail

PROTO="all"
NUMERIC=0
JSON_MODE=0

usage() {
  cat <<'USAGE'
Usage: ./scripts/check_ports.sh [--tcp|--udp|--all] [--numeric] [--json]

Options:
  --tcp        Show TCP listening sockets only.
  --udp        Show UDP listening sockets only.
  --all        Show both TCP and UDP (default).
  --numeric    Use numeric addresses and ports.
  --json       Emit JSON-like structured output.
  -h, --help   Show help.
USAGE
}

while (($# > 0)); do
  case "$1" in
    --tcp) PROTO="tcp" ;;
    --udp) PROTO="udp" ;;
    --all) PROTO="all" ;;
    --numeric) NUMERIC=1 ;;
    --json) JSON_MODE=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
  shift
done

if command -v ss >/dev/null 2>&1; then
  tcp_cmd=(ss -lt)
  udp_cmd=(ss -lu)
  [[ "$NUMERIC" -eq 1 ]] && tcp_cmd=(ss -ltn) && udp_cmd=(ss -lun)
elif command -v netstat >/dev/null 2>&1; then
  tcp_cmd=(netstat -lt)
  udp_cmd=(netstat -lu)
  [[ "$NUMERIC" -eq 1 ]] && tcp_cmd=(netstat -ltn) && udp_cmd=(netstat -lun)
else
  echo "Neither 'ss' nor 'netstat' is available on this system." >&2
  echo "Install iproute2 (ss) or net-tools (netstat), then re-run." >&2
  exit 1
fi

show_proto() {
  local label="$1"
  shift
  if [[ "$JSON_MODE" -eq 1 ]]; then
    echo "\"${label}\": ["
    "$@" | tail -n +2 | sed 's/"/\\"/g; s/^/  "/; s/$/",/' | sed '$ s/,$//'
    echo "]"
  else
    echo "=== ${label^^} listening ports ==="
    "$@"
  fi
}

if [[ "$JSON_MODE" -eq 1 ]]; then
  echo "{"
fi

case "$PROTO" in
  tcp) show_proto "tcp" "${tcp_cmd[@]}" ;;
  udp) show_proto "udp" "${udp_cmd[@]}" ;;
  all)
    show_proto "tcp" "${tcp_cmd[@]}"
    [[ "$JSON_MODE" -eq 1 ]] && echo ","
    [[ "$JSON_MODE" -eq 0 ]] && echo
    show_proto "udp" "${udp_cmd[@]}"
    ;;
esac

[[ "$JSON_MODE" -eq 1 ]] && echo "}"
