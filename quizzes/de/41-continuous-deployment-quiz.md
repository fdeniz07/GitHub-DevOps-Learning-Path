---
chapter: 41
title: "Quiz zum kontinuierlichen Deployment"
related_notebook: "Kontinuierliches Deployment"
related_exercise: "Ein kontrolliertes Deployment entwerfen"
related_lab: "Ein kontrolliertes Deployment ausführen"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/41-continuous-deployment.md) | [Übung](../../exercises/de/41-design-a-controlled-deployment.md) | [Lab](../../labs/de/41-run-a-controlled-deployment.md) | [Roadmap](../../ROADMAP.md)

# Quiz zum kontinuierlichen Deployment

## Lernziele

- Automatische Produktionsbeförderung erklären.
- Rollout-, Health- und Rollback-Kontrollen auswählen.
- Concurrency zum Schutz der Produktion verwenden.

## Fragen

### Frage 1

Was unterscheidet kontinuierliches Deployment von kontinuierlicher Auslieferung?

**Erwartete Antwort:** Erfolgreiche Änderungen werden automatisch in die Produktion befördert, statt auf eine separate Release-Entscheidung zu warten.

### Frage 2

Was ist ein Canary-Deployment?

- A. Ein Deployment ohne Tests
- B. Eine schrittweise Auslieferung an einen begrenzten Teil des Datenverkehrs
- C. Ein dauerhaftes Backup
- D. Ein Dependency-Update

**Antwort:** B.

### Frage 3

Richtig oder falsch: `concurrency` kann überlappende Produktions-Deployments verhindern.

**Antwort:** Richtig. Eine gemeinsame Produktions-Concurrency-Gruppe serialisiert Deployments.

### Frage 4

Nenne zwei Signale, die eine Beförderung stoppen könnten.

**Erwartete Antwort:** Beispiele sind erhöhte Fehlerrate, fehlgeschlagene Health Checks, Überschreitung eines Latenzgrenzwerts oder fehlgeschlagene Smoke-Tests.

### Frage 5 — Praxisszenario

Ein Canary mit 10 % hat eine steigende Fehlerrate. Sollte der Workflow den restlichen Datenverkehr befördern?

**Erwartete Antwort:** Nein. Stoppe die Beförderung, bewahre Nachweise auf, alarmiere das Team und führe das getestete Rollback auf das bekannte funktionierende Artefakt aus.

## Checkliste zur Wiederholung

- [ ] Ich verstehe automatische Beförderung.
- [ ] Ich kann einen Canary beschreiben.
- [ ] Ich kann Health-Signale auswählen.
- [ ] Ich weiß, warum Rollback getestet werden muss.

## Weiterführende Links

- Notebook: [Kontinuierliches Deployment](../../notebooks/de/41-continuous-deployment.md)
- Übung: [Ein kontrolliertes Deployment entwerfen](../../exercises/de/41-design-a-controlled-deployment.md)
- Lab: [Ein kontrolliertes Deployment ausführen](../../labs/de/41-run-a-controlled-deployment.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
