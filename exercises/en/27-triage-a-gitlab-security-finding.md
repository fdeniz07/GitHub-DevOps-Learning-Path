---
chapter: 27
title: "Triage a GitLab Security Finding"
related_notebook: "DevSecOps, Security Scans & Compliance"
level: Beginner
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/27-gitlab-devsecops-security-scans-and-compliance.md) | [Lab](../../labs/en/27-design-a-devsecops-review-flow.md) | [Quiz](../../quizzes/en/27-gitlab-devsecops-security-scans-and-compliance-quiz.md) | [Roadmap](../../ROADMAP.md)

# Triage a GitLab Security Finding

## Objective

Practice a documented, evidence-based response to a dependency security finding.

## Scenario

Dependency scanning reports that package `example-lib` version `2.3.1` has a known vulnerability. The project uses the package only in an optional local development command. A patched version is available.

## Tasks

1. Record affected version, usage context, severity source, owner, and due date without copying sensitive data.
2. Decide what evidence is needed to assess reachability and impact.
3. Plan a patched update, test, merge request, and verification. If an exception is needed, specify its expiry and approval.

## Expected Result

You produce a traceable remediation decision rather than ignoring or blindly closing the finding.

## Self-Assessment

- [ ] I distinguish a scan signal from a final risk decision.
- [ ] I can assign a finding an owner and evidence-based priority.
- [ ] I know a secret must be revoked before cleanup.

### Related Content

- Notebook: [DevSecOps, Security Scans & Compliance](../../notebooks/en/27-gitlab-devsecops-security-scans-and-compliance.md)
- Lab: [Design a DevSecOps Review Flow](../../labs/en/27-design-a-devsecops-review-flow.md)
- Quiz: [DevSecOps, Security Scans & Compliance Quiz](../../quizzes/en/27-gitlab-devsecops-security-scans-and-compliance-quiz.md)
