---
chapter: 48
title: "Container Registries Quiz"
related_notebook: "Container Registries, Tags, Digests, and Authentication"
related_exercise: "Publish an Image to a Container Registry"
related_lab: "Push and Scan a Container Image"
level: Intermediate
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/48-container-registries.md) | [Exercise](../../exercises/en/48-publish-an-image-to-a-container-registry.md) | [Lab](../../labs/en/48-push-and-scan-a-container-image.md) | [Roadmap](../../ROADMAP.md)

# Container Registries Quiz

## Learning Objectives

- Distinguish tags, manifests, and digests.
- Apply least-privilege registry authentication.
- Connect scanning, retention, and deployment identity.

## Questions

### Question 1

Which reference identifies exact image content?

- A. `service:latest`
- B. `service:release`
- C. `service@sha256:...`
- D. `service:branch-main`

**Answer:** C. A digest is content-addressed and immutable for that manifest.

### Question 2

What is a tag?

**Expected Answer:** A human-readable pointer to an image manifest. It is convenient but may be moved unless registry policy prevents overwrites.

### Question 3

True or false: A deployment identity usually needs permission to push new images.

**Answer:** False. A deployment identity commonly needs pull access; publishing belongs to a separate build identity.

### Question 4

Why should registry credentials not be passed in a Dockerfile?

**Answer:** Dockerfile content and image layers may be retained and inspected. Credentials should be supplied through protected authentication mechanisms.

### Question 5

Name two reasons to retain older image versions.

**Expected Answer:** Rollback, disaster recovery, incident investigation, compliance evidence, and reproducibility.

### Question 6

What should a release record contain besides a readable version tag?

**Expected Answer:** The image digest, source commit, scan result, build run, approval, and deployment environment.

## Practical Scenario

A production deployment uses `registry.example.com/team/api:stable`, while a second pipeline can overwrite `stable`. Propose a correction.

**Expected Answer:** Resolve the scanned image to its digest and deploy by `api@sha256:...`. Keep `stable` as a discovery tag if useful, but protect it and record the digest. Separate overwrite-capable publishing access from pull-only deployment access.

## Review Checklist

- [ ] I can explain why tags move.
- [ ] I can deploy by digest.
- [ ] I can separate push and pull permissions.
- [ ] I can define retention needs.
- [ ] I can describe registry audit evidence.

## Related Links

- Notebook: [Container Registries](../../notebooks/en/48-container-registries.md)
- Exercise: [Publish an image to a container registry](../../exercises/en/48-publish-an-image-to-a-container-registry.md)
- Lab: [Push and scan a container image](../../labs/en/48-push-and-scan-a-container-image.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
