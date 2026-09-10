---
chapter: 50
title: "Monitoring und Observability: Metriken, Logs und Traces"
part: "DevOps"
level: Fortgeschritten
estimated_time: 75 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](49-cloud-deployments.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- nützliche Metriken, strukturierte Logs und verteilte Traces für einen Dienst auswählen.
- SLIs und SLOs definieren, die für Benutzer sichtbare Zuverlässigkeit beschreiben.
- umsetzbare Alerts mit Kontext, Zuständigkeit und Eskalationswegen erstellen.

## Einführung

Monitoring berichtet bekannte Signale wie CPU-Auslastung oder Anfrageanzahl. Observability hilft einem Team, einen unbekannten Systemzustand zu erklären, indem Metriken, Logs, Traces und Deployment-Kontext kombiniert werden. Gute Instrumentierung verbindet technisches Verhalten mit der Benutzererfahrung.

## Warum das wichtig ist

Ein Dienst kann verfügbar sein, während Benutzer langsame oder fehlgeschlagene Anfragen erleben. Signale machen diese Fehler sichtbar, helfen beim Finden der verantwortlichen Abhängigkeit und liefern Nachweise für Release-Entscheidungen. Ohne klare Ziele übersehen Teams entweder Vorfälle oder erzeugen Alert-Müdigkeit.

## Schlüsselbegriffe

| Begriff      | Definition                                                       |
| ------------ | ---------------------------------------------------------------- |
| Metrik       | Eine numerische Messung, die über die Zeit aufgezeichnet wird.   |
| Log          | Ein zeitgestempeltes Ereignis, das etwas Geschehenes beschreibt. |
| Trace        | Der Weg einer Anfrage durch mehrere Dienste.                     |
| Span         | Eine zeitlich gemessene Operation innerhalb eines Traces.        |
| SLI          | Ein gemessener Indikator für ein Dienstverhalten.                |
| SLO          | Ein Ziel für einen SLI über ein definiertes Zeitfenster.         |
| Fehlerbudget | Die durch ein SLO tolerierte Unzuverlässigkeit.                  |

## Theorie

Metriken sind effizient für Dashboards und Alerts. Counter messen Summen wie Anfragen und Fehler; Gauges messen aktuelle Werte; Histogramme beschreiben Verteilungen wie Latenz. Bevorzuge Raten und Perzentile gegenüber Mittelwerten, wenn sich die Benutzererfahrung stark unterscheidet.

Strukturierte Logs sollten Zeitstempel, Schweregrad, Dienst, Umgebung, Anfrage- oder Trace-ID, Ereignisnamen und sicheren Kontext enthalten. Protokolliere niemals Passwörter, Zugriffstoken oder personenbezogene Daten ohne genehmigten Grund. Traces verbinden Spans über Dienstgrenzen hinweg und zeigen, wo sich Zeit oder Fehler sammeln.

Ein SLI ist die Messung, etwa der Anteil erfolgreicher Anfragen. Ein SLO ist das Ziel, etwa 99,9 % erfolgreiche Anfragen über 30 Tage. Alerts sollten auslösen, wenn eine benutzerwirksame Bedingung Maßnahmen erfordert, nicht bloß bei jeder Ressourcenänderung.

## Praktische Beispiele

### Eine HTTP-Anfrage instrumentieren

```python
from time import perf_counter
import logging

logger = logging.getLogger(__name__)


def handle_request(request, metrics, tracer):
    with tracer.start_as_current_span("checkout.request") as span:
        started = perf_counter()
        try:
            response = process_checkout(request)
            metrics.requests_total.add(1, {"route": "/checkout", "status": str(response.status)})
            return response
        except Exception as error:
            span.record_exception(error)
            logger.exception("checkout_failed", extra={"request_id": request.id})
            metrics.failures_total.add(1, {"route": "/checkout"})
            raise
        finally:
            metrics.request_duration.record(perf_counter() - started, {"route": "/checkout"})
```

Die Anfrage erzeugt eine Dauer-Metrik, Erfolgs- oder Fehler-Counter, einen Trace-Span und ein strukturiertes Fehlerereignis. Die `request_id` unterstützt die Korrelation, ohne Geheimnisse offenzulegen.

### Ein SLO und einen Alert definieren

```yaml
slo:
  name: checkout-availability
  sli: successful_requests / valid_requests
  target: 99.9%
  window: 30d
alert:
  name: CheckoutHighErrorRate
  condition: error_rate > 1% for 10m
  owner: checkout-oncall
  runbook: docs/runbooks/checkout-high-error-rate.md
```

Das SLO formuliert ein benutzerbezogenes Ziel. Der Alert enthält Dauer, Zuständigkeit und Runbook und führt dadurch zu einer Reaktion statt zu einer Meldung, mit der niemand arbeiten kann.

## Selbst ausprobieren

1. Definiere drei benutzerbezogene SLIs für einen Checkout- oder API-Dienst.
2. Ergänze strukturiertes Logging mit einer Korrelations-ID und entferne sensible Felder.
3. Zeichne einen Trace über API, Datenbank und externen Zahlungsanbieter.
4. Schreibe einen Warn- und einen kritischen Alert mit Zuständigkeiten und Runbook-Links.

## Best Practices

- Instrumentiere die Golden Signals: Latenz, Traffic, Fehler und Sättigung.
- Verwende konsistente Namen, Labels, Trace-IDs und Aufbewahrungsrichtlinien.
- Alarme auf Symptome und SLO-Risiko, nicht auf jede Schwankung auf niedriger Ebene.
- Halte Dashboards entscheidungsorientiert und verknüpfe Alerts mit Runbooks.
- Prüfe Telemetrie nach Releases und entferne laute oder ungenutzte Signale.

## Häufige Fehler

| Fehler                              | Warum er Probleme verursacht                                    | So vermeidest du ihn                       |
| ----------------------------------- | --------------------------------------------------------------- | ------------------------------------------ |
| Nur bei CPU alarmieren              | Benutzer können Fehler erleben, obwohl die CPU normal aussieht. | Auf benutzerbezogene SLIs alarmieren.      |
| Rohe Anfragekörper loggen           | Geheimnisse oder personenbezogene Daten können durchsickern.    | Nur sichere strukturierte Felder loggen.   |
| Mittelwerte für Latenz verwenden    | Langsame Ausreißer verschwinden im Mittelwert.                  | Perzentile und Histogramme verwenden.      |
| Alerts ohne Zuständigkeit erstellen | Niemand weiß, wer reagieren soll.                               | Ein On-Call-Team und ein Runbook zuweisen. |

## Zusammenfassung

- Metriken zeigen Trends, Logs erklären Ereignisse und Traces verbinden verteilte Arbeit.
- SLIs messen benutzerbezogenes Verhalten; SLOs machen Zuverlässigkeitsziele explizit.
- Umsetzbare Alerts benötigen sinnvolle Schwellenwerte, Dauer, Zuständigkeit und Reaktionshinweise.

## Weiterführende Links

- Vorheriges Kapitel: [Cloud-Deployments](49-cloud-deployments.md)
- Übung: [Signale für Dienst-Monitoring definieren](../../exercises/de/50-define-service-monitoring-signals.md)
- Lab: [Einen Dienst instrumentieren und überwachen](../../labs/de/50-instrument-and-monitor-a-service.md)
- Quiz: [Quiz zu Monitoring und Observability](../../quizzes/de/50-monitoring-and-observability-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
