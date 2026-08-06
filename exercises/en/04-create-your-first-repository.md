---
chapter: 04
title: "Create Your First Repository"
related_notebook: "Creating Your First Repository"
level: Beginner
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/04-creating-your-first-repository.md) | [Lab](../../labs/en/04-initialize-a-project-repository.md) | [Quiz](../../quizzes/en/04-creating-your-first-repository-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create Your First Repository

## Objective

Create one local repository in the intended project directory and use `git status` to explain its state.

## Scenario

You are beginning a small documentation project named `team-handbook`. Its project folder does not exist yet. You must create a local repository without accidentally initializing the parent folder that contains other projects.

## Tasks

### Task 1 - Establish the Project Root

Create and enter a directory named `team-handbook`. Before running Git, confirm that your terminal prompt shows that directory.

#### Expected Outcome: Intentional Location

You can identify the one folder that will contain this project's files and Git metadata.

### Task 2 - Initialize and Inspect

Run:

```bash
git init
git status
```

Describe what proves that the folder is a Git repository and what the empty status means.

#### Expected Outcome: Repository Evidence

Git reports an initialized repository, and `git status` reports an empty working tree or no files to commit.

### Task 3 - Observe an Untracked File

Create `README.md` containing one heading, then run `git status` again. Do not add or commit the file.

#### Expected Outcome: Working Directory Evidence

`README.md` appears as an untracked file. You can explain that Git sees the file but has not recorded it in history.

## Self-Check

- [ ] I chose a project root before running `git init`.
- [ ] I can use `git status` to distinguish an empty repository from a non-repository.
- [ ] I understand why `README.md` is untracked at this stage.

### Related Content

- Notebook: [Creating Your First Repository](../../notebooks/en/04-creating-your-first-repository.md)
- Lab: [Initialize a Project Repository](../../labs/en/04-initialize-a-project-repository.md)
- Quiz: [Creating Your First Repository Quiz](../../quizzes/en/04-creating-your-first-repository-quiz.md)
