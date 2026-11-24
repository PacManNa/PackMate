# Device E2E

Install Maestro and ADB. Build and install the debug APK on a **disposable** emulator. Run from repository root:

```sh
bash tests/e2e/run.sh emulator-5554
```

The flow clears test-app data on that emulator only. Never run the YAML directly on a daily-use phone. Uses the existing debug-only applicationId suffix. Requires a preinstalled locally signed debug APK; does not alter or bypass the repository's persistent signing configuration. Does not activate accessibility or start the timer.

Status: authored, not executed. Preserve Maestro output when reporting a result; do not mark this as PASS until it actually runs. No real account or paid API is needed.
