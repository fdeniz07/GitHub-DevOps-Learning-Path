---
chapter: 42
title: "Secrets and Variables Quiz"
related_notebook: "Secrets and Variables"
related_exercise: "Manage Secrets and Variables"
related_lab: "Rotate Secrets and Review Variables"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/42-secrets-and-variables.md) | [Exercise](../../exercises/en/42-manage-secrets-and-variables.md) | [Lab](../../labs/en/42-rotate-secrets-and-review-variables.md) | [Roadmap](../../ROADMAP.md)

# Secrets and Variables Quiz

## Learning Objectives

- Distinguish `secrets` and `vars`.
- Identify credential exposure paths.
- Explain rotation and environment scoping.

## Questions

### Question 1

Which context should hold a cloud access token?

- A. `${{ vars.CLOUD_TOKEN }}`
- B. `${{ secrets.CLOUD_TOKEN }}`
- C. A committed YAML literal
- D. A README example containing the real value

**Answer:** B.

### Question 2

True or false: A GitHub Actions variable is automatically confidential.

**Answer:** False. Variables are ordinary configuration and should not be treated as secrets.

### Question 3

Why is `set -x` dangerous around credentials?

**Expected Answer:** Shell tracing can print commands and expanded values into workflow logs.

### Question 4

Name two actions in a credential rotation.

**Expected Answer:** Create a new credential, update the secret, test it, revoke the old credential, and record the change.

### Question 5 — Practical Scenario

A deployment token appears in a workflow log. What should the team do first?

**Expected Answer:** Revoke or rotate the exposed token immediately, remove the logging path, inspect usage, and review audit evidence.

## Review Checklist

- [ ] I can classify sensitive configuration.
- [ ] I know variables are not automatically secret.
- [ ] I can identify log exposure.
- [ ] I can explain environment-scoped rotation.

## Related Links

- Notebook: [Secrets and Variables](../../notebooks/en/42-secrets-and-variables.md)
- Exercise: [Manage Secrets and Variables](../../exercises/en/42-manage-secrets-and-variables.md)
- Lab: [Rotate Secrets and Review Variables](../../labs/en/42-rotate-secrets-and-review-variables.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
