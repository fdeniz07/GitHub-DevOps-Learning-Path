---
chapter: 33
title: "Harden a Marketplace Action"
related_notebook: "GitHub Marketplace Actions"
related_exercise: "Review a Marketplace Action"
level: Intermediate
estimated_time: 70 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/32-github-runners.md) | [Notebook](../../notebooks/en/33-github-marketplace-actions.md) | [Exercise](../../exercises/en/33-review-a-marketplace-action.md) | [Quiz](../../quizzes/en/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Harden a Marketplace Action

## Objective

Adopt a third-party action with verified provenance, least privilege, and tested inputs and outputs.

## Requirements

- A candidate action with public metadata and source.
- A test repository or branch where the workflow can run safely.
- A method for recording the reviewed commit and update owner.

## Tasks

1. Read `action.yml` and list every input, output, runtime, and permission used by the candidate.
2. Review source, dependencies, release history, and maintenance signals.
3. Replace the mutable tag with a verified full commit SHA.
4. Add a focused workflow that passes non-sensitive inputs and asserts the expected output.
5. Record how update proposals will be reviewed and tested.

## Expected Outcome

The workflow uses a reviewed immutable reference, minimal permissions, and evidence that the action's interface behaves as expected.

## Validation Checklist

- [ ] The SHA is verified against the intended release.
- [ ] Inputs and outputs match metadata.
- [ ] Secrets are not printed or passed unnecessarily.
- [ ] An update and rollback process is documented.

### Related Content

- Previous notebook: [GitHub Actions Runners](../../notebooks/en/32-github-runners.md)
- Notebook: [GitHub Marketplace Actions](../../notebooks/en/33-github-marketplace-actions.md)
- Exercise: [Review a Marketplace Action](../../exercises/en/33-review-a-marketplace-action.md)
- Quiz: [GitHub Marketplace Actions Quiz](../../quizzes/en/33-github-marketplace-actions-quiz.md)
