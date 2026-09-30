---
chapter: 39
title: "Design a Continuous Integration Workflow"
related_notebook: "Continuous Integration"
related_lab: "Build a Continuous Integration Pipeline"
related_quiz: "Continuous Integration Quiz"
level: Beginner
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/39-continuous-integration.md) | [Lab](../../labs/en/39-build-a-continuous-integration-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Design a Continuous Integration Workflow

## Objective

Design a GitHub Actions workflow that validates pull requests and keeps `main` healthy.

## Outcomes

You will be able to:

- Select appropriate `pull_request` and `push` triggers.
- Separate build and test responsibilities.
- Apply minimal workflow `permissions`.

## Prerequisites

- Read the [Continuous Integration notebook](../../notebooks/en/39-continuous-integration.md).
- Understand YAML mappings, lists, and indentation.
- Have a repository with a reproducible test command.

## Scenario

A team currently merges changes without automated checks. Your task is to design the first CI workflow for a small Python service. It must run for pull requests and for pushes to `main`, install dependencies, and run tests without requesting unnecessary write access.

## Tasks

### Task 1 — Define the workflow contract

Write the workflow name, `on` triggers, `permissions`, runner, and job identifier. Use `contents: read` as the default repository permission.

**Expected Result:** The workflow validates proposed changes and the default branch with read-only repository access.

### Task 2 — Add repeatable validation

Add checkout, Python setup with `cache: pip`, dependency installation, and `python -m pytest` steps. Give each step a clear `name`.

**Expected Result:** Another learner can understand exactly how the project is installed and tested.

### Task 3 — Define the merge rule

Specify which check should become a required status check in branch protection. Explain what happens when the test command fails.

**Expected Result:** A failing test blocks the merge and produces visible feedback.

## Challenge

Split the workflow into independent `build`, `test`, and `lint` jobs. Explain which jobs can run in parallel and which results are required before merging.

## Self-Assessment

- [ ] I selected triggers for pull requests and `main`.
- [ ] I used least-privilege `permissions`.
- [ ] I can explain how a failed test blocks merging.
- [ ] I can identify a CI check that is deterministic.

## Common Mistakes

| Mistake                                          | Solution                                 |
| ------------------------------------------------ | ---------------------------------------- |
| Running only on a manual trigger                 | Add `pull_request` and `push` to `main`. |
| Using `write-all` permissions                    | Declare only the access the job needs.   |
| Hiding the test command in a generic script name | Name the step and document the command.  |

## Summary

A good CI design provides frequent, reproducible feedback and a clear merge decision. Required checks make the feedback enforceable.

## Related Links

- Notebook: [Continuous Integration](../../notebooks/en/39-continuous-integration.md)
- Lab: [Build a Continuous Integration Pipeline](../../labs/en/39-build-a-continuous-integration-pipeline.md)
- Quiz: [Continuous Integration Quiz](../../quizzes/en/39-continuous-integration-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
