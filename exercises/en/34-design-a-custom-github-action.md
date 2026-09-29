---
chapter: 34
title: "Design a Custom GitHub Action"
related_notebook: "Writing Custom GitHub Actions"
level: Intermediate
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/33-github-marketplace-actions.md) | [Notebook](../../notebooks/en/34-writing-custom-github-actions.md) | [Lab](../../labs/en/34-build-and-test-a-custom-action.md) | [Quiz](../../quizzes/en/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Design a Custom GitHub Action

## Objective

Select an action type and define a stable, testable public contract.

## Scenario

Three repositories repeat the same metadata calculation. The maintainers want a reusable component without hiding job permissions or creating unnecessary infrastructure.

## Tasks

1. Decide between a composite, JavaScript, Docker action, or reusable workflow.
2. Draft `action.yml` inputs and outputs with validation rules.
3. Define tests for valid input, invalid input, output values, and a caller workflow.
4. Propose a versioning policy for `v1` and breaking changes.

## Expected Result

You deliver a small design that explains the choice, contract, tests, and release policy.

## Self-Assessment

- [ ] I can explain when a custom action is justified.
- [ ] I can distinguish an action from a reusable workflow.
- [ ] I can describe how the public interface will be tested.

### Related Content

- Notebook: [Writing Custom GitHub Actions](../../notebooks/en/34-writing-custom-github-actions.md)
- Lab: [Build and Test a Custom Action](../../labs/en/34-build-and-test-a-custom-action.md)
- Quiz: [Writing Custom GitHub Actions Quiz](../../quizzes/en/34-writing-custom-github-actions-quiz.md)
