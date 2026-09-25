---
chapter: 28
title: "Introduction to GitHub Actions"
part: "GitHub Actions"
level: Beginner
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](27-gitlab-devsecops-security-scans-and-compliance.md) | [Exercise](../../exercises/en/28-create-your-first-github-actions-workflow.md) | [Lab](../../labs/en/28-run-a-github-actions-workflow.md) | [Quiz](../../quizzes/en/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- explain what GitHub Actions automates and when it runs;
- distinguish an event, workflow, job, step, and action;
- create the expected `.github/workflows` directory and identify a valid workflow file;
- choose a focused trigger and describe why minimal permissions matter.

## Introduction

GitHub Actions is GitHub's automation platform. It can build software, run tests, scan code, publish packages, and deploy applications in response to repository events or a manual request. Automation makes a repeatable process visible beside the code that it serves.

## Why This Matters

A workflow turns a team rule such as “every pull request must pass the tests” into an executable, reviewable definition. The workflow file lives in the repository, so changes to automation can be reviewed, versioned, and reproduced with the application.

## Key Terms

| Term     | Meaning                                                                                   |
| -------- | ----------------------------------------------------------------------------------------- |
| Action   | A reusable unit of automation, supplied by GitHub, the community, or the repository.      |
| Event    | Something that starts a workflow, such as `push`, `pull_request`, or `workflow_dispatch`. |
| Workflow | A YAML file that describes an automated process.                                          |
| Job      | A group of steps executed together on a runner.                                           |
| Step     | One command or action invocation inside a job.                                            |
| Runner   | The machine that executes a job.                                                          |

## Theory

### Events Start Workflows

An event is the boundary between repository activity and automation. A `push` trigger is useful for validating committed changes. A `pull_request` trigger gives reviewers feedback before a change is merged. `workflow_dispatch` adds an explicit manual button for controlled operations.

### Workflows Live in a Known Directory

GitHub looks for workflow definitions in `.github/workflows`. Files in another directory may be valid YAML but will not be discovered as Actions workflows. Use a descriptive filename ending in `.yml` or `.yaml`.

### Permissions Are Part of the Design

The `permissions` key controls the access granted to the workflow's `GITHUB_TOKEN`. Start with the smallest access required. For a test-only workflow, `contents: read` is often enough. A job that publishes a release needs a deliberately reviewed permission, not a blanket write grant.

## Practical Example

Create `.github/workflows/ci.yml`:

```yaml
name: Continuous Integration

on:
  push:
    branches: [main]
  pull_request:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository
        uses: actions/checkout@v4
      - name: Show the changed workspace
        run: git status --short
```

The `on` map defines three ways to start the workflow. The `check` job runs on a GitHub-hosted runner. Its first step uses a reusable action; its second step runs a shell command. The read-only permission makes the intended access explicit.

## Try It Yourself

1. Create the `.github/workflows` directory in a practice repository.
2. Add the example as `introduction.yml`.
3. Change the branch filter and explain which pushes will start the workflow.
4. Identify which step is an action invocation and which step is a shell command.

## Best Practices

- Keep one workflow focused on one purpose, such as validation or deployment.
- Pin action references to a reviewed major version or stronger immutable reference.
- Declare permissions explicitly and grant only what the workflow needs.
- Give workflows and steps names that explain their observable purpose.

## Common Mistakes

| Mistake                                     | Why it causes problems                                                    | How to avoid it                                                |
| ------------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------------------- |
| Saving the file outside `.github/workflows` | GitHub does not discover it as a workflow.                                | Check the exact directory and file extension.                  |
| Using `write-all` permissions for tests     | A compromised step receives unnecessary access.                           | Start with `contents: read` and add only required permissions. |
| Confusing `run` with `uses`                 | A shell command and a reusable action have different syntax and behavior. | Use `run` for commands and `uses` for actions.                 |
| Triggering every branch unintentionally     | The workflow consumes time and may produce noisy feedback.                | Select events and branch filters deliberately.                 |

## Summary

- GitHub Actions connects repository events to repeatable automation.
- Workflow YAML files belong in `.github/workflows`.
- Workflows contain jobs, jobs contain steps, and steps run commands or actions.
- Explicit, minimal permissions reduce the impact of mistakes or compromise.

### Related Content

- Exercise: [Create Your First GitHub Actions Workflow](../../exercises/en/28-create-your-first-github-actions-workflow.md)
- Lab: [Run a GitHub Actions Workflow](../../labs/en/28-run-a-github-actions-workflow.md)
- Quiz: [Introduction to GitHub Actions Quiz](../../quizzes/en/28-introduction-to-github-actions-quiz.md)
