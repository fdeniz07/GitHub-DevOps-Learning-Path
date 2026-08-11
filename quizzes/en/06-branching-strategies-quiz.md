---
chapter: 06
title: "Branching Strategies Quiz"
related_notebook: "Branching Strategies"
related_exercise: "Create a Feature Branch"
related_lab: "Create and Inspect Branches"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/06-branching-strategies.md) | [Exercise](../../exercises/en/06-create-a-feature-branch.md) | [Lab](../../labs/en/06-create-and-inspect-branches.md) | [Roadmap](../../ROADMAP.md)

# Branching Strategies Quiz

## Multiple Choice

### Question 1

Which command creates and switches to `feature/add-template`?

- A. `git branch feature/add-template`
- B. `git switch -c feature/add-template`
- C. `git merge feature/add-template`
- D. `git log feature/add-template`

#### Answer and Explanation: Question 1

**B.** `git switch -c` creates the named branch from the current commit and checks it out.

### Question 2

What does `git branch` mark with `*`?

- A. The oldest branch
- B. The remote branch
- C. The currently active branch
- D. The branch with conflicts

#### Answer and Explanation: Question 2

**C.** The asterisk identifies the branch currently checked out in the working directory.

## True or False

### Question 3

Switching from a feature branch to `main` automatically merges the feature commits.

#### Answer and Explanation: Question 3

**False.** Switching changes the active branch; integration is a separate operation.

## Practical Scenario

You must add a changelog entry without changing the stable main line. Which branch name is clearer: `new` or `docs/add-changelog-entry`? Explain briefly.

### Expected Answer: Practical Scenario

`docs/add-changelog-entry` is clearer because it communicates both the type and purpose of the work.

### Related Content

- Notebook: [Branching Strategies](../../notebooks/en/06-branching-strategies.md)
- Exercise: [Create a Feature Branch](../../exercises/en/06-create-a-feature-branch.md)
- Lab: [Create and Inspect Branches](../../labs/en/06-create-and-inspect-branches.md)
