# Requirements Traceability Matrix (RTM)

| Req ID | Requirement | Use Case | Jira | Implementation | Test Cases | Status |
|---|---|---|---|---|---|---|
| FR-01 | Interactive input | UC-01, UC-10 | SH-REQ-01 | `src/shell.c` | TC-01, TC-10 | Implemented |
| FR-02 | External command execution | UC-02 | SH-REQ-02 | `src/executor.c` | TC-02 | Implemented |
| FR-03 | Built-in commands | UC-03, UC-04, UC-05, UC-10 | SH-REQ-03 | `src/builtins.c` | TC-03, TC-04, TC-10 | Implemented |
| FR-04 | Command parsing | UC-01 | SH-REQ-04 | `src/parser.c` | TC-05, TC-06, TC-11 | Implemented |
| FR-05 | Redirection | UC-06 | SH-REQ-05 | `src/executor.c` | TC-07, TC-08, TC-09 | Implemented |
| FR-06 | Pipelines | UC-07 | SH-REQ-06 | `src/executor.c` | TC-12 | Implemented |
| FR-07 | Background execution | UC-08 | SH-REQ-07 | `src/executor.c` | TC-13 | Implemented |
| FR-08 | Error handling | UC-09 | SH-REQ-08 | `src/parser.c`, `src/executor.c`, `src/builtins.c` | TC-11, TC-14, TC-15 | Implemented |
| FR-09 | Process synchronization | UC-02, UC-07 | SH-REQ-09 | `src/executor.c` | TC-16 | Implemented |
| FR-10 | Clean termination | UC-10 | SH-REQ-10 | `src/shell.c`, `src/builtins.c` | TC-01, TC-10 | Implemented |
| NFR-01 | Reliability | All | SH-NFR-01 | All | TC-17 | Planned |
| NFR-02 | Maintainability | N/A | SH-NFR-02 | Modular source layout | Review | Planned |
| NFR-03 | Memory safety | N/A | SH-NFR-03 | All | ASAN-01 | Planned |
| NFR-04 | Usability | All | SH-NFR-04 | `src/shell.c` | UX-01 | Planned |
| NFR-05 | Linux portability | N/A | SH-NFR-05 | Build system | BUILD-01 | Planned |
| NFR-06 | Testability | N/A | SH-NFR-06 | `tests/` | CI-01 | Planned |
| NFR-07 | Security hygiene | N/A | SH-NFR-07 | `src/executor.c` | SEC-01 | Planned |
| NFR-08 | Documentation | N/A | SH-NFR-08 | `docs/`, `README.md` | DOC-01 | Planned |

## Traceability rules

1. Every requirement gets a unique ID.
2. Every FR maps to a use case, implementation module, Jira issue, and test.
3. Jira issue status and this matrix should be updated after each accepted change.
4. A requirement is not considered done until implementation, review, and validation evidence exist.
