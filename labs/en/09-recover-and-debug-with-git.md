---
chapter: 09
title: "Recover and Debug with Git"
related_notebook: "Advanced Git Techniques"
related_exercise: "Recover from a Bad Commit"
level: Intermediate
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/09-advanced-git-techniques.md) | [Exercise](../../exercises/en/09-recover-from-a-bad-commit.md) | [Quiz](../../quizzes/en/09-advanced-git-techniques-quiz.md) | [Roadmap](../../ROADMAP.md)

# Recover and Debug with Git

## Objective

Use real recovery workflows to diagnose a repository problem, recover previous state, and safely continue work without losing traceability.

## Requirements

- Git installed locally
- A repository with at least three commits
- A terminal or shell with Git access

## Tasks

### Task 1 - Create a Local Mistake

```bash
git status
echo "This is a mistake" >> README.md
git add README.md
git commit -m "Add wrong note"
```

Explain why this scenario may be safe to recover locally but may not be safe to rewrite if the commit was already shared.

### Task 2 - Revert the Mistake

```bash
git revert HEAD
git log --oneline --decorate --graph --all
```

Identify the revert commit and describe how it preserves history.

### Task 3 - Experiment with Stash

```bash
git stash push -m "temporary checkpoint"
git stash list
git stash pop
```

Explain the difference between stashing and committing incomplete work.

### Task 4 - Recover from a Branch Move

```bash
git reflog
git reset --hard HEAD@{1}
```

Describe how the reflog helps recover from accidental branch movement.

### Task 5 - Apply One Commit Elsewhere

```bash
git checkout -b hotfix
git cherry-pick <commit-hash>
```

Explain why `git cherry-pick` is useful when a fix belongs on a release branch.

## Expected Outcome

You can recover from common local mistakes, understand the difference between safe and destructive recovery, and explain why Git history remains traceable.

## Troubleshooting

| Problem                                                      | Resolution                                                                                |
| ------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| You cannot revert a commit because it is not the last commit | Use `git revert <commit-hash>` with the exact commit you want to reverse.                 |
| A stash does not restore expected files                      | Run `git stash list` and inspect the saved message or patch before popping.               |
| The reflog does not show the expected state                  | Ensure the repository has recent local movement; reflog tracks your recent local actions. |

### Related Content

- Notebook: [Advanced Git Techniques](../../notebooks/en/09-advanced-git-techniques.md)
- Exercise: [Recover from a Bad Commit](../../exercises/en/09-recover-from-a-bad-commit.md)
- Quiz: [Advanced Git Techniques Quiz](../../quizzes/en/09-advanced-git-techniques-quiz.md)
