---
chapter: 07
title: "Resolve a Merge Conflict"
related_notebook: "Merge and Merge Conflicts"
related_exercise: "Merge a Feature Branch"
level: Beginner
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/07-merge-and-merge-conflicts.md) | [Exercise](../../exercises/en/07-merge-a-feature-branch.md) | [Quiz](../../quizzes/en/07-merge-and-merge-conflicts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Resolve a Merge Conflict

## Objective

Create a controlled text conflict, choose an intentional final version, and record the resolution.

## Requirements

- A repository with one committed `README.md` file.
- A clean working tree.

## Tasks

### Task 1 - Create Competing Changes

Create `feature/rewrite-summary` from `main`. Change the same README sentence on the feature branch and commit it. Switch to `main`, change that same sentence differently, and commit it.

### Task 2 - Start the Merge

```bash
git merge feature/rewrite-summary
git status
```

Git should report a conflict in `README.md`.

### Task 3 - Resolve Deliberately

Open `README.md`, read both versions between the conflict markers, and write the final intended sentence. Remove all markers, then run:

```bash
git add README.md
git commit
git status
```

## Expected Outcome

The merge is complete, `README.md` has no conflict markers, and `git status` is clean.

## Troubleshooting

| Problem                             | Resolution                                                     |
| ----------------------------------- | -------------------------------------------------------------- |
| The conflict is not ready to commit | Use `git status` to identify every unmerged file.              |
| The wrong merge was started         | Use `git merge --abort` before recording a resolution.         |
| Markers remain in the file          | Search for `<<<<<<<`, `=======`, and `>>>>>>>` before staging. |

### Related Content

- Notebook: [Merge and Merge Conflicts](../../notebooks/en/07-merge-and-merge-conflicts.md)
- Exercise: [Merge a Feature Branch](../../exercises/en/07-merge-a-feature-branch.md)
- Quiz: [Merge and Merge Conflicts Quiz](../../quizzes/en/07-merge-and-merge-conflicts-quiz.md)
