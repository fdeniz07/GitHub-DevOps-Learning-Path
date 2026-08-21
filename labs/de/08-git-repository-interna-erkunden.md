---
chapter: 08
title: "Git-Repository-Interna erkunden"
related_notebook: "Git-Interna"
related_exercise: "Git-Objekte untersuchen"
level: Fortgeschritten
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/08-git-internals.md) | [Übung](../../exercises/de/08-git-objekte-untersuchen.md) | [Quiz](../../quizzes/de/08-git-interna-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git-Repository-Interna erkunden

## Ziel

Untersuche die Struktur eines sicheren Übungsrepositorys.

## Aufgaben

```bash
git init
echo "# Demo" > README.md
git add README.md
git commit -m "Add demo README"
git rev-parse --show-toplevel
git cat-file -p HEAD
git ls-tree HEAD
git ls-files --stage
```

Beschreibe, welche Information aus Arbeitsbaum, Index, Commit und Tree stammt.

## Ergebnis

Du kannst die sichtbare Projektdatei mit den internen Git-Objekten verbinden.

## Sicherheitshinweis

`.git` nur untersuchen, niemals Dateien darin manuell überschreiben.
