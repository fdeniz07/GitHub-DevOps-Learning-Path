---
chapter: 07
title: "Quiz: Merges und Konflikte"
related_notebook: "Merges und Merge-Konflikte"
related_exercise: "Einen Merge-Konflikt lösen"
related_lab: "Einen Merge-Konflikt lösen"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/07-merges-und-merge-konflikte.md) | [Übung](../../exercises/de/07-merge-konflikt-loesen.md) | [Labor](../../labs/de/07-merge-konflikt-loesen.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Merges und Konflikte

## Fragen

1. Was verbindet ein Merge?
2. Wann entsteht ein Konflikt?
3. Welche Markierungen müssen vor dem Commit entfernt werden?
4. Wie brichst du einen unklaren Merge ab?

## Antworten

1. Die Historien zweier Branches.
2. Wenn Git konkurrierende Änderungen nicht automatisch entscheiden kann.
3. `<<<<<<<`, `=======` und `>>>>>>>`.
4. Mit `git merge --abort`.

## Praxisszenario

Nach der Konfliktlösung zeigt `git status` eine unaufgelöste Datei. Was fehlt?

**Antwort:** Die geprüfte Datei muss mit `git add` als gelöst vorgemerkt und der Merge anschließend committed werden.
