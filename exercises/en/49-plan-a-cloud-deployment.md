---
chapter: 49
title: "Plan a Cloud Deployment"
related_notebook: "Cloud Deployment Models, Configuration, and Rollback"
level: Intermediate
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/49-cloud-deployments.md) | [Lab](../../labs/en/49-deploy-an-application-to-the-cloud.md) | [Roadmap](../../ROADMAP.md)

# Plan a Cloud Deployment

## Objective

Create a deployment plan for a stateless container service that includes configuration, health checks, rollout gates, and rollback.

## Outcomes

- Choose a cloud deployment model and explain its trade-offs.
- Classify configuration and secrets correctly.
- Define readiness, liveness, and rollback conditions.

## Prerequisites

- Read [Cloud Deployment Models](../../notebooks/en/49-cloud-deployments.md).
- Understand container images, registries, and HTTP health endpoints.
- Access to a cloud test subscription is useful but not required.

## Scenario

A checkout API must move from a test environment to production without rebuilding the image. The service uses a database password, an upstream orders URL, and a readiness endpoint.

## Tasks

### Task 1 - Select the deployment model

Compare a VM, managed container service, and orchestrator. Select one for the service and record operational responsibilities.

**Expected Result:** The decision addresses scaling, networking, patching, team expertise, and recovery.

### Task 2 - Create the runtime contract

List image digest, port, public configuration, secret references, resource limits, readiness path, and liveness path.

**Expected Result:** No secret is stored in the image or plain-text deployment manifest.

### Task 3 - Define promotion and rollback

Specify the rollout observation window, health and SLO gates, approval boundary, previous revision, and rollback command or operator action.

**Expected Result:** Another operator can deploy and recover without inventing steps during an incident.

## Challenge

Add a canary phase that receives 10% of traffic and define the evidence needed before moving to 100%.

## Self-Assessment

- [ ] I can compare cloud deployment models.
- [ ] I can separate configuration from secrets.
- [ ] I can distinguish readiness from liveness.
- [ ] I can write measurable rollback triggers.

## Common Mistakes

| Mistake                                       | Solution                                         |
| --------------------------------------------- | ------------------------------------------------ |
| Rebuilding for production                     | Promote the tested digest.                       |
| Treating a password as ordinary configuration | Store and reference it through a secret manager. |
| Having no previous revision                   | Keep rollback candidates available and tested.   |

## Summary

A deployment plan is complete when its artifact, runtime configuration, health gates, ownership, and rollback path are explicit.

## Related Links

- Notebook: [Cloud Deployment Models](../../notebooks/en/49-cloud-deployments.md)
- Lab: [Deploy an application to the cloud](../../labs/en/49-deploy-an-application-to-the-cloud.md)
- Quiz: [Cloud deployments quiz](../../quizzes/en/49-cloud-deployments-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
