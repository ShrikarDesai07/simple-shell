# Feasibility Study — Simple Shell

## Technical Feasibility

The implementation can be built with GCC and standard C/POSIX APIs available on Linux. Core requirements map directly to operating-system primitives: `fork`, `execvp`, `waitpid`, `chdir`, `getcwd`, `open`, `dup2`, and `pipe`.

## Operational Feasibility

The shell uses familiar command-line interaction. The user enters a command, receives output/error information, and is returned to the prompt. The supported command set and limitations are documented in `README.md`.

## Economic Feasibility

No paid development software is required. GCC, Git, GitHub, Jira, a UML/diagramming tool, and standard Linux utilities are sufficient.

## Schedule Feasibility

A staged implementation reduces risk: requirements → parser/core shell → process execution → redirection/pipes → background execution → testing/documentation.

## Resource Feasibility

Required resources are a Linux development environment, a C compiler, GitHub repository, Jira project, and two team members with assigned module ownership and review duties.

## Security/Safety Feasibility

The implementation intentionally uses `execvp` instead of `system()` for external commands, preventing the project from introducing an unnecessary second shell layer. Malformed input, missing files, invalid commands, and excessive arguments are treated as testable failure cases.
