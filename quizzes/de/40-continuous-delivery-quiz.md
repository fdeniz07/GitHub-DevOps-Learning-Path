---
chapter: 40
title: "Quiz zur kontinuierlichen Auslieferung"
related_notebook: "Kontinuierliche Auslieferung"
related_exercise: "Ein Release für kontinuierliche Auslieferung planen"
related_lab: "Ein Release für kontinuierliche Auslieferung stufenweise ausliefern"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/40-continuous-delivery.md) | [Übung](../../exercises/de/40-plan-a-continuous-delivery-release.md) | [Lab](../../labs/de/40-stage-a-continuous-delivery-release.md) | [Roadmap](../../ROADMAP.md)

# Quiz zur kontinuierlichen Auslieferung

## Lernziele

- CI, kontinuierliche Auslieferung und kontinuierliches Deployment unterscheiden.
- Beförderung unveränderlicher Artefakte und Freigabeschranken erklären.
- Release-Nachweise und Rollback planen.

## Fragen

### Frage 1

Was garantiert kontinuierliche Auslieferung?

- A. Jede Änderung erreicht automatisch die Produktion
- B. Jede akzeptierte Änderung bleibt veröffentlichbar
- C. Es ist niemals eine Freigabe erforderlich
- D. Die Produktion wird nie getestet

**Antwort:** B. Die Software ist bei Bedarf für ein Release bereit.

### Frage 2

Warum sollte die Produktion das Staging-Artefakt befördern?

**Erwartete Antwort:** Es erhält die Nachverfolgbarkeit und stellt sicher, dass das in Staging getestete Artefakt auch das veröffentlichte Artefakt ist.

### Frage 3

Richtig oder falsch: Kontinuierliche Auslieferung und kontinuierliches Deployment sind identisch.

**Antwort:** Falsch. Kontinuierliches Deployment befördert automatisch in die Produktion; bei der Auslieferung kann eine bewusste Freigabe erhalten bleiben.

### Frage 4

Nenne zwei nützliche Release-Nachweise.

**Erwartete Antwort:** Beispiele sind Commit-SHA, Prüfsumme, Testergebnisse, Artefaktversion und Freigabeaufzeichnung.

### Frage 5 — Praxisszenario

Ein Paketierungsjob ist erfolgreich, Staging-Tests bestehen und die Produktion ist eine geschützte Umgebung, die eine Freigabe verlangt. Was passiert als Nächstes bei kontinuierlicher Auslieferung?

**Erwartete Antwort:** Der Release-Kandidat ist bereit, aber eine autorisierte Person oder Richtlinie muss die Produktionsbeförderung freigeben. Rollback-Nachweise sollten verfügbar sein.

## Checkliste zur Wiederholung

- [ ] Ich kann Release-Bereitschaft erklären.
- [ ] Ich verstehe „einmal bauen und befördern“.
- [ ] Ich kann eine Freigabegrenze identifizieren.
- [ ] Ich kann Rollback-Nachweise benennen.

## Weiterführende Links

- Notebook: [Kontinuierliche Auslieferung](../../notebooks/de/40-continuous-delivery.md)
- Übung: [Ein Release für kontinuierliche Auslieferung planen](../../exercises/de/40-plan-a-continuous-delivery-release.md)
- Lab: [Ein Release für kontinuierliche Auslieferung stufenweise ausliefern](../../labs/de/40-stage-a-continuous-delivery-release.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
