---
chapter: 36
title: "Matrix Builds Quiz"
related_notebook: "GitHub Actions Matrix Builds"
related_exercise: "Test a Matrix Workflow"
related_lab: "Run a Multi-Platform Matrix"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](../../notebooks/en/35-composite-actions.md) | [Notebook](../../notebooks/en/36-github-actions-matrix-builds.md) | [Exercise](../../exercises/en/36-test-a-matrix-workflow.md) | [Lab](../../labs/en/36-run-a-multi-platform-matrix.md) | [Roadmap](../../ROADMAP.md)

# Matrix Builds Quiz

## Learning Objectives

- calculate matrix combinations;
- use inclusion and exclusion correctly;
- choose failure behavior deliberately.

## Questions

### Question 1

A matrix has three operating systems and two runtime versions. How many combinations exist before exclusions?

- A. 3
- B. 5
- C. 6
- D. 9

**Answer:** C. 6

### Question 2

Which expression reads a matrix value named `os`?

- A. `${{ job.os }}`
- B. `${{ matrix.os }}`
- C. `${{ include.os }}`
- D. `${{ strategy.os }}`

**Answer:** B. `${{ matrix.os }}`

### Question 3

True or False: `exclude` removes unsupported combinations from the generated matrix.

**Answer:** True.

### Question 4

When is `fail-fast: false` useful?

**Expected Answer:** When results from all platforms or versions are valuable for diagnosis even after one combination fails.

### Question 5

What is the purpose of `include`?

**Expected Answer:** It adds metadata to combinations or adds an explicit special combination.

## Practical Scenario

A matrix has a non-supported Windows/runtime pair. What should you do, and what should you review after the run?

**Expected Answer:** Exclude the pair, then review the expanded jobs and logs to confirm every supported combination ran.

## Review Checklist

- [ ] I can calculate a Cartesian product.
- [ ] I know when to use `include` and `exclude`.
- [ ] I can justify `fail-fast`.

### Related Content

- Previous chapter: [Composite Actions](../../notebooks/en/35-composite-actions.md)
- Notebook: [GitHub Actions Matrix Builds](../../notebooks/en/36-github-actions-matrix-builds.md)
- Exercise: [Test a Matrix Workflow](../../exercises/en/36-test-a-matrix-workflow.md)
- Lab: [Run a Multi-Platform Matrix](../../labs/en/36-run-a-multi-platform-matrix.md)
