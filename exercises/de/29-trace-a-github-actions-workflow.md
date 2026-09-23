---
chapter: 29
title: "Einen GitHub-Actions-Workflow nachvollziehen"
related_notebook: "Anatomie eines GitHub-Actions-Workflows"
level: Beginner
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/29-github-actions-workflow-anatomy.md) | [Lab](../../labs/de/29-review-workflow-execution.md) | [Quiz](../../quizzes/de/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ziel

Verfolge einen Workflow von seinem Trigger über Jobs und Schritte und erkläre anschließend die Ausführungsreihenfolge.

## Lernergebnisse

- übergeordnete Schlüssel ihren Aufgaben zuordnen;
- eine durch `needs` erzeugte Job-Abhängigkeit identifizieren;
- erkennen, warum getrennte Jobs eine getrennte Einrichtung benötigen.

## Voraussetzungen

- Lies das Notebook zu Kapitel 29.
- Du kannst grundlegende YAML-Maps und -Listen lesen.

## Szenario

Verwende diesen Workflow als Übung zur Überprüfung:

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
      - uses: actions/checkout@v4
      - run: git ls-files
  report:
    needs: inspect
    runs-on: ubuntu-latest
    steps:
      - run: echo "Inspection completed"
```

## Aufgaben

### Aufgabe 1

Liste die übergeordneten Schlüssel auf und schreibe jeweils einen Satz, der den Zweck jedes Schlüssels beschreibt.

### Erwartetes Ergebnis: Übergeordnete Schlüssel

Du identifizierst `name`, `on`, `permissions` und `jobs`, ohne sie mit verschachtelten Schlüsseln zu verwechseln.

### Aufgabe 2

Zeichne die Ausführungsfolge und markiere den Punkt, an dem `report` auf `inspect` wartet.

### Erwartetes Ergebnis: Ausführungsreihenfolge

Du zeigst das Ereignis, das `inspect` startet, seine geordneten Schritte, den erfolgreichen Abschluss und anschließend `report`.

### Aufgabe 3

Erkläre, warum ein Checkout in `inspect` Dateien nicht automatisch für `report` verfügbar macht.

### Erwartetes Ergebnis: Job-Isolation

Du erkennst, dass Jobs normalerweise separate Runner verwenden und ihre eigene Einrichtung oder eine explizite Artefaktübertragung benötigen.

## Herausforderung

Füge einen dritten Job hinzu, der erst nach `report` ausgeführt wird. Entscheide anschließend, ob er einen Checkout benötigt, und begründe deine Antwort.

## Selbsteinschätzung

- [ ] Ich kann einen Workflow von der Wurzel abwärts lesen.
- [ ] Ich weiß, was `needs` verbindet.
- [ ] Ich verstehe die Isolation von Jobs.

## Häufige Fehler

| Fehler                                                   | Lösung                                                        |
| -------------------------------------------------------- | ------------------------------------------------------------- |
| `needs` als Schritt-Schlüssel behandeln                  | Bei einem Job verwenden, um die Job-Reihenfolge auszudrücken. |
| Annehmen, dass Checkout über Jobs hinweg bestehen bleibt | Einrichtung wiederholen oder Daten explizit übergeben.        |
| Trigger-Filter ignorieren                                | Ereignis-Map und Branch-Filter gemeinsam lesen.               |

## Zusammenfassung

Einen Workflow nachzuvollziehen bedeutet, Ereignis-, Berechtigungs-, Job-, Runner-, Abhängigkeits- und Schrittbeziehungen in der richtigen Reihenfolge zu verfolgen.

### Verwandte Inhalte

- Notebook: [Anatomie eines GitHub-Actions-Workflows](../../notebooks/de/29-github-actions-workflow-anatomy.md)
- Lab: [Workflow-Ausführung überprüfen](../../labs/de/29-review-workflow-execution.md)
- Quiz: [Quiz zur Workflow-Anatomie](../../quizzes/de/29-workflow-anatomy-quiz.md)
