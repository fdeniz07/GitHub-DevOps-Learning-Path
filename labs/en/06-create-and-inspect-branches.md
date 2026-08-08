---
chapter: 06
title: "Create and Inspect Branches"
related_notebook: "Branching Strategies"
related_exercise: "Create a Feature Branch"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/06-branching-strategies.md) | [Exercise](../../exercises/en/06-create-a-feature-branch.md) | [Quiz](../../quizzes/en/06-branching-strategies-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create and Inspect Branches

## Objective

Use a feature branch to make isolated documentation work, then inspect the repository graph before any merge occurs.

## Requirements

- A clean local repository with at least one commit.
- Git identity configured as described in Chapter 03.

## Tasks

### Task 1 - Check State

Run `git status` and `git branch`. Resolve or commit unrelated changes before continuing.

### Task 2 - Create a Documentation Branch

Create and switch to a branch:

```bash
git switch -c docs/add-usage-note
```

Add `usage.md`, stage it, and create a commit:

```bash
git add usage.md
git commit -m "Add usage note"
```

### Task 3 - Compare Branches

Return to the primary branch and inspect all history:

```bash
git switch main
git branch
git log --oneline --graph --all
```

#### Expected Outcome: Isolated Change

The `docs/add-usage-note` commit is visible in the graph while `main` does not yet contain the usage note.

## Validation Checklist

- [ ] The branch name describes the work.
- [ ] The documentation commit was created while the feature branch was active.
- [ ] I returned to `main` without merging.
- [ ] The graph shows the separate branch commit.

## Troubleshooting

| Problem                                   | Likely cause                                     | Resolution                                                               |
| ----------------------------------------- | ------------------------------------------------ | ------------------------------------------------------------------------ |
| A commit landed on `main`                 | The branch was not checked before committing.    | Inspect `git branch`; move or repair history only with guidance.         |
| `git switch` refuses to change branches   | Local changes would be overwritten.              | Inspect `git status` and commit, stash, or discard changes deliberately. |
| The graph does not show the branch commit | The file may not have been staged and committed. | Run `git log --oneline` on the feature branch and verify state.          |

### Related Content

- Notebook: [Branching Strategies](../../notebooks/en/06-branching-strategies.md)
- Exercise: [Create a Feature Branch](../../exercises/en/06-create-a-feature-branch.md)
- Quiz: [Branching Strategies Quiz](../../quizzes/en/06-branching-strategies-quiz.md)
