---
chapter: 30
title: "Practice GitHub Actions YAML"
related_notebook: "YAML Fundamentals for GitHub Actions"
level: Beginner
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/30-yaml-fundamentals.md) | [Lab](../../labs/en/30-build-a-valid-actions-workflow.md) | [Quiz](../../quizzes/en/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Objective

Repair and extend a workflow by applying YAML maps, lists, indentation, and expressions.

## Learning Outcomes

- classify YAML values as maps, lists, or scalars;
- repair indentation without changing the intended hierarchy;
- add a readable Actions expression.

## Prerequisites

- Read the Chapter 30 notebook.
- Have an editor that can display spaces and tabs.

## Scenario

Start with this intended structure and write it as valid workflow YAML: a workflow named `YAML practice`, a manual trigger, read-only contents permission, and one `validate` job with a checkout step and a command step.

## Tasks

### Task 1

Write the workflow using two spaces per indentation level. Use a block list for `steps` and a map for the job.

### Expected Result: YAML Hierarchy

The structure makes `runs-on` and `steps` children of `validate`, and step properties children of their list items.

### Task 2

Add `if: ${{ github.ref == 'refs/heads/main' }}` to a reporting step. Keep the expression as the scalar value of the `if` key.

### Expected Result: Conditional Value

The step is conditionally evaluated by Actions rather than treated as a new YAML hierarchy.

### Task 3

Review the file for tabs, inconsistent indentation, unquoted `#` data, and a list item at the wrong level.

### Expected Result: Review Findings

You can name each possible parser or behavior problem and correct it before a run.

## Challenge

Convert an inline branch list to a block list and add a second branch while preserving the trigger's parent.

## Self-Assessment

- [ ] I can identify maps and lists visually.
- [ ] I use spaces consistently.
- [ ] I can explain where the expression is evaluated.

## Common Mistakes

| Mistake                              | Solution                                     |
| ------------------------------------ | -------------------------------------------- |
| Indenting a step under the wrong key | Align each list item with its sibling.       |
| Using tabs                           | Replace tabs with spaces.                    |
| Forgetting expression delimiters     | Use `${{ ... }}` for the Actions expression. |

## Summary

Readable YAML depends on accurate hierarchy. Small indentation errors can change workflow meaning even when the file looks almost correct.

### Related Content

- Notebook: [YAML Fundamentals for GitHub Actions](../../notebooks/en/30-yaml-fundamentals.md)
- Lab: [Build a Valid Actions Workflow](../../labs/en/30-build-a-valid-actions-workflow.md)
- Quiz: [YAML Fundamentals Quiz](../../quizzes/en/30-yaml-fundamentals-quiz.md)
