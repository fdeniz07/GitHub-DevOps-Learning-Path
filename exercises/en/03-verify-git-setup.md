---
chapter: 03
title: "Verify a Git Setup"
related_notebook: "Installing Git"
level: Beginner
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/03-installing-git.md) | [Lab](../../labs/en/03-install-and-configure-git.md) | [Quiz](../../quizzes/en/03-installing-git-quiz.md) | [Roadmap](../../ROADMAP.md)

# Verify a Git Setup

## Objective

Verify that a terminal can run Git and that Git has a deliberate global commit identity.

## Scenario

A teammate says that Git was installed but receives an error when trying to commit. Before changing settings, collect evidence from the terminal.

## Tasks

### Task 1 - Check Command Availability

Run `git --version`. Record whether a version is printed or the command is not found.

#### Expected Outcome: Installation Evidence

You can distinguish a working Git installation from a terminal that cannot find Git.

### Task 2 - Inspect Identity

Run these commands:

```bash
git config --global --get user.name
git config --global --get user.email
```

Explain whether each value is suitable for commit history.

#### Expected Outcome: Configuration Evidence

You can identify a missing, placeholder, or deliberate name and email setting.

### Task 3 - Propose the Smallest Fix

For each condition below, write the smallest next action:

| Condition                                                   | Smallest next action                               |
| ----------------------------------------------------------- | -------------------------------------------------- |
| `git` is not found in a terminal opened before installation | Open a new terminal and run `git --version` again. |
| Git version is shown but `user.email` prints nothing        | Set `user.email`, then read it back.               |
| A work repository requires an approved organization email   | Configure the approved email before committing.    |

## Self-Check

- [ ] I can verify Git without creating a repository.
- [ ] I know why a new terminal can matter after installation.
- [ ] I can inspect name and email before a commit is made.

### Related Content

- Notebook: [Installing Git](../../notebooks/en/03-installing-git.md)
- Lab: [Install and Configure Git](../../labs/en/03-install-and-configure-git.md)
- Quiz: [Installing Git Quiz](../../quizzes/en/03-installing-git-quiz.md)
