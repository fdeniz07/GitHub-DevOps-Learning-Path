---
chapter: 37
title: "Optimize a Safe Cache Strategy"
related_notebook: "GitHub Actions Dependency Caching"
related_exercise: "Design a Safe Dependency Cache"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/en/37-github-actions-dependency-caching.md) | [Exercise](../../exercises/en/37-design-a-safe-dependency-cache.md) | [Quiz](../../quizzes/en/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Optimize a Safe Cache Strategy

## Objective

Measure and improve dependency installation time while preserving reproducibility and cache safety.

## Learning Outcomes

- identify cacheable dependency data;
- construct and test a key and restore prefix;
- detect unsafe or ineffective caching.

## Scenario

Your matrix workflow installs the same dependencies repeatedly. Add package-manager caching, compare runs, and verify that a changed lockfile invalidates the exact key.

## Prerequisites

- Completed the related notebook and exercise.
- A lockfile and repeatable dependency install command.
- Permission to run the workflow several times.

## Environment Setup

| Requirement      | Value                                        |
| ---------------- | -------------------------------------------- |
| Operating System | GitHub-hosted runner used by the project     |
| Software         | Project package manager and GitHub Actions   |
| Version          | Versions declared by the repository lockfile |

## Tasks

### Task 1 — Baseline

1. Run the workflow without a cache.
2. Record install duration and dependency command.
3. Identify paths that must not be cached.

**Expected Result:** You have a measurable baseline and a data classification.

### Task 2 — Add the Cache

1. Cache the package-manager download directory.
2. Key it by runner system and lockfile hash.
3. Add a same-system restore prefix.

**Expected Result:** The cache is scoped to compatible inputs and misses after lockfile changes.

### Task 3 — Verify Safety and Benefit

1. Run the workflow twice and compare hit status and duration.
2. Change the lockfile in a controlled branch and run again.
3. Confirm the locked install still executes and no secret path is cached.

**Expected Result:** The cache improves repeated runs without becoming the dependency source of truth.

## Validation Checklist

- [ ] Cache path contains dependency data only.
- [ ] Exact key includes all relevant lockfiles.
- [ ] Restore key is intentionally broad but bounded.
- [ ] Locked installation runs after restore.
- [ ] Results show whether caching helped.

## Troubleshooting

| Problem                | Possible Cause               | Solution                                        |
| ---------------------- | ---------------------------- | ----------------------------------------------- |
| Every run misses       | Key changes unexpectedly     | Inspect lockfile paths and matrix values.       |
| Install still fails    | Cache is incomplete or stale | Keep the normal locked install.                 |
| Sensitive files appear | Cache path is too broad      | Narrow the path and rotate exposed credentials. |

## Best Practices

- Keep a baseline before optimizing.
- Prefer setup-action caching when it matches the package manager.
- Remove a cache that adds complexity without measurable benefit.

## Summary

You evaluated caching as a measurable optimization and kept reproducible installation in control.

### Related Content

- Notebook: [GitHub Actions Dependency Caching](../../notebooks/en/37-github-actions-dependency-caching.md)
- Exercise: [Design a Safe Dependency Cache](../../exercises/en/37-design-a-safe-dependency-cache.md)
- Quiz: [Dependency Caching Quiz](../../quizzes/en/37-dependency-caching-quiz.md)
