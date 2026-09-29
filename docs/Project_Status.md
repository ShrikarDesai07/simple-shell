# Project Status

**Project:** Simple Shell
**Team:** H1
**Primary language:** C
**Target:** Linux
**Last updated:** 2026-09-29

## Phase 1 (Requirements stage) status

| Deliverable | File | Status |
|---|---|---|
| Problem statement / feasibility | `Problem_Statement.md`, `Feasibility_Study.md` | Prepared |
| SRS and requirement categorization | `SRS.md` | Prepared |
| RTM | `RTM.md` | Prepared |
| Actors identified and named | `Use_Case_Catalog.md` §1 | Prepared — 2 actors |
| Use cases grouped by actor | `Use_Case_Catalog.md` §2 | Prepared |
| Use case diagram | `Use_Case_Diagram.mmd` / `.png` | Prepared |
| Validation specification | `Validation_Specification.md` | Prepared, including penetration test plan (planning only) |

Deliverable-to-file mapping is in `docs/Phase_1_Checklist.md` Section 1.

## Implementation baseline

- Modular C implementation in `src/` with headers in `include/`.
- Automated parser unit tests and shell integration tests in `tests/`.
- GitHub Actions CI workflow running `make test` on every push and pull request.
- Jira backlog seed in `docs/Jira_Backlog.md`.

## Validation state

- No recorded validation run. See `docs/Test_Report.md` Section 1.
- Automated coverage gaps are recorded in `docs/RTM.md` Section 4 and `docs/Test_Cases.md` Section 4.
  TC-13 (background) and TC-16 (foreground synchronisation) are the only coverage for FR-07 and
  FR-09 and are not yet automated.

## Open items

1. Run `make test` and `make asan-test` on the target Linux system and paste the output into
   `Test_Report.md` Sections 5.1–5.3.
2. Create/connect the Jira project so the logical IDs `SH-REQ-*` and `SH-NFR-*` map to real keys.
3. Decide whether the performance-monitoring feature sketched in `CONTRIBUTING.md` becomes a
   requirement or is dropped. It currently has no SRS requirement, RTM row or Jira issue.
