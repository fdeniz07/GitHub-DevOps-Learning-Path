---
chapter: 51
title: "Enterprise CI/CD Pipelines and Platform Governance"
part: "DevOps"
level: Advanced
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](50-monitoring-and-observability.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Design an enterprise delivery flow with governed environments and approvals.
- Explain auditability, platform ownership, separation of duties, and reusable templates.
- Balance team autonomy with secure, consistent delivery standards.

## Introduction

Enterprise CI/CD coordinates many teams, services, environments, compliance obligations, and deployment paths. The goal is not to make every team follow a slow central process. The goal is to provide safe paved roads: reusable automation, clear ownership, policy checks, and enough flexibility for legitimate differences.

## Why This Matters

At scale, an undocumented manual approval or a copied workflow becomes a reliability and audit risk. Standard templates reduce drift, protected environments control sensitive actions, and ownership boundaries make failures easier to resolve. Good governance enables teams instead of replacing engineering judgment.

## Key Terms

| Term                 | Definition                                                                      |
| -------------------- | ------------------------------------------------------------------------------- |
| Environment          | A named deployment target with configuration, access, and controls.             |
| Promotion            | Moving the same artifact to a later environment.                                |
| Separation of duties | Dividing responsibilities so one person cannot bypass important controls alone. |
| Auditability         | The ability to reconstruct who changed, approved, and deployed what.            |
| Platform team        | A team that provides shared delivery capabilities and paved roads.              |
| Reusable template    | Versioned automation that product teams consume consistently.                   |

## Theory

A governed pipeline usually validates a change, creates one immutable artifact, scans and signs it, deploys to a lower environment, runs verification, and promotes the same artifact through staging to production. Approvals belong at risk boundaries, not after every harmless automated step.

Environment controls should define who may deploy, which checks are required, how secrets are scoped, and how long an approval remains valid. Audit records should connect source commit, workflow run, artifact digest, test and scan results, approver, deployment time, and outcome.

Platform teams own the shared pipeline framework, runners, identity integration, templates, and policy controls. Product teams own service behavior, tests, operational readiness, and service-level objectives. Reusable templates should expose safe parameters, validate inputs, and have a versioning and deprecation policy.

## Practical Examples

### Reusable workflow template

```yaml
name: Governed service delivery
on:
  workflow_call:
    inputs:
      image:
        required: true
        type: string
      service:
        required: true
        type: string
jobs:
  promote:
    permissions:
      contents: read
      deployments: write
    uses: platform/.github/.github/workflows/promote.yml@v3
    with:
      image: ${{ inputs.image }}
      service: ${{ inputs.service }}
    secrets: inherit
```

The platform owns the implementation and version. A service supplies the artifact and identity of the service, while the called workflow applies common controls. Production should still use a protected environment and explicit approval policy.

### Promotion record

```text
service: checkout-api
commit: a1b2c3d
image: registry.example.com/platform/checkout@sha256:abc123
workflow_run: 18742
staging_result: passed
production_approval: release-manager@example.com
production_time: 2026-09-23T14:20:00Z
```

This record makes a deployment explainable during an audit or incident review.

## Try It Yourself

1. Draw a pipeline from pull request to production with artifact, test, scan, approval, and rollback gates.
2. Assign responsibilities to the platform team, service team, security team, and release approver.
3. Define the minimum audit record needed to reconstruct one production deployment.
4. List template inputs that allow service differences without bypassing policy.

## Best Practices

- Build once and promote the same immutable artifact through controlled environments.
- Put policy in versioned reusable templates and test template changes independently.
- Use least privilege, protected environments, separation of duties, and short-lived credentials.
- Make ownership, escalation, audit evidence, and rollback responsibilities explicit.
- Measure delivery performance without rewarding teams for bypassing quality controls.

## Common Mistakes

| Mistake                            | Why it causes problems                              | How to avoid it                            |
| ---------------------------------- | --------------------------------------------------- | ------------------------------------------ |
| Rebuilding in every environment    | Test evidence no longer describes production bytes. | Promote one artifact by digest.            |
| Copying workflows between teams    | Fixes and controls drift over time.                 | Provide versioned reusable templates.      |
| Adding approvals everywhere        | Delivery slows without reducing meaningful risk.    | Place approvals at risk boundaries.        |
| Centralizing all service decisions | The platform becomes a bottleneck.                  | Keep product ownership with service teams. |

## Summary

- Enterprise CI/CD combines automation, governance, ownership, and evidence.
- Reusable templates and protected environments create paved roads without hiding accountability.
- Build-once promotion, separation of duties, and auditable deployment records support safe scale.

## Related Links

- Previous chapter: [Monitoring and observability](50-monitoring-and-observability.md)
- Exercise: [Design an enterprise CI/CD pipeline](../../exercises/en/51-design-an-enterprise-cicd-pipeline.md)
- Lab: [Review an enterprise delivery pipeline](../../labs/en/51-review-an-enterprise-delivery-pipeline.md)
- Quiz: [Enterprise CI/CD pipeline quiz](../../quizzes/en/51-enterprise-cicd-pipeline-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
