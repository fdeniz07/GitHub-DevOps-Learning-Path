---
chapter: 23
title: "GitLab CI/CD Foundations Quiz"
related_notebook: "GitLab CI/CD Foundations"
related_exercise: "Diagnose GitLab Pipeline Results"
related_lab: "Investigate a GitLab Pipeline Failure"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/23-gitlab-cicd-foundations.md) | [Exercise](../../exercises/en/23-diagnose-gitlab-pipeline-results.md) | [Lab](../../labs/en/23-investigate-a-gitlab-pipeline-failure.md) | [Roadmap](../../ROADMAP.md)

## GitLab CI/CD Foundations Quiz

## Section A - Multiple Choice

### Question 1

What is a GitLab runner's conceptual role?

- A. It stores repository history.
- B. It receives and executes jobs.
- C. It approves merge requests.
- D. It writes pipeline configuration.

**Answer:** B

**Explanation:** A runner provides the execution environment for queued jobs.

### Question 2

Which status best describes a job that has been created but is waiting for an available runner?

- A. `pending`
- B. `passed`
- C. `canceled`
- D. `skipped`

**Answer:** A

**Explanation:** `pending` means the job has not started execution.

## Section B - True or False

### Question 3

A failed test assertion should normally be retried until it passes.

**Answer:** False

**Explanation:** A reproducible test failure is evidence that should be fixed or investigated.

### Question 4

A push or merge request can be a pipeline trigger, depending on project rules.

**Answer:** True

**Explanation:** Pipelines respond to configured events and may also support schedules or manual actions.

## Section C - Short Answer

### Question 5

How do jobs and stages differ?

**Expected Answer:** A job is one executable unit of work; a stage groups jobs into an ordered point in the pipeline lifecycle.

### Question 6

Name two pieces of evidence to collect from a failed job.

**Expected Answer:** The failing command, first meaningful error, trigger, commit, runner or queue state, and nearby log context are useful evidence.

## Practical Scenario

A job failed while an external service was unavailable, and the team has confirmed the outage ended. What is a safe action?

**Expected Answer:** Retry once, record the transient reason, and review the new result. Escalate if it fails again instead of repeating retries.

## Related Content

- Notebook: [GitLab CI/CD Foundations](../../notebooks/en/23-gitlab-cicd-foundations.md)
- Exercise: [Diagnose GitLab Pipeline Results](../../exercises/en/23-diagnose-gitlab-pipeline-results.md)
- Lab: [Investigate a GitLab Pipeline Failure](../../labs/en/23-investigate-a-gitlab-pipeline-failure.md)
