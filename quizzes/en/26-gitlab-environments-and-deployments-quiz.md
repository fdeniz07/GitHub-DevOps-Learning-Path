---
chapter: 26
title: "Environments & Deployments Quiz"
related_notebook: "Environments & Deployments"
related_exercise: "Map GitLab Environments"
related_lab: "Plan a Controlled GitLab Deployment"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/26-gitlab-environments-and-deployments.md) | [Exercise](../../exercises/en/26-map-gitlab-environments.md) | [Lab](../../labs/en/26-plan-a-controlled-gitlab-deployment.md) | [Roadmap](../../ROADMAP.md)

# Environments & Deployments Quiz

### Question 1

What is an environment?

**Answer:** A named target where a particular application version is deployed, such as staging or production.

### Question 2

Why should production deployment usually have stricter controls than staging?

**Answer:** It affects real users and systems, so access, approval, verification, and rollback risk are higher.

### True or False

Rebuilding a new artifact for production is the best way to prove that staging was tested.

**Answer:** False. Promote the tested artifact to retain traceability.

### Scenario

A post-deployment health check fails.

**Expected Answer:** Stop promotion, inspect evidence, use the preplanned rollback to a known-good version when appropriate, and verify recovery.

### Related Content

- Notebook: [Environments & Deployments](../../notebooks/en/26-gitlab-environments-and-deployments.md)
- Exercise: [Map GitLab Environments](../../exercises/en/26-map-gitlab-environments.md)
- Lab: [Plan a Controlled GitLab Deployment](../../labs/en/26-plan-a-controlled-gitlab-deployment.md)
