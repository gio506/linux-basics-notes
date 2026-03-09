#!/usr/bin/env bash
# lint_markdown.sh
# Usage: ./scripts/lint_markdown.sh

set -euo pipefail

status=0

while IFS= read -r -d '' file; do
  if grep -nE "[[:space:]]+$" "$file" >/tmp/md_trailing.out; then
    echo "Trailing whitespace found in $file"
    cat /tmp/md_trailing.out
    status=1
  fi
  if ! grep -q '^#' "$file"; then
    echo "No heading found in $file"
    status=1
  fi
done < <(find . -name '*.md' -not -path './node_modules/*' -print0)

exit "$status"
