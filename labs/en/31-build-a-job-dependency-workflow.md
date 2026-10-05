---
chapter: 31
title: "Build a Job Dependency Workflow"
related_notebook: "GitHub Actions Jobs and Steps"
related_exercise: "Design GitHub Actions Jobs and Steps"
level: Beginner
estimated_time: 60 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](../../notebooks/en/30-yaml-fundamentals.md) | [Notebook](../../notebooks/en/31-github-actions-jobs-and-steps.md) | [Exercise](../../exercises/en/31-design-github-actions-jobs-and-steps.md) | [Quiz](../../quizzes/en/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

# Build a Job Dependency Workflow

## Objective

Create a workflow that runs independent checks in parallel and publishes only after both succeed.

## Requirements

- A GitHub repository where you can create a workflow file.
- A small project with a lint and test command, or harmless placeholder commands.
- Familiarity with YAML and GitHub Actions expressions.

## Tasks

### Task 1 — Create the graph

Create `prepare`, `lint`, `test`, and `package` jobs. Let lint and test depend on prepare; let package depend on both checks.

### Task 2 — Pass metadata

Create a step output in prepare, map it to a job output, and print it in package. Do not put credentials in the output.

### Task 3 — Verify behavior

Open the workflow run summary and confirm the graph, output value, and failure behavior when one check fails.

## Expected Outcome

The run summary shows parallel checks, an explicit package gate, and a small output transferred through `needs`.

## Validation Checklist

- [ ] Job dependencies are explicit.
- [ ] The output is mapped correctly.
- [ ] A failing prerequisite prevents packaging.
- [ ] Permissions and logs contain no unnecessary secrets.

## Troubleshooting

| Problem                  | Cause                                      | Solution                                   |
| ------------------------ | ------------------------------------------ | ------------------------------------------ |
| Output is empty          | Step has no `id` or writes the wrong file. | Set an `id` and write to `$GITHUB_OUTPUT`. |
| Package starts too early | `needs` is missing.                        | Add every real prerequisite.               |

### Related Content

- Notebook: [GitHub Actions Jobs and Steps](../../notebooks/en/31-github-actions-jobs-and-steps.md)
- Exercise: [Design GitHub Actions Jobs and Steps](../../exercises/en/31-design-github-actions-jobs-and-steps.md)
- Quiz: [GitHub Actions Jobs and Steps Quiz](../../quizzes/en/31-github-actions-jobs-and-steps-quiz.md)
