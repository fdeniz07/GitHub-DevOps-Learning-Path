---
chapter: 17
title: "GitLab Fundamentals Quiz"
related_notebook: "GitLab Fundamentals"
related_exercise: "Explore GitLab Project Fundamentals"
related_lab: "Create and Review a GitLab Change"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Navigation:** [Notebook](../../notebooks/en/17-gitlab-fundamentals.md) | [Exercise](../../exercises/en/17-explore-gitlab-project-fundamentals.md) | [Lab](../../labs/en/17-create-and-review-a-gitlab-change.md) | [Roadmap](../../ROADMAP.md)

# GitLab Fundamentals Quiz

## Purpose

This quiz checks whether you can explain GitLab's core objects and apply its basic collaboration workflow.

---

## Instructions

- Answer from understanding rather than memorization.
- Use the terminology from the notebook precisely.
- Review every incorrect answer before continuing.

---

## Learning Objectives

This quiz evaluates your ability to:

- distinguish a group, project, and repository;
- explain the relationship between visibility, roles, and least privilege;
- describe how issues, merge requests, and pipelines support a change.

---

## Section A - Multiple Choice

### Question 1

What is the primary purpose of a GitLab group?

- A. It replaces every Git repository with one shared file list.
- B. It organizes related projects and can provide shared membership and access.
- C. It automatically merges every branch.
- D. It is a local Git configuration file.

**Answer:** B

**Explanation:** A group organizes related projects and can manage members across them. A project is the workspace that normally contains a repository and its collaboration features.

---

### Question 2

Which statement describes a merge request most accurately?

- A. It deletes the source branch before anyone can review it.
- B. It is a proposal to compare and merge a source branch into a target branch.
- C. It is a replacement for a Git commit.
- D. It is only used to add project members.

**Answer:** B

**Explanation:** A merge request brings together the diff, description, discussions, approvals, and pipeline status for a proposed branch change.

---

## Section B - True or False

### Question 3

Project visibility and a member's role are the same access control setting.

- True
- False

**Answer:** False

**Explanation:** Visibility controls who can discover or read a project. A role controls what an authorized member can do. Both must be considered when managing access.

---

### Question 4

When a new commit is pushed to the source branch of a merge request, the merge request can show the updated change and new pipeline result.

- True
- False

**Answer:** True

**Explanation:** The merge request remains connected to its source branch. Pushing a fix to that branch updates the change under review and can trigger configured pipeline checks.

---

## Section C - Short Answer

### Question 5

Why is least privilege important when inviting a contributor to a GitLab project?

**Expected Answer:** It limits a contributor to the actions needed for their task. This reduces the impact of mistakes or a compromised account and protects settings and important branches from unnecessary changes.

---

### Question 6

What are the different purposes of an issue and a merge request?

**Expected Answer:** An issue captures the work context, problem, or expected result. A merge request presents the implementation for review, discussion, automated checks, and a merge decision.

---

## Section D - Practical Scenario

### Scenario

Alex has changed a README on branch `docs/setup-command` and opened a merge request to `main`. The pipeline's Markdown check fails, and a reviewer asks Alex to make the command explanation clearer.

### Question

What should Alex do before the merge request is merged?

**Expected Answer:** Alex should read the pipeline job output, improve the README and explanation on the same source branch, test the result, commit, and push the update. Alex should then wait for the required pipeline and review requirements to be satisfied before merging into `main`.

---

## Scoring Guide

| Score     | Evaluation                                                       |
| --------- | ---------------------------------------------------------------- |
| 90-100%   | Excellent: you can explain the core GitLab workflow confidently. |
| 75-89%    | Good: review the terms that were unclear.                        |
| 60-74%    | Satisfactory: revisit the notebook and exercise.                 |
| Below 60% | Repeat the notebook and lab before continuing.                   |

---

## Review Checklist

- [ ] I can distinguish a namespace, group, project, and repository.
- [ ] I understand visibility, roles, and least privilege.
- [ ] I can explain the connection between issues, merge requests, and pipelines.
- [ ] I am ready for Chapter 18.

---

## Next Step

Continue with Chapter 18 to learn how groups, projects, members, and permissions are organized in greater depth.

### Related Content

- Notebook: [GitLab Fundamentals](../../notebooks/en/17-gitlab-fundamentals.md)
- Exercise: [Explore GitLab Project Fundamentals](../../exercises/en/17-explore-gitlab-project-fundamentals.md)
- Lab: [Create and Review a GitLab Change](../../labs/en/17-create-and-review-a-gitlab-change.md)
- Next Chapter: Groups, Projects, Members & Permissions (coming soon)
