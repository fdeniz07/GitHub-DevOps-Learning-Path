---
chapter: 05
title: "Create Focused Commits"
related_notebook: "Working with Commits"
related_exercise: "Create a Focused Commit"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/05-working-with-commits.md) | [Exercise](../../exercises/en/05-create-a-focused-commit.md) | [Quiz](../../quizzes/en/05-working-with-commits-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create Focused Commits

## Objective

Use the working directory, staging area, and commit history to record two small project changes as separate, understandable commits.

## Requirements

- The `release-notes` repository from Chapter 04, or another empty practice repository.
- Git identity configured as described in Chapter 03.
- A text editor.

## Scenario

You are preparing a small project. First, you add a README that explains the project. Later, you add a `CONTRIBUTING.md` file with a short contribution note. These are two distinct pieces of work and should be visible as two commits in history.

## Tasks

### Task 1 - Inspect the Repository

Run:

```bash
git status
git log --oneline
```

Record whether the repository has prior commits. Continue even if it is empty.

### Task 2 - Commit the Project Description

Create or update `README.md` with a project heading and one description sentence. Then run:

```bash
git status
git add README.md
git commit -m "Add project README"
```

#### Expected Outcome: First Focused Commit

The README change is recorded as one commit with a purpose-oriented message.

### Task 3 - Commit Contribution Guidance Separately

Create `CONTRIBUTING.md` with one short contribution guideline. Then run:

```bash
git status
git add CONTRIBUTING.md
git commit -m "Add contribution guidance"
```

#### Expected Outcome: Second Focused Commit

The contribution guidance is a separate snapshot from the project description.

### Task 4 - Verify State and History

Run:

```bash
git status
git log --oneline
```

#### Expected Outcome: Clear Evidence

The working tree is clean, and the log shows the two messages in reverse chronological order.

## Validation Checklist

- [ ] Each commit contains one related purpose.
- [ ] Both commit messages begin with a verb.
- [ ] `git log --oneline` shows two understandable entries.
- [ ] `git status` is clean after the final commit.

## Troubleshooting

| Problem                             | Likely cause                                    | Resolution                                                       |
| ----------------------------------- | ----------------------------------------------- | ---------------------------------------------------------------- |
| Git says there is nothing to commit | The file was not changed or no file was staged. | Check `git status`, edit the intended file, then stage it.       |
| The wrong file is staged            | Broad staging selected unrelated work.          | Use `git restore --staged <file>`, then stage the intended file. |
| Commit reports missing identity     | Name or email is not configured.                | Return to Chapter 03 and configure the required identity.        |

### Related Content

- Notebook: [Working with Commits](../../notebooks/en/05-working-with-commits.md)
- Exercise: [Create a Focused Commit](../../exercises/en/05-create-a-focused-commit.md)
- Quiz: [Working with Commits Quiz](../../quizzes/en/05-working-with-commits-quiz.md)
