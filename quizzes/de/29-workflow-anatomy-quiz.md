---
chapter: 29
title: "Quiz: Aufbau eines Workflows"
related_notebook: "Aufbau eines GitHub-Actions-Workflows"
related_exercise: "Einen GitHub-Actions-Workflow nachvollziehen"
related_lab: "Die Ausführung eines Workflows überprüfen"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/29-github-actions-workflow-anatomy.md) | [Übung](../../exercises/de/29-trace-a-github-actions-workflow.md) | [Labor](../../labs/de/29-review-workflow-execution.md) | [Roadmap](../../ROADMAP.md)

## Zweck

Überprüfe, ob du einen Workflow von seinem Auslöser über Jobs und Schritte lesen kannst.

## Fragen

### Frage 1

Welcher Schlüssel enthält die Arbeitseinheiten eines Workflows?

- A. `steps`
- B. `jobs`
- C. `runs-on`
- D. `permissions`

**Antwort:** B. `jobs`

### Frage 2

Was drückt `needs: inspect` aus?

- A. Einen Schritt namens `inspect` im selben Job
- B. Eine Abhängigkeit vom Job `inspect`
- C. Ein Runner-Label
- D. Einen Auslöserfilter

**Antwort:** B. Eine Abhängigkeit vom Job `inspect`.

### Frage 3

Richtig oder falsch: Schritte in einem Job werden normalerweise der Reihe nach ausgeführt.

**Antwort:** Richtig.

### Frage 4

Richtig oder falsch: Ein Checkout in einem Job stellt die Dateien automatisch in jedem anderen Job zur Verfügung.

**Antwort:** Falsch. Jobs verwenden normalerweise getrennte Runner.

### Frage 5

Warum sind Auslöserfilter wichtig?

**Erwartete Antwort:** Sie legen fest, welche Änderungen oder Ereignisse im Repository die Automatisierung starten. Dadurch reduzieren sie unnötige Ausführungen und setzen eine bewusst gewählte Validierungsgrenze.

### Frage 6

### Praxisszenario

Der Job `report` startet, bevor `inspect` abgeschlossen ist. Was solltest du prüfen?

**Erwartete Antwort:** Prüfe, ob `report` `needs: inspect` deklariert. Ohne diese Abhängigkeit können unabhängige Jobs parallel laufen.

## Review-Checkliste

- [ ] Ich kann die Schlüssel auf der obersten Workflow-Ebene erkennen.
- [ ] Ich verstehe Job-Abhängigkeiten und Isolation.
- [ ] Ich kann eine Ausführung vom Ereignis bis zum Schritt nachvollziehen.

### Zugehörige Inhalte

- Notebook: [Aufbau eines GitHub-Actions-Workflows](../../notebooks/de/29-github-actions-workflow-anatomy.md)
- Übung: [Einen GitHub-Actions-Workflow nachvollziehen](../../exercises/de/29-trace-a-github-actions-workflow.md)
- Labor: [Die Ausführung eines Workflows überprüfen](../../labs/de/29-review-workflow-execution.md)
