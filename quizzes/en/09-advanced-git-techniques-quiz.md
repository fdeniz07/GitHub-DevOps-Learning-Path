---
chapter: 09
title: "Advanced Git Techniques Quiz"
related_notebook: "Advanced Git Techniques"
related_exercise: "Recover from a Bad Commit"
related_lab: "Recover and Debug with Git"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/09-advanced-git-techniques.md) | [Exercise](../../exercises/en/09-recover-from-a-bad-commit.md) | [Lab](../../labs/en/09-recover-and-debug-with-git.md) | [Roadmap](../../ROADMAP.md)

# Advanced Git Techniques Quiz

## Multiple Choice

### Question 1

Which command is best when you want to undo a file in the working tree without rewriting project history?

- A. `git reset --hard`
- B. `git restore`
- C. `git cherry-pick`
- D. `git branch -d`

#### Answer and Explanation: Question 1

**B.** `git restore` is the safest command for returning a file to a known state without rewriting commit history.

### Question 2

Which command creates a new commit that reverses the effect of an older one while keeping the original commit visible?

- A. `git stash`
- B. `git cherry-pick`
- C. `git revert`
- D. `git status`

#### Answer and Explanation: Question 2

**C.** `git revert` creates a corrective commit and preserves the original history.

## True or False

### Question 3

`git reset --hard` is usually the safest default option for routine recovery.

#### Answer and Explanation: Question 3

**False.** It is powerful and destructive; use it only when you are fully certain the discarded work is no longer needed.

## Practical Scenario

You accidentally moved a branch pointer backward and want to recover the last local state. Which tool should you inspect first?

### Expected Answer: Practical Scenario

`git reflog`.

### Related Content

- Notebook: [Advanced Git Techniques](../../notebooks/en/09-advanced-git-techniques.md)
- Exercise: [Recover from a Bad Commit](../../exercises/en/09-recover-from-a-bad-commit.md)
- Lab: [Recover and Debug with Git](../../labs/en/09-recover-and-debug-with-git.md)
