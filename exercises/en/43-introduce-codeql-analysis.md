---
chapter: 43
title: "Introduce CodeQL Analysis"
related_notebook: "CodeQL Analysis"
related_lab: "Triage a CodeQL Finding"
related_quiz: "CodeQL Quiz"
level: Intermediate
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/43-codeql.md) | [Lab](../../labs/en/43-triage-a-codeql-finding.md) | [Roadmap](../../ROADMAP.md)

# Introduce CodeQL Analysis

## Objective

Plan and review a CodeQL workflow that reports security findings on changes and on a schedule.

## Outcomes

- Select CodeQL triggers and language configuration.
- Explain `security-events: write`.
- Triage a finding using source, sink, and sanitization evidence.

## Prerequisites

- Read [CodeQL Analysis](../../notebooks/en/43-codeql.md).
- Understand GitHub Actions jobs and permissions.
- Know basic secure coding terminology.

## Scenario

A Python service has no static security analysis. A new workflow must analyze pull requests, pushes to `main`, and weekly scheduled code. The security team also needs a documented alert triage process.

## Tasks

### Task 1 — Configure analysis

Write the `CodeQL` workflow name, triggers, matrix language, checkout, `github/codeql-action/init@v3`, and `github/codeql-action/analyze@v3` steps.

**Expected Result:** The workflow can analyze Python and upload results.

### Task 2 — Apply permissions

Add `contents: read` and `security-events: write`. Explain why the latter is needed and why broader permissions are unnecessary.

**Expected Result:** Results can be uploaded with least privilege.

### Task 3 — Define triage

For one hypothetical alert, record the source, sink, data flow, sanitization, severity, and remediation decision.

**Expected Result:** The decision is evidence-based rather than a blanket dismissal.

## Challenge

Explain when a scheduled run may find a new alert even though source code has not changed.

## Self-Assessment

- [ ] I can configure the required CodeQL actions.
- [ ] I understand `security-events: write`.
- [ ] I can explain a source-to-sink path.
- [ ] I can document a fix or dismissal.

## Common Mistakes

| Mistake                             | Solution                                        |
| ----------------------------------- | ----------------------------------------------- |
| Forgetting result upload permission | Add only `security-events: write`.              |
| Treating every alert as exploitable | Inspect reachability and sanitization.          |
| Running analysis only once          | Add pull request, push, and scheduled triggers. |

## Summary

CodeQL is most valuable when its workflow is correctly permissioned and its findings are consistently triaged.

## Related Links

- Notebook: [CodeQL Analysis](../../notebooks/en/43-codeql.md)
- Lab: [Triage a CodeQL Finding](../../labs/en/43-triage-a-codeql-finding.md)
- Quiz: [CodeQL Quiz](../../quizzes/en/43-codeql-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
