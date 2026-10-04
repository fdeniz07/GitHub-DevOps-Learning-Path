---
chapter: 36
title: "Eine plattformübergreifende Matrix ausführen"
related_notebook: "Matrix-Builds mit GitHub Actions"
related_exercise: "Einen Matrix-Workflow testen"
level: Intermediate
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/35-composite-actions.md) | [Notebook](../../notebooks/de/36-github-actions-matrix-builds.md) | [Übung](../../exercises/de/36-test-a-matrix-workflow.md) | [Quiz](../../quizzes/de/36-matrix-builds-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine plattformübergreifende Matrix ausführen

## Ziel

Erstelle einen Matrix-Workflow, der eine Support-Richtlinie über Plattformen und Laufzeitversionen hinweg testet.

## Lernergebnisse

- eine begrenzte Matrix implementieren;
- `include` für explizite Metadaten und `exclude` für nicht unterstützte Fälle verwenden;
- unabhängige Matrixergebnisse interpretieren.

## Szenario

Ein Kommandozeilenwerkzeug unterstützt Ubuntu und Windows mit zwei Laufzeitversionen. Eine Windows-/Laufzeitkombination wird nicht unterstützt. Das Team möchte jedes andere Ergebnis erhalten, selbst wenn ein Job fehlschlägt.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- Ein Repository mit einem deterministischen Testbefehl.

## Umgebung einrichten

| Anforderung    | Wert                                                |
| -------------- | --------------------------------------------------- |
| Betriebssystem | Von GitHub gehostete Ubuntu- und Windows-Runner     |
| Software       | GitHub Actions und die Laufzeit des Projekts        |
| Version        | Verwende die im Übungsprojekt definierten Versionen |

## Aufgaben

### Aufgabe 1 — Support modellieren

1. Definiere die Dimensionen `os` und `runtime`.
2. Schließe das nicht unterstützte Paar aus.
3. Setze `fail-fast: false` und halte den diagnostischen Grund fest.

**Erwartetes Ergebnis:** Der Workflow erstellt genau die unterstützten Kombinationen.

### Aufgabe 2 — Tests ausführen und beschriften

1. Wähle den Runner aus `matrix.os`.
2. Installiere `matrix.runtime`.
3. Gib beide Werte vor dem Ausführen der Tests aus.

**Erwartetes Ergebnis:** Die Protokolle identifizieren jedes Ergebnis ohne Rätselraten.

### Aufgabe 3 — Eine Ausnahme hinzufügen

1. Verwende `include`, um einer Kombination ein `coverage`-Flag hinzuzufügen.
2. Führe den Coverage-Schritt nur aus, wenn das Flag wahr ist.
3. Überprüfe die erweiterte Workflow-Zusammenfassung.

**Erwartetes Ergebnis:** Die Ausnahme ist sichtbar und verändert nicht stillschweigend andere Kombinationen.

## Validierungs-Checkliste

- [ ] Nicht unterstützte Kombinationen sind ausgeschlossen.
- [ ] Matrixwerte werden in Runner- und Einrichtungsschritten verwendet.
- [ ] Protokolle identifizieren jede Kombination.
- [ ] Das Fehlerverhalten entspricht dem Diagnoseziel.

## Fehlerbehebung

| Problem                                   | Mögliche Ursache                                | Lösung                                    |
| ----------------------------------------- | ----------------------------------------------- | ----------------------------------------- |
| Zu viele Jobs                             | Das kartesische Produkt ist größer als erwartet | Zähle Dimensionen und verwende `exclude`. |
| Wert wird nicht aufgelöst                 | Präfix `matrix.` fehlt                          | Verwende `${{ matrix.name }}`.            |
| Ergebnisse verschwinden nach einem Fehler | Fail-fast ist aktiviert                         | Setze es bei Bedarf auf `false`.          |

## Best Practices

- Halte die Support-Richtlinie nahe an der Matrix.
- Vermeide, dass experimentelle Kombinationen stillschweigend erforderlich werden.
- Überprüfe Zeit- und Runnerkosten nach dem Hinzufügen von Dimensionen.

## Zusammenfassung

Dieses Labor verwandelt eine Support-Matrix in beobachtbare, unabhängig diagnostizierbare CI-Jobs.

### Verwandte Inhalte

- Notebook: [Matrix-Builds mit GitHub Actions](../../notebooks/de/36-github-actions-matrix-builds.md)
- Übung: [Einen Matrix-Workflow testen](../../exercises/de/36-test-a-matrix-workflow.md)
- Quiz: [Quiz zu Matrix-Builds](../../quizzes/de/36-matrix-builds-quiz.md)
