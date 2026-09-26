---
chapter: 33
title: "Eine Marketplace-Action überprüfen"
related_notebook: "GitHub-Marketplace-Actions"
level: Intermediate
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/32-github-runners.md) | [Notebook](../../notebooks/de/33-github-marketplace-actions.md) | [Lab](../../labs/de/33-harden-a-marketplace-action.md) | [Quiz](../../quizzes/de/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine Marketplace-Action überprüfen

## Ziel

Führe eine evidenzbasierte Prüfung der Lieferkette durch, bevor du eine Action zu einem Workflow hinzufügst.

## Szenario

Ein Pull Request schlägt vor, eine Marketplace-Action mit `@v4` hinzuzufügen, um Build-Metadaten zu veröffentlichen.

## Aufgaben

1. Prüfe die Metadaten der Action auf Inputs, Outputs, Laufzeit und erforderliche Berechtigungen.
2. Überprüfe Quellcode, Releases, Maintainer, Abhängigkeiten und Netzwerkverhalten.
3. Ersetze die veränderliche Referenz durch eine verifizierte Commit-SHA und dokumentiere den Aktualisierungsprozess.

## Erwartetes Ergebnis

Du erstellst eine kurze Prüfaufzeichnung, die Vertrauen, geringste Rechte, Pinning und Testnachweise erklärt.

## Selbsteinschätzung

- [ ] Ich habe die Metadaten der Action gelesen, bevor ich Inputs verwendet habe.
- [ ] Ich verstehe, warum eine Commit-SHA die Reproduzierbarkeit verbessert.
- [ ] Ich kann fehlende Nachweise zur Lieferkette identifizieren.

### Verwandte Inhalte

- Notebook: [GitHub-Marketplace-Actions](../../notebooks/de/33-github-marketplace-actions.md)
- Lab: [Eine Marketplace-Action härten](../../labs/de/33-harden-a-marketplace-action.md)
- Quiz: [Quiz zu GitHub-Marketplace-Actions](../../quizzes/de/33-github-marketplace-actions-quiz.md)
