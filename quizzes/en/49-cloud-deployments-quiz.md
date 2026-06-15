---
chapter: 49
title: "Cloud Deployments Quiz"
related_notebook: "Cloud Deployment Models, Configuration, and Rollback"
related_exercise: "Plan a Cloud Deployment"
related_lab: "Deploy an Application to the Cloud"
level: Intermediate
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/49-cloud-deployments.md) | [Exercise](../../exercises/en/49-plan-a-cloud-deployment.md) | [Lab](../../labs/en/49-deploy-an-application-to-the-cloud.md) | [Roadmap](../../ROADMAP.md)

# Cloud Deployments Quiz

## Learning Objectives

- Compare cloud deployment models.
- Externalize configuration and secrets.
- Use health checks, promotion gates, and rollback.

## Questions

### Question 1

What is a readiness check for?

- A. Deciding whether an instance receives traffic
- B. Storing a database password
- C. Building an image
- D. Deleting old revisions

**Answer:** A. Readiness indicates that the instance can safely receive traffic.

### Question 2

How does liveness differ from readiness?

**Expected Answer:** Liveness indicates whether a process may need restarting; readiness controls traffic. They answer different operational questions.

### Question 3

True or false: The same image should normally be rebuilt separately for staging and production.

**Answer:** False. Promote the same tested immutable image and change only external configuration as needed.

### Question 4

Where should a production database password be stored?

**Expected Answer:** In a managed secret store or protected secret mechanism, referenced at runtime with least-privilege access.

### Question 5

Name three useful rollback triggers.

**Expected Answer:** Failed readiness, sustained error-rate increase, SLO violation, unacceptable latency, or a failed dependency check.

### Question 6

Why should a rollout include an observation window?

**Answer:** Some failures appear only under real traffic. Observation lets operators compare health and user-facing signals before full promotion.

## Practical Scenario

A new revision starts successfully but returns 20% errors after receiving production traffic. What should the team do?

**Expected Answer:** Stop or reverse promotion according to the gate, preserve evidence, shift traffic to the previous known-good revision, verify health, and investigate using logs, metrics, and traces. Do not rebuild an untracked emergency artifact.

## Review Checklist

- [ ] I can compare VM, managed container, and orchestrator models.
- [ ] I can separate secrets from configuration.
- [ ] I can explain readiness and liveness.
- [ ] I can define rollback triggers.
- [ ] I can describe promotion evidence.

## Related Links

- Notebook: [Cloud Deployment Models](../../notebooks/en/49-cloud-deployments.md)
- Exercise: [Plan a cloud deployment](../../exercises/en/49-plan-a-cloud-deployment.md)
- Lab: [Deploy an application to the cloud](../../labs/en/49-deploy-an-application-to-the-cloud.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
