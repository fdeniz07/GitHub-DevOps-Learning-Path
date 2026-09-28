---
chapter: 49
title: "Ein Cloud-Deployment planen"
related_notebook: "Cloud-Deployment-Modelle, Konfiguration und Rollback"
level: Fortgeschritten
estimated_time: 45 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/49-cloud-deployments.md) | [Lab](../../labs/de/49-deploy-an-application-to-the-cloud.md) | [Roadmap](../../ROADMAP.md)

# Ein Cloud-Deployment planen

## Ziel

Erstelle einen Deployment-Plan für einen zustandslosen Containerdienst mit Konfiguration, Healthchecks, Rollout-Gates und Rollback.

## Ergebnisse

- Ein Cloud-Deployment-Modell wählen und seine Kompromisse erklären.
- Konfiguration und Geheimnisse korrekt klassifizieren.
- Readiness-, Liveness- und Rollback-Bedingungen definieren.

## Voraussetzungen

- Lies [Cloud-Deployment-Modelle](../../notebooks/de/49-cloud-deployments.md).
- Verstehe Container-Images, Registries und HTTP-Health-Endpunkte.
- Zugriff auf ein Cloud-Testabonnement ist hilfreich, aber nicht erforderlich.

## Szenario

Eine Checkout-API muss ohne Neubau des Images aus einer Testumgebung in Produktion gelangen. Der Dienst verwendet ein Datenbankpasswort, eine Orders-URL und einen Readiness-Endpunkt.

## Aufgaben

### Aufgabe 1 - Deployment-Modell auswählen

Vergleiche VM, verwalteten Containerdienst und Orchestrator. Wähle eines für den Dienst und dokumentiere betriebliche Verantwortlichkeiten.

**Erwartetes Ergebnis:** Die Entscheidung behandelt Skalierung, Netzwerk, Patching, Teamwissen und Wiederherstellung.

### Aufgabe 2 - Laufzeitvertrag erstellen

Liste Image-Digest, Port, öffentliche Konfiguration, Secret-Referenzen, Ressourcenlimits, Readiness-Pfad und Liveness-Pfad auf.

**Erwartetes Ergebnis:** Kein Geheimnis ist im Image oder im Deployment-Manifest im Klartext gespeichert.

### Aufgabe 3 - Promotion und Rollback definieren

Lege Beobachtungsfenster, Health- und SLO-Gates, Freigabegrenze, vorherige Revision und Rollback-Befehl oder Bedieneraktion fest.

**Erwartetes Ergebnis:** Ein anderer Bediener kann deployen und sich während eines Vorfalls erholen, ohne Schritte zu erfinden.

## Herausforderung

Füge eine Canary-Phase hinzu, die 10 % des Traffics erhält, und definiere die Nachweise für die Freigabe auf 100 %.

## Selbsteinschätzung

- [ ] Ich kann Cloud-Deployment-Modelle vergleichen.
- [ ] Ich kann Konfiguration von Geheimnissen trennen.
- [ ] Ich kann Readiness von Liveness unterscheiden.
- [ ] Ich kann messbare Rollback-Auslöser schreiben.

## Häufige Fehler

| Fehler                                           | Lösung                                                 |
| ------------------------------------------------ | ------------------------------------------------------ |
| Für Produktion neu bauen                         | Den getesteten Digest fördern.                         |
| Ein Passwort als normale Konfiguration behandeln | Über einen Secret Manager speichern und referenzieren. |
| Keine vorherige Revision besitzen                | Rollback-Kandidaten verfügbar und getestet halten.     |

## Zusammenfassung

Ein Deployment-Plan ist vollständig, wenn Artefakt, Laufzeitkonfiguration, Health-Gates, Zuständigkeit und Rollback-Weg explizit sind.

## Weiterführende Links

- Notebook: [Cloud-Deployment-Modelle](../../notebooks/de/49-cloud-deployments.md)
- Lab: [Eine Anwendung in die Cloud deployen](../../labs/de/49-deploy-an-application-to-the-cloud.md)
- Quiz: [Quiz zu Cloud-Deployments](../../quizzes/de/49-cloud-deployments-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
