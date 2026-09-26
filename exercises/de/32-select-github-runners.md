---
chapter: 32
title: "GitHub-Runner auswählen"
related_notebook: "GitHub-Actions-Runner"
level: Beginner
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/31-github-actions-jobs-and-steps.md) | [Notebook](../../notebooks/de/32-github-runners.md) | [Lab](../../labs/de/32-configure-runner-selection.md) | [Quiz](../../quizzes/de/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitHub-Runner auswählen

## Ziel

Wähle eine Runner-Strategie, die technische Anforderungen erfüllt, ohne Vertrauensgrenzen zu schwächen.

## Szenario

Ein Workflow benötigt Linux, Docker und Zugriff auf einen privaten Integrationsdienst. Ein Pull Request aus einem Fork kann die Validierung auslösen, aber die Bereitstellung läuft erst nach einer Genehmigung.

## Aufgaben

1. Wähle für die Validierung gehostete oder selbst gehostete Runner und erkläre die Vertrauensentscheidung.
2. Definiere Labels für einen dedizierten Integrations-Runner.
3. Identifiziere, welcher Job niemals ungeprüften Code aus einem Fork oder Produktions-Credentials erhalten darf.

## Erwartetes Ergebnis

Du empfiehlst gehostete Runner für nicht vertrauenswürdige Validierung, isolierte Runner mit Labels für private Integration und eine Genehmigungsgrenze vor der Bereitstellung.

## Selbsteinschätzung

- [ ] Ich verstehe, dass Labels Fähigkeiten und keine Berechtigungen beschreiben.
- [ ] Ich kann die Wartungsaufgaben beim Selbstbetrieb benennen.
- [ ] Ich kann eine Vertrauensgrenze eines Runners identifizieren.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Runner](../../notebooks/de/32-github-runners.md)
- Lab: [Runner-Auswahl konfigurieren](../../labs/de/32-configure-runner-selection.md)
- Quiz: [Quiz zu GitHub-Actions-Runnern](../../quizzes/de/32-github-runners-quiz.md)
