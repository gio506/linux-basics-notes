#!/usr/bin/env bash
# find_large_files.sh
# Usage: ./scripts/find_large_files.sh [DIRECTORY] [MIN_SIZE_MB] [--dry-run] [--top N]
# Example: ./scripts/find_large_files.sh /var/log 50 --top 20

set -euo pipefail

SEARCH_DIR="."
MIN_SIZE_MB="20"
DRY_RUN=0
TOP_N=0

usage() {
  cat <<'USAGE'
Usage: ./scripts/find_large_files.sh [DIRECTORY] [MIN_SIZE_MB] [--dry-run] [--top N]

Examples:
  ./scripts/find_large_files.sh /var/log 50
  ./scripts/find_large_files.sh . 200 --top 10
  ./scripts/find_large_files.sh /home 20 --dry-run
USAGE
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

POSITIONAL=()
while (($# > 0)); do
  case "$1" in
    --dry-run) DRY_RUN=1 ;;
    --top) TOP_N="${2:-0}"; shift ;;
    *) POSITIONAL+=("$1") ;;
  esac
  shift
done

[[ ${#POSITIONAL[@]} -ge 1 ]] && SEARCH_DIR="${POSITIONAL[0]}"
[[ ${#POSITIONAL[@]} -ge 2 ]] && MIN_SIZE_MB="${POSITIONAL[1]}"

if [[ ! -d "$SEARCH_DIR" ]]; then
  echo "Error: directory '$SEARCH_DIR' does not exist." >&2
  exit 1
fi
if ! [[ "$MIN_SIZE_MB" =~ ^[0-9]+$ ]]; then
  echo "Error: MIN_SIZE_MB must be a positive integer." >&2
  exit 1
fi
if ! [[ "$TOP_N" =~ ^[0-9]+$ ]]; then
  echo "Error: --top requires a positive integer." >&2
  exit 1
fi

echo "Scanning directory: $SEARCH_DIR"
echo "Minimum file size: ${MIN_SIZE_MB}MB"
[[ "$TOP_N" -gt 0 ]] && echo "Showing top entries: $TOP_N"

if [[ "$DRY_RUN" -eq 1 ]]; then
  echo "Dry run: would execute find + du + sort for files > ${MIN_SIZE_MB}MB"
  exit 0
fi

cmd_output="$(find "$SEARCH_DIR" -xdev -type f -size "+${MIN_SIZE_MB}M" -print0 | xargs -0 -r du -h | sort -hr)"

if [[ -z "$cmd_output" ]]; then
  echo "No files larger than ${MIN_SIZE_MB}MB found under $SEARCH_DIR"
  exit 0
fi

if [[ "$TOP_N" -gt 0 ]]; then
  printf '%s\n' "$cmd_output" | head -n "$TOP_N"
else
  printf '%s\n' "$cmd_output"
fi
