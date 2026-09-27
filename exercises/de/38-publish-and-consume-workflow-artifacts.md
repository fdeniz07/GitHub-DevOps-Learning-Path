---
chapter: 38
title: "Workflow-Artefakte veröffentlichen und verwenden"
related_notebook: "GitHub-Actions-Artefakte"
level: Intermediate
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/de/38-github-actions-artifacts.md) | [Lab](../../labs/de/38-share-build-artifacts-between-jobs.md) | [Quiz](../../quizzes/de/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Workflow-Artefakte veröffentlichen und verwenden

## Ziel

Übertrage ein Build-Ergebnis mit einem expliziten Artefaktvertrag zwischen zwei isolierten Jobs.

## Lernergebnisse

- nur die erforderlichen Dateien hochladen;
- Producer- und Consumer-Jobs mit `needs` koordinieren;
- eine Aufbewahrungsdauer wählen und heruntergeladene Inhalte validieren.

## Voraussetzungen

- [GitHub-Actions-Artefakte](../../notebooks/de/38-github-actions-artifacts.md) abgeschlossen.
- Ein Repository mit einem kleinen Build-Befehl.

## Szenario

Ein Build-Job erstellt einen Bericht und ein Paket. Ein separater Prüf-Job muss den Bericht lesen, während ein Release-Job nach der Validierung nur das Paket erhalten darf.

## Aufgaben

### Aufgabe 1

Erstelle einen Build-Job, der Dateien in separate Verzeichnisse `reports/` und `dist/` schreibt. Lade die erforderlichen Dateien mit beschreibenden Namen hoch.

### Erwartetes Ergebnis

Die Artefaktpfade sind eng gefasst und enthalten weder Secrets noch den gesamten Workspace.

### Aufgabe 2

Füge einen Consumer-Job mit `needs: build` hinzu, lade das erwartete Artefakt in ein bekanntes Verzeichnis herunter und liste dessen Inhalte auf.

### Erwartetes Ergebnis

Der Consumer sieht die Dateien des Producers, obwohl er einen anderen Runner verwendet.

### Aufgabe 3

Setze eine für einen Testbericht geeignete Aufbewahrungsdauer und füge vor jeder Veröffentlichung eine Validierung hinzu.

### Erwartetes Ergebnis

Lebenszyklus und Vertrauensgrenze sind ausdrücklich festgelegt.

## Herausforderung

Passe den Workflow für Matrix-Builds an und mache Artefaktnamen pro Betriebssystem eindeutig.

## Selbsteinschätzung

- [ ] Ich kann ein Artefakt von einem Cache unterscheiden.
- [ ] Ich habe `needs` verwendet, um die Job-Grenze zu modellieren.
- [ ] Ich validiere heruntergeladene Dateien vor ihrer Verwendung.

## Häufige Fehler

| Fehler                                            | Lösung                                |
| ------------------------------------------------- | ------------------------------------- |
| Annehmen, dass Workspace-Dateien bestehen bleiben | Ein Artefakt hoch- und herunterladen. |
| Den gesamten Workspace hochladen                  | Nur erforderliche Pfade auswählen.    |
| Heruntergeladene Dateien ohne Prüfung ausführen   | Inhalte zuerst validieren.            |

## Zusammenfassung

Du hast eine explizite, überprüfbare Dateiübergabe zwischen isolierten Workflow-Jobs erstellt.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Artefakte](../../notebooks/de/38-github-actions-artifacts.md)
- Lab: [Build-Artefakte zwischen Jobs teilen](../../labs/de/38-share-build-artifacts-between-jobs.md)
- Quiz: [Quiz zu Artefakten](../../quizzes/de/38-artifacts-quiz.md)
