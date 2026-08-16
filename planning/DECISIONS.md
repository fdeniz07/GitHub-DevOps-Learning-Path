# Architecture Decision Records

This document records significant architectural and project decisions made during the development of the GitHub-DevOps-Learning-Path repository.

---

# ADR-001 — Adopt the RDIV Development Workflow

## Status

Accepted

## Date

2026-07-17

## Decision

Adopt the RDIV (Review → Decide → Implement → Verify) workflow as the standard development process for this repository.

## Context

The repository is developed using AI-assisted engineering practices. Repository analysis should always precede implementation.

## Rationale

RDIV provides a predictable and repeatable workflow that improves development quality and reduces unnecessary changes.

## Consequences

All major development tasks should follow the RDIV workflow.

Related AIOS Methodology:
`methodology/rdiv.md`

---

# ADR-002 — Apply the Architecture First Principle

## Status

Accepted

## Date

2026-07-17

## Decision

Architectural understanding shall always precede implementation.

## Context

Repository reviews demonstrated that architectural consistency is more important than rapid implementation.

## Rationale

Understanding the repository before modifying it minimizes technical debt and preserves long-term maintainability.

## Consequences

Repository Analysis, Risk Assessment, and Architecture Review become mandatory before significant implementation work.

Related AIOS Methodology:
`methodology/architecture_first.md`

---

# ADR-003 — Use AIOS as the Project Framework

## Status

Accepted

## Date

2026-07-17

## Decision

Use the AIOS Framework as the standard methodology for project planning, documentation, reviews, and AI collaboration.

## Context

AIOS provides reusable prompts, methodologies, templates, and engineering standards.

## Rationale

Using a single framework increases consistency and allows improvements to be shared across projects.

## Consequences

Future repository reviews and implementations should follow AIOS standards.

---

# ADR-004 — Preserve the Existing Repository Architecture

## Status

Accepted

## Date

2026-07-17

## Decision

The current repository architecture will be preserved during Sprint 1.

## Context

Repository, roadmap, and architecture reviews concluded that the overall structure is scalable and logically organized.

## Rationale

The identified issues concern navigation, artifact relationships, and metadata rather than the top-level architecture.

## Consequences

Sprint 1 will focus on improving documentation, navigation, and curriculum structure instead of restructuring directories.

---

# ADR-005 — Improve the Repository Incrementally

## Status

Accepted

## Date

2026-07-17

## Decision

Repository improvements will be implemented incrementally rather than through large-scale refactoring.

## Context

Sprint 0 identified several improvement opportunities while confirming that the overall repository architecture is sound.

## Rationale

Incremental improvements reduce risk, preserve repository stability, and make progress easier to review.

## Consequences

Future work will prioritize focused enhancements over large architectural changes.

---

# ADR-006 — Add GitLab DevOps as a Dedicated Curriculum Part

## Status

Accepted

## Date

2026-08-03

## Decision

Add GitLab DevOps as Part 3 of the curriculum, covering Chapters 17-27. Preserve the existing Git Foundations and GitHub chapter numbers, and renumber only the unwritten GitHub Actions, CI/CD, and DevOps chapters to 28-51.

## Context

The original roadmap covered Git, GitHub, GitHub Actions, CI/CD, and DevOps but did not teach GitLab. Learners need a coherent GitLab path that covers hosted collaboration, CI/CD, deployments, and DevSecOps without treating GitLab as a collection of disconnected comparisons.

## Rationale

Placing GitLab after GitHub lets learners transfer the shared Git fundamentals while clearly learning platform-specific workflows. Keeping existing Chapters 01-16 stable protects current references and allows later, unwritten content to move without breaking published material.

## Consequences

The learning path contains six parts and 51 chapters. GitLab Chapters 17-27 must form a platform-to-delivery sequence before GitHub Actions begins at Chapter 28. Documentation and future navigation must use the revised numbering.

---

# ADR-007 — Publish Synchronized English, Turkish, and German Editions

## Status

Accepted

## Date

2026-08-03

## Decision

Publish each canonical chapter in English, Turkish, and German. English is reviewed as the source edition before Turkish and German are localized and independently reviewed. A chapter is published only when all three language editions and their required companion artifacts are synchronized.

## Context

The repository already provides language-specific notebook directories, but its Turkish content is not aligned with the canonical roadmap and German content has not started. The project needs an explicit synchronization model before parallel authoring begins.

## Rationale

An English source edition makes technical accuracy and future maintenance traceable. Independent localization review preserves teaching quality and avoids presenting literal, unreviewed translations as finished learning material.

## Consequences

Planning tracks source and localized versions. Each language edition maintains its own metadata, localized navigation, examples, and visuals when diagram text is language-specific.

---

# ADR-008 — Store Companion Artifacts by Language

## Status

Accepted

## Date

2026-08-03

## Decision

Store exercises, labs, and quizzes in language-scoped directories: `exercises/en|tr|de/`, `labs/en|tr|de/`, and `quizzes/en|tr|de/`. Each chapter requires one exercise, lab, and quiz per language edition.

## Context

The existing companion-artifact directories are flat. Parallel editions would otherwise require language suffixes in filenames and make navigation harder to scan.

## Rationale

Language-scoped directories match the established `notebooks/<language>/` pattern, prevent filename collisions, and keep related material easy to locate.

## Consequences

Existing legacy artifacts remain in place until they are mapped to the canonical curriculum. New companion-artifact links use the matching language directory. The change adds no new top-level directory.

---

# ADR-009 — Author the English Curriculum Before Localization

## Status

Accepted

## Date

2026-08-03

## Decision

Author and review the remaining canonical curriculum in English before starting the Turkish and German editions for those chapters. Each English chapter remains incomplete for publication until its localized editions and language-matched companion artifacts are authored and reviewed.

## Context

Writing each chapter in three languages before advancing creates repeated context switching while the canonical sequence is still under development. The repository needs a stable English source set before the next localization wave begins.

## Rationale

An English-first workflow lets the curriculum sequence, terminology, technical examples, links, exercises, labs, and quizzes mature in one source language. Localization can then work from a stable reviewed source and apply consistent language-specific terminology.

## Consequences

From Chapter 04 onward, author the English notebook, exercise, lab, and quiz before starting Turkish or German equivalents. Translation status records `Not started` for pending localizations. ADR-007 remains the publication gate: a chapter is published only after all required English, Turkish, and German artifacts are synchronized and reviewed.

---
