---
chapter: 08
title: "Git-Objekte untersuchen"
related_notebook: "Git-Interna"
level: Fortgeschritten
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/08-git-internals.md) | [Labor](../../labs/de/08-git-repository-interna-erkunden.md) | [Quiz](../../quizzes/de/08-git-interna-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git-Objekte untersuchen

## Ziel

Untersuche einen Commit, seinen Tree und die zugehörigen Dateien mit Plumbing-Befehlen.

## Aufgaben

1. Erstelle einen Commit.
2. Führe `git rev-parse HEAD` aus.
3. Prüfe mit `git cat-file -t HEAD` den Objekttyp.
4. Untersuche mit `git cat-file -p HEAD` den Commit.
5. Zeige mit `git ls-tree HEAD` den Tree.

## Erwartetes Ergebnis

Du kannst erklären, wie ein Commit auf Tree- und Blob-Objekte zeigt.

## Selbstprüfung

- [ ] Ich kenne den Unterschied zwischen Ref und Objekt.
- [ ] Ich bearbeite `.git` nicht direkt.
- [ ] Ich kann den Tree eines Commits anzeigen.
