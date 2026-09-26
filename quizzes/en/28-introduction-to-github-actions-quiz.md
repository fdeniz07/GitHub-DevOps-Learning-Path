---
chapter: 28
title: "Introduction to GitHub Actions Quiz"
related_notebook: "Introduction to GitHub Actions"
related_exercise: "Create Your First GitHub Actions Workflow"
related_lab: "Run a GitHub Actions Workflow"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/28-introduction-to-github-actions.md) | [Exercise](../../exercises/en/28-create-your-first-github-actions-workflow.md) | [Lab](../../labs/en/28-run-a-github-actions-workflow.md) | [Roadmap](../../ROADMAP.md)

## Purpose

Check your understanding of GitHub Actions purpose, events, workflow location, and permissions.

## Questions

### Question 1

Where must a repository workflow file be stored?

- A. `.github/workflows`
- B. `.github/actions`
- C. `workflows/.github`
- D. `actions`

**Answer:** A. `.github/workflows`

### Question 2

What is an event?

- A. A machine that executes a job
- B. Something that starts a workflow
- C. A command inside a step
- D. A permission grant

**Answer:** B. Something that starts a workflow.

### Question 3

True or False: `workflow_dispatch` can provide a manual way to start a workflow.

**Answer:** True.

### Question 4

Why should a test-only workflow usually declare minimal permissions?

**Expected Answer:** Minimal permissions reduce the access available to a mistaken or compromised step.

### Question 5

What is the difference between `run` and `uses`?

**Expected Answer:** `run` executes a shell command; `uses` invokes a reusable action.

### Question 6

### Practical Scenario

A workflow exists in the repository root but does not appear in the Actions interface. What should you check first?

**Expected Answer:** Check that the file is committed under `.github/workflows` and has a `.yml` or `.yaml` extension.

## Review Checklist

- [ ] I can explain events and workflows.
- [ ] I know the required workflow directory.
- [ ] I understand why permissions should be minimal.

### Related Content

- Notebook: [Introduction to GitHub Actions](../../notebooks/en/28-introduction-to-github-actions.md)
- Exercise: [Create Your First GitHub Actions Workflow](../../exercises/en/28-create-your-first-github-actions-workflow.md)
- Lab: [Run a GitHub Actions Workflow](../../labs/en/28-run-a-github-actions-workflow.md)
