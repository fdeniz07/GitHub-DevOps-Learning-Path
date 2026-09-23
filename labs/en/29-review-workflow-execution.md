---
chapter: 29
title: "Review Workflow Execution"
related_notebook: "GitHub Actions Workflow Anatomy"
related_exercise: "Trace a GitHub Actions Workflow"
level: Beginner
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/en/29-github-actions-workflow-anatomy.md) | [Exercise](../../exercises/en/29-trace-a-github-actions-workflow.md) | [Quiz](../../quizzes/en/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Objective

Use the Actions interface to review how an event became jobs, steps, logs, and a final status.

## Learning Outcomes

- connect a run to its triggering event and commit;
- distinguish job status from individual step status;
- identify a dependency-driven execution order.

## Scenario

Review a workflow with an `inspect` job and a dependent `report` job. Your task is to create evidence that explains not only whether it passed, but how it ran.

## Prerequisites

- Completed the related notebook and exercise.
- A repository containing a workflow with at least two jobs.
- Permission to view Actions runs.

## Environment Setup

| Requirement      | Value                                       |
| ---------------- | ------------------------------------------- |
| Operating System | Windows, Linux, or macOS                    |
| Software         | Browser and text editor                     |
| Repository       | A practice repository with workflow history |

## Tasks

### Task 1 - Identify the run boundary

#### Steps: Identify the Run Boundary

1. Open one completed workflow run.
2. Record its event, branch, commit, actor, and workflow name.
3. Compare those values with the `on` block.

#### Expected Result: Matching Trigger

You can explain why this run started and which trigger matched.

### Task 2 - Trace jobs and steps

#### Steps: Trace Jobs and Steps

1. Record each job identifier and runner label.
2. Expand every step and note whether it uses an action or runs a command.
3. Find any `needs` relationship and confirm the observed order.

#### Expected Result: Execution Graph

Your trace shows the workflow's execution graph and the ordered steps inside each job.

### Task 3 - Review the result

#### Steps: Review the Result

1. Find the first failing step if the run failed.
2. Separate a YAML/configuration problem from a command or environment problem.
3. Write one evidence-based next action.

#### Expected Result: Next Action

The review names a likely control point instead of treating the whole workflow as one opaque failure.

## Validation Checklist

- [ ] Event, branch, and commit are recorded.
- [ ] Every job and runner is identified.
- [ ] Action steps and command steps are distinguished.
- [ ] `needs` relationships are explained.
- [ ] Any failure has a specific next action.

## Troubleshooting

| Problem                     | Possible Cause                     | Solution                                                           |
| --------------------------- | ---------------------------------- | ------------------------------------------------------------------ |
| Job order seems unexpected  | No dependency was declared.        | Inspect `needs` and remember independent jobs may run in parallel. |
| Later job cannot find files | Jobs use separate runners.         | Add setup to the later job or transfer an artifact.                |
| Logs are too broad          | The review lacks a starting point. | Locate the first failing step and inspect its context.             |

## Best Practices

- Record immutable context such as commit SHA when possible.
- Review the first failure before later cascading failures.
- Treat logs as evidence and avoid copying sensitive values into notes.

## Summary

Workflow review becomes manageable when the run is decomposed into event, job, dependency, step, log, and result.

### Related Content

- Notebook: [GitHub Actions Workflow Anatomy](../../notebooks/en/29-github-actions-workflow-anatomy.md)
- Exercise: [Trace a GitHub Actions Workflow](../../exercises/en/29-trace-a-github-actions-workflow.md)
- Quiz: [Workflow Anatomy Quiz](../../quizzes/en/29-workflow-anatomy-quiz.md)
