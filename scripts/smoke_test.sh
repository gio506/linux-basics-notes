#!/usr/bin/env bash
# smoke_test.sh
# Usage: ./scripts/smoke_test.sh
# Example: ./scripts/smoke_test.sh

set -euo pipefail

mkdir -p /tmp/linux-lab-smoke
./scripts/show_sysinfo.sh --json --output /tmp/linux-lab-smoke/sysinfo.json >/tmp/linux-lab-smoke/show_sysinfo.out
./scripts/check_ports.sh --all --numeric >/tmp/linux-lab-smoke/check_ports.out || true
./scripts/find_large_files.sh . 99999 --dry-run --top 5 >/tmp/linux-lab-smoke/find_large_files.out
./scripts/vm_preflight.sh >/tmp/linux-lab-smoke/preflight.out

echo "Smoke tests completed. Artifacts in /tmp/linux-lab-smoke"
