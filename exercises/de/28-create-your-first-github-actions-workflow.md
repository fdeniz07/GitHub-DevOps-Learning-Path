---
chapter: 28
title: "Deinen ersten GitHub-Actions-Workflow erstellen"
related_notebook: "Einführung in GitHub Actions"
level: Beginner
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/28-introduction-to-github-actions.md) | [Lab](../../labs/de/28-run-a-github-actions-workflow.md) | [Quiz](../../quizzes/de/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ziel

Erstelle einen kleinen, gut lesbaren Workflow, der auf einen Push reagiert und auch manuell gestartet werden kann.

## Lernergebnisse

- den erforderlichen Speicherort `.github/workflows` identifizieren;
- ein Ereignis und eine schreibgeschützte `contents`-Berechtigung konfigurieren;
- einen Action-Schritt von einem Shell-Befehlsschritt unterscheiden.

## Voraussetzungen

- Lies das Notebook zu Kapitel 28.
- Du hast ein Übungs-Repository auf GitHub und die Berechtigung, Dateien hinzuzufügen.
- Du weißt, wie man einen Branch erstellt und eine Datei committet.

## Szenario

Du betreust ein kleines Repository und möchtest eine sichtbare erste Prüfung, sobald Code `main` erreicht. Die Prüfung erstellt oder veröffentlicht noch nichts; sie zeigt, dass das Repository einen Actions-Workflow sicher starten kann.

## Aufgaben

### Aufgabe 1

Erstelle `.github/workflows/first-check.yml` mit einem beschreibenden `name`, einem `push`-Trigger für `main` und `workflow_dispatch`.

### Erwartetes Ergebnis: Speicherort des Workflows

Die Datei befindet sich im exakten Verzeichnis, das GitHub scannt, und enthält eine gültige YAML-Struktur.

### Aufgabe 2

Füge `permissions: contents: read` und einen Job auf `ubuntu-latest` hinzu. Ergänze einen Checkout-Schritt mit `actions/checkout@v4` sowie einen zweiten Schritt, der `git status --short` ausführt.

### Erwartetes Ergebnis: Job-Definition

Der Workflow trennt die wiederverwendbare Action-Syntax klar von einem Shell-Befehl und fordert keinen umfassenden Schreibzugriff an.

### Aufgabe 3

Committe den Workflow auf einem Branch, öffne einen Pull Request und erkläre, welches konfigurierte Ereignis jeden Lauf gestartet hat.

### Erwartetes Ergebnis: Erklärung des Laufs

Du kannst den sichtbaren Lauf mit seinem Ereignis verbinden und beschreiben, warum die Berechtigung ausreichend ist.

## Herausforderung

Füge einen Branch-Filter für einen zweiten geschützten Branch hinzu, ohne zusätzliche Berechtigungen zu vergeben. Erkläre, wie der Filter das Verhalten des Workflows verändert.

## Selbsteinschätzung

- [ ] Die Datei liegt unter `.github/workflows`.
- [ ] Ich kann jeden Trigger in der Datei erklären.
- [ ] Ich habe `contents: read` statt eines umfassenden Schreibzugriffs verwendet.
- [ ] Ich kann `uses` von `run` unterscheiden.

## Häufige Fehler

| Fehler                                  | Lösung                                                          |
| --------------------------------------- | --------------------------------------------------------------- |
| Der Workflow erscheint nicht in Actions | Verzeichnis und committeten Branch prüfen.                      |
| YAML-Parserfehler                       | Einrückung prüfen und Leerzeichen statt Tabs verwenden.         |
| Übermäßiger Token-Zugriff               | Nur die für die Prüfung erforderliche Berechtigung deklarieren. |

## Zusammenfassung

- Ein nützlicher erster Workflow ist klein, sichtbar und schreibgeschützt.
- Ereignisauswahl und Dateispeicherort bestimmen, ob GitHub den Workflow entdeckt und startet.

### Verwandte Inhalte

- Notebook: [Einführung in GitHub Actions](../../notebooks/de/28-introduction-to-github-actions.md)
- Lab: [Einen GitHub-Actions-Workflow ausführen](../../labs/de/28-run-a-github-actions-workflow.md)
- Quiz: [Quiz: Einführung in GitHub Actions](../../quizzes/de/28-introduction-to-github-actions-quiz.md)
