---
chapter: 50
title: "Einen Dienst instrumentieren und überwachen"
related_notebook: "Monitoring und Observability: Metriken, Logs und Traces"
related_exercise: "Monitoring-Signale eines Dienstes definieren"
level: Fortgeschritten
estimated_time: 110 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/50-monitoring-and-observability.md) | [Übung](../../exercises/de/50-define-service-monitoring-signals.md) | [Roadmap](../../ROADMAP.md)

# Einen Dienst instrumentieren und überwachen

## Ziel

Füge einem kleinen Dienst nützliche Metriken, strukturierte Logs, Traces, SLOs und umsetzbare Alerts hinzu.

## Ergebnisse

- Eine Anfrage über Logs und Trace-Spans korrelieren.
- Ein Dashboard für Traffic, Fehler, Latenz und Sättigung bauen.
- Einen Alert testen und mit einem Runbook verbinden.

## Voraussetzungen

- Notebook und Übung abgeschlossen.
- Ein Dienst mit HTTP-Endpunkt und Telemetrie-Backend oder lokalem Collector.
- Berechtigung, Dashboards und Alerts in einer Testumgebung zu erstellen.

## Szenario

Das On-Call-Team erhält während Zahlungsvorfällen vage CPU-Alerts. Ersetze sie durch Signale, die Benutzerauswirkungen zeigen und eine langsame Abhängigkeit identifizieren.

## Umgebung

| Anforderung    | Wert                                                                  |
| -------------- | --------------------------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                                             |
| Software       | Dienstlaufzeit, OpenTelemetry-kompatibler Collector, Dashboard-System |
| Signale        | Metriken, strukturierte Logs, Traces                                  |
| Ziel           | 99,9 % erfolgreiche gültige Anfragen über 30 Tage                     |

## Aufgaben

### Aufgabe 1 - Eine Anfrage instrumentieren

Füge Anfrage-Counter, Dauer-Histogramm, Fehler-Counter, strukturiertes Ereignis und Trace-Span hinzu. Nimm Dienst, Route, Status und Korrelations-ID auf; schließe Geheimnisse und rohe Zugangsdaten aus.

**Erwartetes Ergebnis:** Eine Anfrage kann von der Metrik über das Log bis zum Trace verfolgt werden.

### Aufgabe 2 - Dashboard bauen

Erstelle Panels für Anfrage- und Fehlerrate, p50- und p95-Latenz, Sättigung, Abhängigkeitslatenz und aktuelle Deployments.

**Erwartetes Ergebnis:** Das Dashboard unterstützt eine Entscheidung während eines kundenwirksamen Vorfalls.

### Aufgabe 3 - Alerting testen

Definiere einen Fehlerraten-Alert mit Zuständigkeit und Runbook, löse ihn in einem sicheren Testfenster aus, bestätige ihn und dokumentiere die Reaktion.

**Erwartetes Ergebnis:** Der Alert ist umsetzbar, wird an das richtige Team geleitet und ist mit einer Reaktionsanleitung verknüpft.

## Validierungscheckliste

- [ ] Metriken verwenden stabile Namen und begrenzte Labels.
- [ ] Logs sind strukturiert und frei von Geheimnissen.
- [ ] Traces enthalten Abhängigkeits-Spans und Korrelation.
- [ ] SLO- und Alert-Schwellenwerte sind dokumentiert.
- [ ] Alert-Test und Reaktion sind aufgezeichnet.

## Fehlerbehebung

| Problem                         | Mögliche Ursache                          | Lösung                                              |
| ------------------------------- | ----------------------------------------- | --------------------------------------------------- |
| Metriken mit hoher Kardinalität | Benutzer-IDs oder URLs als Labels         | Begrenzte Routen- und Status-Labels verwenden.      |
| Trace-Korrelation fehlt         | Propagation ist nicht konfiguriert        | Kontext-Propagation über Aufrufe hinweg aktivieren. |
| Alert löst keine Seite aus      | Falsche Benachrichtigungsroute oder Dauer | Routing testen und Alert-Auswertung prüfen.         |

## Best Practices

- Telemetrie nützlich, begrenzt, datenschutzbewusst und an Dienstziele gebunden halten.
- Jede Seite mit Zuständigkeit und Runbook verknüpfen.
- Signalqualität nach Releases prüfen und laute Alerts entfernen.

## Zusammenfassung

Instrumentierung wird zum betrieblichen Wert, wenn Signale korreliert sind, Dashboards Entscheidungen unterstützen und Alerts zu geübten Reaktionen führen.

## Weiterführende Links

- Notebook: [Monitoring und Observability](../../notebooks/de/50-monitoring-and-observability.md)
- Übung: [Monitoring-Signale eines Dienstes definieren](../../exercises/de/50-define-service-monitoring-signals.md)
- Quiz: [Quiz zu Monitoring und Observability](../../quizzes/de/50-monitoring-and-observability-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
