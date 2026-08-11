---
chapter: 04
title: "Creating Your First Repository Quiz"
related_notebook: "Creating Your First Repository"
related_exercise: "Create Your First Repository"
related_lab: "Initialize a Project Repository"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/04-creating-your-first-repository.md) | [Exercise](../../exercises/en/04-create-your-first-repository.md) | [Lab](../../labs/en/04-initialize-a-project-repository.md) | [Roadmap](../../ROADMAP.md)

# Creating Your First Repository Quiz

## Objective

Check your understanding of repository initialization, the `.git` directory, and safe state inspection.

## Multiple Choice

### Question 1

What does `git init` create in the selected project directory?

- A. A GitHub account
- B. A `.git` directory containing local repository metadata
- C. A first commit containing every file
- D. A remote repository on the internet

#### Answer and Explanation: Question 1

**B.** `git init` creates the local metadata Git needs to treat the selected folder as a repository.

### Question 2

Which command safely reports the current repository state without creating a commit?

- A. `git status`
- B. `git push`
- C. `git commit`
- D. `git clone`

#### Answer and Explanation: Question 2

**A.** `git status` inspects the working directory and repository state.

## True or False

### Question 3

An untracked file is already part of Git history.

#### Answer and Explanation: Question 3

**False.** Git can see an untracked file, but it is not staged or recorded in a commit.

### Question 4

Deleting `.git` removes the local repository metadata from a project folder.

#### Answer and Explanation: Question 4

**True.** Deleting it removes local history and configuration, so it is not a routine troubleshooting step.

## Short Answer

### Question 5

Why should you confirm the current directory before running `git init`?

#### Expected Answer: Question 5

Git will treat that directory and its descendants as the repository scope. Initializing a broad parent folder can include unrelated projects.

## Practical Scenario

You run `git status` in a directory and Git reports that it is not a repository. What should you check before immediately running `git init`?

### Expected Answer: Practical Scenario

Confirm that the current directory is the intended project root. If it is not, navigate to or create the correct project directory first.

### Related Content

- Notebook: [Creating Your First Repository](../../notebooks/en/04-creating-your-first-repository.md)
- Exercise: [Create Your First Repository](../../exercises/en/04-create-your-first-repository.md)
- Lab: [Initialize a Project Repository](../../labs/en/04-initialize-a-project-repository.md)
