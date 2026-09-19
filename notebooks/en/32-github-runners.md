---
chapter: 32
title: "GitHub Actions Runners"
part: "GitHub Actions"
level: Beginner
estimated_time: 70 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Notebook](31-github-actions-jobs-and-steps.md) | [Exercise](../../exercises/en/32-select-github-runners.md) | [Lab](../../labs/en/32-configure-runner-selection.md) | [Quiz](../../quizzes/en/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

- compare GitHub-hosted and self-hosted runners;
- select runners with labels and understand runner groups;
- evaluate trust, isolation, maintenance, and secret exposure before using a runner.

## Introduction

A runner is the machine that executes a job. Runner choice affects operating system compatibility, available tools, startup time, cost, network access, and the blast radius of untrusted workflow code.

## Key Terms

| Term                 | Definition                                                                 |
| -------------------- | -------------------------------------------------------------------------- |
| GitHub-hosted runner | A temporary virtual machine managed by GitHub for a job.                   |
| Self-hosted runner   | A machine registered and maintained by an organization or repository.      |
| Label                | A capability or routing tag used by `runs-on`.                             |
| Runner group         | An administrative boundary controlling which repositories can use runners. |
| Trust boundary       | The point where code or identities gain access to another environment.     |

## Theory

### Hosted Runners

Hosted runners provide clean, ephemeral machines and a documented set of images. They are convenient for public tooling and ordinary build jobs. The job should still treat repository content and pull-request code carefully, because workflow code executes with the permissions granted to it.

### Self-Hosted Runners

Self-hosted runners are useful for private networks, specialized hardware, custom tools, or predictable environments. They require patching, access control, monitoring, cleanup, and capacity management. A persistent runner can retain files or credentials after a job, so isolation is a security requirement rather than a cosmetic preference.

### Labels and Groups

```yaml
jobs:
  integration:
    runs-on: [self-hosted, linux, integration]
    steps:
      - uses: actions/checkout@v4
      - run: ./scripts/run-integration-tests.sh
```

Every label in the array must match the selected runner. Labels describe capability, not authorization. Use runner groups and repository policy to decide who may route jobs to sensitive machines.

### Trust Decisions

Do not send fork pull requests or unreviewed external code to a self-hosted runner with access to production networks or long-lived secrets. Prefer hosted runners, isolated ephemeral machines, or an approval gate for untrusted inputs.

## Best Practices

- Start with hosted runners unless a clear requirement justifies self-hosting.
- Keep self-hosted runners patched, observable, and disposable where possible.
- Use specific labels that describe tested capabilities.
- Separate trusted deployment runners from general build runners.
- Review workflow triggers and permissions together with runner placement.

## Common Mistakes

| Mistake                                    | Impact                                         | Better approach                                   |
| ------------------------------------------ | ---------------------------------------------- | ------------------------------------------------- |
| Treating `self-hosted` as a harmless label | Sensitive jobs may reach a persistent machine. | Use dedicated groups and labels.                  |
| Installing tools manually without records  | Builds become difficult to reproduce.          | Automate and document runner provisioning.        |
| Reusing a runner after untrusted code      | Files or credentials may leak between jobs.    | Use isolation and cleanup or an ephemeral runner. |

## Summary

Runner selection is an execution and security decision. Labels route work, groups restrict access, and trust analysis determines whether a job belongs on a hosted, isolated, or self-hosted runner.

### Related Content

- Previous notebook: [GitHub Actions Jobs and Steps](31-github-actions-jobs-and-steps.md)
- Exercise: [Select GitHub Runners](../../exercises/en/32-select-github-runners.md)
- Lab: [Configure Runner Selection](../../labs/en/32-configure-runner-selection.md)
- Quiz: [GitHub Actions Runners Quiz](../../quizzes/en/32-github-runners-quiz.md)
