---
chapter: 30
title: "YAML Fundamentals Quiz"
related_notebook: "YAML Fundamentals for GitHub Actions"
related_exercise: "Practice GitHub Actions YAML"
related_lab: "Build a Valid Actions Workflow"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/30-yaml-fundamentals.md) | [Exercise](../../exercises/en/30-practice-github-actions-yaml.md) | [Lab](../../labs/en/30-build-a-valid-actions-workflow.md) | [Roadmap](../../ROADMAP.md)

## Purpose

Check your understanding of YAML maps, lists, indentation, expressions, and common mistakes.

## Questions

### Question 1

What does indentation communicate in YAML?

- A. The file's publication date
- B. Parent-child structure
- C. The runner operating system
- D. The workflow secret value

**Answer:** B. Parent-child structure.

### Question 2

Which syntax starts a block list item?

- A. `:`
- B. `#`
- C. `-`
- D. `${{ }}`

**Answer:** C. `-`

### Question 3

True or False: Tabs are a safe replacement for spaces in YAML indentation.

**Answer:** False.

### Question 4

Which form is a GitHub Actions expression?

- A. `if: github.ref == main`
- B. `if: ${{ github.ref == 'refs/heads/main' }}`
- C. `if -> github.ref`
- D. `if: [github.ref]`

**Answer:** B. `if: ${{ github.ref == 'refs/heads/main' }}`

### Question 5

What can happen when a list item is indented under the wrong key?

**Expected Answer:** The parser may reject the file or interpret the item as belonging to a different parent, changing workflow behavior.

### Question 6

### Practical Scenario

The text `name: Build #1` displays only `Build` as the value. Why?

**Expected Answer:** The unquoted `#` begins a comment. Use `name: "Build #1"` when the character is part of the value.

## Review Checklist

- [ ] I can identify maps, lists, and scalars.
- [ ] I can explain indentation and expression boundaries.
- [ ] I can name common YAML mistakes before running the workflow.

### Related Content

- Notebook: [YAML Fundamentals for GitHub Actions](../../notebooks/en/30-yaml-fundamentals.md)
- Exercise: [Practice GitHub Actions YAML](../../exercises/en/30-practice-github-actions-yaml.md)
- Lab: [Build a Valid Actions Workflow](../../labs/en/30-build-a-valid-actions-workflow.md)
