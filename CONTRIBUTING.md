# Contributing

## Branch naming

Use branches such as:

    feature/SH-12-parser
    bugfix/SH-31-pipeline-close

Use the format:

    <type>/<jira-key>-<short-description>

Where:

- `feature` is used for new functionality.
- `bugfix` is used for bug fixes.
- The Jira issue key should be included in the branch name.
- Use a short, descriptive name for the change.

---

## Commit naming

Include the Jira key in every commit message.

Example:

    SH-12 implement quoted-argument parser

For the performance monitoring feature, examples include:

    SH-XX add command execution time monitoring
    SH-XX add command memory usage monitoring
    SH-XX add command execution statistics

Keep commits focused on a single logical change.

---

## Feature proposals

New features should be tracked through a Jira issue before implementation.

Each feature issue should include:

- Feature description
- Expected behaviour
- Implementation approach
- Test cases
- Known limitations

### Performance and Resource Monitoring

The shell may provide users with information about command execution and resource usage.

The planned monitoring features include:

- **Execution Time** — Measure the time taken by a command to complete.
- **Memory Usage** — Report peak resident memory usage of the executed command.
- **Exit Status** — Display the exit status returned by the command.
- **Command Statistics** — Provide aggregate execution statistics through a `stats` command.

Example:

    $ ls

    Execution time : 1.24 ms
    Memory usage   : 1.82 MB
    Exit status    : 0

Example statistics:

    $ stats

    Shell Statistics
    -------------------------
    Commands executed : 12
    Successful        : 10
    Failed            : 2
    Average time      : 3.42 ms
    Peak memory       : 3.14 MB

Performance monitoring should not interfere with the normal execution or behaviour of existing shell commands.

---

## Pull requests

Every PR should include:

- Jira issue key
- What changed
- Tests run
- Known limitations

For feature contributions, the PR should also describe:

- The purpose of the feature
- Expected behaviour
- Relevant test cases
- Any changes to documentation

At least one teammate should review the PR before merge.

Before submitting a PR, contributors should verify that:

- Existing functionality still works.
- Relevant tests pass.
- New functionality has been tested.
- Documentation has been updated where necessary.
