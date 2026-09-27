# Software Requirements Specification (SRS) — Simple Shell

## 1. Purpose

This document defines the functional and non-functional requirements for Team H1's Simple Shell project.

## 2. Scope

The system is a lightweight Unix-like command-line interpreter for Linux. It reads commands interactively, parses them, executes built-ins or external programs, supports basic I/O redirection and pipelines, and reports errors.

## 3. Definitions

- **Shell:** command-line interpreter developed by the project.
- **Built-in:** command implemented inside the shell process.
- **External command:** executable launched as a child process.
- **Pipeline:** sequence of commands connected by `|`.
- **Foreground command:** shell waits for command completion.
- **Background command:** command launched without blocking the interactive prompt.
- **FR:** Functional Requirement.
- **NFR:** Non-Functional Requirement.
- **RTM:** Requirements Traceability Matrix.

## 4. Functional Requirements

### FR-01 — Interactive Input
The shell shall display a prompt, accept one command line at a time, and continue until `exit` or end-of-file is received.

**Acceptance:** Given a valid command line, the shell reads it and returns to the prompt after processing it.

### FR-02 — External Command Execution
The shell shall execute valid external programs by creating a child process and invoking the selected executable.

**Acceptance:** `ls`, `date`, `printf`, and similar available programs execute successfully when invoked with valid arguments.

### FR-03 — Built-in Commands
The shell shall support `cd`, `pwd`, `echo`, `help`, and `exit`.

**Acceptance:** Each command performs its documented operation and reports invalid arguments appropriately.

### FR-04 — Command Parsing
The shell shall parse whitespace-separated arguments, quoted strings, escaping, and the supported operators.

**Acceptance:** `echo "hello world"` produces one argument containing `hello world`.

### FR-05 — Input/Output Redirection
The shell shall support input `<`, overwrite output `>`, and append output `>>`.

**Acceptance:** Data is read from the specified input file and output is created/overwritten/appended as requested.

### FR-06 — Pipelines
The shell shall connect multiple commands using `|`.

**Acceptance:** `printf "a\nb\n" | wc -l` produces the expected line count.

### FR-07 — Background Execution
The shell shall support commands ending with `&` without waiting for completion.

**Acceptance:** `sleep 2 &` returns the prompt immediately and the process is eventually reaped.

### FR-08 — Error Handling
The shell shall provide useful errors for invalid commands, malformed syntax, inaccessible files, and system-call failures without terminating the shell unexpectedly.

**Acceptance:** An invalid command returns to the prompt and the shell remains usable.

### FR-09 — Process Synchronization
The shell shall wait for foreground child processes and capture their completion status.

**Acceptance:** A foreground command does not return control to the next prompt until the command completes.

### FR-10 — Clean Termination
The shell shall terminate on `exit` and handle end-of-file without leaking allocated parser resources.

**Acceptance:** Both `exit` and Ctrl-D/EOF end the interactive loop cleanly.

## 5. Non-Functional Requirements

### NFR-01 — Reliability
The shell shall not crash during supported normal usage or malformed-input tests.

### NFR-02 — Maintainability
Parsing, built-ins, execution, and shell-loop responsibilities shall be separated into source modules with headers.

### NFR-03 — Memory Safety
The project shall free parser-owned heap memory and close file descriptors on normal and error paths. Sanitizer runs shall be part of quality validation.

### NFR-04 — Usability
The prompt and error messages shall be consistent and understandable.

### NFR-05 — Portability
The supported development target is Linux with a C11-capable GCC toolchain and POSIX APIs.

### NFR-06 — Testability
Every functional requirement shall map to one or more test cases in the RTM.

### NFR-07 — Security Hygiene
The implementation shall avoid `system()` for external command execution and shall validate parser/operator syntax before execution.

### NFR-08 — Documentation
Build, installation, usage, supported syntax, limitations, and testing instructions shall be documented.

## 6. Constraints

- Linux is the official target environment.
- The shell is not intended to be full POSIX-shell compliant.
- Advanced job control, shell variables, glob expansion, command substitution, and scripting are outside the initial scope.

## 7. Assumptions

- GCC and POSIX APIs are available.
- The user has access to normal Linux executables for functional testing.
- Two team members collaborate through GitHub and Jira.

## 8. Acceptance Summary

The release is accepted when all in-scope FRs are implemented, mapped in the RTM, covered by tests, reviewed, documented, and the final test suite passes on the agreed Linux environment.
