---
chapter: 24
title: "Write a GitLab CI Pipeline"
related_notebook: ".gitlab-ci.yml, Pipelines, Stages & Jobs"
level: Beginner
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Chapter 23](../../notebooks/en/23-gitlab-cicd-foundations.md) | [Notebook](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md) | [Lab](../../labs/en/24-review-a-gitlab-ci-pipeline.md) | [Quiz](../../quizzes/en/24-gitlab-ci-yml-pipelines-stages-and-jobs-quiz.md) | [Roadmap](../../ROADMAP.md)

## Write a GitLab CI Pipeline

## Objective

Create and explain a readable `.gitlab-ci.yml` for a small Node.js project.

## Scenario

The project has `npm run lint`, `npm test`, and `npm run build`. The team wants lint and tests to verify a change before the build runs. No deployment, cache setup, or secrets are part of this exercise.

## Tasks

### Task 1 - Shape the YAML

Write a root-level `.gitlab-ci.yml` with a `stages` list containing `verify` and `build`. Add `lint` and `test` maps in `verify`, each with a `script` list.

**Expected Result:** Indentation is consistent, every key has a colon, and every list item starts with `-`.

### Task 2 - Add a shared execution environment

Add `default` with `image: node:22-alpine` and `before_script` containing `npm ci`. Explain why the commands remain under each job's `script`.

**Expected Result:** The common environment is shared without obscuring the separate lint and test purposes.

### Task 3 - Add rules and a dependency

Use `workflow: rules` to allow merge request event and push pipelines, then reject other sources. Add a `build` job with `needs: [test]`. Explain the meaning of `'$CI_PIPELINE_SOURCE == "merge_request_event"'` and draw the dependency as `test -> build`.

**Expected Result:** You distinguish pipeline creation from job execution order.

### Task 4 - Review safely

Use CI Lint, then inspect the pipeline graph after a small non-secret change. If a job fails, write down its first failing command and error instead of repeatedly retrying it.

**Expected Result:** Your review records evidence and no sensitive value is placed in the file or log.

## Self-Assessment

- [ ] I can distinguish a YAML map from a YAML list.
- [ ] I can explain why lint and test may run in parallel.
- [ ] I can explain the roles of `workflow: rules`, job `rules`, and `needs`.

## Related Content

- Notebook: [.gitlab-ci.yml, Pipelines, Stages & Jobs](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md)
- Lab: [Review a GitLab CI Pipeline](../../labs/en/24-review-a-gitlab-ci-pipeline.md)
- Quiz: [Chapter 24 Quiz](../../quizzes/en/24-gitlab-ci-yml-pipelines-stages-and-jobs-quiz.md)
