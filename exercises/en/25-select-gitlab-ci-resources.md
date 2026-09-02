---
chapter: 25
title: "Select GitLab CI Resources"
related_notebook: "Runners, Variables, Caching & Artifacts"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md) | [Lab](../../labs/en/25-improve-a-gitlab-ci-pipeline.md) | [Quiz](../../quizzes/en/25-gitlab-runners-variables-caching-and-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Select GitLab CI Resources

## Objective

Choose safe runner, variable, cache, and artifact settings for a small web project.

## Scenario

A Node.js project has lint, test, build, and private deployment jobs. The build produces `dist/`; package downloads are reusable; a deployment token must never be visible to merge-request pipelines from untrusted branches.

## Tasks

### Task 1

Choose runners for the verify jobs and the private deployment job. Explain the different trust requirements.

**Expected Result:** Verify jobs use an eligible general runner; deployment uses a protected trusted runner.

### Task 2

Classify `NODE_ENV`, a deployment token, `.npm/`, and `dist/` as a visible variable, protected masked variable, cache, or artifact.

**Expected Result:** You can explain why a cache is not a replacement for a build artifact.

### Task 3

Design a cache key that changes with `package-lock.json`, and choose a seven-day artifact retention period.

**Expected Result:** Dependency changes invalidate reuse while build output remains available long enough for review.

## Self-Assessment

- [ ] I can identify the runner trust boundary.
- [ ] I never print sensitive variables in logs.
- [ ] I can choose cache or artifact by purpose.

## Summary

Runner selection, secret handling, cache design, and artifact retention should each be intentional.

### Related Content

- Notebook: [Runners, Variables, Caching & Artifacts](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md)
- Lab: [Improve a GitLab CI Pipeline](../../labs/en/25-improve-a-gitlab-ci-pipeline.md)
- Quiz: [Runners, Variables, Caching & Artifacts Quiz](../../quizzes/en/25-gitlab-runners-variables-caching-and-artifacts-quiz.md)
