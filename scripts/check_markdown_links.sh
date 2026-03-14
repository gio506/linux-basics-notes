#!/usr/bin/env bash
# check_markdown_links.sh
# Usage: ./scripts/check_markdown_links.sh

set -euo pipefail

status=0

while IFS= read -r -d '' file; do
  while IFS= read -r link; do
    target="${link#(}"
    target="${target%)}"
    target="${target%%#*}"
    [[ -z "$target" ]] && continue
    [[ "$target" =~ ^https?:// ]] && continue
    [[ "$target" =~ ^mailto: ]] && continue
    path="$(dirname "$file")/$target"
    if [[ ! -e "$path" ]]; then
      echo "Broken local link in $file -> $target"
      status=1
    fi
  done < <(grep -oE '\[[^]]+\]\(([^)]+)\)' "$file" | sed -E 's/^\[[^]]+\](\([^)]+\))$/\1/')
done < <(find . -name '*.md' -not -path './node_modules/*' -print0)

exit "$status"
