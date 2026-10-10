---
chapter: 32
title: "GitHub-Actions-Runner"
part: "GitHub Actions"
level: Beginner
estimated_time: 70 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](31-github-actions-jobs-and-steps.md) | [Übung](../../exercises/de/32-select-github-runners.md) | [Lab](../../labs/de/32-configure-runner-selection.md) | [Quiz](../../quizzes/de/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- von GitHub bereitgestellte und selbst gehostete Runner vergleichen;
- Runner mit Labels auswählen und Runner-Gruppen verstehen;
- Vertrauen, Isolation, Wartung und Offenlegung von Secrets bewerten, bevor ein Runner verwendet wird.

## Einführung

Ein Runner ist die Maschine, auf der ein Job ausgeführt wird. Die Wahl des Runners beeinflusst Betriebssystem-Kompatibilität, verfügbare Werkzeuge, Startzeit, Kosten, Netzwerkzugriff und den Wirkungsbereich nicht vertrauenswürdigen Workflow-Codes.

## Wichtige Begriffe

| Begriff                            | Definition                                                                                     |
| ---------------------------------- | ---------------------------------------------------------------------------------------------- |
| Von GitHub bereitgestellter Runner | Eine temporäre virtuelle Maschine, die GitHub für einen Job verwaltet.                         |
| Selbst gehosteter Runner           | Eine Maschine, die von einer Organisation oder einem Repository registriert und gewartet wird. |
| Label                              | Ein Fähigkeits- oder Routing-Tag, das von `runs-on` verwendet wird.                            |
| Runner-Gruppe                      | Eine administrative Grenze, die steuert, welche Repositories Runner verwenden können.          |
| Vertrauensgrenze                   | Der Punkt, an dem Code oder Identitäten Zugriff auf eine andere Umgebung erhalten.             |

## Theorie

### Gehostete Runner

Gehostete Runner stellen saubere, kurzlebige Maschinen und einen dokumentierten Satz von Images bereit. Sie sind praktisch für öffentliche Werkzeuge und gewöhnliche Build-Jobs. Repository-Inhalte und Pull-Request-Code müssen trotzdem vorsichtig behandelt werden, weil Workflow-Code mit den ihm gewährten Berechtigungen ausgeführt wird.

### Selbst gehostete Runner

Selbst gehostete Runner eignen sich für private Netzwerke, spezielle Hardware, benutzerdefinierte Werkzeuge oder vorhersehbare Umgebungen. Sie erfordern Patchen, Zugriffskontrolle, Überwachung, Bereinigung und Kapazitätsverwaltung. Ein dauerhafter Runner kann nach einem Job Dateien oder Zugangsdaten behalten. Isolation ist daher eine Sicherheitsanforderung und keine rein optische Präferenz.

### Labels und Gruppen

```yaml
jobs:
  integration:
    runs-on: [self-hosted, linux, integration]
    steps:
      - uses: actions/checkout@v4
      - run: ./scripts/run-integration-tests.sh
```

Jedes Label im Array muss zum ausgewählten Runner passen. Labels beschreiben Fähigkeiten, keine Autorisierung. Verwenden Sie Runner-Gruppen und Repository-Regeln, um festzulegen, wer Jobs auf sensible Maschinen routen darf.

### Vertrauensentscheidungen

Senden Sie Pull Requests aus Forks oder ungeprüften externen Code nicht an einen selbst gehosteten Runner mit Zugriff auf Produktionsnetzwerke oder langlebige Secrets. Bevorzugen Sie gehostete Runner, isolierte kurzlebige Maschinen oder eine Genehmigungsstufe für nicht vertrauenswürdige Eingaben.

## Best Practices

- Beginnen Sie mit gehosteten Runnern, sofern keine klare Anforderung Self-Hosting rechtfertigt.
- Halten Sie selbst gehostete Runner gepatcht, beobachtbar und möglichst wegwerfbar.
- Verwenden Sie spezifische Labels, die geprüfte Fähigkeiten beschreiben.
- Trennen Sie vertrauenswürdige Deployment-Runner von allgemeinen Build-Runnern.
- Prüfen Sie Workflow-Trigger und Berechtigungen gemeinsam mit dem Standort des Runners.

## Häufige Fehler

| Fehler                                                          | Auswirkung                                                   | Besserer Ansatz                                                        |
| --------------------------------------------------------------- | ------------------------------------------------------------ | ---------------------------------------------------------------------- |
| `self-hosted` als harmloses Label behandeln                     | Sensible Jobs können eine dauerhafte Maschine erreichen.     | Verwenden Sie dedizierte Gruppen und Labels.                           |
| Werkzeuge ohne Aufzeichnungen manuell installieren              | Builds werden schwer reproduzierbar.                         | Automatisieren und dokumentieren Sie die Einrichtung.                  |
| Einen Runner nach nicht vertrauenswürdigem Code wiederverwenden | Dateien oder Zugangsdaten können zwischen Jobs durchsickern. | Verwenden Sie Isolation und Bereinigung oder einen kurzlebigen Runner. |

## Zusammenfassung

Die Runner-Auswahl ist eine Ausführungs- und Sicherheitsentscheidung. Labels routen Arbeit, Gruppen begrenzen den Zugriff, und die Vertrauensanalyse bestimmt, ob ein Job auf einen gehosteten, isolierten oder selbst gehosteten Runner gehört.

### Verwandte Inhalte

- Vorheriges Notebook: [Jobs und Schritte in GitHub Actions](31-github-actions-jobs-and-steps.md)
- Übung: [GitHub-Runner auswählen](../../exercises/de/32-select-github-runners.md)
- Lab: [Runner-Auswahl konfigurieren](../../labs/de/32-configure-runner-selection.md)
- Quiz: [Quiz zu GitHub-Actions-Runnern](../../quizzes/de/32-github-runners-quiz.md)
