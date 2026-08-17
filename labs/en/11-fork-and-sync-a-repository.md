---
chapter: 11
title: "Fork and Sync a Repository"
related_notebook: "Clone, Fork & Remote"
related_exercise: "Inspect a Remote Repository"
level: Beginner
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/11-clone-fork-and-remote.md) | [Exercise](../../exercises/en/11-inspect-remote-repository.md) | [Quiz](../../quizzes/en/11-clone-fork-and-remote-quiz.md) | [Roadmap](../../ROADMAP.md)

# Fork and Sync a Repository

## Objective

Practice the real workflow for contributing to an upstream project with a fork, then synchronize the local repository with the latest upstream changes.

## Requirements

- Git installed locally
- A GitHub account
- Access to a public repository you can fork

## Tasks

### Task 1 - Fork the Repository

Open the repository in GitHub and choose **Fork**. Select your own account or organization as the destination.

### Task 2 - Clone Your Fork Locally

```bash
git clone https://github.com/your-user/project.git
cd project
git remote -v
```

Confirm that `origin` points to your fork.

### Task 3 - Add the Upstream Remote

```bash
git remote add upstream https://github.com/project-owner/project.git
git remote -v
```

You should now see both `origin` and `upstream`.

### Task 4 - Sync with Upstream

```bash
git fetch upstream
git switch main
git merge upstream/main
```

This keeps your local repository aligned with the main project before you begin new work.

### Task 5 - Make a Small Change and Push

```bash
git switch -c feature/update-notes
echo "Project note" >> NOTES.md
git add NOTES.md
git commit -m "Add project note"
git push origin feature/update-notes
```

After pushing, open a pull request in GitHub against the upstream repository.

## Expected Outcome

You can use a fork plus upstream tracking to contribute safely and keep your local repository synchronized with the original project.

## Troubleshooting

| Problem                                  | Resolution                                                                           |
| ---------------------------------------- | ------------------------------------------------------------------------------------ |
| `git remote -v` shows only one remote    | Add the missing remote explicitly with `git remote add`.                             |
| `git pull` updates the wrong branch      | Check which branch is active and ensure the remote points to the correct repository. |
| The project is not in sync with upstream | Use `git fetch upstream` and then merge or rebase carefully.                         |

### Related Content

- Notebook: [Clone, Fork & Remote](../../notebooks/en/11-clone-fork-and-remote.md)
- Exercise: [Inspect a Remote Repository](../../exercises/en/11-inspect-remote-repository.md)
- Quiz: [Clone, Fork & Remote Quiz](../../quizzes/en/11-clone-fork-and-remote-quiz.md)
