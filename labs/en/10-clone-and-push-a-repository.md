---
chapter: 10
title: "Clone and Push a Repository"
related_notebook: "GitHub Fundamentals"
related_exercise: "Explore a GitHub Repository"
level: Beginner
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/10-github-fundamentals.md) | [Exercise](../../exercises/en/10-explore-a-github-repository.md) | [Quiz](../../quizzes/en/10-github-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

# Clone and Push a Repository

## Objective

Practice the basic remote workflow: clone a repository, create a branch, commit a change, and push it to GitHub.

## Requirements

- Git installed locally
- A GitHub account or repository access
- A terminal with network access

## Tasks

### Task 1 - Clone the Repository

```bash
git clone https://github.com/your-user/your-repository.git
cd your-repository
git remote -v
```

Identify the remote name and verify that the repository is connected to GitHub.

### Task 2 - Create and Check a Branch

```bash
git switch -c feature/update-docs
git status
```

Confirm that you are on the correct branch before making your change.

### Task 3 - Commit a Small Change

```bash
echo "# Project note" >> NOTES.md
git add NOTES.md
git commit -m "Add project note"
```

Keep the commit focused and readable.

### Task 4 - Push the Branch

```bash
git push origin feature/update-docs
```

Look for the branch in GitHub and confirm that the new commit is visible remotely.

## Expected Outcome

You can move from a local Git workflow to a visible shared GitHub workflow, with the remote repository reflecting your branch and commit history.

## Troubleshooting

| Problem                              | Resolution                                                                           |
| ------------------------------------ | ------------------------------------------------------------------------------------ |
| Push is rejected                     | Check whether the branch is correct and whether you have permission to push.         |
| `git remote -v` shows nothing        | Verify that the repository was cloned correctly and that the remote exists.          |
| The branch does not appear in GitHub | Refresh the repository page and confirm the branch was pushed with the correct name. |

### Related Content

- Notebook: [GitHub Fundamentals](../../notebooks/en/10-github-fundamentals.md)
- Exercise: [Explore a GitHub Repository](../../exercises/en/10-explore-a-github-repository.md)
- Quiz: [GitHub Fundamentals Quiz](../../quizzes/en/10-github-fundamentals-quiz.md)
