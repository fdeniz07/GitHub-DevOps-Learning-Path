---
chapter: 28
title: "Run a GitHub Actions Workflow"
related_notebook: "Introduction to GitHub Actions"
related_exercise: "Create Your First GitHub Actions Workflow"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/28-introduction-to-github-actions.md) | [Exercise](../../exercises/en/28-create-your-first-github-actions-workflow.md) | [Quiz](../../quizzes/en/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Objective

Create, commit, run, and inspect a minimal GitHub Actions workflow.

## Learning Outcomes

- place a workflow where GitHub discovers it;
- start a workflow through a repository event and a manual dispatch;
- inspect job and step results without exposing sensitive data.

## Scenario

You are introducing automation to a repository. The first lab verifies the delivery path with a harmless status command before later chapters add build and test logic.

## Prerequisites

- Completed the related notebook and exercise.
- A GitHub repository and permission to commit a workflow.
- A browser and Git client.

## Environment Setup

| Requirement      | Value                                |
| ---------------- | ------------------------------------ |
| Operating System | Windows, Linux, or macOS             |
| Software         | Git and a text editor                |
| Repository       | A non-production practice repository |

## Tasks

### Task 1 - Create the workflow

#### Steps: Create the Workflow

1. Create `.github/workflows`.
2. Add a workflow with `push` for `main`, `workflow_dispatch`, `contents: read`, and one job.
3. Use checkout and `git status --short` steps.

#### Expected Result: Committed Workflow

The committed file is visible in the repository under `.github/workflows`.

### Task 2 - Start and inspect a run

#### Steps: Start and Inspect

1. Open the repository's Actions view.
2. Select the workflow and use the manual dispatch control, or push the workflow branch according to its trigger.
3. Open the job and expand both steps.

#### Expected Result: Successful Run

The run shows a successful job with separate logs for checkout and the status command.

### Task 3 - Record evidence

#### Steps: Record Evidence

1. Record the event, commit, workflow name, job name, and final status.
2. Confirm that no secret or token value appears in the logs.
3. Explain why `contents: read` was sufficient.

#### Expected Result: Run Record

You produce a small, safe run record that another reviewer can understand.

## Validation Checklist

- [ ] The workflow is under `.github/workflows`.
- [ ] The workflow starts from a configured event.
- [ ] The job and both steps complete successfully.
- [ ] Permissions are explicit and read-only.
- [ ] Logs contain no sensitive values.

## Troubleshooting

| Problem                        | Possible Cause                          | Solution                                                        |
| ------------------------------ | --------------------------------------- | --------------------------------------------------------------- |
| Workflow is missing            | File path or commit is wrong.           | Check `.github/workflows` and the branch containing the file.   |
| Manual dispatch is unavailable | The workflow lacks `workflow_dispatch`. | Add the trigger and commit it.                                  |
| Job fails before the command   | YAML or action reference is invalid.    | Read the first failing step and verify indentation and version. |

## Best Practices

- Use a practice repository for the first run.
- Treat logs as potentially visible to collaborators and never print secrets.
- Capture the event and commit when recording evidence.

## Summary

This lab turns a workflow definition into observable evidence: a configured event starts a run, a runner executes steps, and logs show the result.

### Related Content

- Notebook: [Introduction to GitHub Actions](../../notebooks/en/28-introduction-to-github-actions.md)
- Exercise: [Create Your First GitHub Actions Workflow](../../exercises/en/28-create-your-first-github-actions-workflow.md)
- Quiz: [Introduction to GitHub Actions Quiz](../../quizzes/en/28-introduction-to-github-actions-quiz.md)
