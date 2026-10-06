---
chapter: 42
title: "Rotate Secrets and Review Variables"
related_notebook: "Secrets and Variables"
related_exercise: "Manage Secrets and Variables"
related_quiz: "Secrets and Variables Quiz"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/42-secrets-and-variables.md) | [Exercise](../../exercises/en/42-manage-secrets-and-variables.md) | [Roadmap](../../ROADMAP.md)

# Rotate Secrets and Review Variables

## Objective

Audit a deployment workflow for credential exposure, classify configuration, and rotate a sandbox credential safely.

## Outcomes

- Use environment-scoped secrets without logging them.
- Separate `secrets` from `vars`.
- Complete a create, test, replace, and revoke rotation sequence.

## Prerequisites

- Complete the notebook and exercise.
- Access to a sandbox repository or environment.
- A disposable credential that can be revoked.

## Scenario

A workflow has `CLOUD_TOKEN` in a repository variable and uses shell tracing. You must move the token to an environment secret, remove exposure paths, and rotate it.

## Environment

| Requirement      | Value                                  |
| ---------------- | -------------------------------------- |
| Operating System | Windows, Linux, or macOS               |
| Software         | GitHub Actions, Git, shell             |
| Access           | Sandbox repository and revocable token |

## Tasks

### Task 1 — Inventory configuration

List every configuration value used by the workflow. Mark each as sensitive or non-sensitive and identify its required scope.

**Expected Result:** Sensitive values are candidates for `secrets`; ordinary settings use `vars`.

### Task 2 — Remove exposure

Replace direct values with `${{ secrets.CLOUD_TOKEN }}` and `${{ vars.DEPLOYMENT_URL }}`. Remove `set -x`, `echo` statements, and artifacts that could contain the token.

**Expected Result:** Logs and artifacts do not reveal the credential.

### Task 3 — Rotate

Create a new sandbox token, update the environment secret, run a safe deployment test, revoke the old token, and record the rotation date.

**Expected Result:** The new token works and the old token no longer authenticates.

## Validation Checklist

- [ ] No credential is committed.
- [ ] No step prints the credential.
- [ ] Production secrets are environment-scoped.
- [ ] The new credential is tested.
- [ ] The old credential is revoked.

## Troubleshooting

| Problem           | Possible Cause                            | Solution                                    |
| ----------------- | ----------------------------------------- | ------------------------------------------- |
| Secret is empty   | Wrong scope or name                       | Check environment and exact secret name.    |
| Logs show a token | Debug tracing or command output           | Remove output and rotate the exposed token. |
| New token fails   | Permissions or deployment target mismatch | Verify scope and test in the sandbox.       |

## Best Practices

- Use disposable credentials during training.
- Rotate immediately after any exposure.
- Keep public configuration clearly separate from secrets.

## Summary

Credential safety is operational: classify, scope, avoid logging, rotate, test, and revoke.

## Related Links

- Notebook: [Secrets and Variables](../../notebooks/en/42-secrets-and-variables.md)
- Exercise: [Manage Secrets and Variables](../../exercises/en/42-manage-secrets-and-variables.md)
- Quiz: [Secrets and Variables Quiz](../../quizzes/en/42-secrets-and-variables-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
