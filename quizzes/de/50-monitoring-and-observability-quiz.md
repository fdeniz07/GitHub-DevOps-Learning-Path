---
chapter: 50
title: "Quiz zu Monitoring und Observability"
related_notebook: "Monitoring und Observability: Metriken, Logs und Traces"
related_exercise: "Monitoring-Signale eines Dienstes definieren"
related_lab: "Einen Dienst instrumentieren und überwachen"
level: Fortgeschritten
estimated_time: 20 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/50-monitoring-and-observability.md) | [Übung](../../exercises/de/50-define-service-monitoring-signals.md) | [Lab](../../labs/de/50-instrument-and-monitor-a-service.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Monitoring und Observability

## Lernziele

- Nützliche Metriken, Logs und Traces auswählen.
- SLIs, SLOs und Fehlerbudgets definieren.
- Alerts erstellen, auf die Bediener reagieren können.

## Fragen

### Frage 1

Welches Signal eignet sich am besten, um eine Anfrage über mehrere Dienste zu verstehen?

- A. Ein verteilter Trace
- B. Nur ein CPU-Gauge
- C. Nur ein Release-Tag
- D. Eine Aufbewahrungsrichtlinie

**Antwort:** A. Ein Trace verbindet zeitlich gemessene Spans über Dienstgrenzen.

### Frage 2

Was ist der Unterschied zwischen SLI und SLO?

**Erwartete Antwort:** Ein SLI ist ein gemessener Indikator, etwa erfolgreiche Anfragen. Ein SLO ist das Ziel für diesen Indikator über ein definiertes Zeitfenster.

### Frage 3

Richtig oder falsch: Die durchschnittliche Latenz beschreibt die Benutzererfahrung immer gut.

**Antwort:** Falsch. Perzentile und Verteilungen zeigen langsame Ausreißer, die Mittelwerte verbergen können.

### Frage 4

Nenne vier Golden Signals.

**Erwartete Antwort:** Latenz, Traffic, Fehler und Sättigung.

### Frage 5

Was sollte ein umsetzbarer Alert enthalten?

**Erwartete Antwort:** Eine benutzerwirksame Bedingung, Schwellenwert und Dauer, Schweregrad, Zuständigkeit, Routing sowie Runbook oder Reaktionsweg.

### Frage 6

Welche Daten sollten normalerweise aus Anwendungslogs ausgeschlossen werden?

**Antwort:** Passwörter, Zugriffstoken, Zahlungsgeheimnisse und unnötige personenbezogene Daten. Sichere Bezeichner und Redigierung verwenden.

## Praktisches Szenario

CPU ist normal, aber Checkout-p95-Latenz und die Span-Dauer des Zahlungsanbieters steigen gemeinsam. Danach überschreitet die Fehlerrate den SLO-Schwellenwert. Beschreibe Untersuchung und Alert-Reaktion.

**Erwartete Antwort:** Mit dem Trace die Abhängigkeitsverzögerung bestätigen, Anfrage und strukturierte Logs korrelieren, den Checkout-Eigentümer über den SLO-Alert alarmieren, dem Runbook folgen und Rollback oder Abhilfemaßnahmen für die Abhängigkeit erwägen, während Nachweise erhalten bleiben.

## Prüfcheckliste

- [ ] Ich kann zwischen Metriken, Logs und Traces wählen.
- [ ] Ich kann einen SLI und ein SLO definieren.
- [ ] Ich verstehe Fehlerbudgets.
- [ ] Ich kann sensibles Logging vermeiden.
- [ ] Ich kann einen zuständigen Alert mit Runbook schreiben.

## Weiterführende Links

- Notebook: [Monitoring und Observability](../../notebooks/de/50-monitoring-and-observability.md)
- Übung: [Monitoring-Signale eines Dienstes definieren](../../exercises/de/50-define-service-monitoring-signals.md)
- Lab: [Einen Dienst instrumentieren und überwachen](../../labs/de/50-instrument-and-monitor-a-service.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
