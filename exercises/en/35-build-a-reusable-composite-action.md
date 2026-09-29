---
chapter: 35
title: "Build a Reusable Composite Action"
related_notebook: "GitHub Actions Composite Actions"
level: Intermediate
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/35-composite-actions.md) | [Lab](../../labs/en/35-package-a-composite-action.md) | [Quiz](../../quizzes/en/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Build a Reusable Composite Action

## Objective

Create a local composite action with a required input and a useful output.

## Learning Outcomes

- create valid action metadata;
- pass values safely to shell steps;
- consume an action output from a workflow.

## Prerequisites

- Completed [GitHub Actions Composite Actions](../../notebooks/en/35-composite-actions.md).
- A GitHub repository with Actions enabled.
- Familiarity with YAML and shell commands.

## Scenario

Several workflows need to report the project name and working directory in the same format. Implement that repeated behavior once as a local action.

## Tasks

### Task 1

Create `.github/actions/report-project/action.yml` with a required `project` input and a `summary` output. Use `runs.using: composite`.

### Expected Result

The metadata clearly describes the input and maps the public output to a step output.

### Task 2

Add a Bash step that writes a safe summary to `GITHUB_OUTPUT`. Pass the input through an environment variable instead of interpolating it directly into shell syntax.

### Expected Result

The action exposes a predictable output without treating input text as shell code.

### Task 3

Call the action from a workflow, print the output, and inspect the run log for accidental secrets or confusing values.

### Expected Result

The workflow succeeds and later steps can read `${{ steps.report.outputs.summary }}`.

## Challenge

Add an optional `prefix` input with a safe default and test both the default and custom value.

## Self-Assessment

- [ ] I can explain the action metadata contract.
- [ ] I used an explicit shell and safe environment variables.
- [ ] I mapped and consumed an output.

## Common Mistakes

| Mistake                       | Solution                                       |
| ----------------------------- | ---------------------------------------------- |
| Missing `shell` on a run step | Add `shell: bash` or another supported shell.  |
| Using the wrong output id     | Match the output mapping to the step `id`.     |
| Printing sensitive input      | Review logs and keep secrets out of summaries. |

## Summary

You created a focused local action whose input and output form a reusable contract.

### Related Content

- Notebook: [GitHub Actions Composite Actions](../../notebooks/en/35-composite-actions.md)
- Lab: [Package a Composite Action](../../labs/en/35-package-a-composite-action.md)
- Quiz: [Composite Actions Quiz](../../quizzes/en/35-composite-actions-quiz.md)
