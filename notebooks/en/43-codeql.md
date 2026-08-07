---
chapter: 43
title: "CodeQL Analysis"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 50 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](42-secrets-and-variables.md) | [Roadmap](../../ROADMAP.md) | [Next Chapter](44-dependabot.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Explain how CodeQL identifies security issues through semantic analysis.
- Configure a CodeQL workflow with appropriate permissions and triggers.
- Triage findings using severity, data flow, reachability, and remediation evidence.

## Introduction

CodeQL treats code as data and queries it for patterns associated with vulnerabilities. GitHub Advanced Security can run CodeQL analysis in GitHub Actions and report findings in code scanning alerts. An alert is a lead for investigation, not an automatic proof that an exploit exists.

## Why This Matters

Static analysis can identify insecure data flows before deployment and can protect common paths such as pull requests and the default branch. The value comes from timely triage: teams must understand, fix, dismiss with justification, or track each finding.

## Key Terms

| Term                | Definition                                                  |
| ------------------- | ----------------------------------------------------------- |
| CodeQL              | A semantic code analysis engine and query language.         |
| Code scanning alert | A reported result from a security analysis tool.            |
| Triage              | Reviewing a finding and deciding how it should be handled.  |
| Data flow           | The path data takes from a source to a sensitive sink.      |
| SARIF               | A standard format used to exchange static analysis results. |

## Theory

CodeQL workflows select languages, build modes, query suites, and triggers. Pull request analysis gives developers early feedback; scheduled analysis can detect newly published query improvements or changes in the default branch. Workflow permissions commonly include `security-events: write` so results can be uploaded.

Triage should check the affected code, source, sink, sanitization, exploitability, and test coverage. Fix the root cause where possible. A dismissal should include a meaningful reason and should not be used to silence inconvenient alerts.

### Practical Workflow Example

```yaml
name: CodeQL

on:
  push:
    branches: [main]
  pull_request:
  schedule:
    - cron: "30 2 * * 1"

permissions:
  contents: read
  security-events: write

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        language: [python]
    steps:
      - uses: actions/checkout@v4
      - name: Initialize CodeQL
        uses: github/codeql-action/init@v3
        with:
          languages: ${{ matrix.language }}
      - name: Perform CodeQL analysis
        uses: github/codeql-action/analyze@v3
        with:
          category: /language:${{ matrix.language }}
```

The workflow uploads results using the `security-events: write` permission. The exact build steps depend on the language and build mode. Review the action documentation and repository policy before changing permissions.

## Try It Yourself

1. Enable CodeQL for one supported language.
2. Inspect one alert from source to sink.
3. Decide whether to fix, track, or dismiss it and record the reasoning.
4. Add CodeQL results to pull request review and scheduled analysis.

## Best Practices

- Keep CodeQL actions updated and review workflow permissions.
- Run analysis on pull requests, the default branch, and a schedule when appropriate.
- Triage findings with evidence instead of severity alone.
- Test security fixes and document accepted risk.
- Protect workflow files through review and branch protection.

## Common Mistakes

| Mistake                                            | Why it causes problems                | How to avoid it                                 |
| -------------------------------------------------- | ------------------------------------- | ----------------------------------------------- |
| Uploading results without `security-events: write` | Findings cannot reach code scanning.  | Declare the required minimal permission.        |
| Dismissing every alert as false positive           | Real defects remain unresolved.       | Inspect the data flow and record evidence.      |
| Running only once                                  | New code and query updates go unseen. | Use pull request, push, and scheduled analysis. |

## Summary

- CodeQL uses semantic queries to identify risky code patterns and flows.
- Findings require human triage and documented decisions.
- Correct triggers, permissions, and regular analysis improve coverage.

## Related Links

- Previous chapter: [Secrets and variables](42-secrets-and-variables.md)
- Exercise: [Introduce CodeQL analysis](../../exercises/en/43-introduce-codeql-analysis.md)
- Lab: [Triage a CodeQL finding](../../labs/en/43-triage-a-codeql-finding.md)
- Quiz: [CodeQL quiz](../../quizzes/en/43-codeql-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
- Next chapter: [Dependabot](44-dependabot.md)
