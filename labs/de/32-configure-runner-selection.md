---
chapter: 32
title: "Runner-Auswahl konfigurieren"
related_notebook: "GitHub-Actions-Runner"
related_exercise: "GitHub-Runner auswählen"
level: Beginner
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/31-github-actions-jobs-and-steps.md) | [Notebook](../../notebooks/de/32-github-runners.md) | [Übung](../../exercises/de/32-select-github-runners.md) | [Quiz](../../quizzes/de/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

# Runner-Auswahl konfigurieren

## Ziel

Konfiguriere und dokumentiere das Routing von Runnern für gewöhnliche Validierung und sensible Integrationsarbeiten.

## Anforderungen

- Administrationszugriff auf Repository- oder Organisationsebene oder ein schriftlicher Labormodus nur für Entwurf und Planung.
- Ein Workflow, der einen ungefährlichen Validierungsbefehl ausführt.
- Eine klare Entscheidung, ob selbst gehostete Infrastruktur gerechtfertigt ist.

## Aufgaben

1. Führe die Validierung auf einem von GitHub gehosteten Runner aus und halte sein Image und seine Tools fest.
2. Definiere einen eigenen Satz von Self-hosted-Labels wie `self-hosted`, `linux` und `integration`, ohne nicht vertrauenswürdige Pull Requests dorthin zu routen.
3. Dokumentiere Zuständigkeiten für den Zugriff auf Runnergruppen, Patchen, Bereinigung, Überwachung und Abbau.
4. Teste, dass ein Job mit nicht passenden Labels in der Warteschlange bleibt, statt auf der falschen Maschine zu laufen.

## Erwartetes Ergebnis

Das Repository enthält eine dokumentierte Routing-Entscheidung und keinen Workflowpfad, der ungeprüften Code an einen sensiblen Runner sendet.

## Validierungs-Checkliste

- [ ] Vor- und Nachteile gehosteter und selbst gehosteter Runner sind festgehalten.
- [ ] Labels beschreiben Fähigkeiten korrekt.
- [ ] Sensibler Zugriff ist durch Gruppen oder Genehmigungen eingeschränkt.
- [ ] Für Bereinigung und Wartung gibt es eine verantwortliche Person.

### Verwandte Inhalte

- Vorheriges Notebook: [GitHub-Actions-Jobs und -Schritte](../../notebooks/de/31-github-actions-jobs-and-steps.md)
- Notebook: [GitHub-Actions-Runner](../../notebooks/de/32-github-runners.md)
- Übung: [GitHub-Runner auswählen](../../exercises/de/32-select-github-runners.md)
- Quiz: [Quiz zu GitHub-Actions-Runnern](../../quizzes/de/32-github-runners-quiz.md)
