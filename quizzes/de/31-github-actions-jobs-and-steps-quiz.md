---
chapter: 31
title: "Quiz: Jobs und Schritte in GitHub Actions"
related_notebook: "Jobs und Schritte in GitHub Actions"
related_exercise: "Jobs und Schritte in GitHub Actions entwerfen"
related_lab: "Einen Workflow mit Job-Abhängigkeiten erstellen"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/30-yaml-fundamentals.md) | [Notebook](../../notebooks/de/31-github-actions-jobs-and-steps.md) | [Übung](../../exercises/de/31-design-github-actions-jobs-and-steps.md) | [Labor](../../labs/de/31-build-a-job-dependency-workflow.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Jobs und Schritte in GitHub Actions

### Frage 1

Was drückt `needs` aus?

**Antwort:** Eine Job-Abhängigkeit, die die Reihenfolge und die Ausführbarkeit eines abhängigen Jobs steuert.

### Frage 2

Wohin sollte ein Schritt einen Wert schreiben, der zu einer Ausgabe werden soll?

**Antwort:** In die Datei `$GITHUB_OUTPUT`, wobei eine Schritt-`id` verwendet wird, damit der Wert einer Job-Ausgabe zugeordnet werden kann.

### Frage 3

Richtig oder falsch: Jobs werden nacheinander ausgeführt, weil sie in der YAML-Reihenfolge erscheinen.

**Antwort:** Falsch. Jobs ohne Abhängigkeiten können parallel ausgeführt werden.

### Frage 4

Warum sollten Secrets nicht als gewöhnliche Job-Ausgaben weitergegeben werden?

**Antwort:** Ausgaben sind nicht für den Transport von Secrets vorgesehen und können durch Workflow-Metadaten oder Logs offengelegt werden.

### Zugehörige Inhalte

- Notebook: [Jobs und Schritte in GitHub Actions](../../notebooks/de/31-github-actions-jobs-and-steps.md)
- Übung: [Jobs und Schritte in GitHub Actions entwerfen](../../exercises/de/31-design-github-actions-jobs-and-steps.md)
- Labor: [Einen Workflow mit Job-Abhängigkeiten erstellen](../../labs/de/31-build-a-job-dependency-workflow.md)
