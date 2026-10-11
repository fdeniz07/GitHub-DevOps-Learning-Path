---
chapter: 41
title: "Kontinuierliches Deployment"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](40-continuous-delivery.md) | [Roadmap](../../ROADMAP.md) | [Nächstes Kapitel](42-secrets-and-variables.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- erklären, wie kontinuierliches Deployment validierte Änderungen automatisch in die Produktion befördert.
- Produktionskontrollen für einen automatisierten Deployment-Workflow entwerfen.
- Progressive Auslieferung, Rollback, Monitoring und geschützte Umgebungen kombinieren.

## Einführung

Kontinuierliches Deployment ist die Praxis, jede Änderung, die die Auslieferungspipeline erfolgreich durchläuft, automatisch in die Produktion zu befördern. Es geht über kontinuierliche Auslieferung hinaus, weil die Produktionsfreigabe automatisiert ist. Die Automatisierung muss deshalb zuverlässige Kontrollen enthalten und darf nicht nur aus einem abschließenden `deploy`-Befehl bestehen.

## Warum das wichtig ist

Die automatische Beförderung in die Produktion kann die Zeit bis zum Nutzen verkürzen und manuelle Release-Arbeit reduzieren. Sie erhöht aber auch die Kosten schwacher Tests, unsicherer Berechtigungen und schlechter Beobachtbarkeit. Ein Deployment-System muss nachweisen, dass es Fehler erkennt und eine Änderung stoppen oder zurücknehmen kann.

## Wichtige Begriffe

| Begriff                     | Definition                                                                                |
| --------------------------- | ----------------------------------------------------------------------------------------- |
| Kontinuierliches Deployment | Automatische Beförderung in die Produktion nach erfolgreicher erforderlicher Validierung. |
| Progressive Auslieferung    | Schrittweise Veröffentlichung über Canary-, Blue-Green- oder prozentbasierte Rollouts.    |
| Rollback                    | Rückkehr der Produktion zu einer bekannten funktionierenden Version.                      |
| Health Check                | Ein automatisches Signal zur Bewertung des Serviceverhaltens.                             |

## Theorie

Kontinuierliches Deployment erfordert eine vertrauenswürdige Kette: Quellvalidierung, Artefaktintegrität, Deployment-Autorisierung, Health Checks und Rollback. Kontrollen für die Produktionsbeförderung sollten automatisiert und testbar sein. Eine geschützte Umgebung kann weiterhin erforderliche Reviewer oder Richtlinien definieren, aber eine Freigabe, die immer auf eine Person wartet, ist kontinuierliche Auslieferung und kein vollständig automatisches Deployment.

Progressive Auslieferung reduziert den Wirkungsradius. Ein Canary-Release kann einen kleinen Prozentsatz des Datenverkehrs an die neue Version senden und stoppen, wenn Fehlerrate, Latenz oder Health Checks Grenzwerte überschreiten. Feature Flags können Code-Deployment und Feature-Aktivierung trennen, benötigen aber Verantwortliche und Aufräumarbeiten.

### Praktisches Workflow-Beispiel

```yaml
name: Continuous Deployment

on:
  workflow_run:
    workflows: [Continuous Delivery]
    types: [completed]

permissions:
  contents: read
  deployments: write

jobs:
  deploy:
    if: ${{ github.event.workflow_run.conclusion == 'success' }}
    runs-on: ubuntu-latest
    environment: production
    concurrency:
      group: production
      cancel-in-progress: false
    steps:
      - name: Deploy canary
        run: ./scripts/deploy.sh --strategy canary --percent 10
      - name: Verify health
        run: ./scripts/check-health.sh --timeout 300
      - name: Promote traffic
        run: ./scripts/deploy.sh --strategy promote
```

Der Ausdruck `if` verhindert eine Beförderung nach einem fehlgeschlagenen Auslieferungsworkflow. `concurrency` verhindert überlappende Produktionsänderungen. Die Deployment-Skripte müssen echte Health Checks und Rollback-Verhalten implementieren; YAML allein kann keine Sicherheit garantieren.

## Probiere es selbst aus

1. Zeichne den Beförderungspfad von einem getesteten Artefakt bis zur Produktion.
2. Wähle Health-Signale und definiere Stop-Schwellenwerte.
3. Füge einen Canary-Schritt und einen automatisierten Rollback-Befehl hinzu.
4. Teste, was passiert, wenn der Health Check fehlschlägt.

## Best Practices

- Automatisiere die Beförderung erst, wenn Tests und Artefaktprüfung zuverlässig sind.
- Verwende progressive Rollouts und eindeutige Health-Schwellenwerte.
- Halte Rollback schnell, dokumentiert und regelmäßig getestet.
- Nutze produktive `concurrency`, um konkurrierende Releases zu verhindern.
- Zeichne Deployment-Metadaten und Audit-Ereignisse auf.

## Häufige Fehler

| Fehler                                                  | Warum er Probleme verursacht                                | So vermeidest du ihn                                                  |
| ------------------------------------------------------- | ----------------------------------------------------------- | --------------------------------------------------------------------- |
| Alle Kontrollen zugunsten von Geschwindigkeit entfernen | Eine schlechte Änderung kann jeden Benutzer betreffen.      | Messbare Kontrollen und progressive Rollouts automatisieren.          |
| Kein Rollback-Pfad                                      | Die Wiederherstellung hängt von manueller Notfallarbeit ab. | Ein bekannt funktionierendes Artefakt bereithalten und Rollback üben. |
| Ohne Monitoring deployen                                | Benutzer entdecken Fehler zuerst.                           | Die Beförderung an Health-Signale und Alarme knüpfen.                 |

## Zusammenfassung

- Kontinuierliches Deployment befördert validierte Änderungen automatisch in die Produktion.
- Automatische Beförderung erfordert Tests, Health Checks, Rollout-Kontrollen und Rollback.
- Geringste Rechte, Concurrency und Auditierbarkeit bleiben auch nach der Automatisierung wichtig.

## Weiterführende Links

- Vorheriges Kapitel: [Kontinuierliche Auslieferung](40-continuous-delivery.md)
- Übung: [Ein kontrolliertes Deployment entwerfen](../../exercises/de/41-design-a-controlled-deployment.md)
- Lab: [Ein kontrolliertes Deployment ausführen](../../labs/de/41-run-a-controlled-deployment.md)
- Quiz: [Quiz zum kontinuierlichen Deployment](../../quizzes/de/41-continuous-deployment-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
- Nächstes Kapitel: [Secrets und Variablen](42-secrets-and-variables.md)
