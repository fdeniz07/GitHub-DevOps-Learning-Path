---
chapter: 34
title: "Writing Custom GitHub Actions Quiz"
related_notebook: "Writing Custom GitHub Actions"
related_exercise: "Design a Custom GitHub Action"
related_lab: "Build and Test a Custom Action"
level: Intermediate
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/33-github-marketplace-actions.md) | [Notebook](../../notebooks/en/34-writing-custom-github-actions.md) | [Exercise](../../exercises/en/34-design-a-custom-github-action.md) | [Lab](../../labs/en/34-build-and-test-a-custom-action.md) | [Roadmap](../../ROADMAP.md)

# Writing Custom GitHub Actions Quiz

### Question 1

What is the purpose of `action.yml`?

**Answer:** It defines the action's name, interface, runtime, inputs, outputs, and execution metadata.

### Question 2

When might a reusable workflow be preferable to a custom action?

**Answer:** When the reusable unit needs multiple jobs, permissions, environments, matrices, or deployment orchestration.

### Question 3

True or False: JavaScript action source alone is enough when the runner executes a committed distribution file.

**Answer:** False. The distribution bundle must be rebuilt and tested so the executed entry point matches the source.

### Question 4

What should a custom action test besides its happy path?

**Answer:** Invalid inputs, clear failures, output values, and a real caller workflow on supported runners.

### Question 5

What kind of change normally requires a new major action version?

**Answer:** A breaking change to the documented inputs, outputs, behavior, or runtime contract.

### Related Content

- Previous notebook: [GitHub Marketplace Actions](../../notebooks/en/33-github-marketplace-actions.md)
- Notebook: [Writing Custom GitHub Actions](../../notebooks/en/34-writing-custom-github-actions.md)
- Exercise: [Design a Custom GitHub Action](../../exercises/en/34-design-a-custom-github-action.md)
- Lab: [Build and Test a Custom Action](../../labs/en/34-build-and-test-a-custom-action.md)
