---
chapter: 45
title: "Security Best Practices Quiz"
related_notebook: "Security Best Practices for Delivery Workflows"
related_exercise: "Audit a Secure Delivery Workflow"
related_lab: "Run a Security Controls Review"
level: Intermediate
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/45-security-best-practices.md) | [Exercise](../../exercises/en/45-audit-a-secure-delivery-workflow.md) | [Lab](../../labs/en/45-run-a-security-controls-review.md) | [Roadmap](../../ROADMAP.md)

# Security Best Practices Quiz

## Learning Objectives

- Apply defense in depth and least privilege.
- Recognize the role of pinning, branch protection, and environments.
- Use audit evidence to review delivery security.

## Questions

### Question 1

What does defense in depth mean?

- A. One perfect scanner
- B. Multiple independent controls
- C. Removing all automation
- D. Using one shared credential

**Answer:** B.

### Question 2

Why should deployment permissions be job-specific?

**Expected Answer:** A compromised test step should not automatically gain the ability to deploy or modify unrelated resources.

### Question 3

True or false: Branch protection alone protects production deployment credentials.

**Answer:** False. Production environments and secret scope provide additional deployment controls.

### Question 4

Name three security controls that reinforce each other.

**Expected Answer:** Examples include least-privilege permissions, pinned actions, branch protection, protected environments, CodeQL, Dependabot, and audit logs.

### Question 5 — Practical Scenario

A workflow has `write-all`, accepts code from pull requests, and deploys with a repository-wide cloud token. What should be prioritized?

**Expected Answer:** Reduce permissions, prevent untrusted code from receiving production secrets, scope the token to a protected environment, require branch checks and reviews, and audit recent activity.

## Review Checklist

- [ ] I can explain defense in depth.
- [ ] I can apply least privilege.
- [ ] I understand protected environments and branches.
- [ ] I can name useful audit evidence.

## Related Links

- Notebook: [Security Best Practices for Delivery Workflows](../../notebooks/en/45-security-best-practices.md)
- Exercise: [Audit a Secure Delivery Workflow](../../exercises/en/45-audit-a-secure-delivery-workflow.md)
- Lab: [Run a Security Controls Review](../../labs/en/45-run-a-security-controls-review.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
