---
chapter: 41
title: "Design a Controlled Deployment"
related_notebook: "Continuous Deployment"
related_lab: "Run a Controlled Deployment"
related_quiz: "Continuous Deployment Quiz"
level: Intermediate
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/41-continuous-deployment.md) | [Lab](../../labs/en/41-run-a-controlled-deployment.md) | [Roadmap](../../ROADMAP.md)

# Design a Controlled Deployment

## Objective

Design automated production promotion controls that limit blast radius and recover from failed deployments.

## Outcomes

- Identify health signals and rollout thresholds.
- Use `concurrency` and a protected `production` environment appropriately.
- Describe automated rollback behavior.

## Prerequisites

- Read [Continuous Deployment](../../notebooks/en/41-continuous-deployment.md).
- Understand release artifacts and environment protection.
- Know basic HTTP health checks and deployment terminology.

## Scenario

A team wants continuous deployment for a service with a large user base. Every successful delivery should deploy a 10% canary, verify health, and then promote traffic only when error rate and latency remain within limits.

## Tasks

### Task 1 — Define promotion gates

Choose health signals, observation time, and stop thresholds for the canary.

**Expected Result:** The promotion decision is measurable instead of subjective.

### Task 2 — Prevent conflicting releases

Add a production `concurrency` group and explain why `cancel-in-progress: false` may be appropriate during deployment.

**Expected Result:** Two production deployments cannot modify the environment simultaneously.

### Task 3 — Design rollback

Describe what the workflow does if health validation fails. Include the known-good artifact and the audit information to retain.

**Expected Result:** Failure stops promotion and restores service predictably.

## Challenge

Compare canary and blue-green deployment for this service. Choose one and justify the operational cost.

## Self-Assessment

- [ ] I can distinguish delivery from deployment.
- [ ] I defined objective health thresholds.
- [ ] I included production concurrency.
- [ ] I can describe an automated rollback.

## Common Mistakes

| Mistake                             | Solution                              |
| ----------------------------------- | ------------------------------------- |
| Promoting immediately after upload  | Observe a canary first.               |
| Deploying two versions concurrently | Use a production `concurrency` group. |
| Relying on users to report failure  | Automate health checks and alerts.    |

## Summary

Continuous deployment is safe only when automated promotion has measurable gates, limited exposure, and a tested rollback path.

## Related Links

- Notebook: [Continuous Deployment](../../notebooks/en/41-continuous-deployment.md)
- Lab: [Run a Controlled Deployment](../../labs/en/41-run-a-controlled-deployment.md)
- Quiz: [Continuous Deployment Quiz](../../quizzes/en/41-continuous-deployment-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
