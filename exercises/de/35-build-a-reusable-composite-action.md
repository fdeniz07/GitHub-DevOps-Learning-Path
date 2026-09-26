---
chapter: 35
title: "Eine wiederverwendbare Composite-Action erstellen"
related_notebook: "GitHub-Actions-Composite-Actions"
level: Intermediate
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/35-composite-actions.md) | [Lab](../../labs/de/35-package-a-composite-action.md) | [Quiz](../../quizzes/de/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine wiederverwendbare Composite-Action erstellen

## Ziel

Erstelle eine lokale Composite-Action mit einem erforderlichen Input und einem nützlichen Output.

## Lernergebnisse

- gültige Action-Metadaten erstellen;
- Werte sicher an Shell-Schritte übergeben;
- einen Action-Output aus einem Workflow verwenden.

## Voraussetzungen

- [GitHub-Actions-Composite-Actions](../../notebooks/de/35-composite-actions.md) abgeschlossen.
- Ein GitHub-Repository mit aktivierten Actions.
- Vertrautheit mit YAML und Shell-Befehlen.

## Szenario

Mehrere Workflows müssen den Projektnamen und das Arbeitsverzeichnis im gleichen Format ausgeben. Implementiere dieses wiederholte Verhalten einmal als lokale Action.

## Aufgaben

### Aufgabe 1

Erstelle `.github/actions/report-project/action.yml` mit einem erforderlichen Input `project` und einem Output `summary`. Verwende `runs.using: composite`.

### Erwartetes Ergebnis

Die Metadaten beschreiben den Input eindeutig und ordnen den öffentlichen Output einem Schritt-Output zu.

### Aufgabe 2

Füge einen Bash-Schritt hinzu, der eine sichere Zusammenfassung in `GITHUB_OUTPUT` schreibt. Übergib den Input über eine Umgebungsvariable, statt ihn direkt in die Shell-Syntax einzusetzen.

### Erwartetes Ergebnis

Die Action stellt einen vorhersehbaren Output bereit, ohne den Eingabetext als Shell-Code zu behandeln.

### Aufgabe 3

Rufe die Action aus einem Workflow auf, gib den Output aus und prüfe das Laufprotokoll auf versehentlich ausgegebene Secrets oder verwirrende Werte.

### Erwartetes Ergebnis

Der Workflow ist erfolgreich und spätere Schritte können `${{ steps.report.outputs.summary }}` lesen.

## Herausforderung

Füge einen optionalen Input `prefix` mit einem sicheren Standardwert hinzu und teste sowohl den Standardwert als auch einen benutzerdefinierten Wert.

## Selbsteinschätzung

- [ ] Ich kann den Vertrag der Action-Metadaten erklären.
- [ ] Ich habe eine explizite Shell und sichere Umgebungsvariablen verwendet.
- [ ] Ich habe einen Output zugeordnet und verwendet.

## Häufige Fehler

| Fehler                                | Lösung                                                            |
| ------------------------------------- | ----------------------------------------------------------------- |
| `shell` bei einem `run`-Schritt fehlt | `shell: bash` oder eine andere unterstützte Shell hinzufügen.     |
| Falsche Output-ID verwenden           | Die Output-Zuordnung an die `id` des Schritts anpassen.           |
| Sensiblen Input ausgeben              | Protokolle prüfen und Secrets aus Zusammenfassungen heraushalten. |

## Zusammenfassung

Du hast eine fokussierte lokale Action erstellt, deren Input und Output einen wiederverwendbaren Vertrag bilden.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Composite-Actions](../../notebooks/de/35-composite-actions.md)
- Lab: [Eine Composite-Action paketieren](../../labs/de/35-package-a-composite-action.md)
- Quiz: [Quiz zu Composite-Actions](../../quizzes/de/35-composite-actions-quiz.md)
