---
chapter: 09
title: "Fortgeschrittene Git-Techniken Quiz"
related_notebook: "Fortgeschrittene Git-Techniken"
related_exercise: "Von einem schlechten Commit wiederherstellen"
related_lab: "Mit Git wiederherstellen und debuggen"
level: Fortgeschritten
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/09-fortgeschrittene-git-techniken.md) | [Übung](../../exercises/de/09-von-schlechtem-commit-wiederherstellen.md) | [Labor](../../labs/de/09-mit-git-wiederherstellen-und-debuggen.md) | [Roadmap](../../ROADMAP.md)

# Fortgeschrittene Git-Techniken Quiz

1. Wann ist `revert` geeigneter als `reset`?
2. Wofür dient `stash`?
3. Was zeigt der Reflog?
4. Was macht `cherry-pick`?

**Antworten:** `revert` bewahrt geteilte Historie. `stash` parkt unfertige Arbeit. Der Reflog zeigt lokale Bewegungen von Referenzen. `cherry-pick` übernimmt einen einzelnen Commit.

## Szenario

Ein falscher Commit wurde bereits geteilt. Welches Werkzeug ist sicherer?

**Antwort:** `git revert`, weil ein neuer Gegencommit erstellt und die bestehende Historie nicht umgeschrieben wird.
