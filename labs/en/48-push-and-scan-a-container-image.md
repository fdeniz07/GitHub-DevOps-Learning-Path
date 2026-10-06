---
chapter: 48
title: "Push and Scan a Container Image"
related_notebook: "Container Registries, Tags, Digests, and Authentication"
related_exercise: "Publish an Image to a Container Registry"
level: Intermediate
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/48-container-registries.md) | [Exercise](../../exercises/en/48-publish-an-image-to-a-container-registry.md) | [Roadmap](../../ROADMAP.md)

# Push and Scan a Container Image

## Objective

Publish a versioned image to a private registry, scan it, and record the digest used for deployment.

## Outcomes

- Authenticate with a scoped registry token.
- Apply release and commit tags without confusing them with immutable identity.
- Verify scan results and pull the image by digest.

## Prerequisites

- Completed the notebook and exercise.
- A private test registry and a non-administrator token.
- Docker and a scanner such as Trivy.

## Scenario

A release candidate must be available to a deployment system while a security reviewer verifies its contents. The reviewer needs a stable digest and evidence of the scan policy.

## Environment

| Requirement      | Value                                  |
| ---------------- | -------------------------------------- |
| Operating System | Windows, Linux, or macOS               |
| Registry         | `registry.example.com/platform`        |
| Release image    | `service:1.4.2`                        |
| Scan policy      | Fail on `HIGH` and `CRITICAL` findings |

## Tasks

### Task 1 - Authenticate safely

Use `docker login registry.example.com` with a protected token. Confirm that the identity can push only to the test repository and that credentials are not echoed.

**Expected Result:** Authentication succeeds without exposing the secret or granting unrelated write access.

### Task 2 - Push and scan

Tag and push `registry.example.com/platform/service:1.4.2` and `registry.example.com/platform/service:git-a1b2c3d`. Scan the pushed image and save the report.

**Expected Result:** Both tags exist, the scan result is retained, and policy failures block release approval.

### Task 3 - Verify digest pull

Record the digest from the registry, pull with `service@sha256:...`, and compare the local image identity with the registry response.

**Expected Result:** The deployment reference identifies the exact bytes that were scanned.

## Validation Checklist

- [ ] Push credentials are scoped and protected.
- [ ] Release and commit tags are present.
- [ ] The final image was scanned.
- [ ] Scan evidence is retained.
- [ ] The digest pull succeeds.

## Troubleshooting

| Problem                    | Possible Cause                            | Solution                                           |
| -------------------------- | ----------------------------------------- | -------------------------------------------------- |
| `denied: requested access` | Token lacks repository permission         | Request scoped push access to the test repository. |
| Tag cannot be overwritten  | Registry enforces immutability            | Use a new release or commit tag.                   |
| Digest differs locally     | Different manifest or platform was pulled | Record platform and compare the registry manifest. |

## Best Practices

- Use short-lived credentials or workload identity in CI.
- Scan after push and before deployment approval.
- Keep release tags readable but deploy by digest.

## Summary

Registry operations are complete only when authentication, scanning, retention, and digest evidence agree on the artifact.

## Related Links

- Notebook: [Container Registries](../../notebooks/en/48-container-registries.md)
- Exercise: [Publish an image to a container registry](../../exercises/en/48-publish-an-image-to-a-container-registry.md)
- Quiz: [Container registries quiz](../../quizzes/en/48-container-registries-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
