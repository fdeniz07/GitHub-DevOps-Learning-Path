---
chapter: 37
title: "Dependency Caching Quiz"
related_notebook: "GitHub Actions Dependency Caching"
related_exercise: "Design a Safe Dependency Cache"
related_lab: "Optimize a Safe Cache Strategy"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/en/37-github-actions-dependency-caching.md) | [Exercise](../../exercises/en/37-design-a-safe-dependency-cache.md) | [Lab](../../labs/en/37-optimize-a-safe-cache-strategy.md) | [Roadmap](../../ROADMAP.md)

# Dependency Caching Quiz

## Learning Objectives

- design exact and fallback keys;
- distinguish caches from artifacts;
- recognize cache safety risks.

## Questions

### Question 1

What should normally change a dependency cache key?

- A. The workflow author's name
- B. The lockfile contents
- C. The current clock minute
- D. The issue number

**Answer:** B. The lockfile contents.

### Question 2

What is the purpose of a restore key?

**Expected Answer:** It provides a bounded prefix fallback when an exact cache key misses.

### Question 3

True or False: A cache replaces the package manager's lockfile verification.

**Answer:** False. The normal locked install remains authoritative.

### Question 4

Which content should not be cached by default?

- A. Public package downloads
- B. A package-manager download directory
- C. Credentials and `.env` files
- D. A lockfile hash

**Answer:** C. Credentials and `.env` files.

### Question 5

Why should matrix dimensions sometimes appear in a cache key?

**Expected Answer:** Different operating systems or runtimes may produce incompatible cached data.

## Practical Scenario

A cache restores successfully, but the lockfile install fails. Should the workflow trust the cache?

**Expected Answer:** No. Investigate the cache path and key, but keep the locked install as the source of truth and rebuild or miss the cache if necessary.

## Review Checklist

- [ ] I can build a key from relevant inputs.
- [ ] I understand restore-key staleness.
- [ ] I can identify sensitive cache contents.

### Related Content

- Previous chapter: [Matrix Builds](../../notebooks/en/36-github-actions-matrix-builds.md)
- Notebook: [GitHub Actions Dependency Caching](../../notebooks/en/37-github-actions-dependency-caching.md)
- Exercise: [Design a Safe Dependency Cache](../../exercises/en/37-design-a-safe-dependency-cache.md)
- Lab: [Optimize a Safe Cache Strategy](../../labs/en/37-optimize-a-safe-cache-strategy.md)
