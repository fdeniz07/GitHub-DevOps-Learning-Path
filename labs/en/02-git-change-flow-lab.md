---
chapter: 02
title: "Git Change Flow Lab"
related_notebook: "Git Architecture"
related_exercise: "Git Areas Classification"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/02-git-architecture.md) | [Exercise](../../exercises/en/02-git-areas-classification.md) | [Quiz](../../quizzes/en/02-git-architecture-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git Change Flow Lab

## Objective

Observe one documentation change move through Git's working directory, staging area, and local repository while unrelated work remains unselected.

## Learning Outcomes

- Use `git status` to inspect a file's current state.
- Select one focused file version with `git add`.
- Record the selected snapshot with `git commit`.
- Verify that unrelated working-directory changes remain outside the commit.

## Scenario

Your team wants a small documentation correction in the project history today, but the navigation redesign is not ready. You must record the correction without accidentally including the unfinished redesign.

## Prerequisites

- Complete [Chapter 02](../../notebooks/en/02-git-architecture.md) and the [classification exercise](../../exercises/en/02-git-areas-classification.md).
- Install Git and configure a user name and email. If installation is not complete, use the commands as a guided preview and complete this lab after Chapter 03.
- Use a terminal and text editor.

## Environment Setup

```bash
mkdir git-change-flow-lab
cd git-change-flow-lab
git init
printf "# Portfolio site\n" > README.md
printf "<h1>Portfolio</h1>\n" > index.html
git add README.md index.html
git commit -m "chore: create practice project"
```

If PowerShell does not support `printf` as shown, create the two files with an editor before running `git add`.

## Tasks

### Task 1 - Create separate changes

1. Correct or add one setup sentence in `README.md`.
2. Change the heading in `index.html` to an unfinished navigation note.
3. Run `git status`.
4. Record which files Git reports as modified.

#### Expected Result: Working Directory

Both files are modified in the working directory and neither is staged.

### Task 2 - Select the documentation correction

1. Run `git add README.md`.
2. Run `git status` again.
3. Identify the section that contains `README.md` and the section that contains `index.html`.
4. Explain why only one file is ready for the intended commit.

#### Expected Result: Staging Area

The README change is staged for the next commit while the HTML change remains unstaged.

### Task 3 - Record and verify the focused snapshot

1. Run `git commit -m "docs: improve setup instruction"`.
2. Run `git status`.
3. Run `git log --oneline -1`.
4. Confirm that the documentation commit exists and that the unfinished HTML change is still reported.

#### Expected Result: Local Repository

The local repository contains the README snapshot. The working directory still shows the unfinished `index.html` change.

## Validation Checklist

- [ ] I observed a modified file with `git status`.
- [ ] I staged only `README.md`.
- [ ] I created one focused documentation commit.
- [ ] `index.html` remained outside that commit.
- [ ] I can describe the role of each Git area.

## Troubleshooting

| Problem                                           | Possible Cause                                                         | Solution                                                                                                                        |
| ------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| Git refuses to commit because identity is unknown | User name or email is not configured.                                  | Run `git config --global user.name "Your Name"` and `git config --global user.email "you@example.com"`, then repeat the commit. |
| Both files are staged                             | A broad command such as `git add .` was used.                          | Run `git restore --staged index.html`, inspect with `git status`, then stage only `README.md`.                                  |
| `git status` is clean after the commit            | The unfinished HTML change was not made or was included in the commit. | Edit `index.html` again and repeat the focused-selection observation.                                                           |

## Best Practices

- Run `git status` before and after each state-changing command.
- Stage only files that support one understandable commit purpose.
- Keep incomplete work in the working directory until it is ready to be recorded.

## Next Step

Complete the [Git Architecture Quiz](../../quizzes/en/02-git-architecture-quiz.md), then prepare to install Git in Chapter 03.

### Related Content

- Notebook: [Git Architecture](../../notebooks/en/02-git-architecture.md)
- Exercise: [Git Areas Classification](../../exercises/en/02-git-areas-classification.md)
- Quiz: [Git Architecture Quiz](../../quizzes/en/02-git-architecture-quiz.md)
