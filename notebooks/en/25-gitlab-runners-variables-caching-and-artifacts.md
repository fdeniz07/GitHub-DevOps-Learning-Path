---
chapter: 25
title: "Runners, Variables, Caching & Artifacts"
part: "GitLab DevOps"
level: Beginner
estimated_time: 100 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Chapter 24](24-gitlab-ci-yml-pipelines-stages-and-jobs.md) | [Exercise](../../exercises/en/25-select-gitlab-ci-resources.md) | [Lab](../../labs/en/25-improve-a-gitlab-ci-pipeline.md) | [Quiz](../../quizzes/en/25-gitlab-runners-variables-caching-and-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- select a runner based on capability and trust boundary;
- use CI/CD variables without exposing sensitive values;
- distinguish a dependency cache from a build artifact;
- diagnose common runner, variable, cache, and artifact failures.

## Introduction

A pipeline definition describes what should happen. Runners provide the environment where jobs actually run. Variables supply configuration, caches speed up repeatable work, and artifacts preserve useful job output for later jobs or people. These features are powerful, so each needs a clear purpose and security boundary.

## Key Terms

| Term               | Meaning                                                    |
| ------------------ | ---------------------------------------------------------- |
| Runner             | An agent that picks up and executes CI/CD jobs.            |
| Runner tag         | A label used to select runners with a needed capability.   |
| Variable           | A configuration value made available to a pipeline or job. |
| Protected variable | A variable available only to pipelines for protected refs. |
| Masked variable    | A secret-like value GitLab attempts to hide in job logs.   |
| Cache              | Reusable, reproducible files retained to speed later jobs. |
| Artifact           | A named job output preserved for download or later jobs.   |

## Runners and Trust

Runners execute code from a pipeline. Treat each runner as a trust boundary: a job can read its checkout and any variables it is permitted to receive. Shared runners serve many projects; group runners serve a group; project runners are dedicated to one project. Availability and policy depend on the GitLab instance.

Tags select suitable runners. A job requiring Linux and Docker must target a runner configured for that work. Do not use powerful or production-connected runners for untrusted code. Use protected runners and protected branches when sensitive jobs require them.

## Variables: Configuration Without Exposure

Variables may be defined in the UI, at group or project scope, or in `.gitlab-ci.yml`. Their effective value depends on scope and configured precedence, so teams should document their instance rules and avoid duplicate names. Non-sensitive configuration can be visible in YAML; passwords, tokens, and private keys must be stored as protected, masked UI variables or an approved secret system.

Never run `echo $TOKEN`, print all environment variables, or copy secret values into issues and logs. File-type variables are useful when a tool expects a file, such as a certificate; GitLab provides a temporary file path rather than requiring the secret content in the repository.

## Cache and Artifacts Are Different

| Question                 | Cache                           | Artifact                                      |
| ------------------------ | ------------------------------- | --------------------------------------------- |
| Purpose                  | Speed up recreated dependencies | Preserve a job result                         |
| Example                  | npm package cache               | `dist/` build output                          |
| Reliability              | May be absent or invalidated    | Available for its configured retention period |
| Use for deployment input | No                              | Yes, when the pipeline design requires it     |

A cache key identifies which jobs may reuse a cache. Include dependency-file changes in the key so an old dependency cache is not treated as current. A cache miss is normally a performance event, not a correctness failure. Artifacts need exact paths relative to the project directory and an intentional expiry period.

## Progressive Node.js Pipeline

```yaml
default:
  image: node:22-alpine

cache:
  key:
    files:
      - package-lock.json
  paths:
    - .npm/

test:
  script:
    - npm ci --cache .npm --prefer-offline
    - npm test
```

The cache contains downloaded package data, not the application result. Its key changes when `package-lock.json` changes. The job remains correct on a cache miss because `npm ci` can download dependencies again.

```yaml
stages:
  - verify
  - build

build:
  stage: build
  script:
    - npm ci --cache .npm --prefer-offline
    - npm run build
  artifacts:
    paths:
      - dist/
    expire_in: 7 days

package-check:
  stage: verify
  needs:
    - job: build
      artifacts: true
  script:
    - test -f dist/index.html
```

`dist/` is an artifact because it is the specific build output that a later job needs. `expire_in` prevents unbounded storage. In a real pipeline, order stages and `needs` so the consuming job follows the producing job; this short example focuses on artifact transfer. The `package-check` job explicitly downloads build artifacts through `needs`.

## Troubleshooting

| Problem               | Likely cause                             | Safe response                                                                  |
| --------------------- | ---------------------------------------- | ------------------------------------------------------------------------------ |
| Job is pending        | No eligible runner or matching tag       | Inspect runner availability and job tags; do not remove tags blindly.          |
| Variable is empty     | Wrong scope, protected-ref rule, or name | Check the variable name and allowed ref without printing its value.            |
| Cache miss            | Key changed or cache was cleared         | Let dependencies install; inspect key design only if performance remains poor. |
| Artifact upload fails | Path does not exist after the script     | Inspect generated files and correct the relative artifact path.                |

## Best Practices

- Select runners deliberately and keep sensitive jobs on trusted protected runners.
- Use variables for configuration, and secrets only through approved protected controls.
- Cache downloaded dependencies; publish build output as an artifact.
- Set artifact expiry and avoid broad paths that collect unrelated files.

## Summary

- Runners execute jobs and define a meaningful trust boundary.
- Variables configure jobs but must never be exposed in logs.
- Caches optimize repeatable input; artifacts preserve explicit output.
- Correct keys, paths, and retention make pipelines faster without weakening reliability.

### Related Content

- Exercise: [Select GitLab CI Resources](../../exercises/en/25-select-gitlab-ci-resources.md)
- Lab: [Improve a GitLab CI Pipeline](../../labs/en/25-improve-a-gitlab-ci-pipeline.md)
- Quiz: [Runners, Variables, Caching & Artifacts Quiz](../../quizzes/en/25-gitlab-runners-variables-caching-and-artifacts-quiz.md)
