---
chapter: 31
title: "GitHub-Actions-Jobs und -Schritte entwerfen"
related_notebook: "GitHub-Actions-Jobs und -Schritte"
level: Beginner
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/30-yaml-fundamentals.md) | [Notebook](../../notebooks/de/31-github-actions-jobs-and-steps.md) | [Lab](../../labs/de/31-build-a-job-dependency-workflow.md) | [Quiz](../../quizzes/de/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitHub-Actions-Jobs und -Schritte entwerfen

## Ziel

Entwirf einen Workflow-Graphen, der parallele Arbeit, Abhängigkeiten und eine kleine Job-Ausgabe sichtbar macht.

## Lernergebnisse

- die richtige Job-Grenze identifizieren;
- `needs`-Abhängigkeiten deklarieren;
- die Ausgabe eines Schritts einer Job-Ausgabe zuordnen.

## Szenario

Dein Team möchte, dass Linting und Unit-Tests nach dem Checkout unabhängig voneinander laufen, während das Packaging auf beide Prüfungen wartet und einen generierten Artefaktnamen verwendet.

## Aufgaben

### Aufgabe 1

Skizziere Jobs mit den Namen `lint`, `test` und `package`. Entscheide, welche Jobs parallel laufen können und welcher Job warten muss.

### Erwartetes Ergebnis

`lint` und `test` sind unabhängig; `package` deklariert `needs: [lint, test]`.

### Aufgabe 2

Füge einen `prepare`-Schritt hinzu, der `artifact_name=app-${GITHUB_SHA::7}` in `$GITHUB_OUTPUT` schreibt, und stelle ihn als Job-Ausgabe bereit.

### Erwartetes Ergebnis

Der Package-Job kann `needs.<job-id>.outputs.artifact_name` lesen, ohne ein Secret zu verwenden.

### Aufgabe 3

Prüfe den Workflow auf versehentliche Abhängigkeiten, unklare Namen und übermäßige Berechtigungen.

### Erwartetes Ergebnis

Der Graph ist lesbar, es werden nur tatsächliche Abhängigkeiten deklariert und die Berechtigungen folgen dem Prinzip der geringsten Rechte.

## Selbsteinschätzung

- [ ] Ich kann einen Job von einem Schritt unterscheiden.
- [ ] Ich kann erklären, warum `needs` erforderlich ist.
- [ ] Ich kann einen kleinen, nicht sensiblen Wert zwischen Jobs übergeben.

## Zusammenfassung

Modelliere den Abhängigkeitsgraphen ausdrücklich und halte zwischen Jobs übergebene Daten klein und nicht sensibel.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Jobs und -Schritte](../../notebooks/de/31-github-actions-jobs-and-steps.md)
- Lab: [Einen Workflow mit Job-Abhängigkeit erstellen](../../labs/de/31-build-a-job-dependency-workflow.md)
- Quiz: [Quiz zu GitHub-Actions-Jobs und -Schritten](../../quizzes/de/31-github-actions-jobs-and-steps-quiz.md)
