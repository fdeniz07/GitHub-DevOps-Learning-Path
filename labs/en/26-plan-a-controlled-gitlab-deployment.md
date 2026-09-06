---
chapter: 26
title: "Plan a Controlled GitLab Deployment"
related_notebook: "Environments & Deployments"
related_exercise: "Map GitLab Environments"
level: Beginner
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/26-gitlab-environments-and-deployments.md) | [Exercise](../../exercises/en/26-map-gitlab-environments.md) | [Quiz](../../quizzes/en/26-gitlab-environments-and-deployments-quiz.md) | [Roadmap](../../ROADMAP.md)

# Plan a Controlled GitLab Deployment

## Objective

Design a safe staging-to-production deployment flow without publishing credentials or deploying a real service.

## Tasks

1. Add `deploy_staging` and manual `deploy_production` jobs to a training `.gitlab-ci.yml`, each with an environment name.
2. Write a release checklist: tested artifact identifier, successful pipeline, approval, smoke test, and monitoring owner.
3. Write a rollback procedure using a known-good version and a confirmation check.

## Validation Checklist

- [ ] Production is a manual, protected decision point.
- [ ] No token or secret appears in the YAML example.
- [ ] The same artifact is promoted from staging to production.
- [ ] Rollback is documented before release.

## Troubleshooting

| Problem                       | Response                                                        |
| ----------------------------- | --------------------------------------------------------------- |
| Production job is unavailable | Check protected environment and branch rules with a maintainer. |
| Smoke test fails              | Stop promotion, inspect evidence, and follow the rollback plan. |

### Related Content

- Notebook: [Environments & Deployments](../../notebooks/en/26-gitlab-environments-and-deployments.md)
- Exercise: [Map GitLab Environments](../../exercises/en/26-map-gitlab-environments.md)
- Quiz: [Environments & Deployments Quiz](../../quizzes/en/26-gitlab-environments-and-deployments-quiz.md)
