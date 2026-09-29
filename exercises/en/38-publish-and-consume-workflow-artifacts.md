---
chapter: 38
title: "Publish and Consume Workflow Artifacts"
related_notebook: "GitHub Actions Artifacts"
level: Intermediate
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/en/38-github-actions-artifacts.md) | [Lab](../../labs/en/38-share-build-artifacts-between-jobs.md) | [Quiz](../../quizzes/en/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Publish and Consume Workflow Artifacts

## Objective

Move a build result across two isolated jobs with an explicit artifact contract.

## Learning Outcomes

- upload only the required files;
- coordinate producer and consumer jobs with `needs`;
- choose a retention period and validate downloaded content.

## Prerequisites

- Completed [GitHub Actions Artifacts](../../notebooks/en/38-github-actions-artifacts.md).
- A repository with a small build command.

## Scenario

A build job creates a report and a package. A separate inspection job must read the report, while a release job must receive only the package after validation.

## Tasks

### Task 1

Create a build job that writes files into separate `reports/` and `dist/` directories. Upload the needed files with descriptive names.

### Expected Result

The artifact paths are narrow and do not include secrets or the entire workspace.

### Task 2

Add a consumer job with `needs: build`, download the expected artifact into a known directory, and list its contents.

### Expected Result

The consumer sees the producer's files despite using a different runner.

### Task 3

Set retention appropriate for a test report and add a validation step before any publish action.

### Expected Result

The lifecycle and trust boundary are explicit.

## Challenge

Adapt the workflow for matrix builds and make artifact names unique per operating system.

## Self-Assessment

- [ ] I can distinguish an artifact from a cache.
- [ ] I used `needs` to model the job boundary.
- [ ] I validate downloaded files before use.

## Common Mistakes

| Mistake                                   | Solution                         |
| ----------------------------------------- | -------------------------------- |
| Assuming workspace files persist          | Upload and download an artifact. |
| Uploading the entire workspace            | Select only required paths.      |
| Executing downloaded files without checks | Validate content first.          |

## Summary

You created an explicit, reviewable file handoff between isolated workflow jobs.

### Related Content

- Notebook: [GitHub Actions Artifacts](../../notebooks/en/38-github-actions-artifacts.md)
- Lab: [Share Build Artifacts Between Jobs](../../labs/en/38-share-build-artifacts-between-jobs.md)
- Quiz: [Artifacts Quiz](../../quizzes/en/38-artifacts-quiz.md)
