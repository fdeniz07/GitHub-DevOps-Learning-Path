---
chapter: 03
title: "Install and Configure Git"
related_notebook: "Installing Git"
related_exercise: "Verify a Git Setup"
level: Beginner
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/03-installing-git.md) | [Exercise](../../exercises/en/03-verify-git-setup.md) | [Quiz](../../quizzes/en/03-installing-git-quiz.md) | [Roadmap](../../ROADMAP.md)

# Install and Configure Git

## Objective

Install Git using an approved operating-system method, verify it in a new terminal, and configure a deliberate commit identity.

## Requirements

- An account with permission to install software, or access to an approved support process.
- A terminal: Git Bash, PowerShell, Windows Terminal, or the system terminal.
- A name and email address appropriate for commit history.

## Tasks

### Task 1 - Install Git

1. Visit the official [Git Downloads](https://git-scm.com/downloads) page.
2. Select the supported method for your operating system.
3. Complete the installation or use your organization's approved installation process.
4. Close all terminals that were open during installation.

#### Expected Outcome: Git Installed

Git is installed and a new terminal can load any required PATH updates.

### Task 2 - Verify the Terminal

Open a new terminal and run:

```bash
git --version
```

If a version is not printed, stop here and resolve the installation or PATH issue before continuing.

#### Expected Outcome: Git Available

The command prints a Git version in the terminal you intend to use.

### Task 3 - Configure and Check Identity

Replace the placeholders with your deliberate values:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global --get user.name
git config --global --get user.email
```

#### Expected Outcome: Verified Identity

The final commands print the exact name and email Git will use for future commits.

## Validation Checklist

- [ ] `git --version` prints a version.
- [ ] I opened a new terminal after installation.
- [ ] `user.name` prints my intended commit name.
- [ ] `user.email` prints an appropriate commit email.

## Troubleshooting

| Problem                                           | Likely cause                                          | Resolution                                                   |
| ------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------------ |
| `git` is not recognized                           | Git is not installed or the terminal has an old PATH. | Reopen the terminal, then review the installation if needed. |
| Commit later reports unknown author               | Name or email was not configured.                     | Configure both values, then read them back.                  |
| The email is not suitable for a shared repository | The identity was copied from an old example.          | Set the approved identity before making commits.             |

## Next Step

Continue with [Installing Git Quiz](../../quizzes/en/03-installing-git-quiz.md), then create your first repository in Chapter 04.

### Related Content

- Notebook: [Installing Git](../../notebooks/en/03-installing-git.md)
- Exercise: [Verify a Git Setup](../../exercises/en/03-verify-git-setup.md)
- Quiz: [Installing Git Quiz](../../quizzes/en/03-installing-git-quiz.md)
