---
chapter: 24
title: "Review a GitLab CI Pipeline"
related_notebook: ".gitlab-ci.yml, Pipelines, Stages & Jobs"
related_exercise: "Write a GitLab CI Pipeline"
level: Beginner
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Chapter 23](../../notebooks/en/23-gitlab-cicd-foundations.md) | [Notebook](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md) | [Exercise](../../exercises/en/24-write-a-gitlab-ci-pipeline.md) | [Quiz](../../quizzes/en/24-gitlab-ci-yml-pipelines-stages-and-jobs-quiz.md) | [Roadmap](../../ROADMAP.md)

## Review a GitLab CI Pipeline

## Objective

Find configuration and execution problems in a proposed Node.js pipeline, then produce a safe corrected version.

## Scenario

A teammate submits this file for review:

```yaml
stages:
  - verify
    - build

lint:
  stage: verify
  image: node:22-alpine
  script: npm run lint

test:
  stage: verify
  script:
    - npm test

build:
  stage: build
  needs: test
  script:
    - npm run build
```

## Prerequisites

- Completed the [notebook](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md).
- Access to GitLab CI Lint or a team-provided validation environment.

## Tasks

### Task 1 - Inspect structure

Identify the indentation defect in `stages`. State which values are YAML lists and which are maps. Explain why `script: npm run lint` can be valid YAML but a list is clearer when a job may grow.

**Expected Result:** You separate syntax errors from style and maintenance concerns.

### Task 2 - Correct the job model

Create a corrected file with explicit `verify` and `build` stages, a shared Node image and `npm ci` preparation, plus distinct lint, test, and build scripts. Make `build` depend on `test` with list syntax.

**Expected Result:** Lint and test may run in parallel; build has clear required evidence.

### Task 3 - Add creation control

Add `workflow: rules` that permits merge request event and push sources, then ends with `when: never`. Explain why this decision happens before a job's `rules` are evaluated.

**Expected Result:** Unwanted pipeline sources do not create a pipeline.

### Task 4 - Validate and diagnose

Run CI Lint, inspect the resulting graph, and trigger only a harmless validation pipeline. For a failure, capture the first failed command and error. Do not add credentials, deploy commands, or cache configuration.

**Expected Result:** The review has a valid configuration, graph evidence, and a documented response to failures.

## Validation Checklist

- [ ] All YAML list items align.
- [ ] The root file is named `.gitlab-ci.yml`.
- [ ] Pipeline creation rules and job dependencies are explained.
- [ ] Logs are read before any retry decision.

## Related Content

- Notebook: [.gitlab-ci.yml, Pipelines, Stages & Jobs](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md)
- Exercise: [Write a GitLab CI Pipeline](../../exercises/en/24-write-a-gitlab-ci-pipeline.md)
- Quiz: [Chapter 24 Quiz](../../quizzes/en/24-gitlab-ci-yml-pipelines-stages-and-jobs-quiz.md)
