---
chapter: 06
title: "Einen Feature-Branch erstellen"
related_notebook: "Branching-Strategien"
level: Einsteiger
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/06-branching-strategien.md) | [Labor](../../labs/de/06-branches-erstellen-und-pruefen.md) | [Quiz](../../quizzes/de/06-branching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Einen Feature-Branch erstellen

## Ziel

Isoliere eine kleine Änderung in einem verständlich benannten Feature-Branch.

## Aufgaben

1. Prüfe mit `git status`, dass dein Arbeitsverzeichnis sauber ist.
2. Erstelle `feature/update-readme` mit `git switch -c`.
3. Ändere eine Datei und committe sie.
4. Zeige mit `git branch` und `git log --oneline --all` den Verlauf.
5. Wechsle zurück zu `main` und beschreibe den Unterschied.

## Erwartetes Ergebnis

Du kannst erkennen, in welchem Branch du arbeitest, und unfertige Arbeit von `main` fernhalten.

## Selbstprüfung

- [ ] Der Branch-Name beschreibt seinen Zweck.
- [ ] Die Änderung ist nicht direkt auf `main` entstanden.
- [ ] Ich kann den aktuellen Branch anzeigen.
