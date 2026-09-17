---
chapter: 24
title: ".gitlab-ci.yml, Pipelines, Stages & Jobs Quiz"
related_notebook: ".gitlab-ci.yml, Pipelines, Stages & Jobs"
related_exercise: "Write a GitLab CI Pipeline"
related_lab: "Review a GitLab CI Pipeline"
level: Beginner
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Chapter 23](../../notebooks/en/23-gitlab-cicd-foundations.md) | [Notebook](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md) | [Exercise](../../exercises/en/24-write-a-gitlab-ci-pipeline.md) | [Lab](../../labs/en/24-review-a-gitlab-ci-pipeline.md) | [Roadmap](../../ROADMAP.md)

## .gitlab-ci.yml, Pipelines, Stages & Jobs Quiz

## Multiple Choice

### Question 1

Where does GitLab normally look for the pipeline configuration file?

- A. Any subfolder named `pipelines`
- B. The repository root as `.gitlab-ci.yml`
- C. The runner's home directory
- D. Only the default branch's wiki

**Answer:** B

**Explanation:** GitLab reads `.gitlab-ci.yml` from the relevant commit in the repository root.

### Question 2

What may happen to two successful jobs in the same stage?

- A. They must run alphabetically.
- B. They can run in parallel when runners are available.
- C. They automatically share files.
- D. They create separate pipelines.

**Answer:** B

**Explanation:** A stage is an ordering boundary for later stages, not a sequential queue for its jobs.

### Question 3

Which construct decides whether GitLab creates a pipeline at all?

- A. `workflow: rules`
- B. `after_script`
- C. `needs`
- D. `image`

**Answer:** A

**Explanation:** `workflow: rules` is evaluated for pipeline creation; job `rules` decide job inclusion afterward.

## True or False

### Question 4

Tabs are a valid substitute for spaces in YAML indentation.

**Answer:** False

**Explanation:** Use spaces consistently; tabs can make YAML invalid.

### Question 5

`needs: [test]` describes a dependency from `test` to the job that declares it.

**Answer:** True

**Explanation:** The declaring job requires successful test evidence before it can run.

## Short Answer

### Question 6

What are the roles of `before_script`, `script`, and `after_script`?

**Expected Answer:** `before_script` prepares the job, `script` does its main work, and `after_script` runs afterward for safe cleanup or diagnostic output without concealing failures.

### Question 7

What should you inspect first when a job fails?

**Expected Answer:** The first meaningful failed command, its error, and nearby log context, then the pipeline graph and rules if needed.

## Practical Scenario

A merge request pipeline should run lint and tests, but should not be created for an unrelated source. Write the rule expression that identifies a merge request event and name the second level where conditions can control an individual job.

**Expected Answer:** Use `if: '$CI_PIPELINE_SOURCE == "merge_request_event"'`. Job-level `rules` control inclusion of an individual job.

## Related Content

- Notebook: [.gitlab-ci.yml, Pipelines, Stages & Jobs](../../notebooks/en/24-gitlab-ci-yml-pipelines-stages-and-jobs.md)
- Exercise: [Write a GitLab CI Pipeline](../../exercises/en/24-write-a-gitlab-ci-pipeline.md)
- Lab: [Review a GitLab CI Pipeline](../../labs/en/24-review-a-gitlab-ci-pipeline.md)
