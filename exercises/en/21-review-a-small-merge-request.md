---
chapter: 21
title: "Review a Small Merge Request"
related_notebook: "GitLab Merge Requests and Code Review"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Previous Chapter](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md) | [Notebook](../../notebooks/en/21-gitlab-merge-requests-and-code-review.md) | [Lab](../../labs/en/21-open-review-and-merge-a-small-change.md) | [Quiz](../../quizzes/en/21-gitlab-merge-requests-and-code-review-quiz.md)

## Review a Small Merge Request

## Objective

Practice a focused, constructive review before approving a documentation MR.

## Scenario

An MR adds a setup command to a README. Its description claims the command was tested, but the diff also changes unrelated heading capitalization.

## Tasks

### Task 1 - Review the intent

Confirm the title, linked work item, target branch, and acceptance criterion: a new contributor can find and run the documented command.

### Task 2 - Inspect the change

Check the command against project documentation. Identify the unrelated heading change and decide whether it belongs in this MR.

### Task 3 - Write feedback

Write one required comment for a missing or incorrect command, or approve if it is correct. Write a separate non-blocking suggestion for the unrelated formatting change.

**Example comment:** `Question: Is this command verified against the current project? The acceptance criterion requires a runnable command.`

### Task 4 - Decide readiness

List the evidence needed before merge: resolved required discussions, required approvals, and a successful required pipeline.

## Self-Assessment

- [ ] I checked intent before commenting on style.
- [ ] I distinguished a blocking finding from a suggestion.
- [ ] I can name the required merge evidence.

## Related Content

- Previous: [GitLab Work Items, Issues, and Planning](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md)
- Notebook: [GitLab Merge Requests and Code Review](../../notebooks/en/21-gitlab-merge-requests-and-code-review.md)
- Lab: [Open, Review, and Merge a Small Change](../../labs/en/21-open-review-and-merge-a-small-change.md)
- Quiz: [GitLab Merge Requests and Code Review Quiz](../../quizzes/en/21-gitlab-merge-requests-and-code-review-quiz.md)
