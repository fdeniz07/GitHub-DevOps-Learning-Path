---
chapter: 35
title: "GitHub Actions Composite Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](34-writing-custom-github-actions.md) | [Exercise](../../exercises/en/35-build-a-reusable-composite-action.md) | [Lab](../../labs/en/35-package-a-composite-action.md) | [Quiz](../../quizzes/en/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- explain when a composite action is useful;
- define action inputs, outputs, metadata, and shell steps;
- call a local composite action from a workflow;
- design action boundaries that are reusable and safe.

## Introduction

A composite action packages several ordinary workflow steps behind one reusable interface. It is useful when several workflows repeat the same setup, validation, or reporting sequence. The action keeps the workflow readable while its `action.yml` file documents the inputs and outputs.

## Key Terms

| Term             | Meaning                                                             |
| ---------------- | ------------------------------------------------------------------- |
| Composite action | An action implemented as a sequence of workflow steps.              |
| Input            | A value supplied by the workflow that calls the action.             |
| Output           | A named value returned by the action to later steps.                |
| Metadata file    | `action.yml` or `action.yaml`, which describes the action.          |
| Local action     | An action stored in the same repository and referenced with a path. |

## Theory

### Action Structure

A local action normally has its own directory and an `action.yml` file:

```text
.github/actions/report-context/
  action.yml
```

The metadata declares the action name, description, inputs, outputs, and `runs` configuration. A composite action uses `runs.using: composite` and gives every step an explicit `shell`.

### Inputs and Outputs

Inputs make a repeated workflow sequence configurable without copying its implementation. Give inputs useful descriptions and defaults where a safe default exists. Outputs should expose only stable, intentional results. A step writes an output to the runner's `GITHUB_OUTPUT` file, and the action maps that step output to its public output name.

### Example: A Local Composite Action

```yaml
name: Report context
description: Show the selected runtime and expose a normalized label
inputs:
  runtime:
    description: Runtime name to report
    required: true
outputs:
  label:
    description: Normalized runtime label
    value: ${{ steps.label.outputs.value }}
runs:
  using: composite
  steps:
    - id: label
      shell: bash
      env:
        RUNTIME: ${{ inputs.runtime }}
      run: echo "value=${RUNTIME,,}" >> "$GITHUB_OUTPUT"
    - shell: bash
      env:
        RUNTIME: ${{ inputs.runtime }}
      run: echo "Using runtime: $RUNTIME"
```

The workflow calls the action with a relative path and can consume its output:

```yaml
- id: context
  uses: ./.github/actions/report-context
  with:
    runtime: python
- run: echo "Label: ${{ steps.context.outputs.label }}"
```

The `id` is required on the calling step so later expressions can address its outputs.

### Boundaries and Security

Keep an action focused on one repeatable responsibility. Pass values through `with` and `env` instead of constructing shell commands from untrusted strings. Avoid printing tokens, use least-privilege permissions in the calling workflow, and pin third-party actions to reviewed references. A composite action inherits the permissions and runner context of its caller; it does not create a security boundary.

## Try It Yourself

1. Create a local action that accepts a directory input.
2. Add a step that lists files in that directory and exposes the file count as an output.
3. Call the action from a workflow and print the output.

## Best Practices

- Keep `action.yml` small and document every input and output.
- Use environment variables for shell data and quote paths.
- Validate required inputs before doing work.
- Test the action from a workflow on the same runner types it will use.
- Treat local actions as code: review, version, and change them deliberately.

## Common Mistakes

| Mistake                               | Why it causes problems                     | How to avoid it                                   |
| ------------------------------------- | ------------------------------------------ | ------------------------------------------------- |
| Omitting `shell`                      | Composite steps require an explicit shell. | Set `shell` for every `run` step.                 |
| Writing an output to the wrong file   | Later steps receive an empty output.       | Append `name=value` to `GITHUB_OUTPUT`.           |
| Embedding input directly in a command | Untrusted text can alter shell syntax.     | Pass input through a quoted environment variable. |
| Assuming the action isolates secrets  | The action runs with the caller's context. | Apply least privilege and avoid secret output.    |

## Summary

- Composite actions package reusable workflow steps.
- Inputs configure an action; outputs expose intentional results.
- `action.yml` is the action's public contract.
- Reuse improves consistency, but it does not replace workflow security controls.

### Related Content

- Exercise: [Build a Reusable Composite Action](../../exercises/en/35-build-a-reusable-composite-action.md)
- Lab: [Package a Composite Action](../../labs/en/35-package-a-composite-action.md)
- Quiz: [Composite Actions Quiz](../../quizzes/en/35-composite-actions-quiz.md)
