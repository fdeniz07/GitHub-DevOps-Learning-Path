---
chapter: 48
title: "Container Registries, Tags, Digests, and Authentication"
part: "DevOps"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](47-docker-build-pipelines.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Distinguish mutable tags from immutable image digests.
- Design a useful tag policy for branches, releases, and rollbacks.
- Authenticate CI and developers without placing registry credentials in source code.

## Introduction

A container registry stores images and serves them to build and deployment systems. Public and private registries use the same basic image reference format, but production workflows add access control, retention, signing, scanning, and audit requirements.

## Why This Matters

An image reference is part of a deployment contract. A floating tag can silently change what production runs, while a digest identifies exact content. Clear tags help humans navigate releases, and secure authentication keeps publishing and pulling permissions separate.

## Key Terms

| Term              | Definition                                                                                 |
| ----------------- | ------------------------------------------------------------------------------------------ |
| Repository        | A named collection of related image versions in a registry.                                |
| Tag               | A mutable human-readable pointer such as `v1.4.2`.                                         |
| Digest            | A content-addressed immutable identifier such as `sha256:...`.                             |
| Pull              | Download an image from a registry.                                                         |
| Push              | Upload an image to a registry.                                                             |
| Credential helper | A tool that stores or supplies registry credentials without putting them in shell history. |

## Theory

A fully qualified image reference includes a registry host, repository, and tag or digest: `registry.example.com/team/service:v1.4.2`. Tags are convenient aliases and may be moved. A digest is stable for a specific manifest and is the correct deployment input when reproducibility matters.

Use separate identities for pull and push. A CI publish token should be restricted to one repository and one environment. Deployment agents often need pull access only. Store credentials in a secret manager or the CI platform's protected secret store, and use short-lived federation where available.

Tag releases with a semantic version and commit identifier when appropriate. Never overwrite a release tag unless the release policy explicitly allows it. Configure retention carefully: deleting old images can break rollback or disaster recovery.

## Practical Examples

### Login, tag, and push

```bash
docker login registry.example.com
docker build --tag registry.example.com/platform/service:1.4.2 .
docker tag registry.example.com/platform/service:1.4.2 registry.example.com/platform/service:git-a1b2c3d
docker push registry.example.com/platform/service:1.4.2
docker push registry.example.com/platform/service:git-a1b2c3d
docker image inspect registry.example.com/platform/service:1.4.2 --format '{{index .RepoDigests 0}}'
```

The returned repository digest identifies the exact manifest that was pushed. Deployment can use `registry.example.com/platform/service@sha256:...` instead of the mutable tag.

### Protected CI publishing

```yaml
- name: Log in to registry
  uses: docker/login-action@v3
  with:
    registry: registry.example.com
    username: ${{ secrets.REGISTRY_USER }}
    password: ${{ secrets.REGISTRY_TOKEN }}
- name: Push immutable image
  run: docker push registry.example.com/platform/service:${{ github.sha }}
```

The token must be scoped to the required repository and protected from untrusted pull request jobs. Do not print the token or pass it as a command-line argument that could appear in logs.

## Try It Yourself

1. Create a local image with a semantic version tag and a commit tag.
2. Push it to a private test repository using a least-privilege token.
3. Record its digest and pull the image by digest on another machine.
4. Write a retention rule that preserves release images and the last five rollback candidates.

## Best Practices

- Deploy by digest and retain readable release tags for discovery.
- Use separate push and pull identities with the smallest possible scope.
- Protect registries with TLS, audit logs, scanning, and retention policies.
- Never store credentials in Dockerfiles, Git history, or unprotected workflow output.
- Record the digest, source commit, scan result, and approval with each release.

## Common Mistakes

| Mistake                                 | Why it causes problems                                | How to avoid it                           |
| --------------------------------------- | ----------------------------------------------------- | ----------------------------------------- |
| Treating a tag as immutable             | A later push can change the deployed bytes.           | Resolve and deploy by digest.             |
| Sharing one administrator token         | A leak grants unnecessary write access.               | Use scoped identities and federation.     |
| Deleting all old images                 | Rollback and incident investigation become difficult. | Define retention with recovery needs.     |
| Logging in during every untrusted build | Pull request code may access publish credentials.     | Separate validation and publication jobs. |

## Summary

- Tags are navigable aliases; digests identify exact image content.
- Registry access should be scoped by action, repository, and environment.
- Secure publishing combines authentication, scanning, retention, auditability, and immutable deployment references.

## Related Links

- Previous chapter: [Reproducible Docker build pipelines](47-docker-build-pipelines.md)
- Exercise: [Publish an image to a container registry](../../exercises/en/48-publish-an-image-to-a-container-registry.md)
- Lab: [Push and scan a container image](../../labs/en/48-push-and-scan-a-container-image.md)
- Quiz: [Container registries quiz](../../quizzes/en/48-container-registries-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
