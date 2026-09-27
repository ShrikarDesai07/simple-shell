# Test Report — Simple Shell

## Environment used for baseline validation

- Linux x86_64 container
- GCC 14.2.0
- C11 compilation
- Warning flags enabled by the Makefile
- AddressSanitizer + UndefinedBehaviorSanitizer build for memory/undefined-behavior validation

## Executed tests

1. Parser unit tests.
2. Shell integration tests.
3. ASan/UBSan shell test run.

## Baseline result

- Parser unit tests: planned to run through `make test`.
- Shell integration tests: 11 scenarios passed during baseline execution.
- ASan/UBSan: validated through the dedicated `make asan-test` workflow after fixing an error-path parser leak.

## Evidence

Run:

```bash
make clean
make
make test

make asan-test
```

The actual terminal output from the run should be attached to the final project evidence/Jira QA issue.

## Limitations

This report records local development validation. Final acceptance should also be run in the team's agreed target Linux VM and against any instructor-provided test specification.
