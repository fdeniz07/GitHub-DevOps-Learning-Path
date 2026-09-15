---
chapter: 16
title: "GitHub Security Quiz"
related_notebook: "GitHub Security"
related_exercise: "Review GitHub Security Controls"
related_lab: "Harden a GitHub Repository"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/16-github-security.md) | [Exercise](../../exercises/en/16-review-github-security-controls.md) | [Lab](../../labs/en/16-harden-a-github-repository.md) | [Roadmap](../../ROADMAP.md)

# GitHub Security Quiz

## Multiple Choice

### Question 1

What does the principle of least privilege mean?

- A. Give every contributor administrator access
- B. Give each person or process only the access required for its task
- C. Disable all repository automation
- D. Store credentials in public documentation

#### Answer and Explanation: Question 1

**B.** Least privilege limits access to what is necessary and reduces the impact of mistakes or compromise.

### Question 2

What should happen first after a production token is exposed?

- A. Add the token to an issue for discussion
- B. Rename the repository
- C. Revoke or disable the token
- D. Wait for the next release

#### Answer and Explanation: Question 2

**C.** Revoking the credential contains the immediate risk. It should then be rotated and the incident investigated.

## Short Answer

### Question 3

Name two controls that help protect an important default branch.

#### Answer and Explanation: Question 3

Examples include required pull request reviews, required status checks, conversation resolution, and restrictions on force pushes.

## Practical Scenario

A dependency alert reports a vulnerable package version. What should the team do?

### Expected Answer: Practical Scenario

Identify the affected dependency, review the patched version and impact, update the manifest and lockfile, run tests and security checks, review the change, and confirm that the alert is resolved.

### Related Content

- Notebook: [GitHub Security](../../notebooks/en/16-github-security.md)
- Exercise: [Review GitHub Security Controls](../../exercises/en/16-review-github-security-controls.md)
- Lab: [Harden a GitHub Repository](../../labs/en/16-harden-a-github-repository.md)
