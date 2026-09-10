---
chapter: 51
title: "Enterprise-CI/CD-Pipelines und Plattform-Governance"
part: "DevOps"
level: Fortgeschritten
estimated_time: 90 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](50-monitoring-and-observability.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- einen Enterprise-Auslieferungsfluss mit gesteuerten Umgebungen und Freigaben entwerfen.
- Auditierbarkeit, Plattformverantwortung, Aufgabentrennung und wiederverwendbare Vorlagen erklären.
- Teamautonomie mit sicheren, konsistenten Auslieferungsstandards ausbalancieren.

## Einführung

Enterprise-CI/CD koordiniert viele Teams, Dienste, Umgebungen, Compliance-Verpflichtungen und Deployment-Wege. Das Ziel ist nicht, jedes Team einem langsamen zentralen Prozess zu unterwerfen. Ziel sind sichere Standardwege: wiederverwendbare Automatisierung, klare Zuständigkeit, Richtlinienprüfungen und genügend Flexibilität für berechtigte Unterschiede.

## Warum das wichtig ist

Im großen Maßstab wird eine undokumentierte manuelle Freigabe oder ein kopierter Workflow zu einem Zuverlässigkeits- und Auditrisiko. Standardvorlagen verringern Abweichungen, geschützte Umgebungen kontrollieren sensible Aktionen, und Zuständigkeitsgrenzen erleichtern die Fehlerbehebung. Gute Governance befähigt Teams, statt technische Entscheidungen zu ersetzen.

## Schlüsselbegriffe

| Begriff                   | Definition                                                                                      |
| ------------------------- | ----------------------------------------------------------------------------------------------- |
| Umgebung                  | Ein benanntes Deployment-Ziel mit Konfiguration, Zugriff und Kontrollen.                        |
| Promotion                 | Dasselbe Artefakt in eine spätere Umgebung verschieben.                                         |
| Aufgabentrennung          | Verantwortlichkeiten so teilen, dass eine Person wichtige Kontrollen nicht allein umgehen kann. |
| Auditierbarkeit           | Die Möglichkeit, nachzuvollziehen, wer was geändert, genehmigt und deployt hat.                 |
| Plattformteam             | Ein Team, das gemeinsame Auslieferungsfunktionen und Standardwege bereitstellt.                 |
| Wiederverwendbare Vorlage | Versionierte Automatisierung, die Produktteams konsistent nutzen.                               |

## Theorie

Eine gesteuerte Pipeline prüft normalerweise eine Änderung, erstellt ein unveränderliches Artefakt, scannt und signiert es, deployt in eine niedrigere Umgebung, führt Verifikation aus und fördert dasselbe Artefakt über Staging nach Produktion. Freigaben gehören an Risikogrenzen, nicht nach jeden harmlosen automatisierten Schritt.

Umgebungskontrollen sollten definieren, wer deployen darf, welche Prüfungen erforderlich sind, wie Geheimnisse begrenzt werden und wie lange eine Freigabe gültig bleibt. Auditaufzeichnungen sollten Quell-Commit, Workflow-Lauf, Artefakt-Digest, Test- und Scan-Ergebnisse, genehmigende Person, Deployment-Zeit und Ergebnis verbinden.

Plattformteams besitzen das gemeinsame Pipeline-Framework, Runner, Identitätsintegration, Vorlagen und Richtlinienkontrollen. Produktteams besitzen Dienstverhalten, Tests, betriebliche Bereitschaft und Service-Level-Ziele. Wiederverwendbare Vorlagen sollten sichere Parameter anbieten, Eingaben prüfen und eine Versions- sowie Ausmusterungsrichtlinie besitzen.

## Praktische Beispiele

### Wiederverwendbare Workflow-Vorlage

```yaml
name: Governed service delivery
on:
  workflow_call:
    inputs:
      image:
        required: true
        type: string
      service:
        required: true
        type: string
jobs:
  promote:
    permissions:
      contents: read
      deployments: write
    uses: platform/.github/.github/workflows/promote.yml@v3
    with:
      image: ${{ inputs.image }}
      service: ${{ inputs.service }}
    secrets: inherit
```

Die Plattform besitzt Implementierung und Version. Ein Dienst liefert Artefakt und Dienstidentität, während der aufgerufene Workflow gemeinsame Kontrollen anwendet. Produktion sollte trotzdem eine geschützte Umgebung und eine explizite Freigaberichtlinie nutzen.

### Promotionsaufzeichnung

```text
service: checkout-api
commit: a1b2c3d
image: registry.example.com/platform/checkout@sha256:abc123
workflow_run: 18742
staging_result: passed
production_approval: release-manager@example.com
production_time: 2026-09-23T14:20:00Z
```

Diese Aufzeichnung macht ein Deployment bei einem Audit oder einer Vorfalluntersuchung erklärbar.

## Selbst ausprobieren

1. Zeichne eine Pipeline vom Pull Request bis zur Produktion mit Artefakt-, Test-, Scan-, Freigabe- und Rollback-Gates.
2. Weise Plattformteam, Serviceteam, Sicherheitsteam und Release-Genehmigung Verantwortlichkeiten zu.
3. Definiere den minimalen Auditdatensatz, der ein Produktionsdeployment rekonstruierbar macht.
4. Liste Vorlageneingaben auf, die Dienstunterschiede erlauben, ohne Richtlinien zu umgehen.

## Best Practices

- Einmal bauen und dasselbe unveränderliche Artefakt durch kontrollierte Umgebungen fördern.
- Richtlinien in versionierte, wiederverwendbare Vorlagen legen und Vorlagenänderungen unabhängig testen.
- Geringste Rechte, geschützte Umgebungen, Aufgabentrennung und kurzlebige Zugangsdaten nutzen.
- Zuständigkeit, Eskalation, Auditnachweise und Rollback-Verantwortung explizit machen.
- Auslieferungsleistung messen, ohne Teams für das Umgehen von Qualitätskontrollen zu belohnen.

## Häufige Fehler

| Fehler                                   | Warum er Probleme verursacht                                           | So vermeidest du ihn                               |
| ---------------------------------------- | ---------------------------------------------------------------------- | -------------------------------------------------- |
| In jeder Umgebung neu bauen              | Testnachweise beschreiben nicht mehr die Produktionsbytes.             | Ein Artefakt per Digest fördern.                   |
| Workflows zwischen Teams kopieren        | Fehlerbehebungen und Kontrollen driften mit der Zeit auseinander.      | Versionierte, wiederverwendbare Vorlagen anbieten. |
| Überall Freigaben hinzufügen             | Die Auslieferung wird langsamer, ohne sinnvolles Risiko zu reduzieren. | Freigaben an Risikogrenzen platzieren.             |
| Alle Dienstentscheidungen zentralisieren | Die Plattform wird zum Engpass.                                        | Produktverantwortung bei Serviceteams belassen.    |

## Zusammenfassung

- Enterprise-CI/CD verbindet Automatisierung, Governance, Zuständigkeit und Nachweise.
- Wiederverwendbare Vorlagen und geschützte Umgebungen schaffen Standardwege, ohne Verantwortung zu verstecken.
- Einmaliges Bauen, Aufgabentrennung und auditierbare Deployment-Aufzeichnungen unterstützen sichere Skalierung.

## Weiterführende Links

- Vorheriges Kapitel: [Monitoring und Observability](50-monitoring-and-observability.md)
- Übung: [Eine Enterprise-CI/CD-Pipeline entwerfen](../../exercises/de/51-design-an-enterprise-cicd-pipeline.md)
- Lab: [Eine Enterprise-Auslieferungspipeline prüfen](../../labs/de/51-review-an-enterprise-delivery-pipeline.md)
- Quiz: [Quiz zur Enterprise-CI/CD-Pipeline](../../quizzes/de/51-enterprise-cicd-pipeline-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
