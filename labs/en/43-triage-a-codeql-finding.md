---
chapter: 43
title: "Triage a CodeQL Finding"
related_notebook: "CodeQL Analysis"
related_exercise: "Introduce CodeQL Analysis"
related_quiz: "CodeQL Quiz"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/43-codeql.md) | [Exercise](../../exercises/en/43-introduce-codeql-analysis.md) | [Roadmap](../../ROADMAP.md)

# Triage a CodeQL Finding

## Objective

Run or inspect CodeQL analysis and make a documented decision about a code scanning finding.

## Outcomes

- Verify CodeQL workflow permissions and results.
- Trace a finding from source to sink.
- Fix, track, or dismiss an alert with evidence.

## Prerequisites

- Complete the notebook and exercise.
- A repository with CodeQL enabled for a supported language.
- Permission to view code scanning alerts.

## Scenario

CodeQL reports a possible injection path in a web service. You must determine whether untrusted input reaches a sensitive sink and recommend remediation.

## Environment

| Requirement      | Value                                        |
| ---------------- | -------------------------------------------- |
| Operating System | Windows, Linux, or macOS                     |
| Software         | GitHub Actions and CodeQL-enabled repository |
| Access           | Code scanning alerts and pull request checks |

## Tasks

### Task 1 — Verify analysis

Inspect the workflow for `github/codeql-action/init@v3`, `github/codeql-action/analyze@v3`, language selection, triggers, and `security-events: write`.

**Expected Result:** The workflow can produce and upload SARIF results.

### Task 2 — Trace the alert

Open the alert, identify its source, sink, data flow, sanitization, severity, and reachable execution path.

**Expected Result:** The alert is understood in the context of real application behavior.

### Task 3 — Resolve responsibly

Apply a fix and test it, or dismiss the finding with an evidence-based reason. Record the decision and follow-up owner.

**Expected Result:** The alert is not silently ignored and the chosen action is auditable.

## Validation Checklist

- [ ] Workflow permissions are minimal.
- [ ] CodeQL runs on the intended events.
- [ ] Source and sink are identified.
- [ ] A fix is tested or dismissal evidence is recorded.
- [ ] The alert state is updated.

## Troubleshooting

| Problem                  | Possible Cause                   | Solution                                 |
| ------------------------ | -------------------------------- | ---------------------------------------- |
| No results appear        | Missing upload permission        | Add `security-events: write`.            |
| Alert seems unrelated    | Data flow is not understood      | Follow the source-to-sink path.          |
| Fix does not close alert | Query still sees the unsafe path | Recheck sanitization and rerun analysis. |

## Best Practices

- Treat findings as investigation leads, not automatic verdicts.
- Keep security fixes small and covered by tests.
- Schedule analysis so query improvements are applied.

## Summary

CodeQL triage combines automated analysis with careful source review, testing, and accountable decisions.

## Related Links

- Notebook: [CodeQL Analysis](../../notebooks/en/43-codeql.md)
- Exercise: [Introduce CodeQL Analysis](../../exercises/en/43-introduce-codeql-analysis.md)
- Quiz: [CodeQL Quiz](../../quizzes/en/43-codeql-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
