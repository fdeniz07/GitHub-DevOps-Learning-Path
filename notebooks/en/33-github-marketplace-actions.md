---
chapter: 33
title: "GitHub Marketplace Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 80 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](32-github-runners.md) | [Exercise](../../exercises/en/33-review-a-marketplace-action.md) | [Lab](../../labs/en/33-harden-a-marketplace-action.md) | [Quiz](../../quizzes/en/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- explain how Marketplace actions receive inputs and expose outputs;
- pin action references to a reviewable commit and assess update trade-offs;
- review an action's permissions, source, maintenance, dependencies, and data handling.

## Introduction

Marketplace actions package reusable automation. They can remove boilerplate, but an action runs code inside your workflow environment. Treat an action as a third-party dependency with a supply-chain review, not as harmless YAML decoration.

## Key Terms

| Term             | Definition                                                                          |
| ---------------- | ----------------------------------------------------------------------------------- |
| Action reference | The owner, repository, and ref used after `uses:`.                                  |
| Commit pin       | An immutable commit SHA used to select an exact revision.                           |
| Input            | A value passed to an action through `with`.                                         |
| Output           | A named value an action makes available to later steps.                             |
| Supply chain     | The people, code, dependencies, releases, and infrastructure that produce software. |

## Theory

### Inputs and Outputs

```yaml
- id: metadata
  uses: actions/checkout@v4
  with:
    fetch-depth: 0
```

Inputs are action-specific; read the action's metadata and documentation rather than guessing names. Outputs are action-specific too and are normally consumed through `steps.metadata.outputs.<name>` after assigning an `id`.

### Pinning for Reproducibility

A major tag such as `@v4` receives compatible updates but can change over time. A full commit SHA selects an exact revision and supports reproducible review:

```yaml
- uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683
```

A pin is useful only when the SHA is verified as belonging to the intended upstream release. Automate update proposals and review their diffs rather than silently changing pins.

### Supply-Chain Review

Before adoption, inspect source and `action.yml`, release history, maintainers, permissions, third-party dependencies, install behavior, network access, and handling of secrets. The action should receive only the permissions it needs, and the workflow should avoid exposing sensitive values to untrusted action code.

## Best Practices

- Prefer well-maintained actions with transparent source and release history.
- Pin production actions to verified commit SHAs or use an approved organization policy.
- Document why an action is trusted and how updates are reviewed.
- Pass only necessary inputs and permissions.
- Test output behavior and failure handling in a small workflow before broad adoption.

## Common Mistakes

| Mistake                                           | Risk                                            | Better approach                          |
| ------------------------------------------------- | ----------------------------------------------- | ---------------------------------------- |
| Copying an action without reading metadata        | Inputs or permissions may be wrong.             | Inspect metadata and source first.       |
| Trusting a mutable tag in a critical workflow     | Behavior can change without a local diff.       | Pin and automate reviewed updates.       |
| Giving an action broad `GITHUB_TOKEN` permissions | A compromise has a larger blast radius.         | Set least-privilege permissions.         |
| Treating popularity as a security review          | Popular code can still have risky dependencies. | Review provenance, source, and behavior. |

## Summary

Marketplace actions are executable dependencies. Inputs and outputs define their interface, commit pins improve reproducibility, and supply-chain review limits hidden risk.

### Related Content

- Previous notebook: [GitHub Actions Runners](32-github-runners.md)
- Exercise: [Review a Marketplace Action](../../exercises/en/33-review-a-marketplace-action.md)
- Lab: [Harden a Marketplace Action](../../labs/en/33-harden-a-marketplace-action.md)
- Quiz: [GitHub Marketplace Actions Quiz](../../quizzes/en/33-github-marketplace-actions-quiz.md)
