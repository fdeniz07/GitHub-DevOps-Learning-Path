---
chapter: 09
title: "Recover from a Bad Commit"
related_notebook: "Advanced Git Techniques"
level: Intermediate
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/09-advanced-git-techniques.md) | [Lab](../../labs/en/09-recover-and-debug-with-git.md) | [Quiz](../../quizzes/en/09-advanced-git-techniques-quiz.md) | [Roadmap](../../ROADMAP.md)

# Recover from a Bad Commit

## Objective

Practice the difference between undoing a local change and reversing a commit while preserving repository context.

## Scenario

A commit was created with the wrong content or the wrong branch state. You need to decide whether to move the branch pointer backward or create a corrective commit that leaves history visible for review.

## Tasks

1. Create a small project and commit a meaningful change.
2. Make one more incorrect change and commit it.
3. Run `git log --oneline -n 3` to inspect the latest history.
4. Use `git revert HEAD` to reverse the last commit without deleting it.
5. Run `git log --oneline --decorate --graph --all` and explain what changed in the history.

## Expected Outcome

The repository history still shows the original bad commit, and a new commit reverses its effect. This preserves accountability and makes the recovery traceable.

## Self-Check

- [ ] I can explain why `git revert` is safer than `git reset` for a shared history.
- [ ] I understand the difference between rewriting local history and creating a corrective commit.
- [ ] I can identify the new revert commit in `git log`.

### Related Content

- Notebook: [Advanced Git Techniques](../../notebooks/en/09-advanced-git-techniques.md)
- Lab: [Recover and Debug with Git](../../labs/en/09-recover-and-debug-with-git.md)
- Quiz: [Advanced Git Techniques Quiz](../../quizzes/en/09-advanced-git-techniques-quiz.md)
