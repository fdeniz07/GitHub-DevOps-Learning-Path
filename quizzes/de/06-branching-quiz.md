---
chapter: 06
title: "Quiz: Branching-Strategien"
related_notebook: "Branching-Strategien"
related_exercise: "Einen Feature-Branch erstellen"
related_lab: "Branches erstellen und prüfen"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/06-branching-strategien.md) | [Übung](../../exercises/de/06-feature-branch-erstellen.md) | [Labor](../../labs/de/06-branches-erstellen-und-pruefen.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Branching-Strategien

## Fragen

1. Was ist ein Branch?
2. Welcher Befehl erstellt und aktiviert einen neuen Branch?
3. Warum sind Feature-Branches nützlich?
4. Wann darf ein Branch gelöscht werden?

## Antworten

1. Ein benannter Zeiger auf einen Commit.
2. `git switch -c NAME`.
3. Sie isolieren zusammenhängende Arbeit von `main`.
4. Nachdem seine Arbeit integriert oder bewusst verworfen wurde.

## Praxisszenario

Du weißt nicht, auf welchem Branch du arbeitest. Welcher Befehl hilft?

**Antwort:** `git branch --show-current`.
