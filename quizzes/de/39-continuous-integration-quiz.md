---
chapter: 39
title: "Quiz zur kontinuierlichen Integration"
related_notebook: "Kontinuierliche Integration"
related_exercise: "Einen Workflow für kontinuierliche Integration entwerfen"
related_lab: "Eine Pipeline für kontinuierliche Integration erstellen"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/39-continuous-integration.md) | [Übung](../../exercises/de/39-design-a-continuous-integration-workflow.md) | [Lab](../../labs/de/39-build-a-continuous-integration-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Quiz zur kontinuierlichen Integration

## Lernziele

- Häufige Validierung und erforderliche Prüfungen erklären.
- Grundlegende GitHub-Actions-Trigger und Berechtigungen lesen.
- Eine sichere CI-Reaktion auf einen fehlgeschlagenen Test auswählen.

## Fragen

### Frage 1

Was ist der Hauptzweck von CI?

- A. Jeden Commit in die Produktion deployen
- B. Integrierte Änderungen häufig validieren
- C. Code-Reviews ersetzen
- D. Release-Artefakte für immer speichern

**Antwort:** B. CI validiert integrierte Änderungen häufig.

### Frage 2

Welcher Trigger validiert einen vorgeschlagenen Pull Request?

- A. `pull_request`
- B. Nur `workflow_dispatch`
- C. Nur `schedule`
- D. Nur `release`

**Antwort:** A. `pull_request`.

### Frage 3

Richtig oder falsch: `contents: read` ist für einen reinen Testjob im Allgemeinen sicherer als `write-all`.

**Antwort:** Richtig. Ein reiner Testjob benötigt normalerweise keinen Schreibzugriff auf das Repository.

### Frage 4

Warum sollten Flaky Tests behoben und nicht ignoriert werden?

**Erwartete Antwort:** Unzuverlässige Tests zerstören das Vertrauen in das Feedbacksignal und können dazu führen, dass echte Fehler übersehen werden.

### Frage 5 — Praxisszenario

Ein Pull Request ändert Anwendungscode und der CI-Testjob schlägt fehl. Sollte das Team zusammenführen, weil die Änderung klein ist?

**Erwartete Antwort:** Nein. Untersuche den Fehler, behebe gegebenenfalls Code oder Test, führe CI erneut aus und führe erst zusammen, wenn die erforderlichen Prüfungen erfolgreich sind.

## Checkliste zur Wiederholung

- [ ] Ich kann CI erklären.
- [ ] Ich verstehe `pull_request`- und `push`-Trigger.
- [ ] Ich kann minimale Berechtigungen auswählen.
- [ ] Ich weiß, wie erforderliche Prüfungen `main` schützen.

## Weiterführende Links

- Notebook: [Kontinuierliche Integration](../../notebooks/de/39-continuous-integration.md)
- Übung: [Einen Workflow für kontinuierliche Integration entwerfen](../../exercises/de/39-design-a-continuous-integration-workflow.md)
- Lab: [Eine Pipeline für kontinuierliche Integration erstellen](../../labs/de/39-build-a-continuous-integration-pipeline.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
