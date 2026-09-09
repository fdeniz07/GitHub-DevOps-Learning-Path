---
chapter: 21
title: "GitLab Merge Requests and Code Review"
part: "GitLab DevOps"
level: Beginner
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Previous Chapter](20-gitlab-work-items-issues-and-planning.md) | [Exercise](../../exercises/en/21-review-a-small-merge-request.md) | [Lab](../../labs/en/21-open-review-and-merge-a-small-change.md) | [Quiz](../../quizzes/en/21-gitlab-merge-requests-and-code-review-quiz.md)

## Learning Objectives

- open a focused merge request (MR) with useful context;
- review code, approvals, and discussions constructively;
- use pipeline results and merge requirements before merging.

## Introduction

A merge request makes a branch change visible before it reaches a shared branch. It is a record of the proposed change, review discussion, approvals, and automated evidence.

## Theory

| Term          | Meaning                                                            |
| ------------- | ------------------------------------------------------------------ |
| Merge request | A proposal to merge a source branch into a target branch.          |
| Approval      | A required or optional reviewer decision defined by project rules. |
| Discussion    | A comment thread, often attached to a specific line.               |
| Pipeline      | Automated jobs such as tests, linting, or builds.                  |

### A Reviewable MR

Keep one MR small enough that a reviewer can understand its purpose and risk. Describe the problem, solution, testing, and any follow-up work. Select the correct target branch and link the related issue or work item.

```text
Title: Clarify the command for running checks
Description:
- Why: new contributors cannot find the command.
- What: add the verified command to README.md.
- Verification: ran the command locally.
```

### Practical Review Workflow

1. Read the description and acceptance criteria.
2. Inspect the diff for correctness, scope, tests, and accidental changes.
3. Check discussions, required approvals, and the pipeline.
4. Resolve only agreed discussions; update the branch when changes are needed.
5. Merge only when project requirements are met.

### Constructive Comments

State the observation, impact, and a helpful next action. Use a blocking comment only for a defect, security concern, broken requirement, or agreed standard. Ask questions when context is missing.

```text
Suggestion: This error text exposes the account state. Could we use the neutral
message from the acceptance criteria and add a test for it?
```

## Review Types and Requirements

- **Author self-review:** inspect the diff before requesting review.
- **Peer review:** another contributor checks behavior and maintainability.
- **Required approval:** an approval rule may require a specific role or number of reviewers.
- **Discussion review:** all required threads should be resolved before merge.
- **Pipeline review:** a successful required pipeline is evidence, not a substitute for human review.

Protected branches can require approvals, successful pipelines, resolved discussions, or an up-to-date source branch. Exact controls depend on project settings, so read the project policy before relying on a merge button state.

## Best Practices

- Make each MR one coherent, testable change.
- Give reviewers a clear description and verification evidence.
- Separate must-fix findings from optional suggestions.
- Re-review changed code after a requested update.
- Do not approve or merge around failed required checks.

## Common Mistakes

| Mistake                                        | Better approach                              |
| ---------------------------------------------- | -------------------------------------------- |
| Mixing a feature, cleanup, and formatting      | Split independent work into focused MRs.     |
| Writing “looks good” without inspecting checks | Review the diff, requirements, and pipeline. |
| Calling every preference a blocker             | Explain impact and mark suggestions clearly. |

## Summary

An MR is the shared decision point before integration. Small scope, clear comments, complete approvals, resolved discussions, and required pipeline results make that decision reliable.

## Practice

Continue with the [review exercise](../../exercises/en/21-review-a-small-merge-request.md), [hands-on lab](../../labs/en/21-open-review-and-merge-a-small-change.md), and [quiz](../../quizzes/en/21-gitlab-merge-requests-and-code-review-quiz.md).
