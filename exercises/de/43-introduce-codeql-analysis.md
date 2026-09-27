---
chapter: 43
title: "CodeQL-Analyse einführen"
related_notebook: "CodeQL-Analyse"
related_lab: "Einen CodeQL-Fund untersuchen"
related_quiz: "CodeQL-Quiz"
level: Intermediate
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/43-codeql.md) | [Lab](../../labs/de/43-triage-a-codeql-finding.md) | [Roadmap](../../ROADMAP.md)

# CodeQL-Analyse einführen

## Ziel

Plane und prüfe einen CodeQL-Workflow, der Sicherheitsfunde bei Änderungen und nach Zeitplan meldet.

## Ergebnisse

Du wirst in der Lage sein:

- CodeQL-Trigger und Sprachkonfiguration auszuwählen.
- `security-events: write` zu erklären.
- einen Fund anhand von Nachweisen zu Quelle, Ziel und Bereinigung zu untersuchen.

## Voraussetzungen

- Lies [CodeQL-Analyse](../../notebooks/de/43-codeql.md).
- Verstehe GitHub-Actions-Jobs und Berechtigungen.
- Kenne grundlegende Begriffe der sicheren Programmierung.

## Szenario

Ein Python-Service verfügt über keine statische Sicherheitsanalyse. Ein neuer Workflow muss Pull Requests, Pushes auf `main` und wöchentlich geplanten Code analysieren. Das Sicherheitsteam benötigt außerdem einen dokumentierten Prozess zur Alert-Untersuchung.

## Aufgaben

### Aufgabe 1 — Analyse konfigurieren

Schreibe den Workflow-Namen `CodeQL`, Trigger, die Sprachmatrix, Checkout, `github/codeql-action/init@v3` und `github/codeql-action/analyze@v3`-Schritte.

**Erwartetes Ergebnis:** Der Workflow kann Python analysieren und Ergebnisse hochladen.

### Aufgabe 2 — Berechtigungen anwenden

Füge `contents: read` und `security-events: write` hinzu. Erkläre, warum Letzteres benötigt wird und warum umfassendere Berechtigungen unnötig sind.

**Erwartetes Ergebnis:** Ergebnisse können mit geringsten Rechten hochgeladen werden.

### Aufgabe 3 — Untersuchung definieren

Halte für einen hypothetischen Alert Quelle, Ziel, Datenfluss, Bereinigung, Schweregrad und Behebungsentscheidung fest.

**Erwartetes Ergebnis:** Die Entscheidung basiert auf Nachweisen und ist keine pauschale Zurückweisung.

## Herausforderung

Erkläre, wann ein geplanter Lauf einen neuen Alert finden kann, obwohl sich der Quellcode nicht geändert hat.

## Selbstprüfung

- [ ] Ich kann die erforderlichen CodeQL-Actions konfigurieren.
- [ ] Ich verstehe `security-events: write`.
- [ ] Ich kann einen Pfad von der Quelle zum Ziel erklären.
- [ ] Ich kann eine Behebung oder Zurückweisung dokumentieren.

## Häufige Fehler

| Fehler                                         | Lösung                                                |
| ---------------------------------------------- | ----------------------------------------------------- |
| Berechtigung für den Ergebnis-Upload vergessen | Nur `security-events: write` hinzufügen.              |
| Jeden Alert als ausnutzbar behandeln           | Erreichbarkeit und Bereinigung prüfen.                |
| Analyse nur einmal ausführen                   | Pull-Request-, Push- und geplante Trigger hinzufügen. |

## Zusammenfassung

CodeQL ist besonders wertvoll, wenn sein Workflow korrekt berechtigt ist und seine Findings konsistent untersucht werden.

## Weiterführende Links

- Notebook: [CodeQL-Analyse](../../notebooks/de/43-codeql.md)
- Lab: [Einen CodeQL-Fund untersuchen](../../labs/de/43-triage-a-codeql-finding.md)
- Quiz: [CodeQL-Quiz](../../quizzes/de/43-codeql-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
