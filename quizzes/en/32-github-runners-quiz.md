---
chapter: 32
title: "GitHub Actions Runners Quiz"
related_notebook: "GitHub Actions Runners"
related_exercise: "Select GitHub Runners"
related_lab: "Configure Runner Selection"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/31-github-actions-jobs-and-steps.md) | [Notebook](../../notebooks/en/32-github-runners.md) | [Exercise](../../exercises/en/32-select-github-runners.md) | [Lab](../../labs/en/32-configure-runner-selection.md) | [Roadmap](../../ROADMAP.md)

# GitHub Actions Runners Quiz

### Question 1

What is a key advantage of a GitHub-hosted runner?

**Answer:** It is normally a clean, temporary machine managed by GitHub, reducing local maintenance.

### Question 2

True or False: A runner label grants permission to use the runner.

**Answer:** False. Labels route jobs; groups and policy control access.

### Question 3

Why is self-hosting a security responsibility?

**Answer:** The owner must patch, isolate, monitor, clean, and control a machine that executes workflow code.

### Question 4

How should fork pull requests be handled when sensitive self-hosted runners exist?

**Answer:** Keep untrusted code on hosted or isolated runners and require review or approval before sensitive access.

### Related Content

- Previous notebook: [GitHub Actions Jobs and Steps](../../notebooks/en/31-github-actions-jobs-and-steps.md)
- Notebook: [GitHub Actions Runners](../../notebooks/en/32-github-runners.md)
- Exercise: [Select GitHub Runners](../../exercises/en/32-select-github-runners.md)
- Lab: [Configure Runner Selection](../../labs/en/32-configure-runner-selection.md)
