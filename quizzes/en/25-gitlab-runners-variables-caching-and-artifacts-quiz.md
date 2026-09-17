---
chapter: 25
title: "Runners, Variables, Caching & Artifacts Quiz"
related_notebook: "Runners, Variables, Caching & Artifacts"
related_exercise: "Select GitLab CI Resources"
related_lab: "Improve a GitLab CI Pipeline"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md) | [Exercise](../../exercises/en/25-select-gitlab-ci-resources.md) | [Lab](../../labs/en/25-improve-a-gitlab-ci-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Runners, Variables, Caching & Artifacts Quiz

## Multiple Choice

### Question 1

Which item should normally be an artifact?

- A. A downloaded npm package cache
- B. The `dist/` output produced by a specific build
- C. A deployment token
- D. A runner tag

**Answer:** B. Artifacts preserve named job output; caches speed up reproducible inputs.

### Question 2

What is a runner's most important security implication?

- A. It only formats YAML.
- B. It executes job code and is a trust boundary.
- C. It replaces GitLab roles.
- D. It stores all artifacts forever.

**Answer:** B. Select trusted, protected runners for sensitive jobs.

## True or False

### Question 3

It is safe to use `echo $DEPLOY_TOKEN` when a variable is masked.

**Answer:** False. Do not intentionally print sensitive variables.

### Question 4

A cache miss must fail a correct dependency-install job.

**Answer:** False. A miss can download the dependencies again.

## Short Answer

### Question 5

Why should a cache key include a dependency lockfile?

**Expected Answer:** It changes cache reuse when dependency definitions change.

### Scenario

A build job says no files matched `dist/` for its artifact.

**Expected Answer:** Inspect the build output and correct the relative artifact path; do not replace the artifact with a cache.

### Related Content

- Notebook: [Runners, Variables, Caching & Artifacts](../../notebooks/en/25-gitlab-runners-variables-caching-and-artifacts.md)
- Exercise: [Select GitLab CI Resources](../../exercises/en/25-select-gitlab-ci-resources.md)
- Lab: [Improve a GitLab CI Pipeline](../../labs/en/25-improve-a-gitlab-ci-pipeline.md)
