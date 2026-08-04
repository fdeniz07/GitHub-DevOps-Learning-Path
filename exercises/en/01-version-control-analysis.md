---
chapter: 01
title: "Version Control Analysis"
related_notebook: "Why Version Control?"
level: Beginner
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/01-why-version-control.md) | [Lab](../../labs/en/01-manual-versioning-lab.md) | [Quiz](../../quizzes/en/01-why-version-control-quiz.md) | [Roadmap](../../ROADMAP.md)

# Version Control Analysis

## Objective

Analyze the limitations of manually named project copies and explain how version control resolves the resulting risks.

## Learning Outcomes

After completing this exercise, you will be able to:

- Identify missing information in a collection of manually versioned folders.
- Connect recovery, traceability, and a shared source of truth to practical project problems.
- Explain why backups and version control have different responsibilities.

## Prerequisites

- Complete [Chapter 01: Why Version Control?](../../notebooks/en/01-why-version-control.md).
- A text editor for writing a short analysis.

## Scenario

You inherit a portfolio website from a classmate. The project folder contains these copies:

```text
portfolio-site/
|- portfolio-final/
|- portfolio-final-v2/
|- portfolio-final-v2-fixed/
|- portfolio-final-use-this/
`- notes.txt
```

The only note says, "Changed the form and fixed the home page." A second developer must continue the work tomorrow.

## Tasks

### Task 1 - Investigate the available evidence

Write down which folder you would treat as the current version. Then explain why the name alone is not reliable evidence.

#### Expected Result: Available Evidence

You identify that no folder name proves which copy is authoritative, complete, or safe to continue.

### Task 2 - Identify unanswered questions

List at least four questions the folders and note cannot answer. Include questions about what changed, why it changed, when it changed, and which version worked.

#### Expected Result: Unanswered Questions

Your list shows that filenames do not provide a usable history or the context of each change.

### Task 3 - Recommend a safer workflow

For each risk below, name the version-control capability that reduces it and explain how it helps:

- A developer accidentally starts from an outdated folder.
- A form stops working after an unknown edit.
- A teammate asks why a configuration value changed.
- A developer wants to try a risky redesign without losing a stable version.

#### Expected Result: Safer Workflow

You connect the risks to a shared source of truth, recovery, traceability, and safe experimentation.

## Challenge (Optional)

Explain how a backup would still help this project and why it would not replace recorded version history.

## Self-Assessment

- [ ] I can distinguish an old copy from a documented project history.
- [ ] I can explain why the authoritative version is unclear in this scenario.
- [ ] I can connect a project risk to a version-control benefit.
- [ ] I can explain why backups and version control complement one another.

## Common Mistakes

| Mistake                                                       | Solution                                                                                              |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Assuming the folder named `use-this` is automatically correct | Treat names as hints only; use recorded history and review evidence to identify a trustworthy state.  |
| Calling version control a backup system                       | Describe backups as loss protection and version control as the history of meaningful project changes. |
| Focusing only on file recovery                                | Include change reasons, authorship, collaboration, and experimentation in the analysis.               |

## Summary

- Manually named copies preserve files but not reliable relationships between changes.
- Version control provides history, recovery, traceability, experimentation, and a shared source of truth.
- A backup remains useful, but it answers a different problem.

## Next Step

Continue with the [Manual Versioning Lab](../../labs/en/01-manual-versioning-lab.md) to experience the ambiguity described in this exercise.

### Related Content

- Notebook: [Why Version Control?](../../notebooks/en/01-why-version-control.md)
- Lab: [Manual Versioning Lab](../../labs/en/01-manual-versioning-lab.md)
- Quiz: [Why Version Control Quiz](../../quizzes/en/01-why-version-control-quiz.md)
