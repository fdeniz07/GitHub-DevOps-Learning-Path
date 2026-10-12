---
chapter: 49
title: "Cloud-Deployment-Modelle, Konfiguration und Rollback"
part: "DevOps"
level: Fortgeschritten
estimated_time: 75 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](48-container-registries.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- virtuelle Maschinen, verwaltete Containerdienste und Orchestratoren vergleichen.
- Konfiguration und Geheimnisse von einem Anwendungs-Image trennen.
- Healthchecks, Rollout-Gates und einen praktikablen Rollback-Plan entwerfen.

## Einführung

Cloud-Deployment ist die kontrollierte Überführung eines getesteten Artefakts in eine von einem Cloud-Anbieter betriebene Umgebung. Der Anbieter kann virtuelle Maschinen, eine Container-Laufzeit, einen Cluster-Scheduler oder die gesamte Anwendungsplattform verwalten. Die Wahl sollte zu Betriebsanforderungen, Teamfähigkeiten und dem erforderlichen Einfluss auf Netzwerk und Laufzeitverhalten passen.

## Warum das wichtig ist

Ein erfolgreiches Deployment ist mehr als ein Upload. Es muss sicher Konfiguration erhalten, ein Health-Signal bereitstellen, Traffic verarbeiten und einen schnellen Wiederherstellungsweg bieten. Explizite Deployment-Modelle und Rollback-Verfahren reduzieren Unsicherheit während eines Vorfalls.

## Schlüsselbegriffe

| Begriff                     | Definition                                                                                           |
| --------------------------- | ---------------------------------------------------------------------------------------------------- |
| VM-Deployment               | Eine Anwendung auf virtuellen Maschinen ausführen, die vom Team oder Anbieter verwaltet werden.      |
| Verwalteter Containerdienst | Eine Plattform, die Container ausführt und dabei einen großen Teil der Host-Infrastruktur verwaltet. |
| Orchestrator                | Ein Scheduler, der Platzierung, Skalierung, Netzwerk und Lebenszyklus von Containern verwaltet.      |
| Readiness-Check             | Ein Signal, das bestimmt, ob eine Instanz Traffic erhalten darf.                                     |
| Liveness-Check              | Ein Signal, das bestimmt, ob ein ungesunder Prozess neu gestartet werden soll.                       |
| Rollback                    | Zu einer zuvor bekannten guten Version oder Konfiguration zurückkehren.                              |

## Theorie

Virtuelle Maschinen bieten umfassende Kontrolle, erfordern aber Patching, Kapazitätsplanung und Host-Betrieb. Verwaltete Containerdienste reduzieren die Host-Arbeit und eignen sich für zustandslose Dienste mit moderaten Plattformanforderungen. Orchestratoren bieten fortgeschrittene Planung, Diensterkennung und progressive Auslieferung, erfordern aber mehr Plattformwissen und Governance.

Konfiguration wie URLs, Feature-Flags, Ressourcenlimits und Umgebungsnamen sollte vom Deploymentsystem injiziert werden. Geheimnisse gehören in einen verwalteten Secret Store und dürfen nur dem benötigten Prozess bereitgestellt werden. Das Image sollte über Umgebungen hinweg möglichst identisch sein.

Healthchecks müssen unterschiedliche Fragen beantworten. Readiness sagt, ob Traffic ankommen soll. Liveness sagt, ob ein Neustart den Prozess möglicherweise repariert. Ein Deployment sollte auf Readiness warten, Fehlerrate und Latenz beobachten und stoppen oder zurückrollen, wenn das Release seine Gates verletzt.

## Praktische Beispiele

### Konfiguration eines Containerdienstes

```yaml
service: checkout-api
image: registry.example.com/platform/checkout@sha256:abc123
port: 8080
environment:
  ASPNETCORE_ENVIRONMENT: Production
  ORDERS_API_URL: https://orders.internal
secrets:
  - name: DATABASE_PASSWORD
    ref: secret://prod/checkout/database-password
health:
  readiness: /health/ready
  liveness: /health/live
resources:
  cpu: 500m
  memory: 512Mi
```

Das Image wird per Digest ausgewählt, während Umgebungskonfiguration und Geheimnisse von der Plattform bereitgestellt werden. Der Dienst darf das Produktionspasswort nicht in sein Image einbetten.

### Rollout- und Rollback-Übersicht

```bash
cloud deploy checkout-api --image registry.example.com/platform/checkout@sha256:abc123 --wait-for-ready
cloud observe checkout-api --window 10m --signals error-rate,p95-latency
cloud rollback checkout-api --to revision checkout-api-2026-09-22
```

Die Befehlsnamen sind beispielhafte Plattformoperationen. Wichtig ist die Reihenfolge: unveränderliches Artefakt, Readiness-Gate, beobachtbares Zeitfenster und eine geübte vorherige Revision.

## Selbst ausprobieren

1. Wähle ein Deployment-Modell für einen zustandslosen HTTP-Dienst und begründe den betrieblichen Kompromiss.
2. Liste alle Konfigurationswerte auf und klassifiziere jeden als öffentliche Konfiguration oder Geheimnis.
3. Definiere Readiness- und Liveness-Endpunkte sowie eine Start-Gnadenfrist.
4. Schreibe Rollback-Auslöser auf Grundlage von Fehlerrate, Latenz und fehlgeschlagenen Healthchecks.

## Best Practices

- Fördere dasselbe getestete Image durch Umgebungen und deploye per Digest.
- Halte Infrastruktur- und Anwendungskonfiguration versioniert und lagere Geheimnisse aus.
- Nutze Readiness-Gates vor dem Traffic und Liveness-Checks, die Neustartschleifen vermeiden.
- Mache Deployments beobachtbar, begrenzt und umkehrbar.
- Teste Rollback und dokumentiere, wer ihn genehmigen oder ausführen darf.

## Häufige Fehler

| Fehler                             | Warum er Probleme verursacht                                                   | So vermeidest du ihn                 |
| ---------------------------------- | ------------------------------------------------------------------------------ | ------------------------------------ |
| Für jede Umgebung neu bauen        | Artefakte unterscheiden sich zwischen Test und Produktion.                     | Ein unveränderliches Image fördern.  |
| Geheimnisse in Image-Layer legen   | Jeder mit dem Image kann sie möglicherweise wiederherstellen.                  | Geheimnisse zur Laufzeit injizieren. |
| Einen Check für jeden Zweck nutzen | Traffic kann eine nicht bereite App erreichen oder gesunde Arbeit neu starten. | Readiness und Liveness trennen.      |
| Rollback nur auf dem Papier planen | Bediener verlieren während eines Vorfalls Zeit.                                | Rollback mit echten Revisionen üben. |

## Zusammenfassung

- Cloud-Modelle tauschen betriebliche Kontrolle gegen verwaltete Verantwortung.
- Laufzeitkonfiguration und Geheimnisse sollten außerhalb unveränderlicher Images bleiben.
- Healthchecks, Rollout-Gates, Beobachtbarkeit und geübtes Rollback machen Deployments wiederherstellbar.

## Weiterführende Links

- Vorheriges Kapitel: [Container-Registries](48-container-registries.md)
- Übung: [Ein Cloud-Deployment planen](../../exercises/de/49-plan-a-cloud-deployment.md)
- Lab: [Eine Anwendung in die Cloud deployen](../../labs/de/49-deploy-an-application-to-the-cloud.md)
- Quiz: [Quiz zu Cloud-Deployments](../../quizzes/de/49-cloud-deployments-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
