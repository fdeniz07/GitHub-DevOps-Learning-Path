---
chapter: 49
title: "Eine Anwendung in die Cloud deployen"
related_notebook: "Cloud-Deployment-Modelle, Konfiguration und Rollback"
related_exercise: "Ein Cloud-Deployment planen"
level: Fortgeschritten
estimated_time: 120 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/49-cloud-deployments.md) | [Übung](../../exercises/de/49-plan-a-cloud-deployment.md) | [Roadmap](../../ROADMAP.md)

# Eine Anwendung in die Cloud deployen

## Ziel

Deploye ein unveränderliches Container-Image mit externer Konfiguration, Healthchecks und geprüftem Rollback.

## Ergebnisse

- Einen Cloud-Dienst konfigurieren, ohne Geheimnisse einzubetten.
- Traffic an Readiness koppeln und das Deployment beobachten.
- Mit Nachweisen auf eine bekannte gute Revision zurückrollen.

## Voraussetzungen

- Notebook und Übung abgeschlossen.
- Cloud-Testabonnement und Berechtigung zum Deployment eines Containerdienstes.
- Ein Image in einer Registry und ein Health-Endpunkt.

## Szenario

Ein Checkout-Dienst muss von Staging nach Produktion gefördert werden. Er nutzt ein Datenbankpasswort und eine Upstream-URL, und der Release-Manager verlangt einen getesteten Rollback-Weg.

## Umgebung

| Anforderung    | Wert                                |
| -------------- | ----------------------------------- |
| Betriebssystem | Windows, Linux oder macOS           |
| Software       | Cloud-CLI, Docker, Registry-Zugriff |
| Artefakt       | Unveränderlicher Image-Digest       |
| Health-Pfade   | `/health/ready`, `/health/live`     |

## Aufgaben

### Aufgabe 1 - Dienst konfigurieren

Erstelle eine Deploymentdefinition mit Image-Digest, Port 8080, Ressourcenlimits, Readiness-Pfad, Liveness-Pfad und Secret-Store-Referenz.

**Erwartetes Ergebnis:** Keine Zugangsdaten sind im Image oder Repository-Manifest gespeichert.

### Aufgabe 2 - Nach Staging deployen

Deploye den Digest nach Staging, warte auf Readiness, rufe den Health-Endpunkt auf und speichere Revision und Deployment-Ereignisse. Beobachte Fehlerrate und p95-Latenz mindestens zehn Minuten.

**Erwartetes Ergebnis:** Der Dienst ist bereit und die Nachweise zeigen keine Verschlechterung gegenüber dem Release-Gate.

### Aufgabe 3 - Fördern und zurückrollen

Förder denselben Digest mit der erforderlichen Freigabe nach Produktion. Löse ein fehlgeschlagenes Gate aus oder simuliere es, kehre zur vorherigen Revision zurück und prüfe die Dienstgesundheit.

**Erwartetes Ergebnis:** Bediener können die vorherige bekannte gute Revision identifizieren und wiederherstellen.

## Validierungscheckliste

- [ ] Das deployte Image ist per Digest identifiziert.
- [ ] Konfiguration und Geheimnisse sind ausgelagert.
- [ ] Readiness- und Liveness-Checks verhalten sich wie beabsichtigt unterschiedlich.
- [ ] Staging-Nachweise existieren vor der Produktionsfreigabe.
- [ ] Rollback stellt die vorherige Revision wieder her.

## Fehlerbehebung

| Problem                        | Mögliche Ursache                                      | Lösung                                                |
| ------------------------------ | ----------------------------------------------------- | ----------------------------------------------------- |
| Dienst wird nie bereit         | Falscher Port oder falsche Abhängigkeitskonfiguration | Startlogs und Readiness-Antwort prüfen.               |
| Geheimnis fehlt                | Identität kann die Secret-Referenz nicht lesen        | Kleinste erforderliche Laufzeitberechtigung gewähren. |
| Rollback hat keinen Kandidaten | Alte Revision wurde gelöscht                          | Rollback-Kandidaten aufbewahren und testen.           |

## Best Practices

- Getrennte Cloud-Identitäten für Deployment und Laufzeitzugriff verwenden.
- Ressourcenlimits anwenden und Sättigung während des Rollouts beobachten.
- Revision, Digest, Freigabe, Health-Nachweise und Rollback-Ergebnis speichern.

## Zusammenfassung

Ein Cloud-Deployment ist betrieblich vollständig, wenn Konfiguration, Health-Gates, Beobachtungsfenster und Wiederherstellungsweg getestet sind.

## Weiterführende Links

- Notebook: [Cloud-Deployment-Modelle](../../notebooks/de/49-cloud-deployments.md)
- Übung: [Ein Cloud-Deployment planen](../../exercises/de/49-plan-a-cloud-deployment.md)
- Quiz: [Quiz zu Cloud-Deployments](../../quizzes/de/49-cloud-deployments-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
