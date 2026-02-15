#!/usr/bin/env bash
# find_large_files.sh
# List largest files safely, with optional depth and minimum size filters.

set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  ./scripts/find_large_files.sh [DIRECTORY] [COUNT] [--max-depth N] [--min-size SIZE]

Arguments:
  DIRECTORY            Directory to scan (default: current directory)
  COUNT                Number of files to show (default: 10)

Options:
  --max-depth N        Limit directory traversal depth
  --min-size SIZE      Filter by minimum size (find format, e.g., 10M, 500k)
  -h, --help

Example output:
  120M  ./archives/data.tar
   45M  ./videos/demo.mp4
  8.0M  ./logs/app.log
USAGE
}

target_dir="."
count="10"
max_depth=""
min_size=""

positionals=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --max-depth)
      if [[ $# -lt 2 ]]; then
        echo "Error: --max-depth requires a value." >&2
        usage
        exit 1
      fi
      max_depth="$2"
      shift 2
      ;;
    --min-size)
      if [[ $# -lt 2 ]]; then
        echo "Error: --min-size requires a value." >&2
        usage
        exit 1
      fi
      min_size="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    --*)
      echo "Error: unknown option '$1'" >&2
      usage
      exit 1
      ;;
    *)
      positionals+=("$1")
      shift
      ;;
  esac
done

if [[ ${#positionals[@]} -ge 1 ]]; then
  target_dir="${positionals[0]}"
fi
if [[ ${#positionals[@]} -ge 2 ]]; then
  count="${positionals[1]}"
fi
if [[ ${#positionals[@]} -gt 2 ]]; then
  echo "Error: too many positional arguments." >&2
  usage
  exit 1
fi

if [[ ! -d "$target_dir" ]]; then
  echo "Error: directory '$target_dir' does not exist." >&2
  exit 1
fi
if ! [[ "$count" =~ ^[0-9]+$ ]] || [[ "$count" -eq 0 ]]; then
  echo "Error: COUNT must be a positive integer (>= 1)." >&2
  exit 1
fi
if [[ -n "$max_depth" ]] && { ! [[ "$max_depth" =~ ^[0-9]+$ ]] || [[ "$max_depth" -eq 0 ]]; }; then
  echo "Error: --max-depth must be a positive integer (>= 1)." >&2
  exit 1
fi

find_cmd=(find "$target_dir")
if [[ -n "$max_depth" ]]; then
  find_cmd+=( -maxdepth "$max_depth" )
fi
find_cmd+=( -type f )
if [[ -n "$min_size" ]]; then
  find_cmd+=( -size "+$min_size" )
fi
find_cmd+=( -print0 )

# No file modifications; read-only scan and sort by human-readable size.
"${find_cmd[@]}" \
  | xargs -0 du -h 2>/dev/null \
  | sort -hr \
  | head -n "$count"
