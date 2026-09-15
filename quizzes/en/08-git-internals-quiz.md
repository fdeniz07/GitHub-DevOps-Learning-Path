---
chapter: 08
title: "Git Internals Quiz"
related_notebook: "Git Internals"
related_exercise: "Inspect Git Objects"
related_lab: "Explore Git Repository Internals"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/08-git-internals.md) | [Exercise](../../exercises/en/08-inspect-git-objects.md) | [Lab](../../labs/en/08-explore-git-repository-internals.md) | [Roadmap](../../ROADMAP.md)

# Git Internals Quiz

## Multiple Choice

### Question 1

Which Git object usually stores file content?

- A. Commit
- B. Tree
- C. Blob
- D. Ref

#### Answer and Explanation: Question 1

**C.** A blob stores the content of a file without the filename metadata.

### Question 2

What does a branch name represent?

- A. A complete copy of the repository
- B. A pointer to a commit
- C. The working directory state only
- D. The index contents

#### Answer and Explanation: Question 2

**B.** A branch is a lightweight reference to a commit, which is why branch creation is typically fast.

## True or False

### Question 3

`git status` shows the repository's internal object database.

#### Answer and Explanation: Question 3

**False.** `git status` reports working tree and staging state, not the raw object store.

## Practical Scenario

You want to inspect the current commit metadata and the files it contains. Which two commands are the most direct?

### Expected Answer: Practical Scenario

`git cat-file -p HEAD` and `git ls-tree -r HEAD`.

### Related Content

- Notebook: [Git Internals](../../notebooks/en/08-git-internals.md)
- Exercise: [Inspect Git Objects](../../exercises/en/08-inspect-git-objects.md)
- Lab: [Explore Git Repository Internals](../../labs/en/08-explore-git-repository-internals.md)
