---
chapter: 49
title: "Deploy an Application to the Cloud"
related_notebook: "Cloud Deployment Models, Configuration, and Rollback"
related_exercise: "Plan a Cloud Deployment"
level: Intermediate
estimated_time: 120 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/49-cloud-deployments.md) | [Exercise](../../exercises/en/49-plan-a-cloud-deployment.md) | [Roadmap](../../ROADMAP.md)

# Deploy an Application to the Cloud

## Objective

Deploy one immutable container image with external configuration, health checks, and a verified rollback.

## Outcomes

- Configure a cloud service without embedding secrets.
- Gate traffic on readiness and observe the deployment.
- Roll back to a known-good revision using evidence.

## Prerequisites

- Completed the notebook and exercise.
- A cloud test subscription and permission to deploy a container service.
- An image in a registry and a health endpoint.

## Scenario

A checkout service must be promoted from staging to production. The service uses a database password and an upstream URL, and the release manager requires a tested rollback path.

## Environment

| Requirement      | Value                              |
| ---------------- | ---------------------------------- |
| Operating System | Windows, Linux, or macOS           |
| Software         | Cloud CLI, Docker, registry access |
| Artifact         | Immutable image digest             |
| Health paths     | `/health/ready`, `/health/live`    |

## Tasks

### Task 1 - Configure the service

Create a deployment definition that references the image digest, port 8080, resource limits, readiness path, liveness path, and secret-store reference.

**Expected Result:** No credential is stored in the image or repository manifest.

### Task 2 - Deploy to staging

Deploy the digest to staging, wait for readiness, call the health endpoint, and record revision and deployment events. Observe error rate and p95 latency for at least ten minutes.

**Expected Result:** The service is ready and evidence shows no regression against the release gate.

### Task 3 - Promote and roll back

Promote the same digest to production with the required approval. Trigger or simulate a failed gate, then return to the prior revision and verify service health.

**Expected Result:** Operators can identify and restore the previous known-good revision.

## Validation Checklist

- [ ] The deployed image is identified by digest.
- [ ] Configuration and secrets are externalized.
- [ ] Readiness and liveness checks behave differently as intended.
- [ ] Staging evidence exists before production approval.
- [ ] Rollback restores the previous revision.

## Troubleshooting

| Problem                     | Possible Cause                            | Solution                                        |
| --------------------------- | ----------------------------------------- | ----------------------------------------------- |
| Service never becomes ready | Wrong port or dependency configuration    | Inspect startup logs and readiness response.    |
| Secret is missing           | Identity cannot read the secret reference | Grant the smallest required runtime permission. |
| Rollback has no candidate   | Old revision was deleted                  | Retain and test rollback candidates.            |

## Best Practices

- Use separate cloud identities for deployment and runtime access.
- Apply resource limits and observe saturation during rollout.
- Record revision, digest, approval, health evidence, and rollback outcome.

## Summary

A cloud deployment is operationally complete when its configuration, health gates, observation window, and recovery path are tested.

## Related Links

- Notebook: [Cloud Deployment Models](../../notebooks/en/49-cloud-deployments.md)
- Exercise: [Plan a cloud deployment](../../exercises/en/49-plan-a-cloud-deployment.md)
- Quiz: [Cloud deployments quiz](../../quizzes/en/49-cloud-deployments-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
