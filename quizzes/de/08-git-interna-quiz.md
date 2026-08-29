---
chapter: 08
title: "Git-Interna Quiz"
related_notebook: "Git-Interna"
related_exercise: "Git-Objekte untersuchen"
related_lab: "Git-Repository-Interna erkunden"
level: Fortgeschritten
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/08-git-internals.md) | [Übung](../../exercises/de/08-git-objekte-untersuchen.md) | [Labor](../../labs/de/08-git-repository-interna-erkunden.md) | [Roadmap](../../ROADMAP.md)

# Git-Interna Quiz

1. Was speichert ein Blob?
2. Worauf zeigt ein Branch?
3. Welche Aufgabe hat ein Tree?
4. Welcher Befehl zeigt den Objekttyp?

**Antworten:** Ein Blob speichert Dateiinhalte. Ein Branch zeigt auf einen Commit. Ein Tree beschreibt Verzeichnisse und Dateien. `git cat-file -t` zeigt den Typ.

## Szenario

Warum kann Git einen früheren Commit wiederfinden?

**Antwort:** Weil Objekte und Referenzen die Zustände und ihre Beziehungen dauerhaft beschreiben.
