---
chapter: 41
title: "Run a Controlled Deployment"
related_notebook: "Continuous Deployment"
related_exercise: "Design a Controlled Deployment"
related_quiz: "Continuous Deployment Quiz"
level: Intermediate
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/41-continuous-deployment.md) | [Exercise](../../exercises/en/41-design-a-controlled-deployment.md) | [Roadmap](../../ROADMAP.md)

# Run a Controlled Deployment

## Objective

Simulate an automated canary deployment with health checks, concurrency protection, and rollback.

## Outcomes

- Promote a tested artifact through a canary stage.
- Stop on an unhealthy signal.
- Record deployment and rollback evidence.

## Prerequisites

- Complete the notebook and exercise.
- Have a staging artifact and a test endpoint.
- Understand GitHub environment and concurrency settings.

## Scenario

A service is ready for continuous deployment, but production traffic must be exposed gradually. You will deploy 10% traffic, verify health, and either promote or roll back.

## Environment

| Requirement      | Value                                                |
| ---------------- | ---------------------------------------------------- |
| Operating System | Windows, Linux, or macOS                             |
| Software         | GitHub Actions, shell, test service                  |
| Access           | A non-production or sandbox `production` environment |

## Tasks

### Task 1 — Configure the deployment job

Create a production job with `environment: production`, `concurrency.group: production`, and `cancel-in-progress: false`.

**Expected Result:** Overlapping production deployments are prevented.

### Task 2 — Deploy the canary

Run a deployment command with a 10% traffic setting. Record commit SHA, artifact identifier, start time, and operator or workflow run.

**Expected Result:** The canary is traceable and limited in scope.

### Task 3 — Verify and recover

Run health checks. On failure, execute rollback and preserve the failed release evidence. On success, promote traffic.

**Expected Result:** The decision is based on measurable health and the service can recover.

## Validation Checklist

- [ ] A canary is deployed before full traffic.
- [ ] Health checks have explicit thresholds.
- [ ] Production concurrency is configured.
- [ ] Rollback is executable.
- [ ] Deployment evidence is retained.

## Troubleshooting

| Problem                              | Possible Cause                     | Solution                           |
| ------------------------------------ | ---------------------------------- | ---------------------------------- |
| Two releases overlap                 | Missing or incorrect `concurrency` | Use one stable production group.   |
| Canary promotes despite failure      | Health result is ignored           | Fail the step and guard promotion. |
| Rollback cannot find the old version | Artifact retention is insufficient | Retain a known-good artifact.      |

## Best Practices

- Use a sandbox for deployment practice.
- Keep thresholds explicit and observable.
- Rehearse rollback before enabling automatic promotion.

## Summary

Controlled deployment combines automation with measurable safety boundaries, not manual hope.

## Related Links

- Notebook: [Continuous Deployment](../../notebooks/en/41-continuous-deployment.md)
- Exercise: [Design a Controlled Deployment](../../exercises/en/41-design-a-controlled-deployment.md)
- Quiz: [Continuous Deployment Quiz](../../quizzes/en/41-continuous-deployment-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
