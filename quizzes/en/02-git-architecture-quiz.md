---
chapter: 02
title: "Git Architecture Quiz"
related_notebook: "Git Architecture"
related_exercise: "Git Areas Classification"
related_lab: "Git Change Flow Lab"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/02-git-architecture.md) | [Exercise](../../exercises/en/02-git-areas-classification.md) | [Lab](../../labs/en/02-git-change-flow-lab.md) | [Roadmap](../../ROADMAP.md)

# Git Architecture Quiz

## Purpose

This quiz evaluates your understanding of Git's three local areas and the path from an edited file to recorded history.

## Learning Objectives

- Identify the working directory, staging area, and local repository.
- Explain the purpose of `git add`, `git commit`, and `git status`.
- Decide which changes belong in a focused commit.

## Section A - Multiple Choice

### Question 1

Which Git area contains the files you edit in your project folder?

- A. Local repository
- B. Working directory
- C. Remote repository
- D. Release archive

#### Answer and Explanation: Question 1

**B.** The working directory contains the current files available for editing.

### Question 2

What is the primary purpose of the staging area?

- A. To permanently publish a change
- B. To store a backup of every file
- C. To select exact file versions for the next commit
- D. To send changes to teammates

#### Answer and Explanation: Question 2

**C.** The staging area is a deliberate selection for the next recorded snapshot.

## Section B - True / False

### Question 3

Saving an edited file automatically records it in Git history.

#### Answer and Explanation: Question 3

**False.** Saving changes the working directory. A selected version becomes local history only after a commit.

### Question 4

Creating a commit automatically shares it with teammates.

#### Answer and Explanation: Question 4

**False.** A commit records history locally. Remote sharing is introduced later in the course.

## Section C - Short Answer

### Question 5

What does `git status` help you understand?

#### Expected Answer: Question 5

It reports whether files are untracked, modified in the working directory, or staged for the next commit.

### Question 6

A README correction is staged, then the README is edited again before committing. Which version is prepared for the commit?

#### Expected Answer: Question 6

The version that was present when `git add` ran is staged. The later edit remains a separate working-directory change until selected again.

## Section D - Practical Scenario

### Scenario

You have corrected a broken link in `README.md`, started an unfinished navigation redesign in `index.html`, and created temporary `notes.txt`. The team asks for a clear documentation commit today.

### Question

Which file should be staged and committed? Which files should remain outside the commit, and why?

#### Expected Answer: Scenario

Stage and commit only the README correction because it matches the commit purpose. Keep the unfinished navigation redesign and temporary notes outside the commit so the history remains focused and understandable.

## Scoring Guide

| Score     | Evaluation                                               |
| --------- | -------------------------------------------------------- |
| 90-100%   | Excellent                                                |
| 75-89%    | Good                                                     |
| 60-74%    | Satisfactory                                             |
| Below 60% | Review the notebook, exercise, and lab before continuing |

## Next Step

Continue with Chapter 03 to install and configure Git for daily use.

### Related Content

- Notebook: [Git Architecture](../../notebooks/en/02-git-architecture.md)
- Exercise: [Git Areas Classification](../../exercises/en/02-git-areas-classification.md)
- Lab: [Git Change Flow Lab](../../labs/en/02-git-change-flow-lab.md)
