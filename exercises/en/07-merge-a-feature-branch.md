---
chapter: 07
title: "Merge a Feature Branch"
related_notebook: "Merge and Merge Conflicts"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/07-merge-and-merge-conflicts.md) | [Lab](../../labs/en/07-resolve-a-merge-conflict.md) | [Quiz](../../quizzes/en/07-merge-and-merge-conflicts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Merge a Feature Branch

## Objective

Integrate one completed feature branch into the primary branch and verify the resulting history.

## Scenario

`feature/add-issue-template` contains one ready commit. Integrate it into `main` only after confirming the working tree is clean.

## Tasks

1. Switch to `main`, then run `git status` and `git branch`.
1. Run `git merge feature/add-issue-template`.
1. Inspect `git status` and `git log --oneline --graph --all`.

## Expected Outcome

The feature commit is reachable from `main`, the working tree is clean, and no remote operation has occurred.

## Self-Check

- [ ] I merged while the target branch was active.
- [ ] I checked the working tree before the merge.
- [ ] I can identify the integrated commit in the graph.

### Related Content

- Notebook: [Merge and Merge Conflicts](../../notebooks/en/07-merge-and-merge-conflicts.md)
- Lab: [Resolve a Merge Conflict](../../labs/en/07-resolve-a-merge-conflict.md)
- Quiz: [Merge and Merge Conflicts Quiz](../../quizzes/en/07-merge-and-merge-conflicts-quiz.md)
