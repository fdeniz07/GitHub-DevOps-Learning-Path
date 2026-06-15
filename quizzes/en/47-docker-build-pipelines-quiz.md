---
chapter: 47
title: "Docker Build Pipelines Quiz"
related_notebook: "Reproducible Docker Build Pipelines"
related_exercise: "Design a Docker Build Pipeline"
related_lab: "Run a Docker Build Pipeline"
level: Intermediate
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/47-docker-build-pipelines.md) | [Exercise](../../exercises/en/47-design-a-docker-build-pipeline.md) | [Lab](../../labs/en/47-run-a-docker-build-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Docker Build Pipelines Quiz

## Learning Objectives

- Design reproducible and cacheable Docker builds.
- Use multi-stage builds and scan the final image.
- Gate publication on tests and security evidence.

## Questions

### Question 1

What is the main benefit of a multi-stage Dockerfile?

- A. It guarantees no vulnerabilities
- B. It keeps build tools out of the runtime image
- C. It removes the need for tests
- D. It makes tags immutable

**Answer:** B. Build and runtime concerns are separated.

### Question 2

Why should a dependency lock file influence the cache key?

**Answer:** A dependency change must invalidate the cached restore step so the image uses the declared versions.

### Question 3

True or false: Scanning source dependencies alone proves that the final container is safe.

**Answer:** False. The final image also contains base operating system packages and runtime files.

### Question 4

Name two useful build evidence artifacts.

**Expected Answer:** Examples include test logs, a vulnerability scan report, an SBOM, provenance metadata, and the source commit identifier.

### Question 5

When should a protected registry publish job run?

**Answer:** After tests, image checks, and scan policy gates pass, and only in a context that can safely access publication credentials.

### Question 6

Why is `latest` a poor deployment identity?

**Expected Answer:** It is mutable and may refer to different bytes over time. Use a commit tag for traceability and a digest for deployment.

## Practical Scenario

A pipeline builds an image from a floating base tag, runs tests on source code, scans only the repository, and pushes before the scan job. Identify the four most important changes.

**Expected Answer:** Control or pin the base input, test the final image, scan the final runtime image, and make publication depend on successful tests and scan policy. Record the commit and image digest.

## Review Checklist

- [ ] I understand multi-stage builds.
- [ ] I can explain cache invalidation.
- [ ] I can scan the final image.
- [ ] I can place publication after quality gates.
- [ ] I can name reproducibility evidence.

## Related Links

- Notebook: [Reproducible Docker Build Pipelines](../../notebooks/en/47-docker-build-pipelines.md)
- Exercise: [Design a Docker build pipeline](../../exercises/en/47-design-a-docker-build-pipeline.md)
- Lab: [Run a Docker build pipeline](../../labs/en/47-run-a-docker-build-pipeline.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
