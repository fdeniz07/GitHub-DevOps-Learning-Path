---
chapter: 29
title: "Die Ausführung eines Workflows überprüfen"
related_notebook: "Anatomie eines GitHub-Actions-Workflows"
related_exercise: "Einen GitHub-Actions-Workflow nachvollziehen"
level: Beginner
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/29-github-actions-workflow-anatomy.md) | [Übung](../../exercises/de/29-trace-a-github-actions-workflow.md) | [Quiz](../../quizzes/de/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ziel

Verwende die Actions-Oberfläche, um zu überprüfen, wie aus einem Ereignis Jobs, Schritte, Protokolle und ein finaler Status wurden.

## Lernergebnisse

- einen Lauf mit seinem auslösenden Ereignis und Commit verbinden;
- den Jobstatus vom Status einzelner Schritte unterscheiden;
- eine durch Abhängigkeiten bestimmte Ausführungsreihenfolge erkennen.

## Szenario

Überprüfe einen Workflow mit einem `inspect`-Job und einem davon abhängigen `report`-Job. Deine Aufgabe ist es, Belege zu erstellen, die nicht nur erklären, ob der Lauf erfolgreich war, sondern auch, wie er ausgeführt wurde.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- Ein Repository mit einem Workflow, der mindestens zwei Jobs enthält.
- Die Berechtigung, Actions-Läufe anzuzeigen.

## Umgebung einrichten

| Anforderung    | Wert                                       |
| -------------- | ------------------------------------------ |
| Betriebssystem | Windows, Linux oder macOS                  |
| Software       | Browser und Texteditor                     |
| Repository     | Ein Übungsrepository mit Workflow-Historie |

## Aufgaben

### Aufgabe 1 - Die Laufgrenze bestimmen

#### Schritte: Die Laufgrenze bestimmen

1. Öffne einen abgeschlossenen Workflow-Lauf.
2. Halte Ereignis, Branch, Commit, Akteur und Workflowname fest.
3. Vergleiche diese Werte mit dem `on`-Block.

#### Erwartetes Ergebnis: Passender Trigger

Du kannst erklären, warum dieser Lauf gestartet wurde und welcher Trigger übereinstimmte.

### Aufgabe 2 - Jobs und Schritte nachvollziehen

#### Schritte: Jobs und Schritte nachvollziehen

1. Halte jede Jobkennung und jedes Runner-Label fest.
2. Erweitere jeden Schritt und notiere, ob er eine Action verwendet oder einen Befehl ausführt.
3. Finde jede `needs`-Beziehung und bestätige die beobachtete Reihenfolge.

#### Erwartetes Ergebnis: Ausführungsgraph

Deine Nachverfolgung zeigt den Ausführungsgraphen des Workflows und die geordneten Schritte innerhalb jedes Jobs.

### Aufgabe 3 - Das Ergebnis überprüfen

#### Schritte: Das Ergebnis überprüfen

1. Finde den ersten fehlgeschlagenen Schritt, falls der Lauf fehlgeschlagen ist.
2. Trenne ein YAML-/Konfigurationsproblem von einem Befehls- oder Umgebungsproblem.
3. Schreibe eine evidenzbasierte nächste Aktion auf.

#### Erwartetes Ergebnis: Nächste Aktion

Die Überprüfung benennt einen wahrscheinlichen Kontrollpunkt, statt den gesamten Workflow als undurchsichtigen Fehler zu behandeln.

## Validierungs-Checkliste

- [ ] Ereignis, Branch und Commit sind festgehalten.
- [ ] Jeder Job und jeder Runner ist identifiziert.
- [ ] Aktionsschritte und Befehlsschritte sind unterschieden.
- [ ] `needs`-Beziehungen sind erklärt.
- [ ] Für jeden Fehler gibt es eine konkrete nächste Aktion.

## Fehlerbehebung

| Problem                           | Mögliche Ursache                         | Lösung                                                                   |
| --------------------------------- | ---------------------------------------- | ------------------------------------------------------------------------ |
| Jobreihenfolge wirkt unerwartet   | Keine Abhängigkeit wurde definiert.      | Prüfe `needs` und beachte, dass unabhängige Jobs parallel laufen können. |
| Späterer Job findet Dateien nicht | Jobs verwenden getrennte Runner.         | Richte den späteren Job ein oder übertrage ein Artefakt.                 |
| Protokolle sind zu umfangreich    | Der Überprüfung fehlt ein Ausgangspunkt. | Suche den ersten fehlschlagenden Schritt und prüfe seinen Kontext.       |

## Best Practices

- Halte unveränderliche Zusammenhänge wie die Commit-SHA fest, wenn möglich.
- Überprüfe den ersten Fehler vor späteren Folgefehlern.
- Behandle Protokolle als Belege und übernimm keine vertraulichen Werte in Notizen.

## Zusammenfassung

Die Überprüfung eines Workflows wird beherrschbar, wenn der Lauf in Ereignis, Job, Abhängigkeit, Schritt, Protokoll und Ergebnis zerlegt wird.

### Verwandte Inhalte

- Notebook: [Anatomie eines GitHub-Actions-Workflows](../../notebooks/de/29-github-actions-workflow-anatomy.md)
- Übung: [Einen GitHub-Actions-Workflow nachvollziehen](../../exercises/de/29-trace-a-github-actions-workflow.md)
- Quiz: [Quiz zur Workflow-Anatomie](../../quizzes/de/29-workflow-anatomy-quiz.md)
