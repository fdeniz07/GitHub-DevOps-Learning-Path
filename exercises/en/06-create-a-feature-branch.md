---
chapter: 06
title: "Create a Feature Branch"
related_notebook: "Branching Strategies"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/06-branching-strategies.md) | [Lab](../../labs/en/06-create-and-inspect-branches.md) | [Quiz](../../quizzes/en/06-branching-strategies-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create a Feature Branch

## Objective

Create a purpose-named feature branch, make one branch-specific commit, and prove that the primary branch remains unchanged.

## Scenario

The `release-notes` project needs a reusable issue template. Create the template on a branch named `feature/add-issue-template`; do not add it directly to `main`.

## Tasks

### Task 1 - Confirm the Starting Point

Run `git status` and `git branch`. Confirm that the working tree is clean and identify the current branch.

### Task 2 - Create and Use the Feature Branch

Run:

```bash
git switch -c feature/add-issue-template
git branch
```

Create `issue-template.md`, then stage and commit it with the message `Add issue template`.

#### Expected Outcome: Branch-specific Commit

The feature branch is marked with `*`, and its history contains the template commit.

### Task 3 - Inspect Both Lines of Work

Switch to the primary branch and run:

```bash
git switch main
git log --oneline --graph --all
```

#### Expected Outcome: Separate Histories

The feature commit remains visible in the all-branch graph but is not yet part of `main`.

## Self-Check

- [ ] I verified the active branch before committing.
- [ ] My branch name states one purpose.
- [ ] I can show that the feature commit is not merged into `main`.

### Related Content

- Notebook: [Branching Strategies](../../notebooks/en/06-branching-strategies.md)
- Lab: [Create and Inspect Branches](../../labs/en/06-create-and-inspect-branches.md)
- Quiz: [Branching Strategies Quiz](../../quizzes/en/06-branching-strategies-quiz.md)
