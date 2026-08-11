---
chapter: 03
title: "Installing Git Quiz"
related_notebook: "Installing Git"
related_exercise: "Verify a Git Setup"
related_lab: "Install and Configure Git"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/03-installing-git.md) | [Exercise](../../exercises/en/03-verify-git-setup.md) | [Lab](../../labs/en/03-install-and-configure-git.md) | [Roadmap](../../ROADMAP.md)

# Installing Git Quiz

## Objective

Check your understanding of local Git installation, terminal verification, and commit identity.

## Multiple Choice

### Question 1

Which command verifies that the current terminal can run Git?

- A. `git init`
- B. `git --version`
- C. `git commit`
- D. `git push`

#### Answer and Explanation: Question 1

**B.** `git --version` asks the terminal to run Git and print the installed version.

### Question 2

Why should you open a new terminal after installing Git on Windows?

- A. Git only works once per terminal.
- B. A new terminal can load an updated PATH value.
- C. It automatically creates a repository.
- D. It sends the installation to GitHub.

#### Answer and Explanation: Question 2

**B.** Existing terminals may not know about the location added by the installer.

## True or False

### Question 3

Creating a GitHub account installs Git on your computer.

#### Answer and Explanation: Question 3

**False.** GitHub is a hosting platform; Git must be installed locally to use the `git` command.

### Question 4

`user.name` and `user.email` can be checked before you create a commit.

#### Answer and Explanation: Question 4

**True.** `git config --global --get` reads the current global configuration.

## Short Answer

### Question 5

What two pieces of information does Git use as a basic global commit identity?

#### Expected Answer: Question 5

A name and an email address.

### Question 6

What should you do first if `git --version` reports that Git is not found immediately after installation?

#### Expected Answer: Question 6

Close the terminal, open a new terminal, and run the command again. If it still fails, inspect the installation or PATH configuration.

## Practical Scenario

You installed Git, but `git config --global --get user.email` prints nothing. What is the smallest safe next action before creating a repository?

### Expected Answer: Practical Scenario

Set an appropriate email with `git config --global user.email "you@example.com"`, then read it back with the same `--get` command.

### Related Content

- Notebook: [Installing Git](../../notebooks/en/03-installing-git.md)
- Exercise: [Verify a Git Setup](../../exercises/en/03-verify-git-setup.md)
- Lab: [Install and Configure Git](../../labs/en/03-install-and-configure-git.md)
