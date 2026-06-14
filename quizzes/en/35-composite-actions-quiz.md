---
chapter: 35
title: "Composite Actions Quiz"
related_notebook: "GitHub Actions Composite Actions"
related_exercise: "Build a Reusable Composite Action"
related_lab: "Package a Composite Action"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/35-composite-actions.md) | [Exercise](../../exercises/en/35-build-a-reusable-composite-action.md) | [Lab](../../labs/en/35-package-a-composite-action.md) | [Roadmap](../../ROADMAP.md)

# Composite Actions Quiz

## Learning Objectives

- recognize the structure and contract of a composite action;
- distinguish inputs from outputs;
- identify safe action boundaries.

## Questions

### Question 1

Which `runs.using` value identifies a composite action?

- A. `node20`
- B. `docker`
- C. `composite`
- D. `workflow`

**Answer:** C. `composite`

### Question 2

Why does a calling step need an `id` when it consumes an action output?

**Expected Answer:** The id gives later expressions a stable path such as `steps.check.outputs.result`.

### Question 3

True or False: A composite action automatically isolates secrets from its caller.

**Answer:** False. It runs in the caller's context and must be designed with least privilege.

### Question 4

Where should a composite action write a step output?

**Expected Answer:** It should append `name=value` to the file referenced by `GITHUB_OUTPUT`.

### Question 5

What is safer than interpolating an input directly into a shell command?

**Expected Answer:** Pass the input through an environment variable and quote it in the shell.

## Practical Scenario

A local action prints a user-provided branch name directly inside a shell command. Identify the risk and propose a correction.

**Expected Answer:** Direct interpolation can change shell syntax. Pass the value through `env`, quote it, and validate it when appropriate.

## Review Checklist

- [ ] I can explain `action.yml`.
- [ ] I can map an output.
- [ ] I understand that reuse is not isolation.

### Related Content

- Notebook: [GitHub Actions Composite Actions](../../notebooks/en/35-composite-actions.md)
- Exercise: [Build a Reusable Composite Action](../../exercises/en/35-build-a-reusable-composite-action.md)
- Lab: [Package a Composite Action](../../labs/en/35-package-a-composite-action.md)
