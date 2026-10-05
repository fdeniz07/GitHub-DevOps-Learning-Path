---
chapter: 32
title: "Configure Runner Selection"
related_notebook: "GitHub Actions Runners"
related_exercise: "Select GitHub Runners"
level: Beginner
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/31-github-actions-jobs-and-steps.md) | [Notebook](../../notebooks/en/32-github-runners.md) | [Exercise](../../exercises/en/32-select-github-runners.md) | [Quiz](../../quizzes/en/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

# Configure Runner Selection

## Objective

Configure and document runner routing for ordinary validation and sensitive integration work.

## Requirements

- Repository or organization administration access, or a written design-only lab mode.
- A workflow that runs a harmless validation command.
- A clear decision about whether self-hosted infrastructure is justified.

## Tasks

1. Run validation on a GitHub-hosted runner and record its image and tools.
2. Define a dedicated self-hosted label set such as `self-hosted`, `linux`, and `integration` without routing untrusted pull requests to it.
3. Document runner group access, patching, cleanup, monitoring, and teardown responsibilities.
4. Test that a job with unmatched labels stays queued rather than running on the wrong machine.

## Expected Outcome

The repository has a documented routing decision and no workflow path that sends unreviewed code to a sensitive runner.

## Validation Checklist

- [ ] Hosted and self-hosted trade-offs are recorded.
- [ ] Labels describe capabilities accurately.
- [ ] Sensitive access is restricted by groups or approvals.
- [ ] Runner cleanup and maintenance have an owner.

### Related Content

- Previous notebook: [GitHub Actions Jobs and Steps](../../notebooks/en/31-github-actions-jobs-and-steps.md)
- Notebook: [GitHub Actions Runners](../../notebooks/en/32-github-runners.md)
- Exercise: [Select GitHub Runners](../../exercises/en/32-select-github-runners.md)
- Quiz: [GitHub Actions Runners Quiz](../../quizzes/en/32-github-runners-quiz.md)
