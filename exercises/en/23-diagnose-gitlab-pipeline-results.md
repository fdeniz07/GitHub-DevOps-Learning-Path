---
chapter: 23
title: "Diagnose GitLab Pipeline Results"
related_notebook: "GitLab CI/CD Foundations"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/23-gitlab-cicd-foundations.md) | [Lab](../../labs/en/23-investigate-a-gitlab-pipeline-failure.md) | [Quiz](../../quizzes/en/23-gitlab-cicd-foundations-quiz.md) | [Roadmap](../../ROADMAP.md)

## Diagnose GitLab Pipeline Results

## Objective

Interpret pipeline statuses, identify likely causes, and make evidence-based retry decisions.

## Scenario

Three merge requests show these results: `pending` because no eligible runner is available, `failed` because a test assertion is wrong, and `failed` after a documented temporary service outage.

## Tasks

### Task 1 - Classify the status

For each result, state whether the job is waiting, executing, complete, or blocked. Name the first place you would inspect.

**Expected Result:** You distinguish a queue problem from a command failure.

### Task 2 - Read failure evidence

For each failed job, record the failing command, first meaningful error, and whether the result looks reproducible or transient.

**Expected Result:** Your conclusion is based on job logs rather than the red status alone.

### Task 3 - Decide the next action

Choose one action for each case: wait or escalate runner availability, fix and push a new commit, or retry once with a recorded reason.

**Expected Result:** A retry is used only for the temporary outage case.

## Self-Assessment

- [ ] I can explain pipeline, job, stage, and runner.
- [ ] I can read a job status in context.
- [ ] I can distinguish a transient failure from a reproducible failure.

## Related Content

- Notebook: [GitLab CI/CD Foundations](../../notebooks/en/23-gitlab-cicd-foundations.md)
- Lab: [Investigate a GitLab Pipeline Failure](../../labs/en/23-investigate-a-gitlab-pipeline-failure.md)
- Quiz: [GitLab CI/CD Foundations Quiz](../../quizzes/en/23-gitlab-cicd-foundations-quiz.md)
