---
chapter: 05
title: "Create a Focused Commit"
related_notebook: "Working with Commits"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/05-working-with-commits.md) | [Lab](../../labs/en/05-create-focused-commits.md) | [Quiz](../../quizzes/en/05-working-with-commits-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create a Focused Commit

## Objective

Select related changes deliberately, create one meaningful commit, and verify the recorded history.

## Scenario

Your `release-notes` repository contains two files: `README.md` has a useful project description, while `ideas.txt` contains private brainstorming notes. Only the README change belongs in the first project commit.

## Tasks

### Task 1 - Inspect the Current State

Run `git status`. Identify which files are untracked, modified, or staged.

#### Expected Outcome: State Evidence

You can name the files Git is ready to commit and the files that should remain outside this commit.

### Task 2 - Stage One Intentional Change

Stage only the README:

```bash
git add README.md
git status
```

Explain why `ideas.txt` should not appear under "Changes to be committed."

#### Expected Outcome: Focused Staging

Only `README.md` is staged. The unrelated notes remain outside the proposed snapshot.

### Task 3 - Commit and Verify

Create and inspect the commit:

```bash
git commit -m "Add project description"
git status
git log --oneline
```

#### Expected Outcome: Verified History

The history contains the new commit. `ideas.txt` remains untracked or unstaged, depending on its earlier state.

## Self-Check

- [ ] I checked `git status` before staging.
- [ ] I staged a named file rather than every visible file.
- [ ] My commit message states the purpose of the change.
- [ ] I verified the commit with `git log --oneline`.

### Related Content

- Notebook: [Working with Commits](../../notebooks/en/05-working-with-commits.md)
- Lab: [Create Focused Commits](../../labs/en/05-create-focused-commits.md)
- Quiz: [Working with Commits Quiz](../../quizzes/en/05-working-with-commits-quiz.md)
