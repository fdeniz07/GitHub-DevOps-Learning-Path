---
chapter: 01
title: "Manual Versioning Lab"
related_notebook: "Why Version Control?"
related_exercise: "Version Control Analysis"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/01-why-version-control.md) | [Exercise](../../exercises/en/01-version-control-analysis.md) | [Quiz](../../quizzes/en/01-why-version-control-quiz.md) | [Roadmap](../../ROADMAP.md)

# Manual Versioning Lab

## Objective

Experience the uncertainty caused by manual project copies and identify the version-control capabilities that a small development project needs. This lab deliberately uses no Git commands.

## Learning Outcomes

After completing this lab, you will be able to:

- Create and compare several manually versioned project copies.
- Identify when a project state, change reason, or current version cannot be established confidently.
- Relate observed uncertainty to history, recovery, traceability, experimentation, collaboration, and a shared source of truth.

## Scenario

You are preparing a small campus-events website with another student. Before starting a larger redesign, you make folder copies to "stay safe." By the end of the task, both students need to know which copy should be continued and why.

## Prerequisites

Before starting this lab, you should have:

- Completed [Chapter 01](../../notebooks/en/01-why-version-control.md).
- Completed the [Version Control Analysis exercise](../../exercises/en/01-version-control-analysis.md).
- A file manager and text editor.

## Environment Setup

| Requirement      | Value                        |
| ---------------- | ---------------------------- |
| Operating System | Windows, Linux, or macOS     |
| Software         | File manager and text editor |
| Version          | Any current version          |

Create an empty working folder named `manual-versioning-lab`.

## Tasks

### Task 1 - Create an initial project

#### Objective: Initial Project

Create a small project state that represents a working event page.

#### Steps: Initial Project

1. Create `campus-events-site` inside `manual-versioning-lab`.
2. Add an `index.html` file with an event title and a short registration message.
3. Add a `README.md` file stating that the page is ready for review.
4. Copy the whole folder as `campus-events-site-final`.

#### Expected Result: Initial Project

You have two folders that appear to contain a valid project state.

### Task 2 - Introduce a change and a mistake

#### Objective: Changed Copy

Create a later copy whose name does not communicate its exact state.

#### Steps: Changed Copy

1. In `campus-events-site`, change the event title and add a registration deadline.
2. Remove a phrase from the registration message so the message becomes unclear.
3. Copy the folder as `campus-events-site-final-v2`.
4. Write one sentence describing why someone might incorrectly assume this is the best copy.

#### Expected Result: Changed Copy

You have a newer-looking copy that contains both an intended change and a hidden problem.

### Task 3 - Create conflicting corrections

#### Objective: Conflicting Corrections

Observe how independent copies make it difficult to establish one current project state.

#### Steps: Conflicting Corrections

1. In `campus-events-site-final`, repair the registration message but change the `README.md` status to "approved."
2. Copy that folder as `campus-events-site-use-this`.
3. Compare all project folders and write answers to these questions: Which event title is intended? Which message is correct? Which README is current? What changed in each folder, and why?
4. For every answer you cannot establish confidently, name the version-control capability that would supply the missing information.

#### Expected Result: Conflicting Corrections

You can show that plausible folder names do not establish a trustworthy history, recovery point, or shared source of truth.

## Validation Checklist

Verify that:

- [ ] You created at least three plausible project copies.
- [ ] At least two copies differ in more than one file.
- [ ] You recorded questions that folder names cannot answer.
- [ ] You mapped each uncertainty to a version-control benefit.

## Troubleshooting

| Problem                                    | Possible Cause                                                   | Solution                                                        |
| ------------------------------------------ | ---------------------------------------------------------------- | --------------------------------------------------------------- |
| All copies look identical                  | No meaningful change was made before copying.                    | Change the event title, message, and README in separate copies. |
| The "current" copy seems obvious           | The names may be persuasive rather than reliable.                | Compare the files and list the missing reasons and timestamps.  |
| You want to use Git to compare the folders | This lab is intended to demonstrate the problem before the tool. | Record the uncertainty manually; later chapters introduce Git.  |

## Best Practices

- Keep one authoritative project history instead of many competing final folders.
- Record the purpose of a meaningful change while the context is still known.
- Use backups for loss protection and version control for project evolution.

## Challenge (Optional)

Ask another person to choose the correct folder using only the names and files. Compare their decision with yours and identify the evidence neither of you had.

## Summary

- Manual copies can preserve data but do not explain the relationship between project states.
- A reliable workflow needs history, context, recovery points, and one shared source of truth.
- Git will provide those capabilities in later chapters.

## Next Step

Complete the [Why Version Control Quiz](../../quizzes/en/01-why-version-control-quiz.md) before continuing to Chapter 02.

### Related Content

- Notebook: [Why Version Control?](../../notebooks/en/01-why-version-control.md)
- Exercise: [Version Control Analysis](../../exercises/en/01-version-control-analysis.md)
- Quiz: [Why Version Control Quiz](../../quizzes/en/01-why-version-control-quiz.md)
- Next Chapter: [Git Architecture](../../notebooks/en/02-git-architecture.md)
