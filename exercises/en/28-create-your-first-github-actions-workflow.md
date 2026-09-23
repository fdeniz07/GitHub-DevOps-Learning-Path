---
chapter: 28
title: "Create Your First GitHub Actions Workflow"
related_notebook: "Introduction to GitHub Actions"
level: Beginner
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/28-introduction-to-github-actions.md) | [Lab](../../labs/en/28-run-a-github-actions-workflow.md) | [Quiz](../../quizzes/en/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Objective

Create a small, readable workflow that responds to a push and can also be started manually.

## Learning Outcomes

- identify the required `.github/workflows` location;
- configure an event and read-only contents permission;
- distinguish an action step from a shell-command step.

## Prerequisites

- Read the Chapter 28 notebook.
- Have a practice GitHub repository and permission to add files.
- Know how to create a branch and commit a file.

## Scenario

You maintain a small repository and want a visible first check whenever code reaches `main`. The check does not build or deploy anything yet; it proves that the repository can start an Actions workflow safely.

## Tasks

### Task 1

Create `.github/workflows/first-check.yml` with a descriptive `name`, a `push` trigger for `main`, and `workflow_dispatch`.

### Expected Result: Workflow Location

The file is inside the exact directory GitHub scans and contains valid YAML structure.

### Task 2

Add `permissions: contents: read` and one job on `ubuntu-latest`. Add a checkout step using `actions/checkout@v4` and a second step that runs `git status --short`.

### Expected Result: Job Definition

The workflow clearly separates reusable action syntax from a shell command and requests no broad write access.

### Task 3

Commit the workflow on a branch, open a pull request, and explain which configured event started each run.

### Expected Result: Run Explanation

You can connect the visible run to its event and describe why the permission is sufficient.

## Challenge

Add a branch filter for a second protected branch without granting additional permissions. Explain how the filter changes the workflow's behavior.

## Self-Assessment

- [ ] The file is under `.github/workflows`.
- [ ] I can explain every trigger in the file.
- [ ] I used `contents: read` rather than broad write access.
- [ ] I can distinguish `uses` from `run`.

## Common Mistakes

| Mistake                                 | Solution                                            |
| --------------------------------------- | --------------------------------------------------- |
| The workflow does not appear in Actions | Check the directory and committed branch.           |
| YAML parser error                       | Inspect indentation and use spaces, not tabs.       |
| Excessive token access                  | Declare only the permission required for the check. |

## Summary

- A useful first workflow is small, visible, and read-only.
- Event selection and file placement determine whether GitHub discovers and starts it.

### Related Content

- Notebook: [Introduction to GitHub Actions](../../notebooks/en/28-introduction-to-github-actions.md)
- Lab: [Run a GitHub Actions Workflow](../../labs/en/28-run-a-github-actions-workflow.md)
- Quiz: [Introduction to GitHub Actions Quiz](../../quizzes/en/28-introduction-to-github-actions-quiz.md)
