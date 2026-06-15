---
chapter: 38
title: "Artifacts Quiz"
related_notebook: "GitHub Actions Artifacts"
related_exercise: "Publish and Consume Workflow Artifacts"
related_lab: "Share Build Artifacts Between Jobs"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/en/38-github-actions-artifacts.md) | [Exercise](../../exercises/en/38-publish-and-consume-workflow-artifacts.md) | [Lab](../../labs/en/38-share-build-artifacts-between-jobs.md) | [Roadmap](../../ROADMAP.md)

# Artifacts Quiz

## Learning Objectives

- explain artifact transfer across jobs;
- choose retention and naming policies;
- validate files at a job boundary.

## Questions

### Question 1

Why does a workflow need artifacts to move a file from one job to another?

- A. Jobs always use the same runner
- B. Jobs have isolated runners and workspaces
- C. Artifacts replace all outputs
- D. Artifacts make tests optional

**Answer:** B. Jobs have isolated runners and workspaces.

### Question 2

What does `retention-days` control?

**Expected Answer:** How long the uploaded artifact remains available, subject to repository or organization limits.

### Question 3

True or False: A cache is the best place for a release package that must remain available.

**Answer:** False. Use an artifact or release mechanism with deliberate retention and validation.

### Question 4

How can matrix jobs avoid artifact name collisions?

**Expected Answer:** Include matrix values or another unique run identity in the artifact name.

### Question 5

What should a release job do before executing or publishing a downloaded artifact?

**Expected Answer:** Validate its expected files and integrity, using checksums or signatures when appropriate.

## Practical Scenario

A consumer job downloads an artifact containing a shell script and runs it immediately. What is the safer workflow design?

**Expected Answer:** Restrict the upload path, download to a clean directory, validate the content and integrity, and grant only the permissions needed after validation.

## Review Checklist

- [ ] I can distinguish artifacts, caches, and outputs.
- [ ] I can model a producer-consumer boundary.
- [ ] I can select a responsible retention period.

### Related Content

- Previous chapter: [Dependency Caching](../../notebooks/en/37-github-actions-dependency-caching.md)
- Notebook: [GitHub Actions Artifacts](../../notebooks/en/38-github-actions-artifacts.md)
- Exercise: [Publish and Consume Workflow Artifacts](../../exercises/en/38-publish-and-consume-workflow-artifacts.md)
- Lab: [Share Build Artifacts Between Jobs](../../labs/en/38-share-build-artifacts-between-jobs.md)
