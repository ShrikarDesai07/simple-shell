# Test Cases — Simple Shell

| ID | Scenario | Input / Action | Expected |
|---|---|---|---|
| TC-01 | Start/exit | `exit` | Shell terminates normally. |
| TC-02 | External command | `ls -l` | Directory listing is produced. |
| TC-03 | Built-in echo | `echo hello` | `hello` printed. |
| TC-04 | Directory change | `cd /tmp` then `pwd` | `/tmp` printed. |
| TC-05 | Quoted argument | `echo "hello world"` | One argument printed with space preserved. |
| TC-06 | Escaped character | `echo hello\\ world` | `hello world` printed. |
| TC-07 | Input redirection | `cat < file` | File contents printed. |
| TC-08 | Output overwrite | `echo x > file` | File contains `x`. |
| TC-09 | Output append | `echo y >> file` | `y` appended. |
| TC-10 | EOF | Ctrl-D | Shell exits cleanly. |
| TC-11 | Syntax error | `echo "unterminated` | Error shown; shell remains alive. |
| TC-12 | Two-command pipe | `printf "a\\nb\\n" | wc -l` | `2` produced. |
| TC-13 | Background | `sleep 2 &` | Prompt returns without waiting. |
| TC-14 | Invalid command | `not-a-real-command` | Error shown; shell remains alive. |
| TC-15 | Missing input file | `cat < missing` | Error shown; shell remains alive. |
| TC-16 | Foreground synchronization | `sleep 1` | Next prompt appears after process completion. |
| TC-17 | Stress/regression | Automated suite repeated | No crashes/failing assertions. |

## Non-functional validation

- `make test` (parser unit tests + shell integration tests)
- `make asan && make test`
- Run a long pipeline such as `seq 10000 | wc -l`.
- Run repeated background commands and verify they are eventually reaped.
