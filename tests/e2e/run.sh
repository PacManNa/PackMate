#!/usr/bin/env bash
set -euo pipefail
serial="${1:-}"
if [[ ! "$serial" =~ ^emulator-[0-9]+$ ]]; then
  echo "Usage: bash tests/e2e/run.sh emulator-NNNN (disposable emulator only)" >&2
  exit 2
fi
[[ "$(adb -s "$serial" get-state)" == device ]]
[[ "$(adb -s "$serial" shell getprop ro.kernel.qemu | tr -d '\r')" == 1 ]]
adb -s "$serial" shell pm path ua.borlock.autotap.newkey | grep -q '^package:'
cd "$(dirname "$0")"
maestro --device "$serial" test journey.yaml
