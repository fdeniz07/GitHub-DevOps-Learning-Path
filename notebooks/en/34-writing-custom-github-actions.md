---
chapter: 34
title: "Writing Custom GitHub Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 100 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](33-github-marketplace-actions.md) | [Exercise](../../exercises/en/34-design-a-custom-github-action.md) | [Lab](../../labs/en/34-build-and-test-a-custom-action.md) | [Quiz](../../quizzes/en/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- decide when a custom action is better than a reusable workflow or a shell step;
- describe the roles of `action.yml`, JavaScript actions, Docker actions, inputs, outputs, and branding;
- version, test, document, and secure a custom action for other workflows.

## Introduction

Custom actions package repeated automation behind a stable interface. They are valuable when behavior should be reused across repositories and maintained by one team, but they also create a product surface: metadata, runtime code, tests, release versions, and security expectations.

## Key Terms

| Term                | Definition                                                             |
| ------------------- | ---------------------------------------------------------------------- |
| `action.yml`        | Metadata file that defines an action's interface and runtime.          |
| JavaScript action   | An action executed with a Node.js runtime on the runner.               |
| Docker action       | An action packaged and executed in a container.                        |
| Composite action    | An action that groups workflow steps in YAML.                          |
| Semantic versioning | A versioning convention communicating compatible and breaking changes. |

## Theory

### Choosing the Action Type

Use a composite action for a clear sequence of existing steps. Use JavaScript when you need runner APIs, structured logic, or fast startup without building a container. Use Docker when a controlled Linux userspace or system dependency is essential. A reusable workflow is often better when the reusable unit needs multiple jobs, permissions, environments, or matrix strategy.

### Metadata Defines the Contract

```yaml
name: "Collect build metadata"
description: "Creates a short build identifier"
inputs:
  source:
    description: "Text used to derive the identifier"
    required: true
outputs:
  build-id:
    description: "Short identifier for this build"
    value: ${{ steps.collect.outputs.build_id }}
runs:
  using: "node20"
  main: "dist/index.js"
```

The metadata declares what callers provide and receive. Keep the contract small, validate inputs, write outputs through the supported output mechanism, and document failure behavior.

### JavaScript and Docker Runtimes

A JavaScript action usually keeps source in a readable directory and commits the bundled `dist` entry point used by the runner. A Docker action declares an image or Dockerfile and must account for build time, Linux compatibility, permissions, and image maintenance. Neither runtime removes the need for tests or dependency review.

### Versioning and Tests

Publish an immutable release tag such as `v1.2.0`, then move a major tag such as `v1` only through a reviewed update. Test valid inputs, invalid inputs, output values, failures, and behavior on the supported runner. A small integration workflow should exercise the action through `uses`, not only unit-test internal functions.

## Best Practices

- Keep `action.yml` explicit, minimal, and documented.
- Validate inputs and avoid printing secrets or raw tokens.
- Test the public interface on every supported runtime and operating system.
- Commit generated JavaScript bundles when the action contract requires them.
- Use immutable releases and communicate breaking changes through major versions.
- Apply least-privilege permissions in the calling workflow.

## Common Mistakes

| Mistake                                        | Consequence                            | Better approach                            |
| ---------------------------------------------- | -------------------------------------- | ------------------------------------------ |
| Building a custom action for one local command | Maintenance exceeds the reuse benefit. | Start with a readable workflow step.       |
| Forgetting to update the bundled JavaScript    | Callers run stale code.                | Build and test the distribution artifact.  |
| Reading an undeclared input                    | The public contract is unclear.        | Declare and validate every input.          |
| Moving a major tag without migration notes     | Consumers can break unexpectedly.      | Use semantic versioning and release notes. |

## Summary

Custom actions are versioned software interfaces. Choose the runtime that fits the need, define the contract in `action.yml`, test the public behavior, and release immutable, reviewable versions.

### Related Content

- Previous notebook: [GitHub Marketplace Actions](33-github-marketplace-actions.md)
- Exercise: [Design a Custom GitHub Action](../../exercises/en/34-design-a-custom-github-action.md)
- Lab: [Build and Test a Custom Action](../../labs/en/34-build-and-test-a-custom-action.md)
- Quiz: [Writing Custom GitHub Actions Quiz](../../quizzes/en/34-writing-custom-github-actions-quiz.md)
