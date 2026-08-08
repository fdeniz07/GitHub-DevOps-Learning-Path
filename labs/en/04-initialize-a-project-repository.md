---
chapter: 04
title: "Initialize a Project Repository"
related_notebook: "Creating Your First Repository"
related_exercise: "Create Your First Repository"
level: Beginner
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/04-creating-your-first-repository.md) | [Exercise](../../exercises/en/04-create-your-first-repository.md) | [Quiz](../../quizzes/en/04-creating-your-first-repository-quiz.md) | [Roadmap](../../ROADMAP.md)

# Initialize a Project Repository

## Objective

Create a local Git repository for a small project, inspect it safely, and identify the difference between its project files and repository metadata.

## Requirements

- Git installed and configured as described in Chapter 03.
- A terminal in a location where you may create a practice folder.
- A text editor.

## Scenario

Your team starts a small project called `release-notes`. Before anyone writes code, you prepare the local repository. The first commit will be created in Chapter 05, so this lab stops after inspecting the untracked project files.

## Tasks

### Task 1 - Create a Project Directory

Create and enter the project directory:

```bash
mkdir release-notes
cd release-notes
```

Confirm that the directory name in the terminal matches `release-notes`.

#### Expected Outcome: Project Root Ready

You are inside one dedicated directory for the project.

### Task 2 - Initialize Git

Initialize the repository and inspect its initial state:

```bash
git init
git status
```

#### Expected Outcome: Empty Local Repository

Git confirms initialization, and `git status` reports that there is nothing to commit yet.

### Task 3 - Add a Project File Without Committing

Create `README.md` with a heading such as `# Release Notes`, then run:

```bash
git status
```

#### Expected Outcome: Untracked Project File

`README.md` is shown as untracked. Do not run `git add` or `git commit`; those operations belong to the next chapter.

### Task 4 - Explain the Repository Boundary

In your own words, answer these questions:

1. Which directory contains the visible project file?
1. Which hidden directory contains Git metadata?
1. Why would initializing the parent directory be risky?

#### Expected Outcome: Clear Repository Boundary

You can describe the project root, the `.git` directory, and why one repository should have a deliberate scope.

## Validation Checklist

- [ ] `git status` runs successfully inside `release-notes`.
- [ ] The project root is not a broad parent directory containing unrelated work.
- [ ] `README.md` is visible as untracked.
- [ ] No commit has been created yet.

## Troubleshooting

| Problem                                    | Likely cause                                                       | Resolution                                                        |
| ------------------------------------------ | ------------------------------------------------------------------ | ----------------------------------------------------------------- |
| `git status` says this is not a repository | The terminal is in the wrong folder or initialization was skipped. | Enter `release-notes`, then run `git init` once.                  |
| Unexpected files appear in status          | Git was initialized in a directory that is too broad.              | Stop and inspect the directory before adding or committing files. |
| `.git` is not visible in the file explorer | Hidden files are not displayed.                                    | Use `git status`; do not rely only on explorer visibility.        |

### Related Content

- Notebook: [Creating Your First Repository](../../notebooks/en/04-creating-your-first-repository.md)
- Exercise: [Create Your First Repository](../../exercises/en/04-create-your-first-repository.md)
- Quiz: [Creating Your First Repository Quiz](../../quizzes/en/04-creating-your-first-repository-quiz.md)
