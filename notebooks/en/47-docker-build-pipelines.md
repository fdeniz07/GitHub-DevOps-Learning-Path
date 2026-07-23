---
chapter: 47
title: "Reproducible Docker Build Pipelines"
part: "DevOps"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](46-docker-fundamentals.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Design a Docker build that is reproducible, cacheable, and easy to audit.
- Separate dependency, test, and runtime stages with a multi-stage Dockerfile.
- Add image scanning and provenance checks to a CI build pipeline.

## Introduction

A Docker build pipeline turns source code into a versioned image and evidence about how that image was produced. Reproducibility means that the same reviewed inputs produce equivalent output, while traceability connects the image back to a commit, dependency set, and build run.

## Why This Matters

A build that depends on floating base tags, mutable downloads, or a developer's local files can change without a source change. CI should build from a clean checkout, use controlled inputs, run tests before publishing, and scan the exact image that will be deployed.

## Key Terms

| Term               | Definition                                                  |
| ------------------ | ----------------------------------------------------------- |
| Multi-stage build  | A Dockerfile with separate build and runtime stages.        |
| Build context      | Files sent to the Docker daemon or builder.                 |
| Cache key          | Inputs used to reuse a previous build result safely.        |
| SBOM               | A software bill of materials listing image components.      |
| Vulnerability scan | Analysis that compares components with security advisories. |
| Provenance         | Evidence describing where and how an artifact was built.    |

## Theory

Use a lock file and a pinned or digest-referenced base image when reproducibility matters. A multi-stage build keeps compilers and package managers out of the runtime image. `COPY` only the files required by each stage, and use `.dockerignore` to prevent secrets and unrelated files from entering the context.

A healthy pipeline follows this order: checkout, restore dependencies, build, unit test, build the image, scan the image, and publish only after policy gates pass. A scan of the source tree does not replace a scan of the final image because the image also contains base operating system packages.

Caching is useful only when its inputs are correct. Cache dependency downloads by lock-file hash, but invalidate the cache when the lock file changes. Tags identify a human-friendly release, while immutable digests identify the exact bytes.

## Practical Examples

### Multi-stage Dockerfile

```dockerfile
FROM node:22-bookworm-slim AS build
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm test && npm run build

FROM nginx:1.27-alpine AS runtime
COPY --from=build /src/dist /usr/share/nginx/html
USER 101
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
```

The runtime stage contains the built site and web server, but not the Node.js toolchain or test dependencies.

### CI outline with scan gate

```yaml
name: Build container
on:
  pull_request:
  push:
    branches: [main]
permissions:
  contents: read
  packages: write
jobs:
  build-test-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build image
        run: docker build --tag app:${{ github.sha }} .
      - name: Test image
        run: docker run --rm app:${{ github.sha }} npm test
      - name: Scan image
        uses: aquasecurity/trivy-action@0.28.0
        with:
          image-ref: app:${{ github.sha }}
          severity: CRITICAL,HIGH
          exit-code: "1"
```

The scan targets the immutable commit tag created in the same job. In production, pin third-party actions according to your organization policy and publish only after the gate succeeds.

## Try It Yourself

1. Convert a single-stage Dockerfile into build and runtime stages.
2. Add a lock file and verify that dependency installation is deterministic.
3. Build with a commit-based tag, run a vulnerability scan, and save the report as a CI artifact.
4. Change the lock file and observe that the dependency cache is invalidated.

## Best Practices

- Build from clean, reviewed source and record the commit SHA in image labels.
- Use multi-stage builds, `.dockerignore`, and non-root runtime users.
- Scan the final image for vulnerabilities and generate an SBOM.
- Fail on agreed severity thresholds, while documenting exceptions and expiry dates.
- Separate pull request validation from protected publication credentials.

## Common Mistakes

| Mistake                                | Why it causes problems                                    | How to avoid it                                |
| -------------------------------------- | --------------------------------------------------------- | ---------------------------------------------- |
| Using `latest` as the deployment input | The same tag can point to different bytes.                | Deploy an immutable digest.                    |
| Scanning only source dependencies      | Base image vulnerabilities remain hidden.                 | Scan the built runtime image.                  |
| Copying the whole repository early     | Cache invalidation becomes frequent and secrets may leak. | Copy lock files first and use `.dockerignore`. |
| Publishing before tests and scans      | Defective or vulnerable artifacts become trusted.         | Enforce ordered quality gates.                 |

## Summary

- Reproducible builds require controlled inputs, clean contexts, and lock files.
- Multi-stage Dockerfiles reduce runtime size and attack surface.
- Build, test, scan, and publish gates should operate on the same immutable image reference.

## Related Links

- Previous chapter: [Docker fundamentals](46-docker-fundamentals.md)
- Exercise: [Design a Docker build pipeline](../../exercises/en/47-design-a-docker-build-pipeline.md)
- Lab: [Run a Docker build pipeline](../../labs/en/47-run-a-docker-build-pipeline.md)
- Quiz: [Docker build pipelines quiz](../../quizzes/en/47-docker-build-pipelines-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
