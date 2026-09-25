---
chapter: 29
title: "Anatomie eines GitHub-Actions-Workflows"
part: "GitHub Actions"
level: Beginner
estimated_time: 85 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](27-gitlab-devsecops-security-scans-and-compliance.md) | [Übung](../../exercises/de/29-trace-a-github-actions-workflow.md) | [Lab](../../labs/de/29-review-workflow-execution.md) | [Quiz](../../quizzes/de/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels können Sie:

- die übergeordnete Struktur eines GitHub-Actions-Workflows lesen;
- erklären, wie Trigger, Berechtigungen, Jobs und Schritte zusammenhängen;
- einen Workflow von einem Ereignis über einen Job bis zu seinen einzelnen Schritten verfolgen;
- erkennen, an welchen Stellen spätere Kapitel Runner, Actions und Job-Details ergänzen.

## Einführung

Ein Workflow ist ein strukturiertes Dokument und keine Liste unabhängiger Befehle. Seine Schlüssel auf oberster Ebene beschreiben Identität, Startbedingungen, Zugriff und Arbeit des Workflows. Wenn Sie diese Struktur von außen nach innen lesen, lassen sich Fehler leichter eingrenzen.

## Wichtige Begriffe

| Begriff                      | Bedeutung                                                                              |
| ---------------------------- | -------------------------------------------------------------------------------------- |
| Schlüssel auf oberster Ebene | Ein Schlüssel direkt unter der Wurzel des Workflow-Dokuments, etwa `name` oder `jobs`. |
| Trigger                      | Die `on`-Definition, die Ereignisse und optionale Filter auswählt.                     |
| Job-Bezeichner               | Ein eindeutiger Schlüssel unter `jobs`, der eine Arbeitseinheit benennt.               |
| Runner-Label                 | Der Wert von `runs-on`, der die Ausführungsumgebung auswählt.                          |
| Abhängigkeit                 | Eine Beziehung, durch die ein Job mit `needs` auf einen anderen wartet.                |

## Theorie

### Die Form eines Workflows

```yaml
name: Validate application
on:
  pull_request:
permissions:
  contents: read
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: ./scripts/test.sh
```

`name` beschriftet den Workflow in der Actions-Oberfläche. `on` wählt Ereignisse aus. `permissions` legt den Token-Zugriff fest. `jobs` enthält eine oder mehrere Job-Maps. Jeder Job wählt einen Runner und definiert eine geordnete Liste `steps`.

### Trigger und Filter

Trigger können einfach sein, etwa `workflow_dispatch`, oder Maps mit Filtern:

```yaml
on:
  push:
    branches: [main]
    paths:
      - "src/**"
  pull_request:
    branches: [main]
```

Filter reduzieren unnötige Ausführungen, verändern aber auch, wann Feedback erscheint. Ein Pfadfilter, der eine Konfigurationsdatei ausschließt, kann dazu führen, dass eine relevante Änderung nicht validiert wird. Erklären Sie immer die Grenze, die ein Filter erzeugt.

### Überblick über Jobs und Schritte

Jobs sind getrennte Ausführungseinheiten. Ohne Abhängigkeit können Jobs parallel laufen. `needs: build` lässt einen späteren Job auf den Job `build` warten. Schritte innerhalb eines Jobs laufen der Reihe nach und teilen sich den Workspace des Jobs. Ein Schritt kann eine Action verwenden oder einen Befehl ausführen; außerdem kann er Umgebungsvariablen, ein Arbeitsverzeichnis oder eine Bedingung definieren.

### Ausdrücke und Kontexte

Ausdrücke verwenden die Form `${{ ... }}`, um Werte wie Ereignisdaten zu lesen:

```yaml
if: ${{ github.event_name == 'pull_request' }}
```

Actions wertet Ausdrücke aus, während YAML die umgebende Struktur bereitstellt. Halten Sie Ausdrücke lesbar und setzen Sie nicht vertrauenswürdigen Ereignistext nicht direkt in Shell-Befehle ein.

## Praktisches Beispiel

Verfolgen Sie diesen Workflow zunächst auf Papier, bevor Sie die Erklärung lesen:

```yaml
name: Review gate
on:
  pull_request:
    branches: [main]
permissions:
  contents: read
jobs:
  inspect:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Inspect files
        run: git ls-files
  report:
    needs: inspect
    runs-on: ubuntu-latest
    steps:
      - name: Report completion
        run: echo "Inspection completed"
```

Nur Pull Requests mit Ziel `main` starten den Workflow. `inspect` beginnt zuerst. `report` wartet, bis `inspect` erfolgreich war, und läuft anschließend auf einem separaten Job-Runner. Der Checkout-Schritt wird nicht automatisch mit `report` geteilt; getrennte Jobs benötigen jeweils ihre eigene Einrichtung, wenn sie Repository-Dateien brauchen.

## Probieren Sie es selbst aus

Listen Sie die Schlüssel des Workflows auf und beantworten Sie dann: Welches Ereignis startet ihn, welche Berechtigung wird vergeben, welcher Job läuft zuerst und warum wartet der zweite Job? Markieren Sie anschließend jede Zeile als YAML-Struktur, Action-Referenz, Shell-Befehl oder Ausdruck.

## Best Practices

- Lesen Sie Workflows von der Absicht auf oberster Ebene bis zu den einzelnen Befehlen.
- Verwenden Sie `needs`, um die Job-Reihenfolge ausdrücklich festzulegen, statt sich auf zufällige Zeitabläufe zu verlassen.
- Wiederholen Sie die erforderliche Einrichtung in jedem Job, weil Jobs isolierte Ausführungsumgebungen haben.
- Prüfen Sie Trigger-Filter, wenn sich Repository-Pfade oder Branch-Regeln ändern.

## Häufige Fehler

| Fehler                                              | Warum er Probleme verursacht                                       | So vermeiden Sie ihn                                                                 |
| --------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| Annahme, Jobs teilten Dateien automatisch           | Jobs laufen normalerweise auf getrennten Runnern.                  | Checken Sie benötigte Daten in jedem Job aus oder übertragen Sie sie.                |
| `needs` als Schritt-Abhängigkeit behandeln          | `needs` verbindet Jobs, nicht Schritte.                            | Halten Sie die Schritt-Reihenfolge in `steps` und die Job-Reihenfolge unter `needs`. |
| Breiten Trigger hinter einer kurzen Datei verbergen | Reviewer übersehen möglicherweise, wann die Automatisierung läuft. | Dokumentieren Sie Filter durch klare Namen und eine fokussierte Struktur.            |
| YAML- und Ausdruckssyntax mischen                   | Parser oder Actions-Auswertung erhalten den falschen Wert.         | Prüfen Sie die Einrückung und verwenden Sie `${{ }}` nur bei benötigten Ausdrücken.  |

## Zusammenfassung

Die Anatomie eines Workflows lässt sich am einfachsten so verstehen: `on` startet `jobs`, jeder Job wählt `runs-on`, und geordnete `steps` führen Actions oder Befehle aus. Berechtigungen und Ausdrücke ergänzen Kontrolle, ändern aber diese Grundform nicht.

### Verwandte Inhalte

- Übung: [Einen GitHub-Actions-Workflow verfolgen](../../exercises/de/29-trace-a-github-actions-workflow.md)
- Lab: [Eine Workflow-Ausführung prüfen](../../labs/de/29-review-workflow-execution.md)
- Quiz: [Quiz zur Workflow-Anatomie](../../quizzes/de/29-workflow-anatomy-quiz.md)
