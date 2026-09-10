---
chapter: 31
title: "GitHub Actions Jobs and Steps"
part: "GitHub Actions"
level: Beginner
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](30-yaml-fundamentals.md) | [Exercise](../../exercises/en/31-design-github-actions-jobs-and-steps.md) | [Lab](../../labs/en/31-build-a-job-dependency-workflow.md) | [Quiz](../../quizzes/en/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- distinguish a workflow, job, step, action, and shell command;
- design jobs with explicit dependencies, conditions, and least-privilege outputs;
- pass data between jobs safely and choose the right step boundaries.

## Introduction

GitHub Actions workflows are made of jobs, and jobs are made of steps. A useful design makes the execution graph visible: independent work can run in parallel, while dependent work starts only after its prerequisite succeeds.

## Key Terms

| Term       | Definition                                                      |
| ---------- | --------------------------------------------------------------- |
| Workflow   | A YAML-defined automation process triggered by an event.        |
| Job        | A group of steps executed on one runner.                        |
| Step       | One command or reusable action invocation in a job.             |
| `needs`    | A dependency that controls job ordering and success conditions. |
| Job output | Named data exposed by one job to jobs that depend on it.        |

## Theory

### Jobs Form a Directed Graph

Jobs without `needs` are eligible to start together. A job with `needs: build` waits for `build`. Use `if: ${{ always() }}` only when a cleanup or reporting job must run after a failure; otherwise, allow failed prerequisites to stop dependent work.

### Steps Share a Runner

Steps in one job share the workspace and runner filesystem. This makes checkout, setup, build, and test a natural sequence. A new job provides isolation and a fresh runner, but files must then move through artifacts, caches, or explicit outputs.

### Outputs and Dependencies

Step outputs are written through the runner's output file and mapped to job outputs. A dependent job reads them through `needs.<job-id>.outputs.<name>`. Outputs should contain small, non-sensitive values such as a version or deployment target. Never use outputs as a place to transport secrets.

## Practical Example

```yaml
name: Build and verify

on:
  push:
    branches: [main]

jobs:
  prepare:
    runs-on: ubuntu-latest
    outputs:
      image_tag: ${{ steps.version.outputs.image_tag }}
    steps:
      - id: version
        name: Create image tag
        run: echo "image_tag=${GITHUB_SHA::12}" >> "$GITHUB_OUTPUT"

  verify:
    needs: prepare
    runs-on: ubuntu-latest
    steps:
      - name: Show the selected tag
        run: echo "Testing ${{ needs.prepare.outputs.image_tag }}"

  publish:
    needs: [prepare, verify]
    runs-on: ubuntu-latest
    steps:
      - name: Publish only after verification
        run: echo "Publishing ${{ needs.prepare.outputs.image_tag }}"
```

`prepare` creates a small output, `verify` consumes it, and `publish` depends on both jobs. The graph documents the release gate instead of relying on accidental YAML order.

## Best Practices

- Give jobs and steps names that explain their purpose.
- Use `needs` for real dependencies and keep unrelated jobs parallel.
- Keep job outputs small, deliberate, and free of secrets.
- Pin permissions at workflow or job level and grant only what is required.
- Separate build, verification, and publishing responsibilities.

## Common Mistakes

| Mistake                                  | Why it causes problems                  | How to avoid it                                    |
| ---------------------------------------- | --------------------------------------- | -------------------------------------------------- |
| Assuming YAML order creates dependencies | Jobs may run in parallel.               | Declare `needs` explicitly.                        |
| Writing a value to the wrong output file | Later steps cannot read the value.      | Use `$GITHUB_OUTPUT` and map the step output.      |
| Passing credentials as job outputs       | Outputs may appear in logs or metadata. | Use supported secrets and short-lived credentials. |
| Making every job depend on one setup job | Parallelism and feedback become slower. | Model only genuine dependencies.                   |

## Summary

- A workflow is a graph of jobs, and each job is a sequence of steps.
- `needs` expresses ordering and creates the data path for job outputs.
- Good boundaries improve readability, isolation, security, and parallelism.

### Related Content

- Exercise: [Design GitHub Actions Jobs and Steps](../../exercises/en/31-design-github-actions-jobs-and-steps.md)
- Lab: [Build a Job Dependency Workflow](../../labs/en/31-build-a-job-dependency-workflow.md)
- Quiz: [GitHub Actions Jobs and Steps Quiz](../../quizzes/en/31-github-actions-jobs-and-steps-quiz.md)
