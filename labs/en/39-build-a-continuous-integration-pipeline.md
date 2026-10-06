---
chapter: 39
title: "Build a Continuous Integration Pipeline"
related_notebook: "Continuous Integration"
related_exercise: "Design a Continuous Integration Workflow"
related_quiz: "Continuous Integration Quiz"
level: Beginner
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/39-continuous-integration.md) | [Exercise](../../exercises/en/39-design-a-continuous-integration-workflow.md) | [Roadmap](../../ROADMAP.md)

# Build a Continuous Integration Pipeline

## Objective

Create and verify a GitHub Actions CI workflow for a small Python project.

## Outcomes

- Trigger validation on pull requests and pushes to `main`.
- Install dependencies and run tests in a reproducible runner.
- Observe and correct a failed required check.

## Prerequisites

- Complete the notebook and exercise.
- GitHub repository access and a working Python test command.
- Git and a text editor.

## Scenario

Your team wants every proposed change checked before merge. You will add a workflow, open a test change, and inspect the resulting check.

## Environment

| Requirement      | Value                                             |
| ---------------- | ------------------------------------------------- |
| Operating System | Windows, Linux, or macOS                          |
| Software         | Git, GitHub account, Python 3.12                  |
| Repository       | A project containing `requirements.txt` and tests |

## Tasks

### Task 1 — Add the workflow

Create `.github/workflows/ci.yml` with `pull_request`, `push` to `main`, `permissions: contents: read`, checkout, Python setup, dependency installation, and `python -m pytest`.

**Expected Result:** GitHub recognizes the workflow and starts it for a pull request.

### Task 2 — Trigger feedback

Open a branch, make a small test-safe change, and create a pull request. Inspect the workflow run and check summary.

**Expected Result:** The validation check reports success on the pull request.

### Task 3 — Test failure behavior

Use a temporary branch to introduce a failing test, observe the failed check, then correct it.

**Expected Result:** The failure is visible and the corrected commit returns the check to success.

## Validation Checklist

- [ ] The workflow file is under `.github/workflows`.
- [ ] Both required triggers are present.
- [ ] Permissions are read-only.
- [ ] Dependencies install successfully.
- [ ] Tests run and report status.
- [ ] A failing test blocks the required check.

## Troubleshooting

| Problem                    | Possible Cause                    | Solution                                            |
| -------------------------- | --------------------------------- | --------------------------------------------------- |
| Workflow does not start    | YAML location or trigger is wrong | Check `.github/workflows` and `on`.                 |
| Import errors              | Dependencies were not installed   | Verify `requirements.txt` and setup step.           |
| Test check is not required | Branch protection is incomplete   | Add the exact check name to required status checks. |

## Best Practices

- Keep the workflow reproducible and focused.
- Use clear step names and preserve useful logs.
- Fix flaky tests instead of hiding them with retries.

## Summary

You built a CI feedback loop that validates changes before merge and keeps `main` observable.

## Related Links

- Notebook: [Continuous Integration](../../notebooks/en/39-continuous-integration.md)
- Exercise: [Design a Continuous Integration Workflow](../../exercises/en/39-design-a-continuous-integration-workflow.md)
- Quiz: [Continuous Integration Quiz](../../quizzes/en/39-continuous-integration-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
