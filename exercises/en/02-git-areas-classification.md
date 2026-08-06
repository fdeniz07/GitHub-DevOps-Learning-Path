---
chapter: 02
title: "Git Areas Classification"
related_notebook: "Git Architecture"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/02-git-architecture.md) | [Lab](../../labs/en/02-git-change-flow-lab.md) | [Quiz](../../quizzes/en/02-git-architecture-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git Areas Classification

## Objective

Classify project changes by Git area and decide which changes belong in one focused history entry.

## Learning Outcomes

- Identify the working directory, staging area, and local repository.
- Explain how a file moves between Git's local areas.
- Select related changes while leaving unrelated or temporary work out of a commit.

## Prerequisites

- Complete [Chapter 02: Git Architecture](../../notebooks/en/02-git-architecture.md).
- No Git installation is required for this written exercise.

## Scenario

You are maintaining a portfolio site. During the same afternoon, you correct a broken setup link in `README.md`, begin an unfinished navigation redesign in `index.html`, and create `notes.txt` for temporary ideas.

## Tasks

### Task 1 - Classify the current state

Before selecting anything, state which Git area contains the latest versions of all three files and why.

#### Expected Result: Current State

You explain that edited and newly created files are in the working directory until selected.

### Task 2 - Prepare one focused change

Decide which file version should be placed in the staging area for a commit named `docs: correct setup link`. Explain why the other files should remain unselected.

#### Expected Result: Focused Selection

Only the README correction is selected because it represents the intended documentation change.

### Task 3 - Describe the resulting history

After recording the selected snapshot, describe the state of `README.md`, `index.html`, and `notes.txt`. Include which area contains the recorded documentation fix and which files still require attention.

#### Expected Result: Resulting History

The local repository contains the selected README snapshot; unfinished navigation work and temporary notes remain outside that focused commit.

## Challenge (Optional)

Suppose `README.md` is changed again after it is staged but before the commit. Explain which version Git is prepared to record and how `git status` would help you inspect the difference.

## Self-Assessment

- [ ] I can name Git's three local areas.
- [ ] I can explain why saving a file does not create history.
- [ ] I can select a focused change without including unrelated work.
- [ ] I know when to use `git status`.

## Summary

- The working directory contains current project files.
- The staging area holds the selected next snapshot.
- A commit records the selected snapshot in the local repository.

### Related Content

- Notebook: [Git Architecture](../../notebooks/en/02-git-architecture.md)
- Lab: [Git Change Flow Lab](../../labs/en/02-git-change-flow-lab.md)
- Quiz: [Git Architecture Quiz](../../quizzes/en/02-git-architecture-quiz.md)
