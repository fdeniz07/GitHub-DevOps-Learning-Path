---
chapter: 22
title: "Plan a Versioned Release"
related_notebook: "Releases, Packages, and Container Registry"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/22-releases-packages-and-container-registry.md) | [Lab](../../labs/en/22-publish-and-consume-a-versioned-package.md) | [Quiz](../../quizzes/en/22-releases-packages-and-container-registry-quiz.md) | [Roadmap](../../ROADMAP.md)

## Plan a Versioned Release

## Objective

Plan a traceable release for a compatible new feature and a bug fix.

## Scenario

Version `1.4.0` is current. Your team adds an optional export format and fixes incorrect dates in exported reports. No public API is removed or changed incompatibly.

## Tasks

### Task 1 - Choose versions

Choose the next version for the feature and the next version for the later fix. Explain why each is a `MINOR` or `PATCH` change.

### Task 2 - Define release evidence

Write a tag name, three release-note entries, and the package or image version that should be published. Make every version match.

### Task 3 - Protect consumption

Describe who owns the registry namespace, who may publish, who may consume, and why a consumer must not rely on `latest`.

## Expected Result

Your plan connects a semantic version, source tag, release notes, immutable registry artifact, and least-privilege access decision.

## Self-Assessment

- [ ] I can distinguish a feature release from a patch release.
- [ ] I can explain the different purposes of a tag and a release.
- [ ] I can name the benefit of an immutable version.

## Related Content

- [Notebook](../../notebooks/en/22-releases-packages-and-container-registry.md)
- [Lab](../../labs/en/22-publish-and-consume-a-versioned-package.md)
- [Quiz](../../quizzes/en/22-releases-packages-and-container-registry-quiz.md)
