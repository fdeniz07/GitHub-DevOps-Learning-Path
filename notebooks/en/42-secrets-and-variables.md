---
chapter: 42
title: "Secrets and Variables"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](41-continuous-deployment.md) | [Roadmap](../../ROADMAP.md) | [Next Chapter](43-codeql.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Distinguish GitHub Actions secrets from ordinary variables.
- Reference secrets and variables without exposing credentials in logs.
- Design rotation, scope, and permission practices for workflow configuration.

## Introduction

Workflows need configuration such as deployment URLs, feature switches, tokens, and cloud credentials. GitHub Actions provides `secrets` for sensitive values and `vars` for non-sensitive configuration. A variable is not automatically secret just because it is stored in repository settings.

## Why This Matters

Leaked credentials can allow unauthorized access long after a workflow completes. Clear separation, least privilege, masking, and rotation reduce the impact of mistakes. Security depends on how a value is used, not only where it is stored.

## Key Terms

| Term               | Definition                                                             |
| ------------------ | ---------------------------------------------------------------------- |
| Secret             | A sensitive value protected by GitHub and intended for controlled use. |
| Variable           | Non-sensitive configuration exposed through the `vars` context.        |
| Environment secret | A secret scoped to an environment such as `production`.                |
| Rotation           | Replacing a credential with a new value and revoking the old one.      |
| Masking            | Replacing a sensitive value in log output with `***`.                  |

## Theory

Secrets are referenced through `${{ secrets.NAME }}` and variables through `${{ vars.NAME }}`. Use environment scope when a credential belongs only to one deployment target. Do not place secrets in source files, command arguments that are echoed, artifacts, issue text, or debug output.

A secret can still be exposed accidentally: a script may print it, a tool may include it in an error, or an attacker may alter a workflow to exfiltrate it. Pull request workflows from forks generally cannot access repository secrets, which is an important safety boundary.

### Practical Workflow Example

```yaml
name: Deploy

on:
  workflow_dispatch:

env:
  LOG_LEVEL: ${{ vars.LOG_LEVEL }}

permissions:
  contents: read

jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy application
        env:
          CLOUD_TOKEN: ${{ secrets.CLOUD_TOKEN }}
          DEPLOYMENT_URL: ${{ vars.DEPLOYMENT_URL }}
        run: ./scripts/deploy.sh
```

The token is passed through the step environment instead of being written into the command line. The script must never print `CLOUD_TOKEN`. `DEPLOYMENT_URL` is a variable and should be treated as public configuration unless it is separately sensitive.

## Try It Yourself

1. Classify each configuration value as secret or variable.
2. Scope a production credential to the `production` environment.
3. Search a workflow for `echo`, shell tracing, and artifact uploads that could expose values.
4. Write a rotation procedure that revokes the old credential.

## Best Practices

- Store credentials in GitHub Actions secrets or an external secret manager.
- Use environment-scoped secrets and minimal workflow permissions.
- Never log, commit, or upload secrets.
- Rotate credentials after suspected exposure and on a defined schedule.
- Treat all `vars` values as non-secret configuration.

## Common Mistakes

| Mistake                                  | Why it causes problems                               | How to avoid it                            |
| ---------------------------------------- | ---------------------------------------------------- | ------------------------------------------ |
| Assuming variables are confidential      | Variables can be visible to workflow users and logs. | Put sensitive values in `secrets`.         |
| Using `set -x` with credentials in scope | Shell tracing can print commands and values.         | Disable tracing around sensitive commands. |
| Reusing one broad production token       | A leak affects every workflow and service.           | Scope credentials and use least privilege. |

## Summary

- Secrets protect sensitive values; variables provide ordinary configuration.
- Secrets must not be logged, committed, or uploaded.
- Scope, least privilege, and rotation are essential controls.

## Related Links

- Previous chapter: [Continuous deployment](41-continuous-deployment.md)
- Exercise: [Manage secrets and variables](../../exercises/en/42-manage-secrets-and-variables.md)
- Lab: [Rotate secrets and review variables](../../labs/en/42-rotate-secrets-and-review-variables.md)
- Quiz: [Secrets and variables quiz](../../quizzes/en/42-secrets-and-variables-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
- Next chapter: [CodeQL](43-codeql.md)
