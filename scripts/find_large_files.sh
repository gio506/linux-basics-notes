#!/usr/bin/env bash
# find_large_files.sh
# Usage: ./scripts/find_large_files.sh [DIRECTORY] [MIN_SIZE_MB] [--dry-run]
# Example: ./scripts/find_large_files.sh /var/log 50
# Example: ./scripts/find_large_files.sh . 20 --dry-run

set -euo pipefail

usage() {
  echo "Usage: ./scripts/find_large_files.sh [DIRECTORY] [MIN_SIZE_MB] [--dry-run]"
  echo "Example: ./scripts/find_large_files.sh /var/log 50"
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

SEARCH_DIR="${1:-.}"
MIN_SIZE_MB="${2:-20}"
MODE="${3:-}"

if [[ ! -d "$SEARCH_DIR" ]]; then
  echo "Error: directory '$SEARCH_DIR' does not exist." >&2
  exit 1
fi

if ! [[ "$MIN_SIZE_MB" =~ ^[0-9]+$ ]]; then
  echo "Error: MIN_SIZE_MB must be a positive integer." >&2
  exit 1
fi

echo "Scanning directory: $SEARCH_DIR"
echo "Minimum file size: ${MIN_SIZE_MB}MB"

if [[ "$MODE" == "--dry-run" ]]; then
  echo "Dry run: would execute find + du + sort for large files."
  exit 0
fi

find "$SEARCH_DIR" -xdev -type f -size "+${MIN_SIZE_MB}M" -print0 \
  | xargs -0 -r du -h \
  | sort -hr
