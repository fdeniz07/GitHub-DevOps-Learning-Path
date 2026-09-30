---
chapter: 45
title: "Audit a Secure Delivery Workflow"
related_notebook: "Security Best Practices for Delivery Workflows"
related_lab: "Run a Security Controls Review"
related_quiz: "Security Best Practices Quiz"
level: Intermediate
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/45-security-best-practices.md) | [Lab](../../labs/en/45-run-a-security-controls-review.md) | [Roadmap](../../ROADMAP.md)

# Audit a Secure Delivery Workflow

## Objective

Audit a CI/CD workflow for defense in depth and recommend practical risk reductions.

## Outcomes

- Identify excessive permissions and unprotected release paths.
- Review action pinning, secrets, branch protection, and dependency controls.
- Record evidence and prioritize remediation.

## Prerequisites

- Read [Security Best Practices for Delivery Workflows](../../notebooks/en/45-security-best-practices.md).
- Understand GitHub Actions `permissions`, environments, and `concurrency`.
- Know the purpose of CodeQL and Dependabot.

## Scenario

A workflow uses `write-all`, deploys directly from any branch, stores a cloud token in a repository variable, and has no concurrency rule. Audit the design before it is allowed to deploy production.

## Tasks

### Task 1 — Find control gaps

List each issue and map it to least privilege, protected environments, branch protection, secret handling, concurrency, or dependency hygiene.

**Expected Result:** Every finding has a security principle and observable evidence.

### Task 2 — Propose the minimum changes

Rewrite the permissions, production condition, environment, and secret reference. Add a production concurrency group.

**Expected Result:** The deployment job has narrower authority and a protected route to production.

### Task 3 — Define audit evidence

Choose audit log events, required checks, CodeQL results, Dependabot status, and deployment records that prove the controls are active.

**Expected Result:** Another reviewer can verify the changes without trusting a verbal claim.

## Challenge

Rank the findings by exploitability and blast radius. Explain why a low-probability issue may still receive urgent treatment if it affects production credentials.

## Self-Assessment

- [ ] I can apply defense in depth.
- [ ] I can reduce a `write-all` permission set.
- [ ] I can distinguish a secret from a variable.
- [ ] I can name evidence from audit logs and required checks.

## Common Mistakes

| Mistake                                             | Solution                                              |
| --------------------------------------------------- | ----------------------------------------------------- |
| Fixing only the scanner                             | Combine scanning with prevention and access controls. |
| Treating branch protection as deployment protection | Protect the production environment too.               |
| Recording recommendations without evidence          | Define how each control will be verified.             |

## Summary

A security audit connects workflow configuration to real controls, evidence, and risk reduction. Defense in depth makes one failure less catastrophic.

## Related Links

- Notebook: [Security Best Practices for Delivery Workflows](../../notebooks/en/45-security-best-practices.md)
- Lab: [Run a Security Controls Review](../../labs/en/45-run-a-security-controls-review.md)
- Quiz: [Security Best Practices Quiz](../../quizzes/en/45-security-best-practices-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
