# Simple Shell

A lightweight Unix-like command-line interpreter written in C for Linux.

## Features

- Interactive prompt
- Built-ins: `cd`, `pwd`, `echo`, `help`, `exit`
- External command execution using `fork`/`execvp`
- Quoted and escaped arguments
- Input redirection: `<`
- Output redirection: `>`
- Append redirection: `>>`
- Pipelines: `|`
- Background execution: `&`
- Error handling for common parser/process/file failures

## Build

```bash
make
```

## Run

```bash
./simple-shell
```

Example:

```text
simple-shell$ pwd
/home/student/simple-shell
simple-shell$ echo "hello world"
hello world
simple-shell$ printf "a\\nb\\n" | wc -l
2
simple-shell$ exit
```

## Test

```bash
make test
```

For sanitizer validation:

```bash
make asan-test
```

## Project documentation

- `docs/Problem_Statement.md`
- `docs/Feasibility_Study.md`
- `docs/SRS.md`
- `docs/RTM.md`
- `docs/Validation_Specification.md`
- `docs/Use_Case_Diagram.mmd`
- `docs/Architecture.md`
- `docs/Test_Cases.md`
- `docs/Jira_Backlog.md`

## Development workflow

1. Create/update a Jira issue.
2. Create a feature branch using the issue key.
3. Implement the smallest complete change.
4. Add/update tests.
5. Run `make test`.
6. Open a pull request for review.
7. Merge only after tests and review pass.
8. Update the RTM and Jira status.

## Out of scope for the initial release

Full shell scripting, variable expansion, globbing, command substitution, aliases, job-control signals, and complete POSIX grammar.

## Team

Team H1 — two-member project.
