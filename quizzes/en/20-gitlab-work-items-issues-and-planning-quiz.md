---
chapter: 20
title: "GitLab Work Items, Issues, and Planning Quiz"
related_notebook: "GitLab Work Items, Issues, and Planning"
related_exercise: "Triage GitLab Work Items"
related_lab: "Plan a Small GitLab Delivery"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md) | [Exercise](../../exercises/en/20-triage-gitlab-work-items.md) | [Lab](../../labs/en/20-plan-a-small-gitlab-delivery.md) | [Roadmap](../../ROADMAP.md)

## GitLab Work Items, Issues, and Planning Quiz

## Purpose

Check whether you can create, triage, and trace planning work in GitLab.

## Section A - Multiple Choice

### Question 1

Which acceptance criterion is most useful?

- A. Make login better.
- B. The feature works correctly.
- C. Invalid credentials show a neutral message and automated tests cover the path.
- D. Use the newest framework.

**Answer:** C

**Explanation:** It defines observable behavior and evidence without prescribing an unnecessary implementation.

### Question 2

What is the main purpose of triage?

- A. Merge every request immediately.
- B. Make incoming work understandable, classified, and ordered for action.
- C. Replace code review.
- D. Remove all low-priority items.

**Answer:** B

**Explanation:** Triage creates a trustworthy queue; it does not eliminate planning or review.

## Section B - True or False

### Question 3

Labels, assignees, and milestones have exactly the same purpose.

**Answer:** False

**Explanation:** Labels classify work, an assignee identifies current responsibility, and a milestone groups work toward a time or outcome.

### Question 4

A planning board may not be available in every GitLab project configuration.

**Answer:** True

**Explanation:** Features and permissions vary, so a team should use the views available to it and keep their data current.

## Section C - Short Answer

### Question 5

Why should a branch and merge request refer to the work item or issue?

**Expected Answer:** The links preserve traceability between the requested outcome, implementation, review, automated checks, and completion decision.

### Question 6

Name two factors that can justify high priority.

**Expected Answer:** Examples include user impact, security or reliability risk, a fixed deadline, blocking another delivery, and the number of affected users.

## Practical Scenario

A report says "docs broken". Describe the first triage actions before anyone creates a branch.

**Expected Answer:** Clarify the affected page and user impact, rewrite the title and description, add acceptance criteria, check for duplicates, apply agreed labels, set priority, and assign or schedule the work when ready.

## Related Content

- Notebook: [GitLab Work Items, Issues, and Planning](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md)
- Exercise: [Triage GitLab Work Items](../../exercises/en/20-triage-gitlab-work-items.md)
- Lab: [Plan a Small GitLab Delivery](../../labs/en/20-plan-a-small-gitlab-delivery.md)
