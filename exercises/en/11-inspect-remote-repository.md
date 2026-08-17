---
chapter: 11
title: "Inspect a Remote Repository"
related_notebook: "Clone, Fork & Remote"
level: Beginner
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/11-clone-fork-and-remote.md) | [Lab](../../labs/en/11-fork-and-sync-a-repository.md) | [Quiz](../../quizzes/en/11-clone-fork-and-remote-quiz.md) | [Roadmap](../../ROADMAP.md)

# Inspect a Remote Repository

## Objective

Review how a GitHub repository connects to the local Git workflow through remotes, clone paths, and upstream tracking.

## Scenario

You have just cloned a project and want to understand where your local repository gets its updates from. You also need to determine how a fork differs from the original repository in a real contribution flow.

## Tasks

1. Clone a repository from GitHub.
2. Run `git remote -v` and identify each configured remote.
3. Identify which remote is the default repository and which one represents the upstream source.
4. Compare the public GitHub browser view with the local Git configuration.
5. Explain how a fork changes the contribution model without changing the underlying Git concepts.

## Expected Outcome

You can describe a Git repository’s remote design and explain how GitHub collaboration often uses both an upstream project and a personal fork.

## Self-Check

- [ ] I can explain the difference between a clone and a fork.
- [ ] I understand why `git remote -v` is useful when working with GitHub.
- [ ] I can identify when to use `upstream` versus `origin`.

### Related Content

- Notebook: [Clone, Fork & Remote](../../notebooks/en/11-clone-fork-and-remote.md)
- Lab: [Fork and Sync a Repository](../../labs/en/11-fork-and-sync-a-repository.md)
- Quiz: [Clone, Fork & Remote Quiz](../../quizzes/en/11-clone-fork-and-remote-quiz.md)
