---
chapter: 18
title: "Plan GitLab Project Access"
related_notebook: "GitLab Groups, Projects, Members, and Permissions"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/18-gitlab-groups-projects-members-and-permissions.md) | [Lab](../../labs/en/18-configure-gitlab-project-access.md) | [Quiz](../../quizzes/en/18-gitlab-groups-projects-members-and-permissions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Plan GitLab Project Access

## Objective

Design a least-privilege access plan for a GitLab group and its projects.

## Learning Outcomes

- separate group and project membership decisions;
- choose a role based on a documented task;
- include an access review and protected-branch policy.

## Prerequisites

- Completed the [Chapter 18 notebook](../../notebooks/en/18-gitlab-groups-projects-members-and-permissions.md).
- Access to a GitLab project view or a sample hierarchy.

## Scenario

The `acme/platform` group has `storefront` and `payments` projects. Dana maintains both projects, Lee updates storefront documentation, and a contractor needs read-only access to payments for two weeks. The `main` branches must be merged through review.

## Tasks

### Task 1 - Model membership

Decide which people should receive group membership and which should receive project-only membership. State the reason for each decision.

**Expected Result:** Dana has access that matches cross-project responsibility; narrower needs are not made broader by default.

### Task 2 - Apply least privilege

Choose the lowest suitable configured role for Dana, Lee, and the contractor. Explain what each person must be able to do and what they must not administer.

**Expected Result:** The plan ties every role to a task rather than a job title alone.

### Task 3 - Define controls

Write three access-review questions and a short rule for the protected `main` branch.

**Expected Result:** Your review includes inherited access and expired contractor access; the branch rule prevents ordinary direct pushes.

## Challenge (Optional)

Explain when a subgroup such as `acme/platform/payments` would make ownership clearer than a single flat group.

## Self-Assessment

- [ ] I distinguished visibility from membership.
- [ ] I assigned roles using least privilege.
- [ ] I included a recurring access review and protected-branch rule.

## Common Mistakes

| Mistake                                      | Solution                                                         |
| -------------------------------------------- | ---------------------------------------------------------------- |
| Granting group access for a one-project task | Use direct project membership unless shared access is justified. |
| Treating temporary access as permanent       | Set a review or removal date.                                    |

## Summary

- Group membership scales shared access; project membership handles narrow exceptions.
- Roles and protected branches should be chosen deliberately and reviewed.

### Related Content

- Notebook: [GitLab Groups, Projects, Members, and Permissions](../../notebooks/en/18-gitlab-groups-projects-members-and-permissions.md)
- Lab: [Configure GitLab Project Access](../../labs/en/18-configure-gitlab-project-access.md)
- Quiz: [GitLab Groups, Projects, Members, and Permissions Quiz](../../quizzes/en/18-gitlab-groups-projects-members-and-permissions-quiz.md)
- [Roadmap](../../ROADMAP.md)
