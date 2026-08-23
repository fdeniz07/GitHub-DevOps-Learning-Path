---
chapter: 36
title: "GitHub Actions Matrix Builds"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](35-composite-actions.md) | [Exercise](../../exercises/en/36-test-a-matrix-workflow.md) | [Lab](../../labs/en/36-run-a-multi-platform-matrix.md) | [Quiz](../../quizzes/en/36-matrix-builds-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- explain how a matrix expands one job into several combinations;
- use `include` and `exclude` to model supported combinations;
- choose an appropriate `fail-fast` policy;
- read matrix values in steps and keep results understandable.

## Introduction

Matrix jobs test the same workflow logic across a defined set of versions, operating systems, or configurations. They reduce duplicated YAML, but each combination is a real job with its own logs, cost, permissions, and possible failure.

## Key Terms

| Term        | Meaning                                                                       |
| ----------- | ----------------------------------------------------------------------------- |
| Matrix      | A set of dimensions used to generate job combinations.                        |
| Combination | One concrete set of matrix values executed as a job.                          |
| `include`   | Adds values or custom combinations to a matrix.                               |
| `exclude`   | Removes combinations that are unsupported or unnecessary.                     |
| `fail-fast` | Controls whether queued or running matrix jobs are cancelled after a failure. |

## Theory

### Cartesian Product

If a matrix has three operating systems and two runtime versions, it initially produces six combinations. This is a Cartesian product: every value in one dimension is paired with every value in the other dimension. Use dimensions only when the combinations are meaningful and supported.

```yaml
strategy:
  fail-fast: false
  matrix:
    os: [ubuntu-latest, windows-latest]
    python: ["3.11", "3.12"]
    exclude:
      - os: windows-latest
        python: "3.11"
```

Reference values with expressions such as `${{ matrix.os }}` and `${{ matrix.python }}`. A job can use `matrix.os` for `runs-on`, while a step uses the runtime value for setup.

### Include and Special Cases

`include` can add metadata to matching combinations or add a new combination:

```yaml
matrix:
  os: [ubuntu-latest, windows-latest]
  node: [20, 22]
  include:
    - os: ubuntu-latest
      node: 22
      coverage: true
  exclude:
    - os: windows-latest
      node: 20
```

An included value should describe a supported exception, not hide an accidental mismatch. Review the expanded combinations in the workflow run.

### Choosing Fail-Fast

The default `fail-fast: true` can save runner time when one combination invalidates the whole test. Set it to `false` when every operating system or runtime result is valuable for diagnosis. You can also mark an experimental combination with `continue-on-error` through an included value, but do so visibly and explain why it is non-blocking.

## Practical Example

```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, windows-latest]
        version: ["3.11", "3.12"]
        exclude:
          - os: windows-latest
            version: "3.11"
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.version }}
      - run: python --version
```

This workflow creates three jobs. Each job reports its operating system and Python version separately.

## Best Practices

- Keep the matrix limited to supported combinations.
- Use `fail-fast: false` when cross-platform evidence matters.
- Label logs and artifacts with matrix values to prevent confusion.
- Use `include` for explicit exceptions and document why they exist.
- Consider runner cost and queue time before adding dimensions.

## Common Mistakes

| Mistake                               | Impact                                | Correction                       |
| ------------------------------------- | ------------------------------------- | -------------------------------- |
| Adding every possible version         | Slow, expensive, noisy runs.          | Test a justified support policy. |
| Forgetting `matrix.` in an expression | The value is not resolved.            | Use `${{ matrix.dimension }}`.   |
| Using fail-fast blindly               | Useful diagnostic jobs are cancelled. | Choose the policy deliberately.  |
| Excluding the wrong combination       | A supported platform is never tested. | Review the expanded matrix.      |

## Summary

Matrix builds turn one job definition into controlled combinations. `include` and `exclude` express exceptions, while `fail-fast` balances speed against diagnostic coverage.

### Related Content

- Previous chapter: [Composite Actions](35-composite-actions.md)
- Exercise: [Test a Matrix Workflow](../../exercises/en/36-test-a-matrix-workflow.md)
- Lab: [Run a Multi-Platform Matrix](../../labs/en/36-run-a-multi-platform-matrix.md)
- Quiz: [Matrix Builds Quiz](../../quizzes/en/36-matrix-builds-quiz.md)
