---
chapter: 40
title: "Stage a Continuous Delivery Release"
related_notebook: "Continuous Delivery"
related_exercise: "Plan a Continuous Delivery Release"
related_quiz: "Continuous Delivery Quiz"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/40-continuous-delivery.md) | [Exercise](../../exercises/en/40-plan-a-continuous-delivery-release.md) | [Roadmap](../../ROADMAP.md)

# Stage a Continuous Delivery Release

## Objective

Build one release artifact, test it in staging, and document production readiness without automatically deploying production.

## Outcomes

- Separate package, staging, and production jobs.
- Transfer one immutable artifact between jobs.
- Demonstrate an approval boundary and rollback plan.

## Prerequisites

- Complete the notebook and exercise.
- Understand `needs`, `upload-artifact`, and `download-artifact`.
- Have a project build command.

## Scenario

A service needs a repeatable release candidate. You will create a workflow that packages once, validates in staging, and leaves production behind a protected environment.

## Environment

| Requirement      | Value                                        |
| ---------------- | -------------------------------------------- |
| Operating System | Windows, Linux, or macOS                     |
| Software         | GitHub Actions, Git, project build tool      |
| Access           | Permission to create a `staging` environment |

## Tasks

### Task 1 — Package once

Create a `package` job that builds, tests, archives the application, and uploads it as `release-candidate`.

**Expected Result:** One named artifact is available after a successful build.

### Task 2 — Validate staging

Create a `staging` job with `needs: package`, download the artifact, verify its checksum, and run a smoke test.

**Expected Result:** Staging tests the exact package intended for release.

### Task 3 — Document production readiness

Create a protected `production` environment and write the approval, evidence, and rollback steps. Do not configure automatic promotion.

**Expected Result:** The pipeline is releasable on demand but does not silently deploy production.

## Validation Checklist

- [ ] The artifact is built once.
- [ ] Staging downloads the uploaded artifact.
- [ ] A checksum or version is recorded.
- [ ] Production has an approval boundary.
- [ ] Rollback uses a known-good artifact.

## Troubleshooting

| Problem                  | Possible Cause                          | Solution                                  |
| ------------------------ | --------------------------------------- | ----------------------------------------- |
| Artifact unavailable     | Job dependency or artifact name differs | Check `needs` and `name`.                 |
| Staging uses a new build | Build commands exist in staging         | Remove rebuild and download the artifact. |
| Approval is bypassed     | Environment rules are missing           | Configure protection on `production`.     |

## Best Practices

- Keep artifacts immutable and traceable.
- Record test and checksum evidence.
- Test rollback before a real release.

## Summary

This lab separates technical release readiness from the deliberate production release decision.

## Related Links

- Notebook: [Continuous Delivery](../../notebooks/en/40-continuous-delivery.md)
- Exercise: [Plan a Continuous Delivery Release](../../exercises/en/40-plan-a-continuous-delivery-release.md)
- Quiz: [Continuous Delivery Quiz](../../quizzes/en/40-continuous-delivery-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
