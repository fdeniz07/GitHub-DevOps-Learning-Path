---
chapter: 17
title: "Create and Review a GitLab Change"
related_notebook: "GitLab Fundamentals"
related_exercise: "Explore GitLab Project Fundamentals"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Navigation:** [Notebook](../../notebooks/en/17-gitlab-fundamentals.md) | [Exercise](../../exercises/en/17-explore-gitlab-project-fundamentals.md) | [Quiz](../../quizzes/en/17-gitlab-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create and Review a GitLab Change

## Objective

Complete a small, controlled GitLab contribution by linking work to an issue, pushing a branch, opening a merge request, and responding to review or pipeline feedback.

---

## Learning Outcomes

After completing this lab, you will be able to:

- create an issue and a focused branch for a small change;
- open a merge request with clear context and verification details;
- use review comments and pipeline results to decide when a change is ready to merge.

---

## Scenario

Your team wants the project's README to state the supported local setup command. The update is small, but it must follow the team's normal review process so that the default branch remains stable.

---

## Prerequisites

Before starting this lab, you should have:

- completed the [GitLab Fundamentals notebook](../../notebooks/en/17-gitlab-fundamentals.md);
- completed the [related exercise](../../exercises/en/17-explore-gitlab-project-fundamentals.md);
- access to a GitLab project where you may create issues, branches, and merge requests;
- Git installed and configured with your approved authentication method.

---

## Environment Setup

| Requirement      | Value                                                     |
| ---------------- | --------------------------------------------------------- |
| Operating System | Windows, Linux, or macOS                                  |
| Software         | Git and a current web browser                             |
| GitLab access    | A project role that permits branch and merge-request work |

---

## Tasks

### Task 1 - Create work context and a branch

**Objective**

Record the README improvement and isolate it from the default branch.

**Steps**

1. Create an issue explaining the missing setup command and its expected wording.
2. Clone the project or update your existing local clone.
3. Create a branch named `docs/setup-command` from the intended target branch.

**Expected Result**

The issue provides shared context, and the focused branch is ready for the documentation change.

---

### Task 2 - Commit and push the change

**Objective**

Make the smallest complete documentation change and publish the branch.

**Steps**

1. Add the supported setup command and a short explanation to the README.
2. Inspect the diff, then create a focused commit such as `docs: add setup command`.
3. Push the branch to GitLab with `git push -u origin docs/setup-command`.

**Expected Result**

The remote branch contains only the intended README change and is available for a merge request.

---

### Task 3 - Review pipeline feedback and merge

**Objective**

Use GitLab's review and automation information before integrating the change.

**Steps**

1. Open a merge request from `docs/setup-command` to the correct target branch. Link the issue and describe the change and verification.
2. Review the diff, comments, conflicts, and pipeline status.
3. When a review requests a change or a job fails, correct the issue on the same branch, test it, commit, and push again. Merge only after project requirements are satisfied.

**Expected Result**

The merge request documents the change, review, and pipeline outcome. The change reaches the target branch only after the required review and checks.

---

## Validation Checklist

- [ ] The issue explains the reason for the change.
- [ ] The branch name and commit describe one focused change.
- [ ] The merge request has the correct source and target branches.
- [ ] The description states the change and how it was checked.
- [ ] Review comments and required pipeline jobs are resolved.
- [ ] The merge follows the rules configured for the project.

---

## Troubleshooting

| Problem                                               | Possible Cause                                                     | Solution                                                                             |
| ----------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| The branch is not available in the merge-request form | The branch was not pushed to the remote.                           | Push it with `git push -u origin docs/setup-command`, then refresh the page.         |
| The merge request includes unrelated commits          | The branch was created from the wrong base or contains extra work. | Check the source and target branches, then separate unrelated changes before review. |
| A pipeline job fails                                  | The change violates a check or the job found an existing issue.    | Read the job log, correct the actionable problem, and push a new commit.             |
| The merge action is unavailable                       | A required approval, pipeline, or conflict resolution is missing.  | Read the merge-request requirements and complete the unresolved items.               |

---

## Best Practices

- Use an issue to capture the reason and expected result before implementation.
- Keep the branch, commit, and merge request limited to one understandable change.
- Treat pipeline output as evidence to inspect, not as a result to bypass.

---

## Challenge (Optional)

Ask a teammate to review the merge request. Compare a vague comment with a comment that names the file, concern, and desired outcome.

---

## Summary

- GitLab links planned work, branches, merge requests, and automated feedback.
- A small change still benefits from a clear issue and reviewable merge request.
- Review and pipeline feedback should be resolved before a controlled merge.

---

## Next Step

Complete the related quiz to check your understanding of GitLab's core objects and workflow.

### Related Content

- Notebook: [GitLab Fundamentals](../../notebooks/en/17-gitlab-fundamentals.md)
- Exercise: [Explore GitLab Project Fundamentals](../../exercises/en/17-explore-gitlab-project-fundamentals.md)
- Quiz: [GitLab Fundamentals Quiz](../../quizzes/en/17-gitlab-fundamentals-quiz.md)
- Next Chapter: Groups, Projects, Members & Permissions (coming soon)
