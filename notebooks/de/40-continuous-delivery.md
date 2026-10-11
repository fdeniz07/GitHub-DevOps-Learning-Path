---
chapter: 40
title: "Kontinuierliche Auslieferung"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](39-continuous-integration.md) | [Roadmap](../../ROADMAP.md) | [Nächstes Kapitel](41-continuous-deployment.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- kontinuierliche Auslieferung von kontinuierlicher Integration und Deployment unterscheiden.
- eine Release-Pipeline modellieren, die Produktionsbereitschaft nachweist, ohne automatisch zu deployen.
- Freigaben, Artefakte, Umgebungen und Release-Nachweise verantwortungsvoll nutzen.

## Einführung

Kontinuierliche Auslieferung (CD) hält Software in einem veröffentlichbaren Zustand. Jede akzeptierte Änderung durchläuft automatisierte Build-, Test- und Paketierungsstufen, sodass ein Release bei Bedarf erstellt werden kann. Die endgültige Produktionsentscheidung kann weiterhin eine bewusste Freigabe erfordern.

## Warum das wichtig ist

Ein Team, das jederzeit veröffentlichen kann, ist weniger von riskanten Release-Wochenenden abhängig. Kontinuierliche Auslieferung trennt technische Bereitschaft von der geschäftlichen Entscheidung zur Veröffentlichung. Diese Trennung erleichtert Rollback-Planung, Compliance-Nachweise und die Zustimmung von Stakeholdern.

## Wichtige Begriffe

| Begriff                      | Definition                                                                                                                   |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| Kontinuierliche Auslieferung | Automatische Vorbereitung jeder akzeptierten Änderung für ein Release, wobei die Produktionsfreigabe bei Bedarf möglich ist. |
| Release-Kandidat             | Ein getestetes Artefakt, das zur Veröffentlichung vorgeschlagen wird.                                                        |
| Umgebung                     | Ein benanntes Deployment-Ziel mit Konfigurations- und Schutzregeln.                                                          |
| Freigabeschranke             | Eine bewusste Kontrolle, die vor einer geschützten Aktion erfolgreich sein muss.                                             |

## Theorie

Eine Auslieferungspipeline baut normalerweise einmal, testet den Build, veröffentlicht ein unveränderliches Artefakt und befördert dasselbe Artefakt durch Umgebungen. Separates Neubauen für Staging und Produktion kann unterschiedliche Binärdateien erzeugen und die Nachverfolgbarkeit schwächen.

Kontinuierliche Auslieferung bedeutet nicht, dass jede Änderung automatisch die Produktion erreicht. Sie bedeutet, dass die Änderung bereit ist und die Organisation den Veröffentlichungszeitpunkt wählen kann. Eine geschützte Produktionsumgebung kann Reviewer, ein Änderungsticket oder ein Deployment-Fenster verlangen.

### Praktisches Workflow-Beispiel

```yaml
name: Continuous Delivery

on:
  push:
    branches: [main]

permissions:
  contents: read
  actions: read

jobs:
  package:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build and test
        run: ./scripts/build-and-test.sh
      - name: Create release artifact
        run: tar -czf application.tgz app/
      - uses: actions/upload-artifact@v4
        with:
          name: release-candidate
          path: application.tgz

  release-ready:
    needs: package
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: release-candidate
      - name: Validate release metadata
        run: sha256sum application.tgz
```

Der Workflow bereitet einen Release-Kandidaten vor und dokumentiert Nachweise. Ein späterer Produktionsjob kann auf eine geschützte Umgebung `production` zielen und eine Freigabe verlangen. So bleibt die Unterscheidung zwischen Auslieferung und Deployment erhalten.

## Probiere es selbst aus

1. Definiere die Stufen Build, Test, Paketierung und Staging.
2. Lade ein unveränderliches Artefakt hoch und lade es in der Staging-Stufe herunter.
3. Füge eine geschützte Produktionsumgebung hinzu, ohne automatische Beförderung zu aktivieren.
4. Dokumentiere die Punkte für Freigabe und Rollback.

## Best Practices

- Einmal bauen und dasselbe unveränderliche Artefakt befördern.
- Release-Metadaten, Prüfsummen und Testergebnisse nachvollziehbar machen.
- Produktionsfreigaben explizit und prüfbar halten.
- Anwendungskonfiguration vom Artefakt trennen.
- Rollback testen, bevor eine Pipeline als releasebereit gilt.

## Häufige Fehler

| Fehler                                                        | Warum er Probleme verursacht                                                       | So vermeidest du ihn                                  |
| ------------------------------------------------------------- | ---------------------------------------------------------------------------------- | ----------------------------------------------------- |
| Für jede Umgebung neu bauen                                   | Das getestete Artefakt kann sich vom deployten Artefakt unterscheiden.             | Ein Artefakt befördern.                               |
| Jede automatisierte Pipeline als Deployment bezeichnen        | Auslieferung umfasst Release-Bereitschaft, nicht unbedingt Produktionsbeförderung. | Die Freigabegrenze klar benennen.                     |
| Staging als Nachweis für jedes Produktionsverhalten behandeln | Umgebungen können sich bei Daten, Skalierung und Konfiguration unterscheiden.      | Konfiguration vergleichen und kritische Pfade testen. |

## Zusammenfassung

- Kontinuierliche Auslieferung hält getestete Software zur Veröffentlichung bereit.
- Release-Bereitschaft kann automatisiert werden, während die Produktionsfreigabe bewusst bleibt.
- Unveränderliche Artefakte, geschützte Umgebungen und Rollback-Nachweise verbessern die Kontrolle.

## Weiterführende Links

- Vorheriges Kapitel: [Kontinuierliche Integration](39-continuous-integration.md)
- Übung: [Ein Release für kontinuierliche Auslieferung planen](../../exercises/de/40-plan-a-continuous-delivery-release.md)
- Lab: [Ein Release für kontinuierliche Auslieferung stufenweise ausliefern](../../labs/de/40-stage-a-continuous-delivery-release.md)
- Quiz: [Quiz zur kontinuierlichen Auslieferung](../../quizzes/de/40-continuous-delivery-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
- Nächstes Kapitel: [Kontinuierliches Deployment](41-continuous-deployment.md)
