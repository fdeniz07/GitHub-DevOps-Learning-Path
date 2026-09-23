---
chapter: 30
title: "Build a Valid Actions Workflow"
related_notebook: "YAML Fundamentals for GitHub Actions"
related_exercise: "Practice GitHub Actions YAML"
level: Beginner
estimated_time: 55 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/30-yaml-fundamentals.md) | [Exercise](../../exercises/en/30-practice-github-actions-yaml.md) | [Quiz](../../quizzes/en/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Objective

Build and review a valid GitHub Actions workflow that demonstrates YAML structure, permissions, lists, and an expression.

## Learning Outcomes

- construct nested maps and lists with consistent indentation;
- validate a workflow's structure by reading its hierarchy;
- explain when an expression controls a step.

## Scenario

Create a validation workflow for a practice repository. It should run for pushes to `main` and manual dispatch, use read-only contents permission, and conditionally print a message when the ref is `main`.

## Prerequisites

- Completed the related notebook and exercise.
- A practice GitHub repository.
- An editor configured to insert spaces.

## Environment Setup

| Requirement      | Value                                          |
| ---------------- | ---------------------------------------------- |
| Operating System | Windows, Linux, or macOS                       |
| Software         | GitHub repository and YAML-aware editor        |
| Version          | Any currently supported browser and Git client |

## Tasks

### Task 1 - Construct the document

#### Steps: Construct the Document

1. Create `.github/workflows/yaml-validation.yml`.
2. Add `name`, an `on` map, `permissions`, and a `jobs` map.
3. Use a block list for two steps: checkout and a conditional command.

#### Expected Result: Workflow Hierarchy

The indentation shows one job containing an ordered list of two step maps.

### Task 2 - Review the hierarchy

#### Steps: Review the Hierarchy

1. Mark every map parent and list parent in the file.
2. Search for tabs and trailing accidental indentation.
3. Confirm the expression is the value of `if`, not a separate YAML key.

#### Expected Result: Unambiguous Structure

The document is readable and its intended hierarchy is unambiguous.

### Task 3 - Run and inspect

#### Steps: Run and Inspect

1. Commit the workflow and start it through a configured event.
2. Inspect the job log and conditional step result.
3. Change the event or ref in a controlled branch and compare behavior.

#### Expected Result: Conditional Behavior

The workflow runs and the conditional step's behavior matches the expression.

## Validation Checklist

- [ ] No tabs are used for indentation.
- [ ] `steps` is a list under the job.
- [ ] Permissions are explicit and minimal.
- [ ] The expression uses `${{ ... }}`.
- [ ] The committed workflow runs successfully.

## Troubleshooting

| Problem                     | Possible Cause                         | Solution                                                        |
| --------------------------- | -------------------------------------- | --------------------------------------------------------------- |
| Workflow will not parse     | Indentation or punctuation is invalid. | Compare each child with its parent and use a YAML-aware editor. |
| Conditional step is skipped | The current ref is not `main`.         | Confirm the event context before changing the expression.       |
| A literal `#` disappears    | It began a comment.                    | Quote the scalar containing the literal character.              |

## Best Practices

- Validate structure before changing runtime commands.
- Prefer the clearest list style for the size of the collection.
- Keep conditions short enough that a reviewer can explain them.

## Summary

This lab connects YAML syntax to real Actions behavior: indentation creates structure, expressions control values, and a valid workflow makes the structure observable in a run.

### Related Content

- Notebook: [YAML Fundamentals for GitHub Actions](../../notebooks/en/30-yaml-fundamentals.md)
- Exercise: [Practice GitHub Actions YAML](../../exercises/en/30-practice-github-actions-yaml.md)
- Quiz: [YAML Fundamentals Quiz](../../quizzes/en/30-yaml-fundamentals-quiz.md)
