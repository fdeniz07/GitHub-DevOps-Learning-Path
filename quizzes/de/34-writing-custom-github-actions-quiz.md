---
chapter: 34
title: "Quiz: Benutzerdefinierte GitHub Actions schreiben"
related_notebook: "Benutzerdefinierte GitHub Actions schreiben"
related_exercise: "Eine benutzerdefinierte GitHub Action entwerfen"
related_lab: "Eine benutzerdefinierte Action erstellen und testen"
level: Intermediate
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/33-github-marketplace-actions.md) | [Notebook](../../notebooks/de/34-writing-custom-github-actions.md) | [Übung](../../exercises/de/34-design-a-custom-github-action.md) | [Labor](../../labs/de/34-build-and-test-a-custom-action.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Benutzerdefinierte GitHub Actions schreiben

### Frage 1

Welchen Zweck hat `action.yml`?

**Antwort:** Es definiert den Namen, die Schnittstelle, die Laufzeit, Eingaben, Ausgaben und Ausführungsmetadaten der Action.

### Frage 2

Wann kann ein wiederverwendbarer Workflow einer benutzerdefinierten Action vorzuziehen sein?

**Antwort:** Wenn die wiederverwendbare Einheit mehrere Jobs, Berechtigungen, Umgebungen, Matrizen oder eine Deployment-Orchestrierung benötigt.

### Frage 3

Richtig oder falsch: Der Quellcode einer JavaScript-Action allein reicht aus, wenn der Runner eine committed Distributionsdatei ausführt.

**Antwort:** Falsch. Das Distributions-Bundle muss neu erstellt und getestet werden, damit der ausgeführte Einstiegspunkt zum Quellcode passt.

### Frage 4

Was sollte eine benutzerdefinierte Action zusätzlich zum Erfolgsfall testen?

**Antwort:** Ungültige Eingaben, verständliche Fehler, Ausgabewerte und einen echten auf unterstützten Runnern ausgeführten aufrufenden Workflow.

### Frage 5

Welche Art von Änderung erfordert normalerweise eine neue Major-Version einer Action?

**Antwort:** Eine inkompatible Änderung an den dokumentierten Eingaben, Ausgaben, am Verhalten oder am Laufzeitvertrag.

### Zugehörige Inhalte

- Vorheriges Notebook: [GitHub-Marketplace-Actions](../../notebooks/de/33-github-marketplace-actions.md)
- Notebook: [Benutzerdefinierte GitHub Actions schreiben](../../notebooks/de/34-writing-custom-github-actions.md)
- Übung: [Eine benutzerdefinierte GitHub Action entwerfen](../../exercises/de/34-design-a-custom-github-action.md)
- Labor: [Eine benutzerdefinierte Action erstellen und testen](../../labs/de/34-build-and-test-a-custom-action.md)
