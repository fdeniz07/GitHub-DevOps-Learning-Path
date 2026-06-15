---
chapter: 41
title: "Continuous Deployment Quiz"
related_notebook: "Continuous Deployment"
related_exercise: "Design a Controlled Deployment"
related_lab: "Run a Controlled Deployment"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/41-continuous-deployment.md) | [Exercise](../../exercises/en/41-design-a-controlled-deployment.md) | [Lab](../../labs/en/41-run-a-controlled-deployment.md) | [Roadmap](../../ROADMAP.md)

# Continuous Deployment Quiz

## Learning Objectives

- Explain automated production promotion.
- Select rollout, health, and rollback controls.
- Use concurrency to protect production.

## Questions

### Question 1

What makes continuous deployment different from continuous delivery?

**Expected Answer:** Successful changes are automatically promoted to production rather than waiting for a separate release decision.

### Question 2

What is a canary deployment?

- A. A deployment with no tests
- B. A gradual release to a limited amount of traffic
- C. A permanent backup
- D. A dependency update

**Answer:** B.

### Question 3

True or false: `concurrency` can prevent overlapping production deployments.

**Answer:** True. A shared production concurrency group serializes deployments.

### Question 4

Name two signals that could stop promotion.

**Expected Answer:** Examples include elevated error rate, failed health checks, latency threshold breach, or failed smoke tests.

### Question 5 — Practical Scenario

A 10% canary has a rising error rate. Should the workflow promote the remaining traffic?

**Expected Answer:** No. Stop promotion, preserve evidence, alert the team, and execute the tested rollback to the known-good artifact.

## Review Checklist

- [ ] I understand automated promotion.
- [ ] I can describe a canary.
- [ ] I can select health signals.
- [ ] I know why rollback must be tested.

## Related Links

- Notebook: [Continuous Deployment](../../notebooks/en/41-continuous-deployment.md)
- Exercise: [Design a Controlled Deployment](../../exercises/en/41-design-a-controlled-deployment.md)
- Lab: [Run a Controlled Deployment](../../labs/en/41-run-a-controlled-deployment.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
