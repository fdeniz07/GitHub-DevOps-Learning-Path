---
chapter: 31
title: "Jobs und Schritte in GitHub Actions"
part: "GitHub Actions"
level: Beginner
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](30-yaml-fundamentals.md) | [Übung](../../exercises/de/31-design-github-actions-jobs-and-steps.md) | [Lab](../../labs/de/31-build-a-job-dependency-workflow.md) | [Quiz](../../quizzes/de/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels können Sie:

- einen Workflow, Job, Schritt, eine Action und einen Shell-Befehl unterscheiden;
- Jobs mit ausdrücklichen Abhängigkeiten, Bedingungen und Ausgaben nach dem Prinzip der geringsten Berechtigung entwerfen;
- Daten sicher zwischen Jobs übergeben und passende Grenzen für Schritte auswählen.

## Einführung

GitHub-Actions-Workflows bestehen aus Jobs, und Jobs bestehen aus Schritten. Ein gutes Design macht den Ausführungsgraphen sichtbar: Unabhängige Arbeit kann parallel laufen, während abhängige Arbeit erst startet, wenn ihre Voraussetzung erfolgreich war.

## Wichtige Begriffe

| Begriff     | Definition                                                                       |
| ----------- | -------------------------------------------------------------------------------- |
| Workflow    | Ein durch ein Ereignis ausgelöster, in YAML definierter Automatisierungsprozess. |
| Job         | Eine Gruppe von Schritten, die auf einem Runner ausgeführt wird.                 |
| Schritt     | Ein einzelner Befehl oder wiederverwendbarer Action-Aufruf in einem Job.         |
| `needs`     | Eine Abhängigkeit, die Job-Reihenfolge und Erfolgsbedingungen steuert.           |
| Job-Ausgabe | Benannte Daten, die ein Job abhängigen Jobs zur Verfügung stellt.                |

## Theorie

### Jobs bilden einen gerichteten Graphen

Jobs ohne `needs` können gleichzeitig starten. Ein Job mit `needs: build` wartet auf `build`. Verwenden Sie `if: ${{ always() }}` nur, wenn ein Bereinigungs- oder Reporting-Job nach einem Fehler laufen muss. Andernfalls sollten fehlgeschlagene Voraussetzungen abhängige Arbeit stoppen.

### Schritte teilen sich einen Runner

Schritte innerhalb eines Jobs teilen sich den Workspace und das Dateisystem des Runners. Dadurch bilden Checkout, Einrichtung, Build und Test eine natürliche Reihenfolge. Ein neuer Job sorgt für Isolation und einen frischen Runner; Dateien müssen dann aber über Artefakte, Caches oder ausdrückliche Ausgaben übertragen werden.

### Ausgaben und Abhängigkeiten

Schrittausgaben werden über die Ausgabedatei des Runners geschrieben und auf Job-Ausgaben abgebildet. Ein abhängiger Job liest sie über `needs.<job-id>.outputs.<name>`. Ausgaben sollten kleine, nicht sensible Werte wie eine Version oder ein Deployment-Ziel enthalten. Verwenden Sie Ausgaben niemals zum Transport von Geheimnissen.

## Praktisches Beispiel

```yaml
name: Build and verify

on:
  push:
    branches: [main]

jobs:
  prepare:
    runs-on: ubuntu-latest
    outputs:
      image_tag: ${{ steps.version.outputs.image_tag }}
    steps:
      - id: version
        name: Create image tag
        run: echo "image_tag=${GITHUB_SHA::12}" >> "$GITHUB_OUTPUT"

  verify:
    needs: prepare
    runs-on: ubuntu-latest
    steps:
      - name: Show the selected tag
        run: echo "Testing ${{ needs.prepare.outputs.image_tag }}"

  publish:
    needs: [prepare, verify]
    runs-on: ubuntu-latest
    steps:
      - name: Publish only after verification
        run: echo "Publishing ${{ needs.prepare.outputs.image_tag }}"
```

`prepare` erzeugt eine kleine Ausgabe, `verify` verwendet sie, und `publish` hängt von beiden Jobs ab. Der Graph dokumentiert die Freigabegrenze für das Release, statt sich auf die zufällige Reihenfolge im YAML zu verlassen.

## Best Practices

- Geben Sie Jobs und Schritten Namen, die ihren Zweck erklären.
- Verwenden Sie `needs` für echte Abhängigkeiten und lassen Sie unabhängige Jobs parallel laufen.
- Halten Sie Job-Ausgaben klein, bewusst gewählt und frei von Geheimnissen.
- Begrenzen Sie Berechtigungen auf Workflow- oder Job-Ebene und vergeben Sie nur das Erforderliche.
- Trennen Sie Verantwortlichkeiten für Build, Überprüfung und Veröffentlichung.

## Häufige Fehler

| Fehler                                               | Warum er Probleme verursacht                       | So vermeiden Sie ihn                                                 |
| ---------------------------------------------------- | -------------------------------------------------- | -------------------------------------------------------------------- |
| Annahme, die YAML-Reihenfolge erzeuge Abhängigkeiten | Jobs können parallel laufen.                       | Deklarieren Sie `needs` ausdrücklich.                                |
| Wert in die falsche Ausgabedatei schreiben           | Spätere Schritte können den Wert nicht lesen.      | Verwenden Sie `$GITHUB_OUTPUT` und ordnen Sie die Schrittausgabe zu. |
| Zugangsdaten als Job-Ausgaben übergeben              | Ausgaben können in Logs oder Metadaten erscheinen. | Verwenden Sie unterstützte Secrets und kurzlebige Zugangsdaten.      |
| Jeden Job von einem Einrichtungsjob abhängig machen  | Parallelität und Feedback werden langsamer.        | Modellieren Sie nur echte Abhängigkeiten.                            |

## Zusammenfassung

- Ein Workflow ist ein Graph aus Jobs, und jeder Job ist eine Folge von Schritten.
- `needs` beschreibt die Reihenfolge und erstellt den Datenpfad für Job-Ausgaben.
- Gute Grenzen verbessern Lesbarkeit, Isolation, Sicherheit und Parallelität.

### Verwandte Inhalte

- Übung: [Jobs und Schritte in GitHub Actions entwerfen](../../exercises/de/31-design-github-actions-jobs-and-steps.md)
- Lab: [Einen Workflow mit Job-Abhängigkeit erstellen](../../labs/de/31-build-a-job-dependency-workflow.md)
- Quiz: [Quiz zu Jobs und Schritten in GitHub Actions](../../quizzes/de/31-github-actions-jobs-and-steps-quiz.md)
