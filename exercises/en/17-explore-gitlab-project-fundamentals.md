---
chapter: 17
title: "Explore GitLab Project Fundamentals"
related_notebook: "GitLab Fundamentals"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Navigation:** [Notebook](../../notebooks/en/17-gitlab-fundamentals.md) | [Lab](../../labs/en/17-create-and-review-a-gitlab-change.md) | [Quiz](../../quizzes/en/17-gitlab-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

# Explore GitLab Project Fundamentals

## Objective

Inspect a GitLab project and explain how its hierarchy, access model, and collaboration features support a safe team workflow.

---

## Learning Outcomes

After completing this exercise, you will be able to:

- identify a namespace, group, project, and repository from a GitLab project path;
- distinguish project visibility from a member's role;
- explain when an issue, merge request, or pipeline is used.

---

## Prerequisites

- Completed the [GitLab Fundamentals notebook](../../notebooks/en/17-gitlab-fundamentals.md).
- Access to a GitLab project you may view.
- A web browser.

---

## Scenario

A new contributor, Sam, joins the `acme/training/demo-app` project to improve its README. Sam should create branches and merge requests but must not change project settings, manage members, or push directly to a protected default branch.

---

## Tasks

### Task 1 - Read the project structure

Write down the namespace, group or subgroup, and project name represented by `acme/training/demo-app`. Then locate the project's repository page and default branch.

### Expected Result

You can explain that the project is `demo-app`, while `acme/training` identifies its organizational path.

---

### Task 2 - Choose suitable access

Compare the permissions Sam needs with the GitLab roles available in the project. Select the least privileged role that supports branch and merge-request work, and explain why a Maintainer role is not appropriate.

### Expected Result

You justify an appropriate contributor-level role according to the permissions configured in the project. You recognize that exact permissions can vary by GitLab configuration.

---

### Task 3 - Trace a change workflow

For a small README improvement, describe the order in which Sam should use an issue, branch, merge request, and pipeline. Include what Sam should do if the pipeline fails.

### Expected Result

Your workflow includes a focused branch, a descriptive merge request, inspection of pipeline results, and a fix pushed to the same branch when needed.

---

## Challenge (Optional)

Find a project with a subgroup. Explain one benefit of organizing related projects through the subgroup instead of placing every project at the top level.

---

## Self-Assessment

- [ ] I can distinguish a group from a project.
- [ ] I understand the difference between visibility and role-based permissions.
- [ ] I can describe the purpose of an issue, merge request, and pipeline.
- [ ] I can apply least privilege to a contributor scenario.

---

## Common Mistakes

| Mistake                                                      | Solution                                                                    |
| ------------------------------------------------------------ | --------------------------------------------------------------------------- |
| Assuming visibility grants permission to change a project    | Check membership and role separately from project visibility.               |
| Giving a new contributor more access than needed             | Start with the least privileged role and adjust only for a documented need. |
| Treating a failed pipeline as unrelated to the merge request | Read the job output, fix the cause, and push the update to the same branch. |

---

## Summary

- A project path reveals where a project belongs in the GitLab hierarchy.
- Visibility controls discovery and reading; roles control authorized actions.
- Issues, merge requests, and pipelines provide complementary work, review, and automation context.

---

## Next Step

Complete the related lab to perform a small GitLab contribution from issue to merge request.

### Related Content

- Notebook: [GitLab Fundamentals](../../notebooks/en/17-gitlab-fundamentals.md)
- Lab: [Create and Review a GitLab Change](../../labs/en/17-create-and-review-a-gitlab-change.md)
- Quiz: [GitLab Fundamentals Quiz](../../quizzes/en/17-gitlab-fundamentals-quiz.md)
