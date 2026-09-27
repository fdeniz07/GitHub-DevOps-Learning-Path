---
chapter: 39
title: "Einen Workflow für kontinuierliche Integration entwerfen"
related_notebook: "Kontinuierliche Integration"
related_lab: "Eine Pipeline für kontinuierliche Integration erstellen"
related_quiz: "Quiz zur kontinuierlichen Integration"
level: Beginner
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/39-continuous-integration.md) | [Lab](../../labs/de/39-build-a-continuous-integration-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Einen Workflow für kontinuierliche Integration entwerfen

## Ziel

Entwirf einen GitHub-Actions-Workflow, der Pull Requests validiert und `main` stabil hält.

## Ergebnisse

Du wirst in der Lage sein:

- passende `pull_request`- und `push`-Trigger auszuwählen.
- Verantwortlichkeiten für Build und Test zu trennen.
- minimale Workflow-`permissions` anzuwenden.

## Voraussetzungen

- Lies das [Notebook zur kontinuierlichen Integration](../../notebooks/de/39-continuous-integration.md).
- Verstehe YAML-Zuordnungen, Listen und Einrückungen.
- Verfüge über ein Repository mit einem reproduzierbaren Testbefehl.

## Szenario

Ein Team führt derzeit Änderungen ohne automatische Prüfungen zusammen. Deine Aufgabe ist es, den ersten CI-Workflow für einen kleinen Python-Service zu entwerfen. Er muss bei Pull Requests und Pushes auf `main` laufen, Abhängigkeiten installieren und Tests ausführen, ohne unnötigen Schreibzugriff anzufordern.

## Aufgaben

### Aufgabe 1 — Den Workflow-Vertrag definieren

Schreibe den Workflow-Namen, die `on`-Trigger, `permissions`, den Runner und die Job-ID. Verwende `contents: read` als Standardberechtigung für das Repository.

**Erwartetes Ergebnis:** Der Workflow validiert vorgeschlagene Änderungen und den Standardbranch mit schreibgeschütztem Repository-Zugriff.

### Aufgabe 2 — Wiederholbare Validierung hinzufügen

Füge Checkout, Python-Setup mit `cache: pip`, die Installation der Abhängigkeiten und die Schritte `python -m pytest` hinzu. Gib jedem Schritt einen klaren `name`.

**Erwartetes Ergebnis:** Eine andere lernende Person kann genau verstehen, wie das Projekt installiert und getestet wird.

### Aufgabe 3 — Die Merge-Regel definieren

Lege fest, welche Prüfung als erforderliche Statusprüfung in der Branch Protection gelten soll. Erkläre, was passiert, wenn der Testbefehl fehlschlägt.

**Erwartetes Ergebnis:** Ein fehlgeschlagener Test verhindert das Zusammenführen und erzeugt sichtbares Feedback.

## Herausforderung

Teile den Workflow in unabhängige Jobs für `build`, `test` und `lint` auf. Erkläre, welche Jobs parallel laufen können und welche Ergebnisse vor dem Zusammenführen erforderlich sind.

## Selbstprüfung

- [ ] Ich habe Trigger für Pull Requests und `main` ausgewählt.
- [ ] Ich habe Berechtigungen nach dem Prinzip der geringsten Rechte verwendet.
- [ ] Ich kann erklären, wie ein fehlgeschlagener Test das Zusammenführen verhindert.
- [ ] Ich kann eine deterministische CI-Prüfung identifizieren.

## Häufige Fehler

| Fehler                                                         | Lösung                                             |
| -------------------------------------------------------------- | -------------------------------------------------- |
| Nur bei einem manuellen Trigger laufen                         | `pull_request` und `push` auf `main` hinzufügen.   |
| `write-all`-Berechtigungen verwenden                           | Nur den benötigten Zugriff deklarieren.            |
| Den Testbefehl hinter einem allgemeinen Skriptnamen verstecken | Den Schritt benennen und den Befehl dokumentieren. |

## Zusammenfassung

Ein gutes CI-Design liefert häufiges, reproduzierbares Feedback und eine klare Merge-Entscheidung. Erforderliche Prüfungen machen das Feedback durchsetzbar.

## Weiterführende Links

- Notebook: [Kontinuierliche Integration](../../notebooks/de/39-continuous-integration.md)
- Lab: [Eine Pipeline für kontinuierliche Integration erstellen](../../labs/de/39-build-a-continuous-integration-pipeline.md)
- Quiz: [Quiz zur kontinuierlichen Integration](../../quizzes/de/39-continuous-integration-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
