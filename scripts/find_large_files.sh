#!/usr/bin/env bash
set -euo pipefail

# find_large_files.sh
# Find files larger than a given size (in MB) under a target directory.
# Usage: ./scripts/find_large_files.sh <directory> [min_size_mb]
# Example: ./scripts/find_large_files.sh /var/log 50
#
# Example output:
# Searching in: /var/log
# Minimum size: 50MB
# 63M /var/log/journal/system.journal
# 52M /var/log/big-app.log

if [[ $# -lt 1 || $# -gt 2 ]]; then
  echo "Usage: $0 <directory> [min_size_mb]" >&2
  exit 1
fi

target_dir="$1"
min_size_mb="${2:-100}"

if [[ ! -d "$target_dir" ]]; then
  echo "Error: directory not found: $target_dir" >&2
  exit 1
fi

if ! [[ "$min_size_mb" =~ ^[0-9]+$ ]]; then
  echo "Error: min_size_mb must be a positive integer" >&2
  exit 1
fi

echo "Searching in: $target_dir"
echo "Minimum size: ${min_size_mb}MB"

find "$target_dir" -type f -size "+${min_size_mb}M" -print0 \
  | xargs -0 -r du -h \
  | sort -h
