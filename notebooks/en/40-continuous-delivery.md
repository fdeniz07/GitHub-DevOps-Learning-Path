---
chapter: 40
title: "Continuous Delivery"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](39-continuous-integration.md) | [Roadmap](../../ROADMAP.md) | [Next Chapter](41-continuous-deployment.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Distinguish continuous delivery from continuous integration and deployment.
- Model a release pipeline that proves production readiness without deploying automatically.
- Use approvals, artifacts, environments, and release evidence responsibly.

## Introduction

Continuous delivery (CD) keeps software in a releasable state. Every accepted change passes automated build, test, and packaging stages so that a release can be made on demand. The final production decision may still require a deliberate approval.

## Why This Matters

A team that can release at any time is less dependent on risky release weekends. Continuous delivery separates technical readiness from the business decision to release. That separation makes rollback planning, compliance evidence, and stakeholder approval easier to manage.

## Key Terms

| Term                | Definition                                                                                               |
| ------------------- | -------------------------------------------------------------------------------------------------------- |
| Continuous delivery | Automated preparation of every accepted change for release, with production release available on demand. |
| Release candidate   | A tested artifact proposed for release.                                                                  |
| Environment         | A named deployment target with configuration and protection rules.                                       |
| Approval gate       | A deliberate control that must pass before a protected action.                                           |

## Theory

A delivery pipeline normally builds once, tests the build, publishes an immutable artifact, and promotes that same artifact through environments. Rebuilding separately for staging and production can produce different binaries and weakens traceability.

Continuous delivery does not mean that every change reaches production automatically. It means the change is ready and the organization can choose when to release it. A protected production environment can require reviewers, a change ticket, or a deployment window.

### Practical Workflow Example

```yaml
name: Continuous Delivery

on:
  push:
    branches: [main]

permissions:
  contents: read
  actions: read

jobs:
  package:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build and test
        run: ./scripts/build-and-test.sh
      - name: Create release artifact
        run: tar -czf application.tgz app/
      - uses: actions/upload-artifact@v4
        with:
          name: release-candidate
          path: application.tgz

  release-ready:
    needs: package
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: release-candidate
      - name: Validate release metadata
        run: sha256sum application.tgz
```

The workflow prepares a release candidate and records evidence. A later production job can target a protected `production` environment and require approval, which preserves the distinction between delivery and deployment.

## Try It Yourself

1. Define build, test, package, and staging stages.
2. Upload one immutable artifact and download it in the staging stage.
3. Add a protected production environment without enabling automatic promotion.
4. Document the approval and rollback decision points.

## Best Practices

- Build once and promote the same immutable artifact.
- Make release metadata, checksums, and test results traceable.
- Keep production approvals explicit and auditable.
- Separate application configuration from the artifact.
- Test rollback before calling a pipeline release-ready.

## Common Mistakes

| Mistake                                              | Why it causes problems                                                     | How to avoid it                                |
| ---------------------------------------------------- | -------------------------------------------------------------------------- | ---------------------------------------------- |
| Rebuilding for every environment                     | The tested artifact may differ from the deployed artifact.                 | Promote one artifact.                          |
| Calling every automated pipeline deployment          | Delivery includes release readiness, not necessarily production promotion. | State the approval boundary clearly.           |
| Treating staging as proof of all production behavior | Environments can differ in data, scale, and configuration.                 | Compare configuration and test critical paths. |

## Summary

- Continuous delivery keeps tested software ready for release.
- Release readiness can be automated while production approval remains deliberate.
- Immutable artifacts, protected environments, and rollback evidence improve control.

## Related Links

- Previous chapter: [Continuous integration](39-continuous-integration.md)
- Exercise: [Plan a continuous delivery release](../../exercises/en/40-plan-a-continuous-delivery-release.md)
- Lab: [Stage a continuous delivery release](../../labs/en/40-stage-a-continuous-delivery-release.md)
- Quiz: [Continuous delivery quiz](../../quizzes/en/40-continuous-delivery-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
- Next chapter: [Continuous deployment](41-continuous-deployment.md)
