---
chapter: 40
title: "Continuous Delivery Quiz"
related_notebook: "Continuous Delivery"
related_exercise: "Plan a Continuous Delivery Release"
related_lab: "Stage a Continuous Delivery Release"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/40-continuous-delivery.md) | [Exercise](../../exercises/en/40-plan-a-continuous-delivery-release.md) | [Lab](../../labs/en/40-stage-a-continuous-delivery-release.md) | [Roadmap](../../ROADMAP.md)

# Continuous Delivery Quiz

## Learning Objectives

- Distinguish CI, continuous delivery, and continuous deployment.
- Explain immutable artifact promotion and approval gates.
- Plan release evidence and rollback.

## Questions

### Question 1

What does continuous delivery guarantee?

- A. Every change reaches production automatically
- B. Every accepted change is kept releasable
- C. No approval is ever needed
- D. Production is never tested

**Answer:** B. The software is ready for release on demand.

### Question 2

Why should production promote the staging artifact?

**Expected Answer:** It preserves traceability and ensures the artifact tested in staging is the artifact released.

### Question 3

True or false: Continuous delivery and continuous deployment are identical.

**Answer:** False. Continuous deployment automatically promotes to production; delivery may retain a deliberate approval.

### Question 4

Name two useful release evidence items.

**Expected Answer:** Examples include commit SHA, checksum, test results, artifact version, and approval record.

### Question 5 — Practical Scenario

A package job succeeds, staging tests pass, and production is a protected environment requiring approval. What happens next in continuous delivery?

**Expected Answer:** The release candidate is ready, but an authorized person or policy must approve production promotion. Rollback evidence should be available.

## Review Checklist

- [ ] I can explain release readiness.
- [ ] I understand build once and promote.
- [ ] I can identify an approval boundary.
- [ ] I can name rollback evidence.

## Related Links

- Notebook: [Continuous Delivery](../../notebooks/en/40-continuous-delivery.md)
- Exercise: [Plan a Continuous Delivery Release](../../exercises/en/40-plan-a-continuous-delivery-release.md)
- Lab: [Stage a Continuous Delivery Release](../../labs/en/40-stage-a-continuous-delivery-release.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
