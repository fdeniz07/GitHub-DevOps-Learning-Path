---
chapter: 08
title: "Inspect Git Objects"
related_notebook: "Git Internals"
level: Intermediate
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/08-git-internals.md) | [Lab](../../labs/en/08-explore-git-repository-internals.md) | [Quiz](../../quizzes/en/08-git-internals-quiz.md) | [Roadmap](../../ROADMAP.md)

# Inspect Git Objects

## Objective

Use Git's low-level plumbing commands to inspect the repository data that supports the higher-level commands you already use.

## Scenario

You want to understand why Git can restore earlier states and track file history without duplicating the entire project. A small repository is enough to explore the internal object model.

## Tasks

1. Initialize a repository and create a small file.
2. Commit the file and note the current branch and commit hash.
3. Run `git cat-file -t HEAD` and `git cat-file -p HEAD`.
4. Run `git ls-tree -r HEAD`.
5. Compare the output with `git status` and `git log --oneline --graph --all`.
6. Explain how the commit, tree, and blob work together.

## Expected Outcome

The repository reveals an object-based model: a commit references a tree, the tree references blobs, and the branch points to the current commit.

## Self-Check

- [ ] I can identify the commit object for the current state.
- [ ] I understand that a branch is a pointer and not a full duplicate.
- [ ] I can explain the difference between a blob, tree, and commit.

### Related Content

- Notebook: [Git Internals](../../notebooks/en/08-git-internals.md)
- Lab: [Explore Git Repository Internals](../../labs/en/08-explore-git-repository-internals.md)
- Quiz: [Git Internals Quiz](../../quizzes/en/08-git-internals-quiz.md)
