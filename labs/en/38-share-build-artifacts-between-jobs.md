---
chapter: 38
title: "Share Build Artifacts Between Jobs"
related_notebook: "GitHub Actions Artifacts"
related_exercise: "Publish and Consume Workflow Artifacts"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/en/38-github-actions-artifacts.md) | [Exercise](../../exercises/en/38-publish-and-consume-workflow-artifacts.md) | [Quiz](../../quizzes/en/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Share Build Artifacts Between Jobs

## Objective

Create a producer-consumer workflow that transfers, validates, and retains build files safely.

## Learning Outcomes

- model job boundaries with `needs`;
- upload and download named artifacts;
- apply retention and validation controls.

## Scenario

A build job produces a package and test report. An inspection job validates the report, and a release-preparation job receives only the validated package. No job may assume files persist on its runner.

## Prerequisites

- Completed the related notebook and exercise.
- A deterministic build or test command.
- A repository where workflow runs can be inspected.

## Environment Setup

| Requirement      | Value                                      |
| ---------------- | ------------------------------------------ |
| Operating System | GitHub-hosted Ubuntu runner                |
| Software         | GitHub Actions and the project build tool  |
| Version          | Versions supported by the practice project |

## Tasks

### Task 1 — Produce Narrow Artifacts

1. Build into a dedicated output directory.
2. Upload the package and report as separate named artifacts.
3. Set a short report retention and a policy-approved package retention.

**Expected Result:** Artifacts contain only intended files and have clear lifecycles.

### Task 2 — Inspect Across a Boundary

1. Make the inspection job depend on the build job.
2. Download the report into a clean directory.
3. Validate expected file names and content before continuing.

**Expected Result:** The consumer receives explicit input and rejects an invalid report.

### Task 3 — Prepare a Release

1. Download only the package artifact into the release job.
2. Verify a checksum or other project-appropriate integrity signal.
3. Keep publishing disabled until validation succeeds.

**Expected Result:** Release preparation uses a least-privilege file handoff.

## Validation Checklist

- [ ] Every consumer has an explicit `needs` relationship.
- [ ] Artifact names cannot collide across matrix jobs.
- [ ] Retention matches value and sensitivity.
- [ ] Downloaded files are validated before use.
- [ ] No secret or full workspace is uploaded.

## Troubleshooting

| Problem                     | Possible Cause                  | Solution                                         |
| --------------------------- | ------------------------------- | ------------------------------------------------ |
| Artifact is missing         | Producer failed or name differs | Inspect the producer and exact name.             |
| Files are not present       | Jobs use separate runners       | Download the artifact explicitly.                |
| Release consumes wrong file | Broad path or reused name       | Narrow paths and include run or matrix identity. |

## Best Practices

- Treat artifact contents as untrusted until checked.
- Keep release permissions in the smallest possible job.
- Document why retention values are appropriate.

## Summary

The lab makes file movement across job boundaries explicit, limited, and verifiable.

### Related Content

- Notebook: [GitHub Actions Artifacts](../../notebooks/en/38-github-actions-artifacts.md)
- Exercise: [Publish and Consume Workflow Artifacts](../../exercises/en/38-publish-and-consume-workflow-artifacts.md)
- Quiz: [Artifacts Quiz](../../quizzes/en/38-artifacts-quiz.md)
