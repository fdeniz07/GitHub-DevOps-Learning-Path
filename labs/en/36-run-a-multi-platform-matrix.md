---
chapter: 36
title: "Run a Multi-Platform Matrix"
related_notebook: "GitHub Actions Matrix Builds"
related_exercise: "Test a Matrix Workflow"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/35-composite-actions.md) | [Notebook](../../notebooks/en/36-github-actions-matrix-builds.md) | [Exercise](../../exercises/en/36-test-a-matrix-workflow.md) | [Quiz](../../quizzes/en/36-matrix-builds-quiz.md) | [Roadmap](../../ROADMAP.md)

# Run a Multi-Platform Matrix

## Objective

Build a matrix workflow that tests a support policy across platforms and runtime versions.

## Learning Outcomes

- implement a bounded matrix;
- use `include` for explicit metadata and `exclude` for unsupported cases;
- interpret independent matrix results.

## Scenario

A command-line tool supports Ubuntu and Windows on two runtime versions. One Windows/runtime combination is not supported. The team wants every other result even when one job fails.

## Prerequisites

- Completed the related notebook and exercise.
- A repository with a deterministic test command.

## Environment Setup

| Requirement      | Value                                            |
| ---------------- | ------------------------------------------------ |
| Operating System | GitHub-hosted Ubuntu and Windows runners         |
| Software         | GitHub Actions and the project's runtime         |
| Version          | Use the versions defined by the practice project |

## Tasks

### Task 1 — Model Support

1. Define `os` and `runtime` dimensions.
2. Exclude the unsupported pair.
3. Set `fail-fast: false` and record the diagnostic reason.

**Expected Result:** The workflow creates exactly the supported combinations.

### Task 2 — Run and Label Tests

1. Select the runner from `matrix.os`.
2. Install `matrix.runtime`.
3. Print both values before running tests.

**Expected Result:** Logs identify every result without guesswork.

### Task 3 — Add an Exception

1. Use `include` to add a `coverage` flag to one combination.
2. Run the coverage step only when the flag is true.
3. Review the expanded workflow summary.

**Expected Result:** The exception is visible and does not silently alter unrelated combinations.

## Validation Checklist

- [ ] Unsupported combinations are excluded.
- [ ] Matrix values are used in runner and setup steps.
- [ ] Logs identify every combination.
- [ ] Failure behavior matches the diagnostic goal.

## Troubleshooting

| Problem                             | Possible Cause                            | Solution                            |
| ----------------------------------- | ----------------------------------------- | ----------------------------------- |
| Too many jobs                       | Cartesian product is larger than expected | Count dimensions and use `exclude`. |
| Value not resolved                  | Missing `matrix.` prefix                  | Use `${{ matrix.name }}`.           |
| Results disappear after one failure | Fail-fast is enabled                      | Set it to `false` when appropriate. |

## Best Practices

- Keep support policy close to the matrix.
- Avoid experimental combinations becoming silently required.
- Review time and runner cost after adding dimensions.

## Summary

The lab turns a support matrix into observable, independently diagnosable CI jobs.

### Related Content

- Notebook: [GitHub Actions Matrix Builds](../../notebooks/en/36-github-actions-matrix-builds.md)
- Exercise: [Test a Matrix Workflow](../../exercises/en/36-test-a-matrix-workflow.md)
- Quiz: [Matrix Builds Quiz](../../quizzes/en/36-matrix-builds-quiz.md)
