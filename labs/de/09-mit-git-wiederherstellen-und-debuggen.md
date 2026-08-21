---
chapter: 09
title: "Mit Git wiederherstellen und debuggen"
related_notebook: "Fortgeschrittene Git-Techniken"
related_exercise: "Von einem schlechten Commit wiederherstellen"
level: Fortgeschritten
estimated_time: 40 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/09-fortgeschrittene-git-techniken.md) | [Übung](../../exercises/de/09-von-schlechtem-commit-wiederherstellen.md) | [Quiz](../../quizzes/de/09-fortgeschrittene-git-techniken-quiz.md) | [Roadmap](../../ROADMAP.md)

# Mit Git wiederherstellen und debuggen

## Ziel

Übe `restore`, `reset`, `revert`, `stash`, `reflog` und `cherry-pick` in einem isolierten Repository.

## Aufgaben

1. Erstelle mehrere kleine Commits.
2. Verwende `git stash`, um eine Pause zu simulieren.
3. Setze eine lokale Änderung zurück.
4. Erzeuge einen Gegencommit mit `git revert`.
5. Finde eine Commit-ID mit `git reflog`.
6. Übertrage einen ausgewählten Commit mit `git cherry-pick`.

## Prüfliste

- [ ] Vor jedem Eingriff wurde `git status` geprüft.
- [ ] Öffentliche Historie wurde nicht umgeschrieben.
- [ ] Nach jeder Wiederherstellung wurden Diff und Log kontrolliert.
