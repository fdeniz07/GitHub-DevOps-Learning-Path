---
chapter: 29
title: "Trace a GitHub Actions Workflow"
related_notebook: "GitHub Actions Workflow Anatomy"
level: Beginner
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/29-github-actions-workflow-anatomy.md) | [Lab](../../labs/en/29-review-workflow-execution.md) | [Quiz](../../quizzes/en/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Objective

Trace a workflow from its trigger through jobs and steps, then explain the execution order.

## Learning Outcomes

- map top-level keys to their responsibilities;
- identify a job dependency created by `needs`;
- recognize why separate jobs need separate setup.

## Prerequisites

- Read the Chapter 29 notebook.
- Be able to read basic YAML maps and lists.

## Scenario

Use this workflow as a review exercise:

```yaml
name: Review gate
on:
  pull_request:
    branches: [main]
permissions:
  contents: read
jobs:
  inspect:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: git ls-files
  report:
    needs: inspect
    runs-on: ubuntu-latest
    steps:
      - run: echo "Inspection completed"
```

## Tasks

### Task 1

List the top-level keys and write one sentence describing the purpose of each.

### Expected Result: Top-Level Keys

You identify `name`, `on`, `permissions`, and `jobs` without confusing them with nested keys.

### Task 2

Draw the execution sequence and mark the point where `report` waits for `inspect`.

### Expected Result: Execution Order

You show the event starting `inspect`, its ordered steps, successful completion, and then `report`.

### Task 3

Explain why a checkout in `inspect` does not automatically make files available to `report`.

### Expected Result: Job Isolation

You recognize that jobs normally use separate runners and need their own setup or an explicit artifact transfer.

## Challenge

Add a third job that runs only after `report`, then decide whether it needs checkout and justify your answer.

## Self-Assessment

- [ ] I can read a workflow from the root downward.
- [ ] I know what `needs` connects.
- [ ] I understand job isolation.

## Common Mistakes

| Mistake                                | Solution                                        |
| -------------------------------------- | ----------------------------------------------- |
| Treating `needs` as a step key         | Use it on a job to express job ordering.        |
| Assuming checkout persists across jobs | Repeat setup or pass data explicitly.           |
| Ignoring trigger filters               | Read the event map and branch filters together. |

## Summary

Tracing a workflow means following event, permission, job, runner, dependency, and step relationships in order.

### Related Content

- Notebook: [GitHub Actions Workflow Anatomy](../../notebooks/en/29-github-actions-workflow-anatomy.md)
- Lab: [Review Workflow Execution](../../labs/en/29-review-workflow-execution.md)
- Quiz: [Workflow Anatomy Quiz](../../quizzes/en/29-workflow-anatomy-quiz.md)
