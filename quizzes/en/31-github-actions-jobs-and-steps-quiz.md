---
chapter: 31
title: "GitHub Actions Jobs and Steps Quiz"
related_notebook: "GitHub Actions Jobs and Steps"
related_exercise: "Design GitHub Actions Jobs and Steps"
related_lab: "Build a Job Dependency Workflow"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/30-yaml-fundamentals.md) | [Notebook](../../notebooks/en/31-github-actions-jobs-and-steps.md) | [Exercise](../../exercises/en/31-design-github-actions-jobs-and-steps.md) | [Lab](../../labs/en/31-build-a-job-dependency-workflow.md) | [Roadmap](../../ROADMAP.md)

# GitHub Actions Jobs and Steps Quiz

### Question 1

What does `needs` express?

**Answer:** A job dependency that controls ordering and whether a dependent job can run.

### Question 2

Where should a step write a value intended to become an output?

**Answer:** To the `$GITHUB_OUTPUT` file, using a step `id` so it can be mapped to a job output.

### Question 3

True or False: Jobs run sequentially because they appear in YAML order.

**Answer:** False. Jobs without dependencies may run in parallel.

### Question 4

Why should secrets not be passed as ordinary job outputs?

**Answer:** Outputs are not designed as secret transport and may be exposed through workflow metadata or logs.

### Related Content

- Notebook: [GitHub Actions Jobs and Steps](../../notebooks/en/31-github-actions-jobs-and-steps.md)
- Exercise: [Design GitHub Actions Jobs and Steps](../../exercises/en/31-design-github-actions-jobs-and-steps.md)
- Lab: [Build a Job Dependency Workflow](../../labs/en/31-build-a-job-dependency-workflow.md)
