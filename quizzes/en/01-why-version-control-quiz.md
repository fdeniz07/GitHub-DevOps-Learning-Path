---
chapter: 01
title: "Why Version Control Quiz"
related_notebook: "Why Version Control?"
related_exercise: "Version Control Analysis"
related_lab: "Manual Versioning Lab"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/en/01-why-version-control.md) | [Exercise](../../exercises/en/01-version-control-analysis.md) | [Lab](../../labs/en/01-manual-versioning-lab.md) | [Roadmap](../../ROADMAP.md)

# Why Version Control Quiz

## Purpose

This quiz evaluates your understanding of why software projects need a recorded history of meaningful changes.

## Instructions

- Answer without referring to the notebook whenever possible.
- Focus on reasoning about project situations rather than memorizing terms.
- Review an incorrect answer before continuing to Chapter 02.

## Learning Objectives

This quiz evaluates your ability to:

- Explain the problems version control solves.
- Distinguish version control from a backup.
- Apply recovery, traceability, experimentation, and shared-source-of-truth concepts to a realistic situation.

## Section A - Multiple Choice

### Question 1

Which capability is most useful when a developer needs to find the change that caused a previously working feature to fail?

- A. File compression
- B. Version history
- C. A longer filename
- D. A second monitor

**Answer:** B

#### Explanation: Question 1

Version history lets the developer inspect changes between the last known working state and the first failing state.

### Question 2

What does a shared source of truth provide to a development team?

- A. A separate final copy for each person
- B. One authoritative project history for coordinated work
- C. A guarantee that code never has bugs
- D. A replacement for communication

**Answer:** B

#### Explanation: Question 2

The team can coordinate around one trusted project history instead of guessing which private copy is current.

## Section B - True / False

### Question 3

A backup and version control have exactly the same purpose.

- True
- False

**Answer:** False

#### Explanation: Question 3

A backup protects against data loss. Version control records and explains how a project changes over time. Both are useful, but they solve different problems.

### Question 4

Version control is useful only after several developers begin working on the same project.

- True
- False

**Answer:** False

#### Explanation: Question 4

Individual developers also need recovery, experimentation, and a clear record of why their own work changed.

## Section C - Short Answer

### Question 5

Why is a folder named `project-final-final` not reliable evidence that it is the correct project state?

#### Expected Answer: Question 5

The name does not show what changed, when it changed, why it changed, whether the copy works, or whether another copy is authoritative.

### Question 6

State one difference between Git and GitHub.

#### Expected Answer: Question 6

Git is a version control system that records repository history. GitHub is a collaboration platform built around Git repositories.

## Section D - Practical Scenario

### Scenario

An event website worked on Monday. By Thursday, registration fails. The team has four folders with different names and a backup from Wednesday night, but no record of the edits made during the week.

### Question

What information would version control provide that makes the investigation safer and more focused? Explain why the backup alone is insufficient.

#### Expected Answer: Scenario

Version control would show the sequence and context of changes between the last working and first failing state. The team could inspect, compare, and recover a known version. The backup may restore data, but it does not necessarily explain which edit caused the regression or why it was made.

## Scoring Guide

| Score     | Evaluation                                               |
| --------- | -------------------------------------------------------- |
| 90-100%   | Excellent                                                |
| 75-89%    | Good                                                     |
| 60-74%    | Satisfactory                                             |
| Below 60% | Review the notebook, exercise, and lab before continuing |

## Review Checklist

- [ ] I can explain why history is more useful than a collection of copies.
- [ ] I can distinguish a backup from version control.
- [ ] I can identify when recovery and traceability are needed.
- [ ] I am ready for Chapter 02.

## Next Step

Continue with [Chapter 02: Git Architecture](../../notebooks/en/02-git-architecture.md).

### Related Content

- Notebook: [Why Version Control?](../../notebooks/en/01-why-version-control.md)
- Exercise: [Version Control Analysis](../../exercises/en/01-version-control-analysis.md)
- Lab: [Manual Versioning Lab](../../labs/en/01-manual-versioning-lab.md)
- Next Chapter: [Git Architecture](../../notebooks/en/02-git-architecture.md)
