---
chapter: 25
title: "Improve a GitLab CI Pipeline"
related_notebook: "Runners, Variables, Caching & Artifacts"
related_exercise: "Select GitLab CI Resources"
level: Beginner
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md) | [Exercise](../../exercises/en/25-select-gitlab-ci-resources.md) | [Quiz](../../quizzes/en/25-gitlab-runners-variables-caching-and-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Improve a GitLab CI Pipeline

## Objective

Improve a safe Node.js pipeline by adding a dependency cache and an explicit build artifact without exposing credentials.

## Prerequisites

- Complete the [notebook](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md).
- Use a training project with a `package-lock.json`, test command, and build command.

## Tasks

### Task 1 - Inspect runner eligibility

Check the pending or completed job's runner and tags. Record which runner is eligible; do not change runner registration or secrets.

**Expected Result:** You can explain why the job runs on that runner.

### Task 2 - Add a dependency cache

Add a cache for `.npm/` keyed from `package-lock.json`, then use `npm ci --cache .npm --prefer-offline` in a test job.

**Expected Result:** A cache miss still permits a correct dependency installation.

### Task 3 - Preserve build output

Build to `dist/`, upload `dist/` as an artifact, and set `expire_in: 7 days`. Verify the artifact appears after a successful job.

**Expected Result:** The specific build output can be downloaded without treating the cache as a deliverable.

## Validation Checklist

- [ ] No secret was added to YAML or printed in a log.
- [ ] The cache key references the lockfile.
- [ ] The artifact path exists after the build.
- [ ] Artifact expiry is intentional.

## Troubleshooting

| Problem                 | Solution                                                |
| ----------------------- | ------------------------------------------------------- |
| Job waits for a runner  | Check tags and runner availability.                     |
| No artifact is uploaded | Confirm `dist/` exists and the relative path matches.   |
| Cache is missed         | Continue safely; then review the key if misses persist. |

## Summary

The lab separates reusable dependency data from a durable, reviewable build result.

### Related Content

- Notebook: [Runners, Variables, Caching & Artifacts](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md)
- Exercise: [Select GitLab CI Resources](../../exercises/en/25-select-gitlab-ci-resources.md)
- Quiz: [Runners, Variables, Caching & Artifacts Quiz](../../quizzes/en/25-gitlab-runners-variables-caching-and-artifacts-quiz.md)
