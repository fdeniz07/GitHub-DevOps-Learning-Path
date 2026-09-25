---
chapter: 29
title: "GitHub Actions Workflow Anatomy"
part: "GitHub Actions"
level: Beginner
estimated_time: 85 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](27-gitlab-devsecops-security-scans-and-compliance.md) | [Exercise](../../exercises/en/29-trace-a-github-actions-workflow.md) | [Lab](../../labs/en/29-review-workflow-execution.md) | [Quiz](../../quizzes/en/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- read the top-level structure of a GitHub Actions workflow;
- explain how triggers, permissions, jobs, and steps relate;
- trace a workflow from an event to a job and its individual steps;
- identify where later chapters will add runners, actions, and job details.

## Introduction

A workflow is a structured document, not a list of unrelated commands. Its top-level keys describe the workflow's identity, start conditions, access, and work. Reading this structure from the outside in makes failures easier to locate.

## Key Terms

| Term           | Meaning                                                                    |
| -------------- | -------------------------------------------------------------------------- |
| Top-level key  | A key directly under the workflow document root, such as `name` or `jobs`. |
| Trigger        | The `on` definition that selects events and optional filters.              |
| Job identifier | A unique key under `jobs` that names a unit of work.                       |
| Runner label   | The value of `runs-on` that selects the execution environment.             |
| Dependency     | A relationship that makes one job wait for another with `needs`.           |

## Theory

### The Workflow Shape

```yaml
name: Validate application
on:
  pull_request:
permissions:
  contents: read
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: ./scripts/test.sh
```

`name` labels the workflow in the Actions interface. `on` selects events. `permissions` establishes token access. `jobs` contains one or more job maps. Each job selects a runner and defines an ordered `steps` list.

### Triggers and Filters

Triggers may be simple, such as `workflow_dispatch`, or maps with filters:

```yaml
on:
  push:
    branches: [main]
    paths:
      - "src/**"
  pull_request:
    branches: [main]
```

Filters reduce unnecessary runs, but they also change when feedback appears. A path filter that excludes a configuration file can allow a relevant change to avoid validation. Always explain the boundary created by a filter.

### Jobs and Steps Overview

Jobs are separate execution units. Without a dependency, jobs can run in parallel. `needs: build` makes a later job wait for the `build` job. Steps within one job run in order and share the job workspace. A step can use an action or run a command; it may also define environment variables, a working directory, or a condition.

### Expressions and Contexts

Expressions use the `${{ ... }}` form to read values such as event data:

```yaml
if: ${{ github.event_name == 'pull_request' }}
```

Expressions are evaluated by Actions, while YAML supplies the surrounding structure. Keep expressions readable and avoid placing untrusted event text directly into shell commands.

## Practical Example

Trace this workflow on paper before reading the explanation:

```yaml
name: Review gate
on:
  pull_request:
    branches: [main]
permissions:
  contents: read
jobs:
  inspect:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Inspect files
        run: git ls-files
  report:
    needs: inspect
    runs-on: ubuntu-latest
    steps:
      - name: Report completion
        run: echo "Inspection completed"
```

Only pull requests targeting `main` start the workflow. `inspect` begins first. `report` waits for `inspect` to succeed, then runs on a separate job runner. The checkout step is not automatically shared with `report`; separate jobs need their own setup when they need repository files.

## Try It Yourself

List the workflow's top-level keys, then answer: what event starts it, which permission is granted, which job runs first, and why does the second job wait? Finally, mark every line that is YAML structure, an action reference, a shell command, or an expression.

## Best Practices

- Read workflows from top-level intent down to individual commands.
- Use `needs` to make job ordering explicit instead of relying on accidental timing.
- Repeat required setup in each job because jobs have isolated execution environments.
- Review trigger filters whenever repository paths or branch policy changes.

## Common Mistakes

| Mistake                                    | Why it causes problems                                    | How to avoid it                                                           |
| ------------------------------------------ | --------------------------------------------------------- | ------------------------------------------------------------------------- |
| Assuming jobs share files automatically    | Jobs normally run on separate runners.                    | Check out or transfer required data in each job.                          |
| Treating `needs` as a step dependency      | `needs` connects jobs, not steps.                         | Keep step order inside `steps` and job order under `needs`.               |
| Hiding a broad trigger behind a short file | Reviewers may miss when automation runs.                  | Document filters through clear names and focused structure.               |
| Mixing YAML and expression syntax          | The parser or Actions evaluator receives the wrong value. | Validate indentation and use `${{ }}` only where an expression is needed. |

## Summary

Workflow anatomy is easiest to understand as `on` starts `jobs`, each job selects `runs-on`, and ordered `steps` perform actions or commands. Permissions and expressions add control without changing that basic shape.

### Related Content

- Exercise: [Trace a GitHub Actions Workflow](../../exercises/en/29-trace-a-github-actions-workflow.md)
- Lab: [Review Workflow Execution](../../labs/en/29-review-workflow-execution.md)
- Quiz: [Workflow Anatomy Quiz](../../quizzes/en/29-workflow-anatomy-quiz.md)
