---
chapter: 33
title: "Review a Marketplace Action"
related_notebook: "GitHub Marketplace Actions"
level: Intermediate
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/32-github-runners.md) | [Notebook](../../notebooks/en/33-github-marketplace-actions.md) | [Lab](../../labs/en/33-harden-a-marketplace-action.md) | [Quiz](../../quizzes/en/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Review a Marketplace Action

## Objective

Perform an evidence-based supply-chain review before adding an action to a workflow.

## Scenario

A pull request proposes adding a Marketplace action using `@v4` to publish build metadata.

## Tasks

1. Inspect the action metadata for inputs, outputs, runtime, and required permissions.
2. Review source, releases, maintainers, dependencies, and network behavior.
3. Replace the mutable reference with a verified commit SHA and document the update process.

## Expected Result

You produce a short review record that explains trust, least privilege, pinning, and test evidence.

## Self-Assessment

- [ ] I read action metadata before using inputs.
- [ ] I understand why a commit SHA improves reproducibility.
- [ ] I can identify missing supply-chain evidence.

### Related Content

- Notebook: [GitHub Marketplace Actions](../../notebooks/en/33-github-marketplace-actions.md)
- Lab: [Harden a Marketplace Action](../../labs/en/33-harden-a-marketplace-action.md)
- Quiz: [GitHub Marketplace Actions Quiz](../../quizzes/en/33-github-marketplace-actions-quiz.md)
