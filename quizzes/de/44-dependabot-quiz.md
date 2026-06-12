---
chapter: 44
title: "Dependabot-Quiz"
related_notebook: "Dependabot-Updates"
related_exercise: "Dependabot-Updates konfigurieren"
related_lab: "Ein Dependabot-Update prüfen"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/44-dependabot.md) | [Übung](../../exercises/de/44-configure-dependabot-updates.md) | [Lab](../../labs/de/44-review-a-dependabot-update.md) | [Roadmap](../../ROADMAP.md)

# Dependabot-Quiz

## Lernziele

- Erklären, was Dependabot automatisiert.
- Direkte, transitive und Action-Updates prüfen.
- Sichere Merge- und Ignore-Richtlinien anwenden.

## Fragen

### Frage 1

Was erstellt Dependabot hauptsächlich?

- A. Automatische Produktions-Deployments
- B. Pull Requests für Dependency-Updates
- C. Benutzerkonten
- D. CodeQL-Abfragen

**Antwort:** B.

### Frage 2

Warum muss eine Lock-Datei geprüft werden?

**Erwartete Antwort:** Sie zeichnet den aufgelösten Abhängigkeitsgraphen auf, einschließlich transitiver Pakete, die sich ändern können, obwohl der Manifest-Diff klein ist.

### Frage 3

Richtig oder falsch: Ein Dependabot-Pull-Request kann ohne Tests zusammengeführt werden, weil er automatisch erzeugt wurde.

**Antwort:** Falsch. Updates benötigen Review, Kompatibilitätstests und Sicherheitsprüfungen.

### Frage 4

Nenne einen Grund, `github-actions` als Ökosystem zu überwachen.

**Erwartete Antwort:** Workflow-Actions sind Teil der Software-Lieferkette und können Fehlerbehebungen erhalten oder Breaking Changes einführen.

### Frage 5 — Praxisszenario

Ein gruppiertes Update besteht Unit-Tests, ändert aber eine Major-Version und die Release Notes nennen eine entfernte API. Was ist der nächste Schritt?

**Erwartete Antwort:** Nicht automatisch zusammenführen. Migrationshinweise lesen, umfassendere Tests ausführen, den Code bei Bedarf anpassen und ein Review durch eine verantwortliche Person anfordern.

## Checkliste zur Wiederholung

- [ ] Ich verstehe Dependabot-Vorschläge.
- [ ] Ich prüfe Lock-Datei- und transitive Änderungen.
- [ ] Ich prüfe Action-Updates.
- [ ] Ich verwende verantwortete und zeitlich begrenzte Ignore-Regeln.

## Weiterführende Links

- Notebook: [Dependabot-Updates](../../notebooks/de/44-dependabot.md)
- Übung: [Dependabot-Updates konfigurieren](../../exercises/de/44-configure-dependabot-updates.md)
- Lab: [Ein Dependabot-Update prüfen](../../labs/de/44-review-a-dependabot-update.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
