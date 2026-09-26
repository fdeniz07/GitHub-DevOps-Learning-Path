---
chapter: 34
title: "Eine eigene GitHub-Action entwerfen"
related_notebook: "Eigene GitHub-Actions schreiben"
level: Intermediate
estimated_time: 40 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/33-github-marketplace-actions.md) | [Notebook](../../notebooks/de/34-writing-custom-github-actions.md) | [Lab](../../labs/de/34-build-and-test-a-custom-action.md) | [Quiz](../../quizzes/de/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine eigene GitHub-Action entwerfen

## Ziel

Wähle einen Action-Typ und definiere einen stabilen, testbaren öffentlichen Vertrag.

## Szenario

Drei Repositories wiederholen dieselbe Metadatenberechnung. Die Maintainer möchten eine wiederverwendbare Komponente, ohne Job-Berechtigungen zu verbergen oder unnötige Infrastruktur zu schaffen.

## Aufgaben

1. Entscheide zwischen einer Composite-, JavaScript- oder Docker-Action beziehungsweise einem wiederverwendbaren Workflow.
2. Entwirf Inputs und Outputs von `action.yml` mit Validierungsregeln.
3. Definiere Tests für gültige Inputs, ungültige Inputs, Output-Werte und einen aufrufenden Workflow.
4. Schlage eine Versionierungsstrategie für `v1` und Breaking Changes vor.

## Erwartetes Ergebnis

Du lieferst ein kleines Design, das die Wahl, den Vertrag, die Tests und die Release-Strategie erklärt.

## Selbsteinschätzung

- [ ] Ich kann erklären, wann eine eigene Action gerechtfertigt ist.
- [ ] Ich kann eine Action von einem wiederverwendbaren Workflow unterscheiden.
- [ ] Ich kann beschreiben, wie die öffentliche Schnittstelle getestet wird.

### Verwandte Inhalte

- Notebook: [Eigene GitHub-Actions schreiben](../../notebooks/de/34-writing-custom-github-actions.md)
- Lab: [Eine eigene Action erstellen und testen](../../labs/de/34-build-and-test-a-custom-action.md)
- Quiz: [Quiz zum Schreiben eigener GitHub-Actions](../../quizzes/de/34-writing-custom-github-actions-quiz.md)
