---
chapter: 18
title: "GitLab Groups, Projects, Members, and Permissions Quiz"
related_notebook: "GitLab Groups, Projects, Members, and Permissions"
related_exercise: "Plan GitLab Project Access"
related_lab: "Configure GitLab Project Access"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/18-gitlab-groups-projects-members-and-permissions.md) | [Exercise](../../exercises/en/18-plan-gitlab-project-access.md) | [Lab](../../labs/en/18-configure-gitlab-project-access.md) | [Roadmap](../../ROADMAP.md)

# GitLab Groups, Projects, Members, and Permissions Quiz

## Purpose

Check whether you can design a simple, least-privilege GitLab access model.

## Section A - Multiple Choice

### Question 1

Why is group membership useful?

- A. It automatically gives every user Owner access.
- B. It can provide shared access across related projects.
- C. It removes the need for project visibility settings.
- D. It disables branch protection.

**Answer:** B

**Explanation:** A group can provide consistent access to related projects. The assigned role must still be appropriate.

### Question 2

Which control best prevents ordinary direct pushes to `main`?

- A. A protected-branch rule
- B. A project description
- C. An issue label
- D. A public visibility setting

**Answer:** A

**Explanation:** Protected branches restrict push and merge actions according to configured policy.

## Section B - True or False

### Question 3

A private project and a Developer role are the same type of access control.

- True
- False

**Answer:** False

**Explanation:** Visibility controls discovery and reading; membership and roles control authorized actions.

### Question 4

An access review should consider inherited group membership as well as direct project membership.

- True
- False

**Answer:** True

**Explanation:** A user may retain effective access through a parent group.

## Section C - Short Answer

### Question 5

What does least privilege mean in a GitLab role assignment?

**Expected Answer:** Assign only the minimum role and scope needed for the documented task, then review or remove it when the need ends.

### Question 6

When is project membership preferable to group membership?

**Expected Answer:** When access is needed only for one project or is a narrow exception, rather than a stable need across related projects.

## Section D - Practical Scenario

### Scenario

Morgan needs read-only access to one private project for a short audit. The project belongs to a group that also contains production repositories.

### Question

What access decision is safest?

**Expected Answer:** Grant Morgan the lowest read-only role available directly on the audited project, document an expiry or review date, and avoid broad group membership. Confirm that protected branches remain unchanged.

## Scoring Guide

| Score     | Evaluation                                                    |
| --------- | ------------------------------------------------------------- |
| 90-100%   | Excellent: you can apply GitLab access controls deliberately. |
| 75-89%    | Good: revisit membership scope and branch protection.         |
| Below 75% | Review the notebook and repeat the lab.                       |

### Related Content

- Notebook: [GitLab Groups, Projects, Members, and Permissions](../../notebooks/en/18-gitlab-groups-projects-members-and-permissions.md)
- Exercise: [Plan GitLab Project Access](../../exercises/en/18-plan-gitlab-project-access.md)
- Lab: [Configure GitLab Project Access](../../labs/en/18-configure-gitlab-project-access.md)
- [Roadmap](../../ROADMAP.md)
