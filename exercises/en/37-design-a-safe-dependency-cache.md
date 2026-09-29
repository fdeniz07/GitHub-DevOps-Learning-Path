---
chapter: 37
title: "Design a Safe Dependency Cache"
related_notebook: "GitHub Actions Dependency Caching"
level: Intermediate
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/en/37-github-actions-dependency-caching.md) | [Lab](../../labs/en/37-optimize-a-safe-cache-strategy.md) | [Quiz](../../quizzes/en/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Design a Safe Dependency Cache

## Objective

Create a cache design that improves install time without weakening dependency or secret handling.

## Learning Outcomes

- identify the correct cache path;
- construct an exact key and restore prefix;
- explain why installation still verifies the lockfile.

## Prerequisites

- Completed [GitHub Actions Dependency Caching](../../notebooks/en/37-github-actions-dependency-caching.md).
- A package manager and lockfile in the practice repository.

## Scenario

Dependency installation is slow in a matrix workflow. Cache package downloads for each operating system and lockfile state, while keeping credentials and build output out of the cache.

## Tasks

### Task 1

Write down the package-manager cache path, the lockfile name, and every matrix dimension that can change the cached data.

### Expected Result

The cache scope is based on observed project inputs rather than guesswork.

### Task 2

Create an exact key containing the operating system and lockfile hash, plus a restore prefix for the same operating system and package manager.

### Expected Result

An exact hit is specific, while a fallback remains bounded.

### Task 3

Explain which install command runs after restore and why `.env`, tokens, and generated release files are excluded.

### Expected Result

The design treats the cache as an optimization and protects sensitive data.

## Challenge

Compare cache hit rate and total duration with caching disabled for three runs.

## Self-Assessment

- [ ] My key includes every relevant lockfile.
- [ ] I use a restore prefix intentionally.
- [ ] I can identify unsafe cache contents.

## Common Mistakes

| Mistake                         | Solution                       |
| ------------------------------- | ------------------------------ |
| Ignoring the lockfile           | Hash it in the exact key.      |
| Trusting stale data as complete | Run the normal locked install. |
| Caching secrets                 | Cache only dependency data.    |

## Summary

You designed a bounded cache that supports speed while preserving reproducible installation and security.

### Related Content

- Notebook: [GitHub Actions Dependency Caching](../../notebooks/en/37-github-actions-dependency-caching.md)
- Lab: [Optimize a Safe Cache Strategy](../../labs/en/37-optimize-a-safe-cache-strategy.md)
- Quiz: [Dependency Caching Quiz](../../quizzes/en/37-dependency-caching-quiz.md)
