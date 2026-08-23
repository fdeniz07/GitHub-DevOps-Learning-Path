---
chapter: 37
title: "GitHub Actions Dependency Caching"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](36-github-actions-matrix-builds.md) | [Exercise](../../exercises/en/37-design-a-safe-dependency-cache.md) | [Lab](../../labs/en/37-optimize-a-safe-cache-strategy.md) | [Quiz](../../quizzes/en/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- explain what dependency caching does and does not guarantee;
- design stable cache keys with useful restore keys;
- avoid stale, cross-branch, or untrusted cache data;
- measure whether caching improves a workflow.

## Introduction

Dependency installation can dominate CI time. A cache stores reusable package-manager data between workflow runs so a later run can avoid downloading unchanged dependencies. A cache is an optimization, not a source of truth: the lockfile and package manager must still verify the dependency set.

## Key Terms

| Term            | Meaning                                                                     |
| --------------- | --------------------------------------------------------------------------- |
| Cache key       | Exact identifier used to find a saved cache.                                |
| Restore key     | Prefix used to find an older compatible cache when the exact key misses.    |
| Cache path      | Directory containing data that can be reused.                               |
| Cache hit       | A matching cache was restored.                                              |
| Cache poisoning | Untrusted data is inserted into a cache and later consumed as trusted data. |

## Theory

### Key Design

A useful key includes the operating system, runtime, dependency manager, and a hash of the lockfile. For a matrix job, include the matrix dimensions that change the cache contents. Example:

```yaml
key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
restore-keys: |
  ${{ runner.os }}-npm-
```

The exact key gives a precise hit. The restore prefix may return an older cache, which can save time but must not bypass a fresh install or lockfile verification.

### Safe Cache Contents

Cache package-manager download data when possible. Avoid caching credentials, generated secrets, deployment outputs, or arbitrary workspace state. Do not use a cache as a mechanism for passing data from one job to another; job boundaries should use artifacts or explicit outputs.

### Example with Setup Action

Many setup actions provide a package-manager cache option:

```yaml
- uses: actions/setup-node@v4
  with:
    node-version: 22
    cache: npm
- run: npm ci
```

The setup action derives a cache path and lockfile key for the package manager. The install command remains authoritative and should use a lockfile-enforcing mode such as `npm ci`.

For explicit control, use the cache action:

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.cache/pip
    key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.lock') }}
    restore-keys: |
      ${{ runner.os }}-pip-
- run: python -m pip install -r requirements.lock
```

### Cache Safety and Scope

Caches are shared according to platform rules and key scope. A pull request from an untrusted fork should not be able to write data that a privileged workflow later trusts. Never restore a cache into a location that can override executable source, action code, or credentials. For sensitive workflows, use narrow keys, trusted branches, or no cache.

## Best Practices

- Hash every lockfile that controls the cached dependency set.
- Include matrix dimensions when they affect the cache.
- Install from the lockfile after restoring any cache.
- Cache downloads instead of secrets or build outputs unless the risk is understood.
- Compare hit rates and duration before keeping a cache.

## Common Mistakes

| Mistake                              | Risk                                     | Correction                                  |
| ------------------------------------ | ---------------------------------------- | ------------------------------------------- |
| Keying only by operating system      | Incompatible dependencies can be reused. | Hash lockfiles and include runtime details. |
| Treating restore-key data as current | Stale packages may be assumed complete.  | Run the normal lockfile install.            |
| Caching `.env` or credentials        | Secrets can persist in shared storage.   | Exclude sensitive paths.                    |
| Using cache to cross a job boundary  | Data flow becomes opaque and unsafe.     | Use artifacts or job outputs.               |

## Summary

Caching reduces repeated downloads, but package installation and lockfile verification remain the source of truth. Exact keys provide correctness; restore keys provide a controlled fallback. Cache only data that is safe to reuse.

### Related Content

- Previous chapter: [Matrix Builds](36-github-actions-matrix-builds.md)
- Exercise: [Design a Safe Dependency Cache](../../exercises/en/37-design-a-safe-dependency-cache.md)
- Lab: [Optimize a Safe Cache Strategy](../../labs/en/37-optimize-a-safe-cache-strategy.md)
- Quiz: [Dependency Caching Quiz](../../quizzes/en/37-dependency-caching-quiz.md)
