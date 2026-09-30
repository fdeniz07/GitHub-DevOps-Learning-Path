---
chapter: 47
title: "Design a Docker Build Pipeline"
related_notebook: "Reproducible Docker Build Pipelines"
level: Intermediate
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/47-docker-build-pipelines.md) | [Lab](../../labs/en/47-run-a-docker-build-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Design a Docker Build Pipeline

## Objective

Design a CI workflow that builds, tests, scans, and publishes one reproducible Docker image.

## Outcomes

- Place build, test, scan, and publish stages in a safe order.
- Choose cache inputs and immutable image identifiers.
- Define a vulnerability policy and an exception record.

## Prerequisites

- Read [Reproducible Docker Build Pipelines](../../notebooks/en/47-docker-build-pipelines.md).
- Understand Dockerfiles, lock files, CI jobs, and registry authentication.
- Have access to a CI platform or a YAML editor.

## Scenario

A team currently publishes an image before tests finish and uses `latest` for deployments. Redesign the workflow so the final image is tested and scanned before publication.

## Tasks

### Task 1 - Map pipeline stages

Draw or list checkout, dependency restore, unit tests, image build, image test, vulnerability scan, SBOM generation, and publish stages.

**Expected Result:** Every stage has a reason and a dependency on earlier evidence.

### Task 2 - Define reproducible inputs

Specify the lock file, base image policy, commit tag, build context, and cache key. State which changes invalidate the dependency cache.

**Expected Result:** A reviewer can identify when two builds should produce different output.

### Task 3 - Add quality gates

Write a workflow fragment that fails on agreed `HIGH` and `CRITICAL` findings and publishes only the image tagged with the reviewed commit.

**Expected Result:** Pull request code cannot use production publishing credentials, and failed scans cannot be promoted.

## Challenge

Add provenance and SBOM artifacts to the workflow and describe how a release reviewer would connect them to the image digest.

## Self-Assessment

- [ ] I can explain why multi-stage builds reduce runtime contents.
- [ ] I can distinguish a cache optimization from a security gate.
- [ ] I can scan the final runtime image.
- [ ] I can prevent publication before tests pass.

## Common Mistakes

| Mistake                                        | Solution                                      |
| ---------------------------------------------- | --------------------------------------------- |
| Reusing `latest` as the release identity       | Tag with the commit and deploy by digest.     |
| Scanning only source files                     | Scan the final image including base packages. |
| Sharing publish credentials with pull requests | Isolate protected publication jobs.           |

## Summary

A Docker build pipeline should create evidence in order and publish only a tested, scanned, traceable image.

## Related Links

- Notebook: [Reproducible Docker Build Pipelines](../../notebooks/en/47-docker-build-pipelines.md)
- Lab: [Run a Docker build pipeline](../../labs/en/47-run-a-docker-build-pipeline.md)
- Quiz: [Docker build pipelines quiz](../../quizzes/en/47-docker-build-pipelines-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
