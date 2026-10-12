---
chapter: 43
title: "CodeQL-Analyse"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](42-secrets-and-variables.md) | [Roadmap](../../ROADMAP.md) | [Nächstes Kapitel](44-dependabot.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- erklären, wie CodeQL Sicherheitsprobleme durch semantische Analyse identifiziert.
- einen CodeQL-Workflow mit passenden Berechtigungen und Triggern konfigurieren.
- Findings anhand von Schweregrad, Datenfluss, Erreichbarkeit und Nachweisen zur Behebung untersuchen.

## Einführung

CodeQL behandelt Code als Daten und fragt ihn nach Mustern ab, die mit Schwachstellen verbunden sind. GitHub Advanced Security kann CodeQL-Analysen in GitHub Actions ausführen und Ergebnisse in Code-Scanning-Alerts melden. Ein Alert ist ein Ansatzpunkt für eine Untersuchung, kein automatischer Beweis für einen vorhandenen Exploit.

## Warum das wichtig ist

Statische Analyse kann unsichere Datenflüsse vor dem Deployment erkennen und typische Pfade wie Pull Requests und den Standardbranch schützen. Der Wert entsteht durch zeitnahe Untersuchung: Teams müssen jeden Fund verstehen, beheben, begründet verwerfen oder nachverfolgen.

## Wichtige Begriffe

| Begriff             | Definition                                                     |
| ------------------- | -------------------------------------------------------------- |
| CodeQL              | Eine Engine und Abfragesprache für semantische Codeanalyse.    |
| Code-Scanning-Alert | Ein gemeldetes Ergebnis eines Sicherheitstools.                |
| Untersuchung        | Einen Fund prüfen und entscheiden, wie damit umzugehen ist.    |
| Datenfluss          | Der Weg von Daten von einer Quelle zu einem sensiblen Ziel.    |
| SARIF               | Ein Standardformat zum Austausch statischer Analyseergebnisse. |

## Theorie

CodeQL-Workflows wählen Sprachen, Build-Modi, Abfragesuiten und Trigger. Pull-Request-Analysen geben Entwicklern früh Feedback; geplante Analysen können neu veröffentlichte Verbesserungen an Abfragen oder Änderungen im Standardbranch erkennen. Workflow-Berechtigungen umfassen häufig `security-events: write`, damit Ergebnisse hochgeladen werden können.

Bei der Untersuchung sollten betroffener Code, Quelle, Ziel, Bereinigung, Ausnutzbarkeit und Testabdeckung geprüft werden. Behebe möglichst die Ursache. Eine Zurückweisung sollte einen aussagekräftigen Grund enthalten und nicht dazu dienen, unbequeme Alerts zum Schweigen zu bringen.

### Praktisches Workflow-Beispiel

```yaml
name: CodeQL

on:
  push:
    branches: [main]
  pull_request:
  schedule:
    - cron: "30 2 * * 1"

permissions:
  contents: read
  security-events: write

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        language: [python]
    steps:
      - uses: actions/checkout@v4
      - name: Initialize CodeQL
        uses: github/codeql-action/init@v3
        with:
          languages: ${{ matrix.language }}
      - name: Perform CodeQL analysis
        uses: github/codeql-action/analyze@v3
        with:
          category: /language:${{ matrix.language }}
```

Der Workflow lädt Ergebnisse mit der Berechtigung `security-events: write` hoch. Die genauen Build-Schritte hängen von Sprache und Build-Modus ab. Prüfe die Action-Dokumentation und die Repository-Richtlinie, bevor du Berechtigungen änderst.

## Probiere es selbst aus

1. Aktiviere CodeQL für eine unterstützte Sprache.
2. Untersuche einen Alert von der Quelle bis zum Ziel.
3. Entscheide, ob du ihn behebst, nachverfolgst oder verwirfst, und dokumentiere die Begründung.
4. Füge CodeQL-Ergebnisse zum Pull-Request-Review und zur geplanten Analyse hinzu.

## Best Practices

- Halte CodeQL-Actions aktuell und prüfe Workflow-Berechtigungen.
- Führe Analysen bei Pull Requests, auf dem Standardbranch und bei Bedarf nach Zeitplan aus.
- Untersuche Findings anhand von Nachweisen statt nur anhand des Schweregrads.
- Teste Sicherheitsbehebungen und dokumentiere akzeptierte Risiken.
- Schütze Workflow-Dateien durch Reviews und Branch Protection.

## Häufige Fehler

| Fehler                                             | Warum er Probleme verursacht                       | So vermeidest du ihn                                  |
| -------------------------------------------------- | -------------------------------------------------- | ----------------------------------------------------- |
| Ergebnisse ohne `security-events: write` hochladen | Findings erreichen das Code Scanning nicht.        | Die erforderliche minimale Berechtigung deklarieren.  |
| Jeden Alert als False Positive verwerfen           | Echte Fehler bleiben ungelöst.                     | Datenfluss prüfen und Nachweise dokumentieren.        |
| Nur einmal analysieren                             | Neuer Code und Abfrage-Updates bleiben unentdeckt. | Pull-Request-, Push- und geplante Analysen verwenden. |

## Zusammenfassung

- CodeQL nutzt semantische Abfragen, um riskante Code-Muster und Datenflüsse zu identifizieren.
- Findings erfordern menschliche Untersuchung und dokumentierte Entscheidungen.
- Korrekte Trigger, Berechtigungen und regelmäßige Analysen verbessern die Abdeckung.

## Weiterführende Links

- Vorheriges Kapitel: [Secrets und Variablen](42-secrets-and-variables.md)
- Übung: [CodeQL-Analyse einführen](../../exercises/de/43-introduce-codeql-analysis.md)
- Lab: [Einen CodeQL-Fund untersuchen](../../labs/de/43-triage-a-codeql-finding.md)
- Quiz: [CodeQL-Quiz](../../quizzes/de/43-codeql-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
- Nächstes Kapitel: [Dependabot](44-dependabot.md)
