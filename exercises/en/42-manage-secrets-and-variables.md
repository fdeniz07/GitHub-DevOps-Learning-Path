---
chapter: 42
title: "Manage Secrets and Variables"
related_notebook: "Secrets and Variables"
related_lab: "Rotate Secrets and Review Variables"
related_quiz: "Secrets and Variables Quiz"
level: Intermediate
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/42-secrets-and-variables.md) | [Lab](../../labs/en/42-rotate-secrets-and-review-variables.md) | [Roadmap](../../ROADMAP.md)

# Manage Secrets and Variables

## Objective

Classify workflow configuration correctly and design a safe way to use, scope, and rotate credentials.

## Outcomes

- Choose between `${{ secrets.NAME }}` and `${{ vars.NAME }}`.
- Identify log and artifact exposure paths.
- Create a credential rotation checklist.

## Prerequisites

- Read [Secrets and Variables](../../notebooks/en/42-secrets-and-variables.md).
- Understand GitHub repository and environment settings.
- Know basic shell environment variables.

## Scenario

A deployment workflow uses `CLOUD_TOKEN`, `DEPLOYMENT_URL`, `LOG_LEVEL`, and `FEATURE_FLAG`. The current file prints all step environment variables while debugging. You must classify the values and remove exposure risks.

## Tasks

### Task 1 — Classify values

Mark `CLOUD_TOKEN` as a secret. Decide whether each other value is a variable or should be moved to a secret based on its actual sensitivity.

**Expected Result:** Sensitive credentials are separated from ordinary configuration.

### Task 2 — Rewrite the step

Pass the token through `env:` using `${{ secrets.CLOUD_TOKEN }}` and pass public settings with `${{ vars.NAME }}`. Remove shell tracing and diagnostic output that could reveal values.

**Expected Result:** The deployment command receives configuration without printing credentials.

### Task 3 — Plan rotation

Write steps to create a new credential, update the environment secret, deploy-test it, revoke the old credential, and record the change.

**Expected Result:** Rotation has an order that avoids unnecessary downtime.

## Challenge

Explain why a secret should not be exposed to code from an untrusted pull request or fork.

## Self-Assessment

- [ ] I know that variables are not automatically secret.
- [ ] I can locate possible log exposure.
- [ ] I can rotate and revoke a credential.
- [ ] I can scope a production secret to an environment.

## Common Mistakes

| Mistake                           | Solution                                    |
| --------------------------------- | ------------------------------------------- |
| Putting tokens in YAML            | Reference `secrets` instead.                |
| Assuming masking fixes every leak | Prevent printing and artifact upload first. |
| Reusing one credential everywhere | Scope credentials and use least privilege.  |

## Summary

Secrets protect credentials; variables provide ordinary configuration. Safe use requires scoped access, no logging, and regular rotation.

## Related Links

- Notebook: [Secrets and Variables](../../notebooks/en/42-secrets-and-variables.md)
- Lab: [Rotate Secrets and Review Variables](../../labs/en/42-rotate-secrets-and-review-variables.md)
- Quiz: [Secrets and Variables Quiz](../../quizzes/en/42-secrets-and-variables-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
