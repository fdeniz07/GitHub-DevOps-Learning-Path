---
chapter: 34
title: "Eine eigene Action erstellen und testen"
related_notebook: "Eigene GitHub Actions schreiben"
related_exercise: "Eine eigene GitHub Action entwerfen"
level: Intermediate
estimated_time: 90 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/33-github-marketplace-actions.md) | [Notebook](../../notebooks/de/34-writing-custom-github-actions.md) | [Übung](../../exercises/de/34-design-a-custom-github-action.md) | [Quiz](../../quizzes/de/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine eigene Action erstellen und testen

## Ziel

Implementiere eine kleine eigene Action mit dokumentiertem Metadatenvertrag, Tests und einem versionierten Releaseplan.

## Anforderungen

- Node.js für eine JavaScript-Action oder Docker für eine Docker-Action.
- Ein Repository, in dessen Stammverzeichnis `action.yml` liegen kann.
- Ein Testworkflow, der die Action über `uses` aufruft.

## Aufgaben

### Aufgabe 1 — Den Vertrag definieren

Erstelle `action.yml` mit einer erforderlichen Eingabe und einer Ausgabe. Lege Validierung und Fehlerverhalten fest.

### Aufgabe 2 — Die Laufzeit implementieren

Implementiere die Action in JavaScript oder Docker. Halte Protokolle nützlich, gib aber niemals Tokens, Zugangsdaten oder vollständige Umgebungsabbilder aus.

### Aufgabe 3 — Die öffentliche Schnittstelle testen

Teste gültige und ungültige Eingaben, Ausgabewerte und einen aufrufenden Workflow. Erstelle bei JavaScript das vom Runner verwendete Distributions-Bundle.

### Aufgabe 4 — Die Action versionieren

Erstelle einen Releaseplan für ein unveränderliches Versionstag und ein Major-Kompatibilitätstag. Beschreibe die Änderung, die eine Major-Version erfordern würde.

## Erwartetes Ergebnis

Die Action läuft in einem sauberen Workflow, erzeugt die dokumentierte Ausgabe, schlägt bei ungültiger Eingabe eindeutig fehl und besitzt einen reproduzierbaren Releaseprozess.

## Validierungs-Checkliste

- [ ] `action.yml` stimmt mit der Implementierung überein.
- [ ] Unit- oder fokussierte Laufzeittests sind erfolgreich.
- [ ] Der Test des aufrufenden Workflows ist erfolgreich.
- [ ] Generierter Distributionsinhalt ist aktuell.
- [ ] Release- und Rollback-Verhalten sind dokumentiert.

### Verwandte Inhalte

- Vorheriges Notebook: [GitHub-Marketplace-Actions](../../notebooks/de/33-github-marketplace-actions.md)
- Notebook: [Eigene GitHub Actions schreiben](../../notebooks/de/34-writing-custom-github-actions.md)
- Übung: [Eine eigene GitHub Action entwerfen](../../exercises/de/34-design-a-custom-github-action.md)
- Quiz: [Quiz zum Schreiben eigener GitHub Actions](../../quizzes/de/34-writing-custom-github-actions-quiz.md)
