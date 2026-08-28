---
chapter: 04
title: "Quiz: Erstes Repository"
related_notebook: "Das erste Repository erstellen"
related_exercise: "Das erste Repository erstellen"
related_lab: "Ein Projekt-Repository initialisieren"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/04-erstes-repository-erstellen.md) | [Übung](../../exercises/de/04-erstes-repository-erstellen.md) | [Labor](../../labs/de/04-projekt-repository-initialisieren.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Erstes Repository

## Fragen

1. Welcher Befehl erstellt ein lokales Repository?
2. Was zeigt `git status`?
3. Wo speichert Git seine Verwaltungsdaten?
4. Warum sollte `git init` nicht im allgemeinen Elternordner ausgeführt werden?

## Antworten

1. `git init`.
2. Den aktuellen Zustand von Branch, Arbeitsverzeichnis und Staging-Bereich.
3. Im versteckten Ordner `.git`.
4. Sonst könnten Dateien aus mehreren Projekten in einer Historie landen.

## Praxisszenario

Eine neue `README.md` erscheint nach `git status` als unversioniert. Was bedeutet das?

**Antwort:** Git sieht die Datei, sie wurde aber noch nicht mit `git add` vorgemerkt oder committed.
