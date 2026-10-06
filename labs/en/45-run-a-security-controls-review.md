---
chapter: 45
title: "Run a Security Controls Review"
related_notebook: "Security Best Practices for Delivery Workflows"
related_exercise: "Audit a Secure Delivery Workflow"
related_quiz: "Security Best Practices Quiz"
level: Intermediate
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/45-security-best-practices.md) | [Exercise](../../exercises/en/45-audit-a-secure-delivery-workflow.md) | [Roadmap](../../ROADMAP.md)

# Run a Security Controls Review

## Objective

Perform a defense-in-depth review of repository, workflow, dependency, and production controls.

## Outcomes

- Verify least privilege and protected deployment paths.
- Review CodeQL, Dependabot, branch protection, and audit evidence.
- Produce prioritized remediation actions.

## Prerequisites

- Complete the notebook and exercise.
- Repository administration or read access to relevant settings.
- A workflow and dependency manifest to review.

## Scenario

Before a production launch, a team requests an independent controls review. You will inspect the workflow, repository settings, dependencies, secrets, and audit events, then report gaps by priority.

## Environment

| Requirement      | Value                                                               |
| ---------------- | ------------------------------------------------------------------- |
| Operating System | Windows, Linux, or macOS                                            |
| Software         | GitHub repository, Git, dependency tooling                          |
| Access           | Actions, environments, branch protection, security, and audit views |

## Tasks

### Task 1 — Review workflow authority

Inspect top-level and job-level `permissions`, action references, untrusted inputs, `environment`, and `concurrency`. Record excessive access and supply-chain concerns.

**Expected Result:** Workflow risks have concrete file or setting evidence.

### Task 2 — Review repository controls

Verify protected branches, required reviews, required status checks, protected environments, secret scope, CodeQL status, and Dependabot configuration.

**Expected Result:** Preventive and detective controls are reviewed together.

### Task 3 — Produce the report

Use the audit log and deployment history to confirm recent changes. Rank findings by impact, likelihood, and remediation effort. Assign owners and due dates.

**Expected Result:** The report supports a practical remediation plan.

## Validation Checklist

- [ ] Workflow permissions were checked.
- [ ] Third-party action references were reviewed.
- [ ] Secrets and environment protection were checked.
- [ ] Branch protection and required checks were verified.
- [ ] CodeQL and Dependabot evidence was reviewed.
- [ ] Findings have owners and priorities.

## Troubleshooting

| Problem                                     | Possible Cause                 | Solution                                 |
| ------------------------------------------- | ------------------------------ | ---------------------------------------- |
| Setting is unavailable                      | Insufficient repository access | Request read-only audit access.          |
| A control is documented but inactive        | Configuration drift            | Verify the live repository setting.      |
| Many low-value findings obscure urgent ones | No risk ranking                | Sort by blast radius and exploitability. |

## Best Practices

- Keep evidence links and timestamps with every finding.
- Recheck controls after workflow changes.
- Treat security review as a recurring activity, not a launch ritual.

## Summary

A secure delivery review verifies that controls are active, layered, and supported by evidence. It turns principles into accountable work.

## Related Links

- Notebook: [Security Best Practices for Delivery Workflows](../../notebooks/en/45-security-best-practices.md)
- Exercise: [Audit a Secure Delivery Workflow](../../exercises/en/45-audit-a-secure-delivery-workflow.md)
- Quiz: [Security Best Practices Quiz](../../quizzes/en/45-security-best-practices-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
