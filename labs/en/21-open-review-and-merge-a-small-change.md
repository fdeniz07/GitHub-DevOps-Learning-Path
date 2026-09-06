---
chapter: 21
title: "Open, Review, and Merge a Small Change"
related_notebook: "GitLab Merge Requests and Code Review"
related_exercise: "Review a Small Merge Request"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Previous Chapter](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md) | [Notebook](../../notebooks/en/21-gitlab-merge-requests-and-code-review.md) | [Exercise](../../exercises/en/21-review-a-small-merge-request.md) | [Quiz](../../quizzes/en/21-gitlab-merge-requests-and-code-review-quiz.md)

## Open, Review, and Merge a Small Change

## Objective

Deliver one small documentation improvement through a GitLab merge request.

## Prerequisites

- Completed the [Chapter 20 notebook](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md).
- Access to a GitLab project with permission to create branches and merge requests.

## Tasks

1. Create or select a work item for one documentation correction with an observable acceptance criterion.
2. Create a branch such as `123-clarify-setup-command`; make only the needed change and review the diff yourself.
3. Open an MR to the correct target branch. Explain why, what changed, how you verified it, and link the work item.
4. Request a reviewer. Add one line discussion that is constructive and either a required finding or a suggestion.
5. Check required approvals, resolved discussions, and the pipeline. Update the branch if feedback requires it.
6. Merge only when project requirements pass; verify the target branch contains the expected result.

## Expected Outcome

The MR is focused, understandable without private context, linked to its work item, reviewed, and merged with the required automated evidence.

## Validation Checklist

- [ ] The MR contains one coherent change.
- [ ] The description includes verification evidence.
- [ ] Comments are specific and respectful.
- [ ] Required approvals and discussions are complete.
- [ ] Required pipeline jobs pass before merge.

## Related Content

- Notebook: [GitLab Merge Requests and Code Review](../../notebooks/en/21-gitlab-merge-requests-and-code-review.md)
- Exercise: [Review a Small Merge Request](../../exercises/en/21-review-a-small-merge-request.md)
- Quiz: [GitLab Merge Requests and Code Review Quiz](../../quizzes/en/21-gitlab-merge-requests-and-code-review-quiz.md)
