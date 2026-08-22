---
chapter: 16
title: "Harden a GitHub Repository"
related_notebook: "GitHub Security"
related_exercise: "Review GitHub Security Controls"
level: Beginner
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/16-github-security.md) | [Exercise](../../exercises/en/16-review-github-security-controls.md) | [Quiz](../../quizzes/en/16-github-security-quiz.md) | [Roadmap](../../ROADMAP.md)

# Harden a GitHub Repository

## Objective

Practice applying a basic security baseline to a GitHub repository and documenting the decisions.

## Requirements

- A GitHub repository where you can inspect or change settings
- Permission to review repository access and branch rules
- A dependency manifest or workflow to inspect
- No real secrets for the exercise

## Tasks

### Task 1 - Review Access

List repository collaborators, teams, applications, and workflows. Record whether each access level follows least privilege.

### Task 2 - Protect the Default Branch

Configure or document rules requiring pull requests, approvals, and passing status checks. Disable force pushes when appropriate.

### Task 3 - Review Secrets

Search the repository for placeholder credentials and secret-like values. Confirm that real secrets are stored outside source files and are not printed by workflows.

### Task 4 - Review Security Alerts

Open the repository security view and identify how dependency alerts, secret scanning, and code scanning would be reviewed. Do not expose or copy sensitive findings.

### Task 5 - Document the Response Plan

Write a short response plan for an exposed token: revoke, rotate, inspect, clean up, notify, and improve controls.

## Expected Outcome

You can describe a practical security baseline and explain how each control reduces risk.

## Troubleshooting

| Problem                          | Resolution                                                                     |
| -------------------------------- | ------------------------------------------------------------------------------ |
| You cannot change settings       | Document the recommended configuration and ask a maintainer to apply it.       |
| A secret-like value is found     | Do not copy it; treat it as exposed and follow the response process.           |
| An alert lacks context           | Identify the affected dependency or file without publishing sensitive details. |
| A workflow requests broad access | Reduce permissions to the smallest set required for its task.                  |

### Related Content

- Notebook: [GitHub Security](../../notebooks/en/16-github-security.md)
- Exercise: [Review GitHub Security Controls](../../exercises/en/16-review-github-security-controls.md)
- Quiz: [GitHub Security Quiz](../../quizzes/en/16-github-security-quiz.md)
