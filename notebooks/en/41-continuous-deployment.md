---
chapter: 41
title: "Continuous Deployment"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](40-continuous-delivery.md) | [Roadmap](../../ROADMAP.md) | [Next Chapter](42-secrets-and-variables.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Explain how continuous deployment promotes validated changes to production automatically.
- Design production promotion controls for an automated deployment workflow.
- Combine progressive delivery, rollback, monitoring, and protected environments.

## Introduction

Continuous deployment is the practice of automatically promoting every change that passes the delivery pipeline into production. It is stronger than continuous delivery because the production release decision is automated. The automation must therefore include reliable controls rather than simply a final `deploy` command.

## Why This Matters

Automatic production promotion can shorten time to value and reduce manual release work. It also increases the cost of weak tests, unsafe permissions, and poor observability. A deployment system must prove that it can detect failure and stop or reverse a change.

## Key Terms

| Term                  | Definition                                                                   |
| --------------------- | ---------------------------------------------------------------------------- |
| Continuous deployment | Automatic production promotion after required validation succeeds.           |
| Progressive delivery  | Releasing gradually through canary, blue-green, or percentage-based rollout. |
| Rollback              | Returning production to a known-good version.                                |
| Health check          | An automated signal used to assess service behavior.                         |

## Theory

Continuous deployment requires a trustworthy chain: source validation, artifact integrity, deployment authorization, health checks, and rollback. Production promotion controls should be automated and testable. A protected environment can still define required reviewers or policies, but an approval that always waits for a person is continuous delivery rather than fully automatic deployment.

Progressive delivery reduces blast radius. A canary release may send a small percentage of traffic to the new version and stop if error rate, latency, or health checks breach thresholds. Feature flags can separate code deployment from feature activation, but flags need ownership and cleanup.

### Practical Workflow Example

```yaml
name: Continuous Deployment

on:
  workflow_run:
    workflows: [Continuous Delivery]
    types: [completed]

permissions:
  contents: read
  deployments: write

jobs:
  deploy:
    if: ${{ github.event.workflow_run.conclusion == 'success' }}
    runs-on: ubuntu-latest
    environment: production
    concurrency:
      group: production
      cancel-in-progress: false
    steps:
      - name: Deploy canary
        run: ./scripts/deploy.sh --strategy canary --percent 10
      - name: Verify health
        run: ./scripts/check-health.sh --timeout 300
      - name: Promote traffic
        run: ./scripts/deploy.sh --strategy promote
```

The `if` expression prevents promotion after a failed delivery workflow. `concurrency` prevents overlapping production changes. The deployment scripts must implement real health checks and rollback behavior; YAML alone cannot guarantee safety.

## Try It Yourself

1. Draw the promotion path from a tested artifact to production.
2. Choose health signals and define stop thresholds.
3. Add a canary step and an automated rollback command.
4. Test what happens when the health check fails.

## Best Practices

- Automate promotion only after tests and artifact verification are reliable.
- Use progressive rollout and explicit health thresholds.
- Keep rollback fast, documented, and regularly tested.
- Use production `concurrency` to prevent conflicting releases.
- Record deployment metadata and audit events.

## Common Mistakes

| Mistake                                | Why it causes problems                     | How to avoid it                                       |
| -------------------------------------- | ------------------------------------------ | ----------------------------------------------------- |
| Removing all controls to achieve speed | A bad change can affect every user.        | Automate measurable controls and progressive rollout. |
| No rollback path                       | Recovery depends on emergency manual work. | Keep a known-good artifact and rehearse rollback.     |
| Deploying without monitoring           | Failure is discovered by users first.      | Gate promotion on health signals and alerts.          |

## Summary

- Continuous deployment automatically promotes validated changes to production.
- Automated promotion requires tests, health checks, rollout controls, and rollback.
- Least privilege, concurrency, and auditability remain important after automation.

## Related Links

- Previous chapter: [Continuous delivery](40-continuous-delivery.md)
- Exercise: [Design a controlled deployment](../../exercises/en/41-design-a-controlled-deployment.md)
- Lab: [Run a controlled deployment](../../labs/en/41-run-a-controlled-deployment.md)
- Quiz: [Continuous deployment quiz](../../quizzes/en/41-continuous-deployment-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
- Next chapter: [Secrets and variables](42-secrets-and-variables.md)
