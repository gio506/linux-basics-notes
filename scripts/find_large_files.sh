#!/usr/bin/env bash
# find_large_files.sh
# Find files larger than N MB under a directory.
# Usage: ./scripts/find_large_files.sh [DIRECTORY] [MIN_SIZE_MB]
# Example: ./scripts/find_large_files.sh /var/log 50
# Example output:
#   Scanning directory: /var/log
#   Minimum file size: 50MB
#   73M /var/log/journal/abc/system.journal

set -euo pipefail

SEARCH_DIR="${1:-.}"
MIN_SIZE_MB="${2:-20}"

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

# -xdev avoids crossing filesystem boundaries.
# sort -hr shows largest files first in human-readable format.
find "$SEARCH_DIR" -xdev -type f -size "+${MIN_SIZE_MB}M" -print0 \
  | xargs -0 -r du -h \
  | sort -hr
