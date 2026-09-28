---
chapter: 50
title: "Monitoring-Signale eines Dienstes definieren"
related_notebook: "Monitoring und Observability: Metriken, Logs und Traces"
level: Fortgeschritten
estimated_time: 45 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/50-monitoring-and-observability.md) | [Lab](../../labs/de/50-instrument-and-monitor-a-service.md) | [Roadmap](../../ROADMAP.md)

# Monitoring-Signale eines Dienstes definieren

## Ziel

Entwirf ein kleines, umsetzbares Observability-Modell für einen HTTP-Dienst.

## Ergebnisse

- Metriken, strukturierte Logfelder und Trace-Spans auswählen.
- Einen SLI und ein SLO aus benutzerbezogenem Verhalten definieren.
- Alerts mit Schwellenwerten, Zuständigkeiten und Runbook-Links schreiben.

## Voraussetzungen

- Lies [Monitoring und Observability](../../notebooks/de/50-monitoring-and-observability.md).
- Verstehe HTTP-Statuscodes, Latenz und grundlegende Telemetriekonzepte.
- Weißt, wie Zugangsdaten und personenbezogene Daten in Logs geschützt werden.

## Szenario

Eine Zahlungs-API meldet nur CPU-Auslastung. Kunden berichten gelegentlich langsame Anfragen, aber das Team kann nicht feststellen, ob API, Datenbank oder Zahlungsanbieter verantwortlich ist.

## Aufgaben

### Aufgabe 1 - Signale auswählen

Definiere Anfrage- und Fehlerrate, Latenzverteilung, Sättigung, strukturierte Ereignisse und Trace-Spans für API und Abhängigkeiten.

**Erwartetes Ergebnis:** Der Signalsatz erklärt Benutzerauswirkungen und unterstützt Abhängigkeitsanalyse.

### Aufgabe 2 - Zuverlässigkeitsziele definieren

Schreibe einen Verfügbarkeits-SLI und ein 30-Tage-SLO. Lege fest, welche Anfragen gültig sind und welche Fehler gegen das Ziel zählen.

**Erwartetes Ergebnis:** Das Ziel ist messbar und für Benutzer sinnvoll.

### Aufgabe 3 - Alerts erstellen

Schreibe Warn- und kritische Alerts mit Dauer, Zuständigkeit, Schweregrad, Runbook-URL und Eskalationsweg. Liste Felder auf, die niemals geloggt werden dürfen.

**Erwartetes Ergebnis:** Alerts führen zu einer Bedieneraktion und legen keine Geheimnisse oder personenbezogenen Daten offen.

## Herausforderung

Definiere einen Burn-Rate-Alert, der schnellen Verbrauch des Fehlerbudgets erkennt, ohne für einen einzelnen kurzen Fehler zu alarmieren.

## Selbsteinschätzung

- [ ] Ich kann Metriken, Logs und Traces unterscheiden.
- [ ] Ich kann einen SLI statt einer rohen Infrastrukturmetrik definieren.
- [ ] Ich kann einen umsetzbaren Alert erstellen.
- [ ] Ich kann sensible Loginhalte erkennen.

## Häufige Fehler

| Fehler                                 | Lösung                                                    |
| -------------------------------------- | --------------------------------------------------------- |
| Nur bei CPU alarmieren                 | Benutzerbezogene Latenz- und Fehlersignale ergänzen.      |
| Token oder Anfragekörper loggen        | Sichere Bezeichner loggen und sensible Felder redigieren. |
| Zuständigkeiten und Runbooks auslassen | Jeden Alert um Reaktionsmetadaten ergänzen.               |

## Zusammenfassung

Nützliche Observability verbindet Dienstverhalten mit Benutzerauswirkungen und gibt Bedienern genug Kontext für sicheres Handeln.

## Weiterführende Links

- Notebook: [Monitoring und Observability](../../notebooks/de/50-monitoring-and-observability.md)
- Lab: [Einen Dienst instrumentieren und überwachen](../../labs/de/50-instrument-and-monitor-a-service.md)
- Quiz: [Quiz zu Monitoring und Observability](../../quizzes/de/50-monitoring-and-observability-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
