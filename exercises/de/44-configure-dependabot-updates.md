---
chapter: 44
title: "Dependabot-Updates konfigurieren"
related_notebook: "Dependabot-Updates"
related_lab: "Ein Dependabot-Update prüfen"
related_quiz: "Dependabot-Quiz"
level: Intermediate
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/44-dependabot.md) | [Lab](../../labs/de/44-review-a-dependabot-update.md) | [Roadmap](../../ROADMAP.md)

# Dependabot-Updates konfigurieren

## Ziel

Erstelle eine Dependabot-Richtlinie, die Anwendungsabhängigkeiten und GitHub Actions aktuell hält und gleichzeitig die Review-Qualität bewahrt.

## Ergebnisse

Du wirst in der Lage sein:

- Ökosystem, Verzeichnis, Intervall und Pull-Request-Limit zu konfigurieren.
- zu entscheiden, wann Gruppierung sinnvoll ist.
- die vor dem Zusammenführen eines Updates erforderlichen Prüfungen zu definieren.

## Voraussetzungen

- Lies [Dependabot-Updates](../../notebooks/de/44-dependabot.md).
- Verstehe Manifeste und Lock-Dateien.
- Weiß, wie CI-Statusprüfungen funktionieren.

## Szenario

Ein Repository hat veraltete Python-Pakete und Action-Versionen. Dependabot soll eine überschaubare Anzahl von Pull Requests öffnen und Sicherheitsupdates sichtbar halten.

## Aufgaben

### Aufgabe 1 — Die Richtlinie schreiben

Erstelle `.github/dependabot.yml` mit `version: 2`, einem wöchentlichen `pip`-Update für `/` und einem monatlichen `github-actions`-Update.

**Erwartetes Ergebnis:** Beide Ökosysteme werden nach einem ausdrücklichen Zeitplan überwacht.

### Aufgabe 2 — Rauschen kontrollieren

Setze `open-pull-requests-limit: 5` und gruppiere kompatible Updates von Produktionsabhängigkeiten. Erkläre ein Risiko der Gruppierung.

**Erwartetes Ergebnis:** Das Team erhält überschaubare Vorschläge, ohne den Review-Kontext zu verlieren.

### Aufgabe 3 — Review-Nachweise definieren

Liste die Release Notes, den Lock-File-Diff, CI-Prüfungen, das Sicherheitsergebnis und das Kompatibilitätsverhalten auf, die vor dem Zusammenführen geprüft werden müssen.

**Erwartetes Ergebnis:** Ein Update wird zusammengeführt, weil Nachweise es unterstützen, nicht nur weil Dependabot es geöffnet hat.

## Herausforderung

Bestimme für jede Ignore-Regel eine verantwortliche Person und ein Ablaufdatum. Erkläre, warum dauerhafte Ignores riskant sind.

## Selbstprüfung

- [ ] Ich kann zwei Ökosysteme konfigurieren.
- [ ] Ich kann die Vor- und Nachteile der Gruppierung erklären.
- [ ] Ich prüfe Lock-Dateien und transitive Änderungen.
- [ ] Ich weiß, dass Dependabot-PRs weiterhin Tests benötigen.

## Häufige Fehler

| Fehler                                  | Lösung                                           |
| --------------------------------------- | ------------------------------------------------ |
| Nur Anwendungspakete überwachen         | Auch `github-actions`-Updates hinzufügen.        |
| Ohne CI zusammenführen                  | Tests und Sicherheitsprüfungen verlangen.        |
| Eine Schwachstelle dauerhaft ignorieren | Verantwortliche Person und Prüftermin festlegen. |

## Zusammenfassung

Dependabot schlägt Änderungen vor; Maintainer prüfen vor dem Zusammenführen Release Notes, Abhängigkeitsgraphen, Tests und Risiken.

## Weiterführende Links

- Notebook: [Dependabot-Updates](../../notebooks/de/44-dependabot.md)
- Lab: [Ein Dependabot-Update prüfen](../../labs/de/44-review-a-dependabot-update.md)
- Quiz: [Dependabot-Quiz](../../quizzes/de/44-dependabot-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
