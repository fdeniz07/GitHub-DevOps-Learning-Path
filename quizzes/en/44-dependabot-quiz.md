---
chapter: 44
title: "Dependabot Quiz"
related_notebook: "Dependabot Updates"
related_exercise: "Configure Dependabot Updates"
related_lab: "Review a Dependabot Update"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/44-dependabot.md) | [Exercise](../../exercises/en/44-configure-dependabot-updates.md) | [Lab](../../labs/en/44-review-a-dependabot-update.md) | [Roadmap](../../ROADMAP.md)

# Dependabot Quiz

## Learning Objectives

- Explain what Dependabot automates.
- Review direct, transitive, and action updates.
- Apply safe merge and ignore policies.

## Questions

### Question 1

What does Dependabot primarily create?

- A. Automatic production deployments
- B. Dependency update pull requests
- C. User accounts
- D. CodeQL queries

**Answer:** B.

### Question 2

Why must a lock file be reviewed?

**Expected Answer:** It records the resolved dependency graph, including transitive packages that may change even when the manifest diff is small.

### Question 3

True or false: A Dependabot pull request can be merged without tests because it was generated automatically.

**Answer:** False. Updates require review, compatibility testing, and security checks.

### Question 4

Name one reason to monitor `github-actions` as an ecosystem.

**Expected Answer:** Workflow actions are part of the software supply chain and can receive fixes or introduce breaking changes.

### Question 5 — Practical Scenario

A grouped update passes unit tests but changes a major version and the release notes mention a removed API. What is the next step?

**Expected Answer:** Do not merge automatically. Read migration guidance, run broader tests, adapt code if needed, and request review from an owner.

## Review Checklist

- [ ] I understand Dependabot proposals.
- [ ] I inspect lock-file and transitive changes.
- [ ] I review action updates.
- [ ] I use owned and time-boxed ignore rules.

## Related Links

- Notebook: [Dependabot Updates](../../notebooks/en/44-dependabot.md)
- Exercise: [Configure Dependabot Updates](../../exercises/en/44-configure-dependabot-updates.md)
- Lab: [Review a Dependabot Update](../../labs/en/44-review-a-dependabot-update.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
