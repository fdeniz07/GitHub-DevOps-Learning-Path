---
chapter: 05
title: "Working with Commits Quiz"
related_notebook: "Working with Commits"
related_exercise: "Create a Focused Commit"
related_lab: "Create Focused Commits"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/05-working-with-commits.md) | [Exercise](../../exercises/en/05-create-a-focused-commit.md) | [Lab](../../labs/en/05-create-focused-commits.md) | [Roadmap](../../ROADMAP.md)

# Working with Commits Quiz

## Objective

Check your understanding of staging, commits, commit messages, and local history.

## Multiple Choice

### Question 1

Which command selects `README.md` for the next commit?

- A. `git status README.md`
- B. `git add README.md`
- C. `git log README.md`
- D. `git push README.md`

#### Answer and Explanation: Question 1

**B.** `git add README.md` places that file's current content in the staging area.

### Question 2

What does `git commit -m "Add project README"` record?

- A. Every file visible in the project directory
- B. Only the content currently staged for commit
- C. A copy of a remote GitHub repository
- D. A new branch

#### Answer and Explanation: Question 2

**B.** A commit records the selected staging-area content, not all working-directory files.

## True or False

### Question 3

`git status` can help you distinguish unstaged changes from changes that are ready to commit.

#### Answer and Explanation: Question 3

**True.** It groups content by its current Git state.

### Question 4

The message `update` gives future readers enough information about a commit's purpose.

#### Answer and Explanation: Question 4

**False.** Use a concise, meaningful message such as `Add project README`.

## Short Answer

### Question 5

Which command displays recent commits as short one-line entries?

#### Expected Answer: Question 5

`git log --oneline`.

## Practical Scenario

You staged `README.md` and `ideas.txt`, but only the README belongs in the next commit. What command removes `ideas.txt` from the staging area while keeping its file content?

### Expected Answer: Practical Scenario

Run `git restore --staged ideas.txt`, then use `git status` to confirm that only the README remains staged.

### Related Content

- Notebook: [Working with Commits](../../notebooks/en/05-working-with-commits.md)
- Exercise: [Create a Focused Commit](../../exercises/en/05-create-a-focused-commit.md)
- Lab: [Create Focused Commits](../../labs/en/05-create-focused-commits.md)
