---
chapter: 45
title: "Security Best Practices für Auslieferungs-Workflows"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](44-dependabot.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- Defense in Depth auf CI/CD-Workflows und Repository-Einstellungen anwenden.
- geringste Rechte, Pinning, geschützte Umgebungen und Branch Protection gemeinsam nutzen.
- Sicherheitsnachweise wie Workflow-Berechtigungen, Dependency-Änderungen und Audit-Logs prüfen.

## Einführung

Sichere Auslieferung ist ein System von Kontrollen rund um Quellcode, Workflows, Artefakte, Umgebungen, Abhängigkeiten und Menschen. Kein einzelner Scanner und keine einzelne Einstellung kann jedes Risiko beseitigen. Defense in Depth geht davon aus, dass eine Kontrolle versagen kann, und ergänzt unabhängige Schutzmaßnahmen.

## Warum das wichtig ist

CI/CD-Workflows können Quellcode lesen, Zugangsdaten verwenden, Artefakte ändern und Produktionssysteme deployen. Eine bösartige Änderung oder kompromittierte Action kann diese Berechtigung in einen Supply-Chain-Vorfall verwandeln. Security Best Practices reduzieren den Wirkungsradius und erhalten gleichzeitig die für Teams nötige Auslieferungsgeschwindigkeit.

## Wichtige Begriffe

| Begriff           | Definition                                                                                                      |
| ----------------- | --------------------------------------------------------------------------------------------------------------- |
| Defense in Depth  | Mehrere unabhängige Kontrollen schützen dasselbe Ziel.                                                          |
| Geringste Rechte  | Ein Benutzer, Token oder Job erhält nur den benötigten Zugriff.                                                 |
| Pinning           | Referenzierung einer bekannten Action- oder Dependency-Revision statt eines unkontrollierten beweglichen Ziels. |
| Branch Protection | Regeln, die Reviews und Prüfungen verlangen, bevor Änderungen in einen geschützten Branch gelangen.             |
| Audit-Log         | Ein Protokoll sicherheitsrelevanter administrativer und Repository-Ereignisse.                                  |

## Theorie

Ein sicherer Workflow beginnt mit minimalen `permissions`, vertrauenswürdigen Actions, geschützten Branches und geprüften Workflow-Änderungen. Pinne Drittanbieter-Actions auf einen geprüften Commit-SHA, wenn es die Organisationsrichtlinie verlangt; verwende mindestens bewusst aktualisierte Versionen und prüfe die Verantwortlichen der Actions. Halte Produktions-Secrets auf geschützte Umgebungen begrenzt und vermeide ihre Offenlegung gegenüber nicht vertrauenswürdigem Pull-Request-Code.

Dependency-Hygiene umfasst Lock-Dateien, CodeQL, Dependabot, die Reaktion auf Schwachstellen und das Entfernen ungenutzter Pakete. Betriebliche Kontrollen umfassen Umgebungsfreigaben, Concurrency, Rollback, Monitoring und Audit-Logs. Diese Kontrollen wirken zusammen: Scanning findet Probleme, Branch Protection verhindert ungeprüfte Änderungen und Logs unterstützen Untersuchungen.

### Praktisches Defense-in-Depth-Beispiel

```yaml
name: Secure delivery

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: ./scripts/test.sh
      - name: Check dependencies
        run: ./scripts/audit-dependencies.sh

  deploy:
    needs: verify
    if: ${{ github.ref == 'refs/heads/main' }}
    permissions:
      contents: read
      deployments: write
    environment: production
    concurrency:
      group: production
      cancel-in-progress: false
    runs-on: ubuntu-latest
    steps:
      - name: Deploy reviewed artifact
        run: ./scripts/deploy.sh
```

Der Workflow verwendet standardmäßig schreibgeschützte Berechtigungen, gewährt Deployment-Rechte nur dem Deployment-Job und beschränkt die Produktionsausführung auf `main`. Die Repository-Einstellungen müssen dennoch Branch Protection und Umgebungsregeln durchsetzen.

## Probiere es selbst aus

1. Prüfe einen Workflow auf übermäßige Berechtigungen und nicht vertrauenswürdige Eingaben.
2. Prüfe, ob Branch Protection Reviews und CI-Prüfungen verlangt.
3. Prüfe Action-Referenzen, die Richtlinie für Dependency-Updates und Regeln der Produktionsumgebung.
4. Nutze das Audit-Log, um eine kürzlich erfolgte Workflow- oder Berechtigungsänderung zu identifizieren.

## Best Practices

- Kombiniere geringste Rechte, Branch Protection, geschützte Umgebungen und erforderliche Prüfungen.
- Pinne Actions oder versioniere sie bewusst und prüfe Änderungen vor der Übernahme.
- Halte Secrets aus Logs und nicht vertrauenswürdigen Codepfaden heraus.
- Führe CodeQL und Dependabot aus und untersuche anschließend ihre Findings und Updates.
- Bewahre Audit-Logs auf und dokumentiere Verfahren für Incident Response und Rollback.

## Häufige Fehler

| Fehler                                       | Warum er Probleme verursacht                                 | So vermeidest du ihn                                 |
| -------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------- |
| Sich auf einen Sicherheits-Scanner verlassen | Übersehene Risiken bleiben ungeschützt.                      | Defense in Depth verwenden.                          |
| `write-all`-Berechtigungen vergeben          | Ein kompromittierter Schritt kann mehr Ressourcen verändern. | Job-spezifische minimale Berechtigungen setzen.      |
| Code, aber nicht Umgebungen schützen         | Eine geprüfte Änderung kann weiterhin unsicher deployen.     | Produktionsumgebungen und Zugangsdaten schützen.     |
| Abhängigkeiten als statisch behandeln        | Nach dem Release entstehen neue Schwachstellen.              | Kontinuierlich überwachen, aktualisieren und prüfen. |

## Zusammenfassung

- Sichere Auslieferung verbindet technische und organisatorische Kontrollen.
- Geringste Rechte, Pinning, geschützte Umgebungen, Branch Protection, Audit-Logs und Dependency-Hygiene verstärken sich gegenseitig.
- Sicherheitskontrollen müssen kontinuierlich geprüft, getestet und verbessert werden.

## Weiterführende Links

- Vorheriges Kapitel: [Dependabot](44-dependabot.md)
- Übung: [Einen sicheren Auslieferungs-Workflow prüfen](../../exercises/de/45-audit-a-secure-delivery-workflow.md)
- Lab: [Eine Prüfung der Sicherheitskontrollen durchführen](../../labs/de/45-run-a-security-controls-review.md)
- Quiz: [Quiz zu Security Best Practices](../../quizzes/de/45-security-best-practices-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
