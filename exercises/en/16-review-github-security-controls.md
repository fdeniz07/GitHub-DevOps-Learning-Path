---
chapter: 16
title: "Review GitHub Security Controls"
related_notebook: "GitHub Security"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/16-github-security.md) | [Lab](../../labs/en/16-harden-a-github-repository.md) | [Quiz](../../quizzes/en/16-github-security-quiz.md) | [Roadmap](../../ROADMAP.md)

# Review GitHub Security Controls

## Objective

Identify security risks in a repository and match each risk with a practical GitHub control or response.

## Scenario

You are reviewing a small project before its first public release. The repository has several contributors, a GitHub Actions workflow, third-party dependencies, and a protected production environment.

## Tasks

1. List the people, workflows, and applications that have repository access.
2. Identify which branches require protection.
3. Check whether secrets could be stored in source code or logs.
4. Review how dependency and code-scanning findings would be handled.
5. Write a response plan for a leaked credential without including a real secret.

## Expected Outcome

You can explain how repository security uses prevention, detection, and response controls together.

## Self-Check

- [ ] I can explain least privilege.
- [ ] I know the first actions after a secret is exposed.
- [ ] I can distinguish dependency alerts from code-scanning findings.

### Related Content

- Notebook: [GitHub Security](../../notebooks/en/16-github-security.md)
- Lab: [Harden a GitHub Repository](../../labs/en/16-harden-a-github-repository.md)
- Quiz: [GitHub Security Quiz](../../quizzes/en/16-github-security-quiz.md)
