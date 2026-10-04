---
chapter: 33
title: "Eine Marketplace-Action absichern"
related_notebook: "GitHub-Marketplace-Actions"
related_exercise: "Eine Marketplace-Action überprüfen"
level: Intermediate
estimated_time: 70 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/32-github-runners.md) | [Notebook](../../notebooks/de/33-github-marketplace-actions.md) | [Übung](../../exercises/de/33-review-a-marketplace-action.md) | [Quiz](../../quizzes/de/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine Marketplace-Action absichern

## Ziel

Übernimm eine Drittanbieter-Action mit überprüfter Herkunft, geringsten Berechtigungen sowie getesteten Eingaben und Ausgaben.

## Anforderungen

- Eine mögliche Action mit öffentlichen Metadaten und Quellcode.
- Ein Testrepository oder Branch, in dem der Workflow sicher laufen kann.
- Eine Methode, um den geprüften Commit und die verantwortliche Person für Aktualisierungen festzuhalten.

## Aufgaben

1. Lies `action.yml` und liste jede Eingabe, Ausgabe, Laufzeit und verwendete Berechtigung der möglichen Action auf.
2. Überprüfe Quellcode, Abhängigkeiten, Release-Historie und Wartungssignale.
3. Ersetze das veränderliche Tag durch eine überprüfte vollständige Commit-SHA.
4. Füge einen fokussierten Workflow hinzu, der nicht vertrauliche Eingaben übergibt und die erwartete Ausgabe prüft.
5. Halte fest, wie Vorschläge für Aktualisierungen überprüft und getestet werden.

## Erwartetes Ergebnis

Der Workflow verwendet eine geprüfte unveränderliche Referenz, minimale Berechtigungen und Belege dafür, dass sich die Schnittstelle der Action wie erwartet verhält.

## Validierungs-Checkliste

- [ ] Die SHA ist gegen das beabsichtigte Release überprüft.
- [ ] Eingaben und Ausgaben stimmen mit den Metadaten überein.
- [ ] Secrets werden nicht ausgegeben oder unnötig übergeben.
- [ ] Ein Prozess für Aktualisierung und Rollback ist dokumentiert.

### Verwandte Inhalte

- Vorheriges Notebook: [GitHub-Actions-Runner](../../notebooks/de/32-github-runners.md)
- Notebook: [GitHub-Marketplace-Actions](../../notebooks/de/33-github-marketplace-actions.md)
- Übung: [Eine Marketplace-Action überprüfen](../../exercises/de/33-review-a-marketplace-action.md)
- Quiz: [Quiz zu GitHub-Marketplace-Actions](../../quizzes/de/33-github-marketplace-actions-quiz.md)
