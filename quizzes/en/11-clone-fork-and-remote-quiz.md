---
chapter: 11
title: "Clone, Fork & Remote Quiz"
related_notebook: "Clone, Fork & Remote"
related_exercise: "Inspect a Remote Repository"
related_lab: "Fork and Sync a Repository"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/11-clone-fork-and-remote.md) | [Exercise](../../exercises/en/11-inspect-remote-repository.md) | [Lab](../../labs/en/11-fork-and-sync-a-repository.md) | [Roadmap](../../ROADMAP.md)

# Clone, Fork & Remote Quiz

## Multiple Choice

### Question 1

What does `git remote -v` show?

- A. The current and previous branches
- B. The configured remote repository connections
- C. The Git commit object IDs
- D. The file contents of the remote repository

#### Answer and Explanation: Question 1

**B.** It lists the configured remote URLs and their fetch/push targets.

### Question 2

Which statement is true about a fork?

- A. A fork is a local copy made on your machine.
- B. A fork is a repository created under your account based on another repository.
- C. A fork automatically merges with the original repository.
- D. A fork deletes the original repository history.

#### Answer and Explanation: Question 2

**B.** A fork creates a separate repository under your account, which is commonly used for open-source contribution.

## Short Answer

### Question 3

What is the difference between `origin` and `upstream` in a typical contributor workflow?

#### Answer and Explanation: Question 3

`origin` usually points to your personal fork, while `upstream` refers to the original project repository that you are contributing to.

## Practical Scenario

You want to contribute to a public project without changing the official repository directly. What workflow should you use?

### Expected Answer: Practical Scenario

Create a fork, clone it locally, add the original project as `upstream`, make a branch-based change, and open a pull request to the upstream repository.

### Related Content

- Notebook: [Clone, Fork & Remote](../../notebooks/en/11-clone-fork-and-remote.md)
- Exercise: [Inspect a Remote Repository](../../exercises/en/11-inspect-remote-repository.md)
- Lab: [Fork and Sync a Repository](../../labs/en/11-fork-and-sync-a-repository.md)
