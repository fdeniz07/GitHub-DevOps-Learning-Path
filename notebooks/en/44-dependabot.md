---
chapter: 44
title: "Dependabot Updates"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](43-codeql.md) | [Roadmap](../../ROADMAP.md) | [Next Chapter](45-security-best-practices.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Explain how Dependabot identifies outdated dependencies and proposes updates.
- Configure update schedules, groups, and pull request limits.
- Review, test, and safely merge dependency update pull requests.

## Introduction

Dependabot monitors dependency manifests and lock files, then opens pull requests for available version updates or security fixes. It reduces forgotten dependency drift, but automation does not make every update safe. The proposed change still needs review, tests, and release judgment.

## Why This Matters

Dependencies carry functionality and risk. Keeping them current can provide security patches and bug fixes, while careless upgrades can introduce breaking changes. A consistent update process makes dependency hygiene part of normal delivery work.

## Key Terms

| Term                | Definition                                                  |
| ------------------- | ----------------------------------------------------------- |
| Dependency          | External package or action required by a project.           |
| Manifest            | File that declares dependencies and version constraints.    |
| Lock file           | File that records resolved dependency versions.             |
| Update pull request | A proposed dependency change created by Dependabot.         |
| Grouped update      | Multiple compatible updates combined into one pull request. |

## Theory

Dependabot configuration lives in `.github/dependabot.yml`. Each update entry identifies an ecosystem, directory, and schedule. `open-pull-requests-limit`, `groups`, and ignore rules help control noise, but ignore rules should be reviewed so that they do not conceal important security updates.

Every update should pass CI and receive a human review appropriate to its risk. Check release notes, compatibility, lock-file changes, transitive dependencies, and production behavior. Action updates deserve the same attention as library updates.

### Practical Configuration Example

```yaml
version: 2
updates:
  - package-ecosystem: pip
    directory: "/"
    schedule:
      interval: weekly
    open-pull-requests-limit: 5
    groups:
      production-dependencies:
        dependency-type: production

  - package-ecosystem: github-actions
    directory: "/"
    schedule:
      interval: monthly
```

This configuration checks Python dependencies weekly and GitHub Actions monthly. A group can reduce pull request volume, but review the complete diff and test result before merging.

## Try It Yourself

1. Add a Dependabot entry for the project ecosystem.
2. Choose a schedule and a sensible pull request limit.
3. Inspect an update for direct and transitive changes.
4. Merge only after CI, security checks, and compatibility review succeed.

## Best Practices

- Review release notes and changelogs before merging updates.
- Keep lock files synchronized and test the resolved dependency graph.
- Update GitHub Actions as well as application libraries.
- Use grouping carefully and avoid broad ignore rules.
- Prioritize security updates while preserving a regular maintenance rhythm.

## Common Mistakes

| Mistake                        | Why it causes problems                                  | How to avoid it                          |
| ------------------------------ | ------------------------------------------------------- | ---------------------------------------- |
| Merging every PR automatically | A breaking update can reach production unreviewed.      | Require tests and appropriate review.    |
| Ignoring lock-file changes     | The actual resolved graph may differ from the manifest. | Review and commit lock-file updates.     |
| Leaving stale ignore rules     | Vulnerable packages remain pinned indefinitely.         | Review ignores with an owner and expiry. |

## Summary

- Dependabot automates dependency update proposals, not the final decision.
- Review, testing, release notes, and lock-file inspection remain necessary.
- Scheduled hygiene and sensible grouping reduce dependency risk and noise.

## Related Links

- Previous chapter: [CodeQL](43-codeql.md)
- Exercise: [Configure Dependabot updates](../../exercises/en/44-configure-dependabot-updates.md)
- Lab: [Review a Dependabot update](../../labs/en/44-review-a-dependabot-update.md)
- Quiz: [Dependabot quiz](../../quizzes/en/44-dependabot-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
- Next chapter: [Security best practices](45-security-best-practices.md)
