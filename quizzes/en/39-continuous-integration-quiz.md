---
chapter: 39
title: "Continuous Integration Quiz"
related_notebook: "Continuous Integration"
related_exercise: "Design a Continuous Integration Workflow"
related_lab: "Build a Continuous Integration Pipeline"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/39-continuous-integration.md) | [Exercise](../../exercises/en/39-design-a-continuous-integration-workflow.md) | [Lab](../../labs/en/39-build-a-continuous-integration-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Continuous Integration Quiz

## Learning Objectives

- Explain frequent validation and required checks.
- Read basic GitHub Actions triggers and permissions.
- Choose a safe CI response to a failing test.

## Questions

### Question 1

What is the primary purpose of CI?

- A. Deploy every commit to production
- B. Validate integrated changes frequently
- C. Replace code review
- D. Store release artifacts forever

**Answer:** B. CI validates integrated changes frequently.

### Question 2

Which trigger validates a proposed pull request?

- A. `pull_request`
- B. `workflow_dispatch` only
- C. `schedule` only
- D. `release` only

**Answer:** A. `pull_request`.

### Question 3

True or false: `contents: read` is generally safer than `write-all` for a test-only job.

**Answer:** True. A test-only job normally needs no repository write access.

### Question 4

Why should flaky tests be fixed instead of ignored?

**Expected Answer:** Unreliable tests destroy trust in the feedback signal and allow real failures to be overlooked.

### Question 5 — Practical Scenario

A pull request changes application code and the CI test job fails. Should the team merge because the change is small?

**Expected Answer:** No. Investigate the failure, fix the code or test if appropriate, rerun CI, and merge only when required checks pass.

## Review Checklist

- [ ] I can explain CI.
- [ ] I understand `pull_request` and `push` triggers.
- [ ] I can choose minimal permissions.
- [ ] I know how required checks protect `main`.

## Related Links

- Notebook: [Continuous Integration](../../notebooks/en/39-continuous-integration.md)
- Exercise: [Design a Continuous Integration Workflow](../../exercises/en/39-design-a-continuous-integration-workflow.md)
- Lab: [Build a Continuous Integration Pipeline](../../labs/en/39-build-a-continuous-integration-pipeline.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
