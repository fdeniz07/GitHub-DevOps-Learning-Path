---
chapter: 32
title: "Select GitHub Runners"
related_notebook: "GitHub Actions Runners"
level: Beginner
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/31-github-actions-jobs-and-steps.md) | [Notebook](../../notebooks/en/32-github-runners.md) | [Lab](../../labs/en/32-configure-runner-selection.md) | [Quiz](../../quizzes/en/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

# Select GitHub Runners

## Objective

Choose a runner strategy that meets technical requirements without weakening trust boundaries.

## Scenario

A workflow needs Linux, Docker, and access to a private integration service. A pull request from a fork can trigger validation, but deployment runs only after approval.

## Tasks

1. Choose hosted or self-hosted runners for validation and explain the trust decision.
2. Define labels for a dedicated integration runner.
3. Identify which job must never receive unreviewed fork code or production credentials.

## Expected Result

You recommend hosted runners for untrusted validation, isolated labeled runners for private integration, and an approval boundary before deployment.

## Self-Assessment

- [ ] I understand that labels describe capability, not authorization.
- [ ] I can name the maintenance responsibilities of self-hosting.
- [ ] I can identify a runner trust boundary.

### Related Content

- Notebook: [GitHub Actions Runners](../../notebooks/en/32-github-runners.md)
- Lab: [Configure Runner Selection](../../labs/en/32-configure-runner-selection.md)
- Quiz: [GitHub Actions Runners Quiz](../../quizzes/en/32-github-runners-quiz.md)
