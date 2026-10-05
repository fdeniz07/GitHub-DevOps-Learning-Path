---
chapter: 34
title: "Build and Test a Custom Action"
related_notebook: "Writing Custom GitHub Actions"
related_exercise: "Design a Custom GitHub Action"
level: Intermediate
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/33-github-marketplace-actions.md) | [Notebook](../../notebooks/en/34-writing-custom-github-actions.md) | [Exercise](../../exercises/en/34-design-a-custom-github-action.md) | [Quiz](../../quizzes/en/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Build and Test a Custom Action

## Objective

Implement a small custom action with a documented metadata contract, tests, and a versioned release plan.

## Requirements

- Node.js for a JavaScript action, or Docker for a Docker action.
- A repository where `action.yml` can live at the action root.
- A test workflow that invokes the action through `uses`.

## Tasks

### Task 1 — Define the contract

Create `action.yml` with one required input and one output. State validation and failure behavior.

### Task 2 — Implement the runtime

Implement the action in JavaScript or Docker. Keep logs useful but never print tokens, credentials, or full environment dumps.

### Task 3 — Test the public interface

Test valid and invalid inputs, output values, and a caller workflow. For JavaScript, build the distribution bundle used by the runner.

### Task 4 — Version the action

Create a release plan for an immutable version tag and a major compatibility tag. Describe the change that would require a major version.

## Expected Outcome

The action runs from a clean workflow, produces the documented output, fails clearly for invalid input, and has a reproducible release process.

## Validation Checklist

- [ ] `action.yml` matches the implementation.
- [ ] Unit or focused runtime tests pass.
- [ ] The caller workflow test passes.
- [ ] Generated distribution content is current.
- [ ] Release and rollback behavior are documented.

### Related Content

- Previous notebook: [GitHub Marketplace Actions](../../notebooks/en/33-github-marketplace-actions.md)
- Notebook: [Writing Custom GitHub Actions](../../notebooks/en/34-writing-custom-github-actions.md)
- Exercise: [Design a Custom GitHub Action](../../exercises/en/34-design-a-custom-github-action.md)
- Quiz: [Writing Custom GitHub Actions Quiz](../../quizzes/en/34-writing-custom-github-actions-quiz.md)
