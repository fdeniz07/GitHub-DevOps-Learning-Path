---
chapter: 08
title: "Explore Git Repository Internals"
related_notebook: "Git Internals"
related_exercise: "Inspect Git Objects"
level: Intermediate
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/08-git-internals.md) | [Exercise](../../exercises/en/08-inspect-git-objects.md) | [Quiz](../../quizzes/en/08-git-internals-quiz.md) | [Roadmap](../../ROADMAP.md)

# Explore Git Repository Internals

## Objective

Work with a real repository and connect the human-facing Git commands to the internal structure stored in `.git`.

## Requirements

- Git installed locally
- A repository with at least two commits
- A terminal or shell with Git access

## Tasks

### Task 1 - Inspect the Repository Metadata

```bash
git status
git rev-parse --abbrev-ref HEAD
git symbolic-ref HEAD
```

Record which branch is checked out and confirm the repository is in a stable state.

### Task 2 - View the Commit History

```bash
git log --oneline --decorate --graph --all
```

Identify the current commit and the previous commit in the chain.

### Task 3 - Inspect Objects Directly

```bash
git cat-file -t HEAD
git cat-file -p HEAD
git ls-tree -r HEAD
```

Explain what each command shows and how it matches the repository history you saw in `git log`.

### Task 4 - Understand the Hidden Repository Store

```bash
ls -la .git
echo "---"
ls -la .git/objects
ls -la .git/refs
```

Describe where Git stores the object database and branch references.

### Task 5 - Explore Branch Pointers

```bash
git branch feature/experiment
git rev-parse feature/experiment
git log --oneline --decorate --graph --all
```

Explain why a branch is lightweight even though it appears to act like a separate line of work.

## Expected Outcome

You can map the Git workflow to the internals: commit objects, tree objects, branch pointers, and the hidden `.git` storage.

## Troubleshooting

| Problem                                 | Resolution                                                            |
| --------------------------------------- | --------------------------------------------------------------------- |
| You do not see commit output            | Run `git add` and `git commit` before inspecting the object model.    |
| `HEAD` does not match your expectations | Use `git symbolic-ref HEAD` to confirm the checked-out branch.        |
| The branch seems to duplicate the repo  | Remember that branches are pointers to commits, not full directories. |

### Related Content

- Notebook: [Git Internals](../../notebooks/en/08-git-internals.md)
- Exercise: [Inspect Git Objects](../../exercises/en/08-inspect-git-objects.md)
- Quiz: [Git Internals Quiz](../../quizzes/en/08-git-internals-quiz.md)
