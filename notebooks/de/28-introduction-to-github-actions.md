---
chapter: 28
title: "Einführung in GitHub Actions"
part: "GitHub Actions"
level: Beginner
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](27-gitlab-devsecops-security-scans-and-compliance.md) | [Übung](../../exercises/de/28-create-your-first-github-actions-workflow.md) | [Lab](../../labs/de/28-run-a-github-actions-workflow.md) | [Quiz](../../quizzes/de/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels können Sie:

- erklären, welche Aufgaben GitHub Actions automatisiert und wann sie ausgeführt werden;
- ein Ereignis, einen Workflow, einen Job, einen Schritt und eine Action unterscheiden;
- das erwartete Verzeichnis `.github/workflows` erstellen und eine gültige Workflow-Datei erkennen;
- einen gezielten Trigger auswählen und erklären, warum minimale Berechtigungen wichtig sind.

## Einführung

GitHub Actions ist die Automatisierungsplattform von GitHub. Sie kann Software bauen, Tests ausführen, Code prüfen, Pakete veröffentlichen und Anwendungen als Reaktion auf Repository-Ereignisse oder eine manuelle Anfrage bereitstellen. Automatisierung macht einen wiederholbaren Prozess neben dem Code sichtbar, für den er gilt.

## Warum das wichtig ist

Ein Workflow verwandelt eine Teamregel wie „Jeder Pull Request muss die Tests bestehen“ in eine ausführbare und überprüfbare Definition. Die Workflow-Datei liegt im Repository. Dadurch können Änderungen an der Automatisierung geprüft, versioniert und zusammen mit der Anwendung reproduziert werden.

## Wichtige Begriffe

| Begriff  | Bedeutung                                                                                                                  |
| -------- | -------------------------------------------------------------------------------------------------------------------------- |
| Action   | Eine wiederverwendbare Einheit der Automatisierung, die von GitHub, der Community oder dem Repository bereitgestellt wird. |
| Ereignis | Etwas, das einen Workflow startet, zum Beispiel `push`, `pull_request` oder `workflow_dispatch`.                           |
| Workflow | Eine YAML-Datei, die einen automatisierten Prozess beschreibt.                                                             |
| Job      | Eine Gruppe von Schritten, die gemeinsam auf einem Runner ausgeführt werden.                                               |
| Schritt  | Ein einzelner Befehl oder Action-Aufruf innerhalb eines Jobs.                                                              |
| Runner   | Die Maschine, auf der ein Job ausgeführt wird.                                                                             |

## Theorie

### Ereignisse starten Workflows

Ein Ereignis bildet die Grenze zwischen Aktivitäten im Repository und der Automatisierung. Ein `push`-Trigger eignet sich, um committete Änderungen zu prüfen. Ein `pull_request`-Trigger gibt Reviewern Feedback, bevor eine Änderung zusammengeführt wird. `workflow_dispatch` fügt eine ausdrücklich manuelle Schaltfläche für kontrollierte Vorgänge hinzu.

### Workflows liegen in einem bekannten Verzeichnis

GitHub sucht Workflow-Definitionen in `.github/workflows`. Dateien in einem anderen Verzeichnis können gültiges YAML sein, werden aber nicht als Actions-Workflows erkannt. Verwenden Sie einen beschreibenden Dateinamen mit der Endung `.yml` oder `.yaml`.

### Berechtigungen gehören zum Design

Der Schlüssel `permissions` steuert den Zugriff, den das `GITHUB_TOKEN` des Workflows erhält. Beginnen Sie mit dem kleinsten erforderlichen Zugriff. Für einen Workflow, der nur Tests ausführt, reicht `contents: read` oft aus. Ein Job, der ein Release veröffentlicht, benötigt eine bewusst geprüfte Berechtigung und keine pauschale Schreibberechtigung.

## Praktisches Beispiel

Erstellen Sie `.github/workflows/ci.yml`:

```yaml
name: Continuous Integration

on:
  push:
    branches: [main]
  pull_request:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository
        uses: actions/checkout@v4
      - name: Show the changed workspace
        run: git status --short
```

Die `on`-Map definiert drei Möglichkeiten, den Workflow zu starten. Der Job `check` läuft auf einem von GitHub bereitgestellten Runner. Sein erster Schritt verwendet eine wiederverwendbare Action; sein zweiter Schritt führt einen Shell-Befehl aus. Die Nur-Lese-Berechtigung macht den vorgesehenen Zugriff ausdrücklich.

## Probieren Sie es selbst aus

1. Erstellen Sie in einem Übungsrepository das Verzeichnis `.github/workflows`.
2. Fügen Sie das Beispiel als `introduction.yml` hinzu.
3. Ändern Sie den Branch-Filter und erklären Sie, welche Pushes den Workflow starten.
4. Bestimmen Sie, welcher Schritt ein Action-Aufruf und welcher ein Shell-Befehl ist.

## Best Practices

- Halten Sie jeden Workflow auf einen Zweck konzentriert, etwa Validierung oder Deployment.
- Fixieren Sie Action-Referenzen auf eine geprüfte Hauptversion oder eine stärkere unveränderliche Referenz.
- Deklarieren Sie Berechtigungen ausdrücklich und vergeben Sie nur, was der Workflow benötigt.
- Geben Sie Workflows und Schritten Namen, die ihren beobachtbaren Zweck erklären.

## Häufige Fehler

| Fehler                                            | Warum er Probleme verursacht                                                                   | So vermeiden Sie ihn                                                          |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| Datei außerhalb von `.github/workflows` speichern | GitHub erkennt sie nicht als Workflow.                                                         | Prüfen Sie das genaue Verzeichnis und die Dateiendung.                        |
| Für Tests `write-all`-Berechtigungen verwenden    | Ein kompromittierter Schritt erhält unnötigen Zugriff.                                         | Beginnen Sie mit `contents: read` und ergänzen Sie nur nötige Berechtigungen. |
| `run` mit `uses` verwechseln                      | Ein Shell-Befehl und eine wiederverwendbare Action haben unterschiedliche Syntax und Semantik. | Verwenden Sie `run` für Befehle und `uses` für Actions.                       |
| Unbeabsichtigt jeden Branch auslösen              | Der Workflow verbraucht Zeit und erzeugt störendes Feedback.                                   | Wählen Sie Ereignisse und Branch-Filter bewusst aus.                          |

## Zusammenfassung

- GitHub Actions verbindet Repository-Ereignisse mit wiederholbarer Automatisierung.
- Workflow-YAML-Dateien gehören nach `.github/workflows`.
- Workflows enthalten Jobs, Jobs enthalten Schritte, und Schritte führen Befehle oder Actions aus.
- Explizite, minimale Berechtigungen verringern die Auswirkungen von Fehlern oder einer Kompromittierung.

### Verwandte Inhalte

- Übung: [Ihren ersten GitHub-Actions-Workflow erstellen](../../exercises/de/28-create-your-first-github-actions-workflow.md)
- Lab: [Einen GitHub-Actions-Workflow ausführen](../../labs/de/28-run-a-github-actions-workflow.md)
- Quiz: [Quiz zur Einführung in GitHub Actions](../../quizzes/de/28-introduction-to-github-actions-quiz.md)
