---
chapter: 39
title: "Kontinuierliche Integration"
part: "Continuous Integration & Continuous Delivery"
level: Beginner
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](38-github-actions-artifacts.md) | [Roadmap](../../ROADMAP.md) | [Nächstes Kapitel](40-continuous-delivery.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- erklären, wie kontinuierliche Integration (CI) Änderungen häufig validiert.
- einen GitHub-Actions-Workflow entwerfen, der Pull Requests erstellt und testet.
- Berechtigungen, Caching und erforderliche Prüfungen nutzen, um CI zuverlässig zu machen.

## Einführung

Kontinuierliche Integration ist die Praxis, kleine Änderungen häufig zusammenzuführen und automatisch zu validieren. Ein CI-Workflow gibt einem Team schnelles Feedback zu Kompilierung, Tests, Formatierung und anderen Qualitätsschranken, bevor eine Änderung zusammengeführt wird.

## Warum das wichtig ist

Ohne CI können fehlerhafte Änderungen verborgen bleiben, bis eine Veröffentlichung dringend wird. Häufige automatische Validierung verkürzt Feedbackschleifen, hält den Standardbranch stabil und macht die Zusammenarbeit sicherer. CI ersetzt keine Code-Reviews; es liefert wiederholbare Nachweise für das Review.

## Wichtige Begriffe

| Begriff                     | Definition                                                                       |
| --------------------------- | -------------------------------------------------------------------------------- |
| Kontinuierliche Integration | Häufige Integration kleiner Änderungen mit automatischer Validierung.            |
| Pull-Request-Prüfung        | Ein von einem automatisierten Workflow gemeldeter Status für einen Pull Request. |
| Erforderliche Statusprüfung | Eine Branch-Protection-Regel, die vor dem Zusammenführen erfolgreich sein muss.  |
| Feedbackschleife            | Die Zeit zwischen einer Änderung und der Erkenntnis, ob sie funktioniert.        |

## Theorie

Eine nützliche CI-Pipeline wird durch Ereignisse ausgelöst, die vorgeschlagene oder integrierte Änderungen darstellen, etwa `pull_request` und `push` auf den Standardbranch. Sie sollte dieselben Abhängigkeiten wie das Projekt installieren, deterministische Prüfungen ausführen und klar fehlschlagen, wenn eine Prüfung fehlschlägt.

CI funktioniert am besten, wenn jeder Job einen Zweck hat. Ein Build-Job kann das Projekt kompilieren, ein Test-Job die Testsuite ausführen und ein Lint-Job den Stil prüfen. Jobs können parallel laufen, wenn sie nicht voneinander abhängen. Der Workflow sollte Ergebnisse über Prüfungen veröffentlichen, statt Fehler in Logs zu verstecken.

### Praktisches Workflow-Beispiel

```yaml
name: Continuous Integration

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"
          cache: pip
      - name: Install dependencies
        run: python -m pip install -r requirements.txt
      - name: Run tests
        run: python -m pytest
```

Der Block `permissions` beschränkt das Workflow-Token auf schreibgeschützten Repository-Zugriff. Der Trigger `pull_request` validiert vorgeschlagene Änderungen, während der Trigger `push` bestätigt, dass der Standardbranch stabil bleibt.

## Probiere es selbst aus

1. Füge unter `.github/workflows/ci.yml` einen CI-Workflow hinzu.
2. Löse ihn für Pull Requests und Pushes auf `main` aus.
3. Füge in der Branch Protection eine erforderliche Statusprüfung `test` oder `validate` hinzu.
4. Öffne einen Pull Request mit einem absichtlich fehlschlagenden Test und beobachte die Prüfung.

## Best Practices

- Halte CI-Jobs deterministisch und schnell genug, um bei jedem Pull Request zu laufen.
- Pinne die Hauptversionen von Actions und prüfe Action-Updates regelmäßig.
- Verwende Berechtigungen nach dem Prinzip der geringsten Rechte und vermeide Secrets in Pull-Request-Workflows.
- Mache Fehler durch klare Schrittbezeichnungen handlungsrelevant.
- Verlange die wichtigen Prüfungen, bevor Änderungen in `main` zusammengeführt werden.

## Häufige Fehler

| Fehler                                                       | Warum er Probleme verursacht                                | So vermeidest du ihn                                                    |
| ------------------------------------------------------------ | ----------------------------------------------------------- | ----------------------------------------------------------------------- |
| CI erst nach der Veröffentlichung ausführen                  | Fehler werden zu spät gefunden.                             | Jeden Pull Request validieren.                                          |
| Jedem Job Schreibzugriff geben                               | Ein kompromittierter Schritt hat übermäßige Berechtigungen. | Minimale `permissions` deklarieren.                                     |
| Lokal und in CI unterschiedliche Abhängigkeiten installieren | Ergebnisse werden inkonsistent.                             | Eine Lock-Datei committen und dasselbe Setup verwenden.                 |
| Flaky Tests ignorieren                                       | Das Signal wird unzuverlässig.                              | Flakiness untersuchen und beheben, statt Wiederholungen zu akzeptieren. |

## Zusammenfassung

- CI integriert kleine Änderungen und validiert sie häufig.
- GitHub Actions kann bauen, testen und erforderliche Prüfungen melden.
- Schnelles Feedback, deterministische Abhängigkeiten und geringste Rechte machen CI nützlich.

## Weiterführende Links

- Vorheriges Kapitel: [GitHub-Actions-Artefakte](38-github-actions-artifacts.md)
- Übung: [Einen Workflow für kontinuierliche Integration entwerfen](../../exercises/de/39-design-a-continuous-integration-workflow.md)
- Lab: [Eine Pipeline für kontinuierliche Integration erstellen](../../labs/de/39-build-a-continuous-integration-pipeline.md)
- Quiz: [Quiz zur kontinuierlichen Integration](../../quizzes/de/39-continuous-integration-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
- Nächstes Kapitel: [Kontinuierliche Bereitstellung](40-continuous-delivery.md)
