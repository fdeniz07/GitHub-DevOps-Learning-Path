---
chapter: 45
title: "Security Best Practices for Delivery Workflows"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](44-dependabot.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Apply defense in depth to CI/CD workflows and repository settings.
- Use least privilege, pinning, protected environments, and branch protection together.
- Audit security evidence such as workflow permissions, dependency changes, and audit logs.

## Introduction

Secure delivery is a system of controls around source code, workflows, artifacts, environments, dependencies, and people. No single scanner or setting can eliminate all risk. Defense in depth assumes that one control may fail and adds independent safeguards.

## Why This Matters

CI/CD workflows can read source code, access credentials, modify artifacts, and deploy production systems. A malicious change or compromised action can turn that authority into a supply-chain incident. Security best practices reduce blast radius while preserving the delivery speed teams need.

## Key Terms

| Term              | Definition                                                                                   |
| ----------------- | -------------------------------------------------------------------------------------------- |
| Defense in depth  | Multiple independent controls protecting the same objective.                                 |
| Least privilege   | Giving a user, token, or job only the access it needs.                                       |
| Pinning           | Referencing a known action or dependency revision rather than an uncontrolled moving target. |
| Branch protection | Rules that require reviews and checks before changes enter a protected branch.               |
| Audit log         | A record of security-relevant administrative and repository events.                          |

## Theory

A secure workflow begins with minimal `permissions`, trusted actions, protected branches, and reviewed workflow changes. Pin third-party actions to a reviewed commit SHA where organizational policy requires it; at minimum, use deliberate version updates and review action ownership. Keep production secrets scoped to protected environments and avoid exposing them to untrusted pull request code.

Dependency hygiene includes lock files, CodeQL, Dependabot, vulnerability response, and removal of unused packages. Operational controls include environment approvals, concurrency, rollback, monitoring, and audit logs. These controls work together: scanning finds issues, branch protection prevents unreviewed changes, and logs support investigation.

### Practical Defense-in-Depth Example

```yaml
name: Secure delivery

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: ./scripts/test.sh
      - name: Check dependencies
        run: ./scripts/audit-dependencies.sh

  deploy:
    needs: verify
    if: ${{ github.ref == 'refs/heads/main' }}
    permissions:
      contents: read
      deployments: write
    environment: production
    concurrency:
      group: production
      cancel-in-progress: false
    runs-on: ubuntu-latest
    steps:
      - name: Deploy reviewed artifact
        run: ./scripts/deploy.sh
```

The workflow uses read-only permissions by default, grants deployment authority only to the deployment job, and limits production execution to `main`. Repository settings must still enforce branch protection and environment rules.

## Try It Yourself

1. Audit a workflow for excessive permissions and untrusted inputs.
2. Check whether branch protection requires reviews and CI checks.
3. Review action references, dependency update policy, and production environment rules.
4. Use the audit log to identify a recent workflow or permission change.

## Best Practices

- Combine least privilege, branch protection, protected environments, and required checks.
- Pin or deliberately version actions and review changes before adoption.
- Keep secrets out of logs and untrusted code paths.
- Run CodeQL and Dependabot, then triage their findings and updates.
- Retain audit logs and document incident response and rollback procedures.

## Common Mistakes

| Mistake                              | Why it causes problems                       | How to avoid it                                  |
| ------------------------------------ | -------------------------------------------- | ------------------------------------------------ |
| Relying on one security scanner      | Missed risks remain unprotected.             | Use defense in depth.                            |
| Granting `write-all` permissions     | A compromised step can alter more resources. | Set job-specific minimal permissions.            |
| Protecting code but not environments | A reviewed change can still deploy unsafely. | Protect production environments and credentials. |
| Treating dependencies as static      | New vulnerabilities appear after release.    | Monitor, update, and audit continuously.         |

## Summary

- Secure delivery combines technical and governance controls.
- Least privilege, pinning, protected environments, branch protection, audit logs, and dependency hygiene reinforce one another.
- Security controls must be reviewed, tested, and improved continuously.

## Related Links

- Previous chapter: [Dependabot](44-dependabot.md)
- Exercise: [Audit a secure delivery workflow](../../exercises/en/45-audit-a-secure-delivery-workflow.md)
- Lab: [Run a security controls review](../../labs/en/45-run-a-security-controls-review.md)
- Quiz: [Security best practices quiz](../../quizzes/en/45-security-best-practices-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
