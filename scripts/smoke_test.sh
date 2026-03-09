#!/usr/bin/env bash
# smoke_test.sh
# Usage: ./scripts/smoke_test.sh
# Example: ./scripts/smoke_test.sh

set -euo pipefail

./scripts/show_sysinfo.sh >/tmp/show_sysinfo.out
./scripts/check_ports.sh >/tmp/check_ports.out || true
./scripts/find_large_files.sh . 99999 --dry-run >/tmp/find_large_files.out

echo "Smoke tests completed."
