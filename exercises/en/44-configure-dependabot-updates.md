---
chapter: 44
title: "Configure Dependabot Updates"
related_notebook: "Dependabot Updates"
related_lab: "Review a Dependabot Update"
related_quiz: "Dependabot Quiz"
level: Intermediate
estimated_time: 30 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/44-dependabot.md) | [Lab](../../labs/en/44-review-a-dependabot-update.md) | [Roadmap](../../ROADMAP.md)

# Configure Dependabot Updates

## Objective

Create a Dependabot policy that keeps application dependencies and GitHub Actions current while preserving review quality.

## Outcomes

- Configure an ecosystem, directory, interval, and pull request limit.
- Decide when grouping is useful.
- Define the checks required before merging an update.

## Prerequisites

- Read [Dependabot Updates](../../notebooks/en/44-dependabot.md).
- Understand manifests and lock files.
- Know how CI status checks work.

## Scenario

A repository has stale Python packages and action versions. Dependabot should open a manageable number of pull requests and keep security updates visible.

## Tasks

### Task 1 — Write the policy

Create `.github/dependabot.yml` with `version: 2`, a weekly `pip` update for `/`, and a monthly `github-actions` update.

**Expected Result:** Both ecosystems are monitored on an explicit schedule.

### Task 2 — Control noise

Set `open-pull-requests-limit: 5` and group compatible production dependency updates. Explain one risk of grouping.

**Expected Result:** The team receives manageable proposals without losing review context.

### Task 3 — Define review evidence

List the release notes, lock-file diff, CI checks, security result, and compatibility behavior that must be reviewed before merging.

**Expected Result:** An update is merged because evidence supports it, not because Dependabot opened it.

## Challenge

Design an owner and expiry date for any ignore rule. Explain why permanent ignores are risky.

## Self-Assessment

- [ ] I can configure two ecosystems.
- [ ] I can explain grouping tradeoffs.
- [ ] I review lock files and transitive changes.
- [ ] I know that Dependabot PRs still need tests.

## Common Mistakes

| Mistake                               | Solution                           |
| ------------------------------------- | ---------------------------------- |
| Monitoring only application packages  | Add `github-actions` updates too.  |
| Merging without CI                    | Require tests and security checks. |
| Ignoring a vulnerability indefinitely | Assign an owner and review date.   |

## Summary

Dependabot proposes changes; maintainers review release notes, dependency graphs, tests, and risk before merging.

## Related Links

- Notebook: [Dependabot Updates](../../notebooks/en/44-dependabot.md)
- Lab: [Review a Dependabot Update](../../labs/en/44-review-a-dependabot-update.md)
- Quiz: [Dependabot Quiz](../../quizzes/en/44-dependabot-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
