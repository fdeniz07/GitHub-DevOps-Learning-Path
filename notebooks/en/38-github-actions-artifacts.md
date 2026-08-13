---
chapter: 38
title: "GitHub Actions Artifacts"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](37-github-actions-dependency-caching.md) | [Exercise](../../exercises/en/38-publish-and-consume-workflow-artifacts.md) | [Lab](../../labs/en/38-share-build-artifacts-between-jobs.md) | [Quiz](../../quizzes/en/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- distinguish artifacts from caches and job outputs;
- upload files from one job and download them in another;
- choose retention and naming policies deliberately;
- protect artifact contents and permissions at job boundaries.

## Introduction

Artifacts are files produced by a workflow and retained with a workflow run. They are useful for test reports, binaries, coverage output, and release packages. Because separate jobs run on separate runners, artifacts provide an explicit way to move files across job boundaries.

## Key Terms

| Term         | Meaning                                                    |
| ------------ | ---------------------------------------------------------- |
| Artifact     | A named collection of files uploaded from a workflow run.  |
| Retention    | How long an artifact remains available.                    |
| Upload       | The operation that stores files with the run.              |
| Download     | The operation that retrieves an artifact into a later job. |
| Job boundary | The isolated transition between jobs and their runners.    |

## Theory

### Upload and Download

An upload step names the artifact and selects files. A later job declares a dependency with `needs` and downloads the named artifact:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: mkdir -p dist && printf 'build output\n' > dist/app.txt
      - uses: actions/upload-artifact@v4
        with:
          name: app-${{ github.sha }}
          path: dist/
          retention-days: 7

  inspect:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: app-${{ github.sha }}
          path: received/
      - run: cat received/app.txt
```

The `needs` relationship ensures the producer completes before the consumer starts. The artifact name should identify the content and avoid accidental collisions between matrix jobs.

### Retention and Lifecycle

Retention should match the purpose of the artifact. Short-lived test reports need less retention than a release package, but long retention increases storage and exposure. Repository or organization policy may cap the value. Do not assume an artifact is an immutable archival system; preserve release records according to the project's actual release policy.

### Artifacts, Caches, and Outputs

Artifacts are for files that need to be inspected or consumed later. Caches are for safe reusable dependencies and may be evicted. Job outputs are small named values for controlling workflow logic. Choosing the wrong mechanism makes data flow harder to reason about and can create security or reliability problems.

### Security at Job Boundaries

Treat downloaded artifacts as untrusted input until validated. Restrict permissions, verify checksums or signatures for release-critical files, and do not execute arbitrary downloaded scripts. Avoid uploading secrets, credentials, or complete workspaces. A job that can publish a release should receive only the permissions and files it needs.

## Best Practices

- Give artifacts descriptive, collision-resistant names.
- Upload only the files needed by reviewers or downstream jobs.
- Set retention according to value, sensitivity, and policy.
- Validate downloaded content before executing or publishing it.
- Use least-privilege permissions for producer and consumer jobs.

## Common Mistakes

| Mistake                                 | Impact                                             | Correction                                   |
| --------------------------------------- | -------------------------------------------------- | -------------------------------------------- |
| Expecting files to persist between jobs | The next runner starts without them.               | Upload and explicitly download an artifact.  |
| Using a cache for release packages      | Data may be evicted or stale.                      | Use artifacts with validation and retention. |
| Uploading secrets with logs             | Sensitive data becomes accessible through the run. | Exclude secrets and review paths.            |
| Reusing one name in matrix jobs         | Files can collide or become ambiguous.             | Include matrix values in names.              |

## Summary

Artifacts make file transfer across isolated jobs explicit. Use them for reports and build outputs, choose retention intentionally, and validate anything consumed across a job boundary.

### Related Content

- Previous chapter: [Dependency Caching](37-github-actions-dependency-caching.md)
- Exercise: [Publish and Consume Workflow Artifacts](../../exercises/en/38-publish-and-consume-workflow-artifacts.md)
- Lab: [Share Build Artifacts Between Jobs](../../labs/en/38-share-build-artifacts-between-jobs.md)
- Quiz: [Artifacts Quiz](../../quizzes/en/38-artifacts-quiz.md)
