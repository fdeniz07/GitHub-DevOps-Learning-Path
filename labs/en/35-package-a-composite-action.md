---
chapter: 35
title: "Package a Composite Action"
related_notebook: "GitHub Actions Composite Actions"
related_exercise: "Build a Reusable Composite Action"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/35-composite-actions.md) | [Exercise](../../exercises/en/35-build-a-reusable-composite-action.md) | [Quiz](../../quizzes/en/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Package a Composite Action

## Objective

Turn repeated repository validation steps into a local composite action with a documented contract.

## Learning Outcomes

- organize action metadata and implementation;
- validate required input and expose output;
- call the action from a workflow with appropriate permissions.

## Scenario

Two workflows repeat checkout-independent checks: they validate a directory, count files, and report the result. Build one action that accepts a directory and returns the count.

## Prerequisites

- Completed the related notebook and exercise.
- GitHub Actions enabled in a practice repository.
- A directory that can be checked safely.

## Environment Setup

| Requirement      | Value                                       |
| ---------------- | ------------------------------------------- |
| Operating System | Any supported GitHub Actions runner         |
| Software         | Git, a text editor, and a GitHub repository |
| Version          | Current repository-supported versions       |

## Tasks

### Task 1 — Define the Contract

1. Create `.github/actions/count-files/action.yml`.
2. Declare a required `directory` input and a `count` output.
3. Add descriptions that tell a workflow author how to use both values.

**Expected Result:** The metadata is understandable without reading the implementation.

### Task 2 — Implement Safe Steps

1. Validate that the directory exists.
2. Count files using a quoted environment variable.
3. Write the result to `GITHUB_OUTPUT`.

**Expected Result:** Invalid input fails clearly, and valid input produces a numeric output.

### Task 3 — Integrate and Review

1. Call the action from a workflow.
2. Print the output in a later step.
3. Review permissions and logs for unnecessary exposure.

**Expected Result:** The action works from a caller and does not print sensitive data.

## Validation Checklist

- [ ] Every `run` step declares a shell.
- [ ] The action uses a required input and public output.
- [ ] The workflow reads the output through the caller step id.
- [ ] Invalid directories fail with a useful message.

## Troubleshooting

| Problem             | Possible Cause               | Solution                                          |
| ------------------- | ---------------------------- | ------------------------------------------------- |
| Output is empty     | Wrong step id or output file | Check the output mapping and `GITHUB_OUTPUT`.     |
| Action is not found | Incorrect relative path      | Call the exact `.github/actions/...` path.        |
| Shell error         | Unquoted input or path       | Pass input through a quoted environment variable. |

## Best Practices

- Keep one clear responsibility per action.
- Review action changes like workflow code.
- Avoid secrets in outputs and logs.

## Summary

The action now provides a reusable, testable interface for repository validation.

### Related Content

- Notebook: [GitHub Actions Composite Actions](../../notebooks/en/35-composite-actions.md)
- Exercise: [Build a Reusable Composite Action](../../exercises/en/35-build-a-reusable-composite-action.md)
- Quiz: [Composite Actions Quiz](../../quizzes/en/35-composite-actions-quiz.md)
