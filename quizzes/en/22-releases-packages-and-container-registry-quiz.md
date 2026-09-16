---
chapter: 22
title: "Releases, Packages, and Container Registry Quiz"
related_notebook: "Releases, Packages, and Container Registry"
related_exercise: "Plan a Versioned Release"
related_lab: "Publish and Consume a Versioned Package"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/22-releases-packages-and-container-registry.md) | [Exercise](../../exercises/en/22-plan-a-versioned-release.md) | [Lab](../../labs/en/22-publish-and-consume-a-versioned-package.md) | [Roadmap](../../ROADMAP.md)

## Releases, Packages, and Container Registry Quiz

### Question 1

What does the `MINOR` number usually signal in `2.3.1`?

- A. A breaking public change
- B. A backward-compatible new feature
- C. A replaced artifact
- D. A private credential

**Answer:** B. A minor version communicates a compatible new capability.

### Question 2

Which statement best distinguishes a tag from a release?

- A. A tag marks a commit; a release communicates a publishable version and its notes.
- B. A release changes source code; a tag stores a container image.
- C. They always have unrelated versions.

**Answer:** A. The release record adds delivery context to the tagged source.

### Question 3

True or false: It is safe to rebuild and overwrite `1.2.0` when a defect is found.

**Answer:** False. Preserve the immutable version and publish a new patch, such as `1.2.1`.

### Question 4

Why should a production consumer prefer a specific image version or digest over `latest`?

**Answer:** A fixed reference makes the deployed artifact repeatable and reviewable.

### Question 5

Who should be granted registry publishing access?

**Answer:** Only the responsible owner or approved automation that needs it; readers should receive read-only access where possible.

## Related Content

- [Notebook](../../notebooks/en/22-releases-packages-and-container-registry.md)
- [Exercise](../../exercises/en/22-plan-a-versioned-release.md)
- [Lab](../../labs/en/22-publish-and-consume-a-versioned-package.md)
