---
chapter: 40
title: "Plan a Continuous Delivery Release"
related_notebook: "Continuous Delivery"
related_lab: "Stage a Continuous Delivery Release"
related_quiz: "Continuous Delivery Quiz"
level: Intermediate
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/40-continuous-delivery.md) | [Lab](../../labs/en/40-stage-a-continuous-delivery-release.md) | [Roadmap](../../ROADMAP.md)

# Plan a Continuous Delivery Release

## Objective

Plan a release pipeline that builds once, tests the result, publishes an immutable artifact, and makes production release available on demand.

## Outcomes

- Distinguish release readiness from automatic production deployment.
- Define artifact, staging, approval, and rollback boundaries.
- Explain how to preserve traceability.

## Prerequisites

- Read [Continuous Delivery](../../notebooks/en/40-continuous-delivery.md).
- Understand jobs, `needs`, and artifacts in GitHub Actions.
- Know the difference between staging and production.

## Scenario

A web service is rebuilt separately for staging and production. The team wants a safer release process that creates one tested release candidate and allows an authorized person to approve production later.

## Tasks

### Task 1 — Map the stages

Design `package`, `staging`, and `production` stages. State which job depends on which earlier job.

**Expected Result:** The plan makes the promotion order explicit.

### Task 2 — Define artifact evidence

Choose an artifact name, checksum, version identifier, and test evidence. Explain why production must download the artifact created by the package stage.

**Expected Result:** The release can be traced to one tested immutable artifact.

### Task 3 — Define the approval boundary

Describe how a protected `production` environment should control release approval and how rollback will be requested.

**Expected Result:** The plan preserves continuous delivery without silently becoming continuous deployment.

## Challenge

Add a release manifest containing commit SHA, dependency lock-file hash, test result, and build timestamp. Explain which values must be immutable.

## Self-Assessment

- [ ] I can explain continuous delivery in one sentence.
- [ ] I designed build-once promotion.
- [ ] I included approval and rollback evidence.
- [ ] I know why rebuilding weakens traceability.

## Common Mistakes

| Mistake                                 | Solution                                        |
| --------------------------------------- | ----------------------------------------------- |
| Rebuilding for production               | Promote the tested artifact.                    |
| Treating staging as production approval | Keep the approval boundary explicit.            |
| Omitting rollback                       | Name a known-good artifact and recovery action. |

## Summary

Continuous delivery makes every accepted change releasable while preserving a deliberate production decision.

## Related Links

- Notebook: [Continuous Delivery](../../notebooks/en/40-continuous-delivery.md)
- Lab: [Stage a Continuous Delivery Release](../../labs/en/40-stage-a-continuous-delivery-release.md)
- Quiz: [Continuous Delivery Quiz](../../quizzes/en/40-continuous-delivery-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
