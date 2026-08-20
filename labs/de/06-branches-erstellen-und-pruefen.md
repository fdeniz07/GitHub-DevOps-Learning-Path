---
chapter: 06
title: "Branches erstellen und prüfen"
related_notebook: "Branching-Strategien"
related_exercise: "Einen Feature-Branch erstellen"
level: Einsteiger
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/06-branching-strategien.md) | [Übung](../../exercises/de/06-feature-branch-erstellen.md) | [Quiz](../../quizzes/de/06-branching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Branches erstellen und prüfen

## Ziel

Arbeite an einer Änderung in einem Feature-Branch und integriere ihn kontrolliert.

## Aufgaben

```bash
git switch main
git switch -c feature/add-status-note
git branch --show-current
echo "Status" > STATUS.md
git add STATUS.md
git commit -m "Add status note"
git switch main
git merge feature/add-status-note
git branch -d feature/add-status-note
```

Prüfe nach jedem wichtigen Schritt den Status.

## Erwartetes Ergebnis

Die Änderung wird isoliert entwickelt, gemergt und der abgeschlossene Branch entfernt.

## Fehlerbehebung

| Problem               | Lösung                                                       |
| --------------------- | ------------------------------------------------------------ |
| Falscher Branch       | Mit `git branch --show-current` prüfen und bewusst wechseln. |
| Branch nicht löschbar | Prüfen, ob seine Commits gemergt wurden.                     |
| Unklare Historie      | `git log --graph --oneline --all` verwenden.                 |
