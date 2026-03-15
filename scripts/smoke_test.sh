#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

fail() {
  echo "[FAIL] $1" >&2
  exit 1
}

pass() {
  echo "[PASS] $1"
}

output="$(./scripts/show_sysinfo.sh)"
echo "$output" | grep -Eq "Operating System|OS|Kernel" || fail "show_sysinfo.sh output check"
pass "show_sysinfo.sh"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
printf 'demo\n' > "$workdir/example.txt"
output="$(./scripts/find_large_files.sh "$workdir" 0)"
echo "$output" | grep -q "example.txt" || fail "find_large_files.sh output check"
pass "find_large_files.sh"

output="$(./scripts/check_ports.sh || true)"
echo "$output" | grep -Eq "Listening|LISTEN|UDP|TCP|No listening ports" || fail "check_ports.sh output check"
pass "check_ports.sh"

echo "All smoke checks passed."
