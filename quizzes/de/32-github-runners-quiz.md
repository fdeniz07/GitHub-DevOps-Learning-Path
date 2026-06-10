---
chapter: 32
title: "Quiz: GitHub-Actions-Runner"
related_notebook: "GitHub-Actions-Runner"
related_exercise: "GitHub-Runner auswählen"
related_lab: "Die Runner-Auswahl konfigurieren"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/31-github-actions-jobs-and-steps.md) | [Notebook](../../notebooks/de/32-github-runners.md) | [Übung](../../exercises/de/32-select-github-runners.md) | [Labor](../../labs/de/32-configure-runner-selection.md) | [Roadmap](../../ROADMAP.md)

# Quiz: GitHub-Actions-Runner

### Frage 1

Was ist ein wichtiger Vorteil eines von GitHub gehosteten Runners?

**Antwort:** Es handelt sich normalerweise um eine saubere, temporäre und von GitHub verwaltete Maschine, wodurch der lokale Wartungsaufwand sinkt.

### Frage 2

Richtig oder falsch: Ein Runner-Label gewährt die Berechtigung, den Runner zu verwenden.

**Antwort:** Falsch. Labels leiten Jobs weiter; Gruppen und Richtlinien steuern den Zugriff.

### Frage 3

Warum ist der eigene Betrieb eines Runners eine Sicherheitsverantwortung?

**Antwort:** Der Betreiber muss eine Maschine, die Workflow-Code ausführt, patchen, isolieren, überwachen, bereinigen und kontrollieren.

### Frage 4

Wie sollten Pull Requests aus Forks behandelt werden, wenn sensible selbst gehostete Runner vorhanden sind?

**Antwort:** Führe nicht vertrauenswürdigen Code auf gehosteten oder isolierten Runnern aus und verlange vor dem Zugriff auf sensible Ressourcen eine Prüfung oder Genehmigung.

### Zugehörige Inhalte

- Vorheriges Notebook: [Jobs und Schritte in GitHub Actions](../../notebooks/de/31-github-actions-jobs-and-steps.md)
- Notebook: [GitHub-Actions-Runner](../../notebooks/de/32-github-runners.md)
- Übung: [GitHub-Runner auswählen](../../exercises/de/32-select-github-runners.md)
- Labor: [Die Runner-Auswahl konfigurieren](../../labs/de/32-configure-runner-selection.md)
