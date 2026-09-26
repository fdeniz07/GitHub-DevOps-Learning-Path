---
chapter: 29
title: "Workflow Anatomy Quiz"
related_notebook: "GitHub Actions Workflow Anatomy"
related_exercise: "Trace a GitHub Actions Workflow"
related_lab: "Review Workflow Execution"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/29-github-actions-workflow-anatomy.md) | [Exercise](../../exercises/en/29-trace-a-github-actions-workflow.md) | [Lab](../../labs/en/29-review-workflow-execution.md) | [Roadmap](../../ROADMAP.md)

## Purpose

Check whether you can read a workflow from its trigger through jobs and steps.

## Questions

### Question 1

Which key contains the units of work in a workflow?

- A. `steps`
- B. `jobs`
- C. `runs-on`
- D. `permissions`

**Answer:** B. `jobs`

### Question 2

What does `needs: inspect` express?

- A. A step named `inspect` in the same job
- B. A dependency on the `inspect` job
- C. A runner label
- D. A trigger filter

**Answer:** B. A dependency on the `inspect` job.

### Question 3

True or False: Steps in one job normally run in order.

**Answer:** True.

### Question 4

True or False: A checkout performed in one job automatically makes files available in every other job.

**Answer:** False. Jobs normally use separate runners.

### Question 5

Why are trigger filters important?

**Expected Answer:** They define which repository changes or events start automation, reducing noise while setting a deliberate validation boundary.

### Question 6

### Practical Scenario

The `report` job starts before `inspect` finishes. What should you look for?

**Expected Answer:** Check whether `report` declares `needs: inspect`; without a dependency, independent jobs may run in parallel.

## Review Checklist

- [ ] I can identify top-level workflow keys.
- [ ] I understand job dependencies and isolation.
- [ ] I can trace a run from event to step.

### Related Content

- Notebook: [GitHub Actions Workflow Anatomy](../../notebooks/en/29-github-actions-workflow-anatomy.md)
- Exercise: [Trace a GitHub Actions Workflow](../../exercises/en/29-trace-a-github-actions-workflow.md)
- Lab: [Review Workflow Execution](../../labs/en/29-review-workflow-execution.md)
