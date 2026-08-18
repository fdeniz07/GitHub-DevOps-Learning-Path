---
chapter: 09
title: "Von einem schlechten Commit wiederherstellen"
related_notebook: "Fortgeschrittene Git-Techniken"
level: Fortgeschritten
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/09-fortgeschrittene-git-techniken.md) | [Labor](../../labs/de/09-mit-git-wiederherstellen-und-debuggen.md) | [Quiz](../../quizzes/de/09-fortgeschrittene-git-techniken-quiz.md) | [Roadmap](../../ROADMAP.md)

# Von einem schlechten Commit wiederherstellen

## Ziel

Wähle für verschiedene Fehler die passende Git-Wiederherstellungstechnik.

## Aufgaben

1. Erzeuge eine ungestagte falsche Änderung und verwende `git restore`.
2. Erzeuge einen lokalen falschen Commit und untersuche `git reset`.
3. Simuliere einen geteilten falschen Commit und verwende `git revert`.
4. Parke unfertige Arbeit mit `git stash`.
5. Finde einen früheren Zustand mit `git reflog`.

## Erwartetes Ergebnis

Du entscheidest anhand der Veröffentlichungssituation und des gewünschten Ergebnisses.

## Selbstprüfung

- [ ] Ich prüfe den Status vor destruktiven Befehlen.
- [ ] Ich verwende `revert` für geteilte Historie.
- [ ] Ich kenne den temporären Zweck von `stash`.
