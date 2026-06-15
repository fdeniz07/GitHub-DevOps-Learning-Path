---
chapter: 43
title: "CodeQL Quiz"
related_notebook: "CodeQL Analysis"
related_exercise: "Introduce CodeQL Analysis"
related_lab: "Triage a CodeQL Finding"
level: Intermediate
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/43-codeql.md) | [Exercise](../../exercises/en/43-introduce-codeql-analysis.md) | [Lab](../../labs/en/43-triage-a-codeql-finding.md) | [Roadmap](../../ROADMAP.md)

# CodeQL Quiz

## Learning Objectives

- Explain semantic CodeQL analysis.
- Recognize required workflow permissions.
- Triage alerts using data-flow evidence.

## Questions

### Question 1

What does CodeQL analyze?

- A. Only commit messages
- B. Code as data using queries
- C. Only deployment uptime
- D. Package download speed

**Answer:** B.

### Question 2

Which permission commonly allows code scanning results to be uploaded?

**Expected Answer:** `security-events: write`.

### Question 3

True or false: Every CodeQL alert proves that an exploitable vulnerability exists.

**Answer:** False. The alert requires investigation of reachability, sanitization, and context.

### Question 4

What are a source and a sink in a data-flow finding?

**Expected Answer:** A source is where data enters or becomes untrusted; a sink is a sensitive operation that may be unsafe with that data.

### Question 5 — Practical Scenario

An alert traces user input to a database query, but a validated parameterization function is used before the query. What should you do?

**Expected Answer:** Inspect the implementation and call path, test the behavior, and document a justified dismissal only if the sanitization is demonstrably effective.

## Review Checklist

- [ ] I understand semantic analysis.
- [ ] I know the upload permission.
- [ ] I can describe source-to-sink triage.
- [ ] I can document a fix or dismissal.

## Related Links

- Notebook: [CodeQL Analysis](../../notebooks/en/43-codeql.md)
- Exercise: [Introduce CodeQL Analysis](../../exercises/en/43-introduce-codeql-analysis.md)
- Lab: [Triage a CodeQL Finding](../../labs/en/43-triage-a-codeql-finding.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
