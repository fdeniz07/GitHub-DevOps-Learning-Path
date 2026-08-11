---
chapter: 07
title: "Merge and Merge Conflicts Quiz"
related_notebook: "Merge and Merge Conflicts"
related_exercise: "Merge a Feature Branch"
related_lab: "Resolve a Merge Conflict"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/07-merge-and-merge-conflicts.md) | [Exercise](../../exercises/en/07-merge-a-feature-branch.md) | [Lab](../../labs/en/07-resolve-a-merge-conflict.md) | [Roadmap](../../ROADMAP.md)

# Merge and Merge Conflicts Quiz

## Multiple Choice

### Question 1

Which branch receives work when you run `git merge feature/add-template`?

- A. The branch named in the command
- B. The currently checked-out branch
- C. Every local branch
- D. The remote default branch

#### Answer and Explanation: Question 1

**B.** Git merges the named source branch into the branch currently checked out.

## True or False

### Question 2

Conflict markers should be removed only after you decide the intended final file content.

#### Answer and Explanation: Question 2

**True.** The markers expose competing edits that require a human decision.

## Practical Scenario

You started a merge on the wrong target branch and have not resolved or committed it. Which command returns to the pre-merge state when possible?

### Expected Answer: Practical Scenario

`git merge --abort`.

### Related Content

- Notebook: [Merge and Merge Conflicts](../../notebooks/en/07-merge-and-merge-conflicts.md)
- Exercise: [Merge a Feature Branch](../../exercises/en/07-merge-a-feature-branch.md)
- Lab: [Resolve a Merge Conflict](../../labs/en/07-resolve-a-merge-conflict.md)
