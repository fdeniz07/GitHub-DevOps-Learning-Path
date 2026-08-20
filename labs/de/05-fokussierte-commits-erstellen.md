---
chapter: 05
title: "Fokussierte Commits erstellen"
related_notebook: "Mit Commits arbeiten"
related_exercise: "Fokussierte Commits erstellen"
level: Einsteiger
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/05-mit-commits-arbeiten.md) | [Übung](../../exercises/de/05-fokussierte-commits-erstellen.md) | [Quiz](../../quizzes/de/05-commit-quiz.md) | [Roadmap](../../ROADMAP.md)

# Fokussierte Commits erstellen

## Ziel

Übe den vollständigen Ablauf vom Ändern einer Datei bis zum geprüften Commit.

## Aufgaben

```bash
git status
git diff
git add README.md
git diff --staged
git commit -m "Improve project overview"
git log --oneline
```

Erstelle anschließend eine zweite, unabhängige Änderung und committe sie separat.

## Erwartetes Ergebnis

Die Historie enthält zwei verständliche Commits, deren Diffs jeweils nur ein Thema zeigen.

## Fehlerbehebung

| Problem                       | Lösung                                         |
| ----------------------------- | ---------------------------------------------- |
| Falsche Datei staged          | `git reset DATEI` ausführen und erneut prüfen. |
| Commit-Nachricht zu allgemein | Änderung mit einem konkreten Verb beschreiben. |
| Unklare Historie              | `git show` und `git log --stat` verwenden.     |
