---
chapter: 39
title: "Continuous Integration"
part: "Continuous Integration & Continuous Delivery"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](38-github-actions-artifacts.md) | [Roadmap](../../ROADMAP.md) | [Next Chapter](40-continuous-delivery.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Explain how continuous integration (CI) validates changes frequently.
- Design a GitHub Actions workflow that builds and tests pull requests.
- Use permissions, caching, and required checks to make CI dependable.

## Introduction

Continuous integration is the practice of merging small changes frequently and validating them automatically. A CI workflow gives a team rapid feedback about compilation, tests, formatting, and other quality gates before a change is merged.

## Why This Matters

Without CI, broken changes can remain hidden until a release is urgent. Frequent automated validation shortens feedback loops, keeps the default branch healthy, and makes collaboration safer. CI does not replace code review; it supplies repeatable evidence for the review.

## Key Terms

| Term                   | Definition                                                       |
| ---------------------- | ---------------------------------------------------------------- |
| Continuous integration | Frequent integration of small changes with automated validation. |
| Pull request check     | A status reported by an automated workflow for a pull request.   |
| Required status check  | A branch protection rule that must pass before merging.          |
| Feedback loop          | The time between making a change and learning whether it works.  |

## Theory

A useful CI pipeline is triggered by events that represent proposed or integrated changes, such as `pull_request` and `push` to the default branch. It should install the same dependencies used by the project, run deterministic checks, and fail clearly when a check fails.

CI works best when each job has one purpose. A build job can compile the project, a test job can execute the test suite, and a lint job can check style. Jobs may run in parallel when they do not depend on one another. The workflow should publish results through checks rather than hiding failures in logs.

### Practical Workflow Example

```yaml
name: Continuous Integration

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"
          cache: pip
      - name: Install dependencies
        run: python -m pip install -r requirements.txt
      - name: Run tests
        run: python -m pytest
```

The `permissions` block limits the workflow token to read-only repository access. The `pull_request` trigger validates proposed changes, while the `push` trigger confirms that the default branch remains healthy.

## Try It Yourself

1. Add a CI workflow under `.github/workflows/ci.yml`.
2. Trigger it for pull requests and pushes to `main`.
3. Add a required `test` or `validate` status check in branch protection.
4. Open a pull request with an intentional test failure and observe the check.

## Best Practices

- Keep CI jobs deterministic and fast enough to run on every pull request.
- Pin action major versions and review action updates regularly.
- Use least-privilege `permissions` and avoid secrets in pull request workflows.
- Make failures actionable by naming steps clearly.
- Require the important checks before merging into `main`.

## Common Mistakes

| Mistake                                             | Why it causes problems                      | How to avoid it                                        |
| --------------------------------------------------- | ------------------------------------------- | ------------------------------------------------------ |
| Running CI only after release                       | Defects are found too late.                 | Validate every pull request.                           |
| Giving every job write access                       | A compromised step has excessive authority. | Declare minimal `permissions`.                         |
| Installing different dependencies locally and in CI | Results become inconsistent.                | Commit a lock file and use the same setup.             |
| Ignoring flaky tests                                | The signal becomes untrustworthy.           | Triage and fix flakiness instead of accepting retries. |

## Summary

- CI integrates small changes and validates them frequently.
- GitHub Actions can build, test, and report required checks.
- Fast feedback, deterministic dependencies, and least privilege make CI useful.

## Related Links

- Previous chapter: [GitHub Actions artifacts](38-github-actions-artifacts.md)
- Exercise: [Design a continuous integration workflow](../../exercises/en/39-design-a-continuous-integration-workflow.md)
- Lab: [Build a continuous integration pipeline](../../labs/en/39-build-a-continuous-integration-pipeline.md)
- Quiz: [Continuous integration quiz](../../quizzes/en/39-continuous-integration-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
- Next chapter: [Continuous delivery](40-continuous-delivery.md)
