---
chapter: 31
title: "Design GitHub Actions Jobs and Steps"
related_notebook: "GitHub Actions Jobs and Steps"
level: Beginner
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/30-yaml-fundamentals.md) | [Notebook](../../notebooks/en/31-github-actions-jobs-and-steps.md) | [Lab](../../labs/en/31-build-a-job-dependency-workflow.md) | [Quiz](../../quizzes/en/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

# Design GitHub Actions Jobs and Steps

## Objective

Design a workflow graph that exposes parallel work, dependencies, and a small job output.

## Learning Outcomes

- identify the correct job boundary;
- declare `needs` dependencies;
- map a step output to a job output.

## Scenario

Your team wants linting and unit tests to run independently after checkout, while packaging waits for both checks and uses a generated artifact name.

## Tasks

### Task 1

Sketch jobs named `lint`, `test`, and `package`. Decide which jobs can run in parallel and which job must wait.

### Expected Result

`lint` and `test` are independent; `package` declares `needs: [lint, test]`.

### Task 2

Add a `prepare` step that writes `artifact_name=app-${GITHUB_SHA::7}` to `$GITHUB_OUTPUT`, then expose it as a job output.

### Expected Result

The package job can read `needs.<job-id>.outputs.artifact_name` without using a secret.

### Task 3

Review the workflow for accidental dependencies, unclear names, and excessive permissions.

### Expected Result

The graph is readable, only real dependencies are declared, and permissions are least-privilege.

## Self-Assessment

- [ ] I can distinguish a job from a step.
- [ ] I can explain why `needs` is required.
- [ ] I can pass a small non-sensitive value between jobs.

## Summary

Model the dependency graph explicitly and keep data passed between jobs small and non-sensitive.

### Related Content

- Notebook: [GitHub Actions Jobs and Steps](../../notebooks/en/31-github-actions-jobs-and-steps.md)
- Lab: [Build a Job Dependency Workflow](../../labs/en/31-build-a-job-dependency-workflow.md)
- Quiz: [GitHub Actions Jobs and Steps Quiz](../../quizzes/en/31-github-actions-jobs-and-steps-quiz.md)
