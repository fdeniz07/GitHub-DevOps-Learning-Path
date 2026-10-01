---
chapter: 48
title: "Publish an Image to a Container Registry"
related_notebook: "Container Registries, Tags, Digests, and Authentication"
level: Intermediate
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/48-container-registries.md) | [Lab](../../labs/en/48-push-and-scan-a-container-image.md) | [Roadmap](../../ROADMAP.md)

# Publish an Image to a Container Registry

## Objective

Publish a versioned image with least-privilege authentication and record its immutable digest.

## Outcomes

- Construct a fully qualified registry image reference.
- Use separate push and pull permissions.
- Explain why deployment should use a digest rather than a floating tag.

## Prerequisites

- Read [Container Registries](../../notebooks/en/48-container-registries.md).
- Access to a private test registry.
- Docker installed and a token that is safe for that registry.

## Scenario

A service team needs to publish release `1.4.2` while preserving a commit tag for investigation and rollback. The release must be traceable and must not expose credentials in logs.

## Tasks

### Task 1 - Define references

Choose `registry.example.com/platform/service:1.4.2` and a commit tag such as `git-a1b2c3d`. Document which tag is for people and which identifier is for automation.

**Expected Result:** The release policy clearly separates discovery tags from immutable deployment references.

### Task 2 - Authenticate and push

Use `docker login registry.example.com` with a protected token, tag the local image, and push both tags. Do not place the token in a Dockerfile or shell history.

**Expected Result:** The registry contains both tags and the push identity has no unrelated administrative access.

### Task 3 - Record the digest

Inspect the pushed image, record the repository digest, and pull it by `registry.example.com/platform/service@sha256:...`.

**Expected Result:** A second environment retrieves the exact manifest associated with the release evidence.

## Challenge

Design a retention rule that keeps every production release, the last five rollback candidates, and scan evidence while deleting unreferenced development tags.

## Self-Assessment

- [ ] I can explain tags and digests.
- [ ] I can scope a registry token to the required repository.
- [ ] I can record and deploy by digest.
- [ ] I can describe a rollback retention requirement.

## Common Mistakes

| Mistake                                   | Solution                                   |
| ----------------------------------------- | ------------------------------------------ |
| Overwriting release tags                  | Make release tags immutable by policy.     |
| Sharing an admin token                    | Use repository-scoped push credentials.    |
| Deleting images without rollback analysis | Retain referenced releases and candidates. |

## Summary

Registry publishing is an artifact-control problem: use clear tags, scoped authentication, immutable digests, retention, and audit evidence.

## Related Links

- Notebook: [Container Registries](../../notebooks/en/48-container-registries.md)
- Lab: [Push and scan a container image](../../labs/en/48-push-and-scan-a-container-image.md)
- Quiz: [Container registries quiz](../../quizzes/en/48-container-registries-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
