---
chapter: 36
title: "Quiz: Matrix-Builds"
related_notebook: "Matrix-Builds in GitHub Actions"
related_exercise: "Einen Matrix-Workflow testen"
related_lab: "Eine Multi-Plattform-Matrix ausführen"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/35-composite-actions.md) | [Notebook](../../notebooks/de/36-github-actions-matrix-builds.md) | [Übung](../../exercises/de/36-test-a-matrix-workflow.md) | [Labor](../../labs/de/36-run-a-multi-platform-matrix.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Matrix-Builds

## Lernziele

- Matrix-Kombinationen berechnen;
- `include` und `exclude` korrekt verwenden;
- das Fehlerverhalten bewusst auswählen.

## Fragen

### Frage 1

Eine Matrix enthält drei Betriebssysteme und zwei Laufzeitversionen. Wie viele Kombinationen gibt es vor Ausschlüssen?

- A. 3
- B. 5
- C. 6
- D. 9

**Antwort:** C. 6

### Frage 2

Welcher Ausdruck liest einen Matrixwert namens `os`?

- A. `${{ job.os }}`
- B. `${{ matrix.os }}`
- C. `${{ include.os }}`
- D. `${{ strategy.os }}`

**Antwort:** B. `${{ matrix.os }}`

### Frage 3

Richtig oder falsch: `exclude` entfernt nicht unterstützte Kombinationen aus der erzeugten Matrix.

**Antwort:** Richtig.

### Frage 4

Wann ist `fail-fast: false` nützlich?

**Erwartete Antwort:** Wenn die Ergebnisse aller Plattformen oder Versionen für die Diagnose wertvoll sind, auch nachdem eine Kombination fehlgeschlagen ist.

### Frage 5

Welchen Zweck hat `include`?

**Erwartete Antwort:** Es fügt Kombinationen Metadaten hinzu oder ergänzt eine ausdrücklich festgelegte besondere Kombination.

## Praxisszenario

Eine Matrix enthält ein nicht unterstütztes Windows-/Laufzeit-Paar. Was solltest du tun, und was solltest du nach der Ausführung prüfen?

**Erwartete Antwort:** Schließe das Paar aus und überprüfe anschließend die erweiterten Jobs und Logs, um zu bestätigen, dass jede unterstützte Kombination ausgeführt wurde.

## Review-Checkliste

- [ ] Ich kann ein kartesisches Produkt berechnen.
- [ ] Ich weiß, wann `include` und `exclude` verwendet werden.
- [ ] Ich kann `fail-fast` begründen.

### Zugehörige Inhalte

- Vorheriges Kapitel: [Composite Actions](../../notebooks/de/35-composite-actions.md)
- Notebook: [Matrix-Builds in GitHub Actions](../../notebooks/de/36-github-actions-matrix-builds.md)
- Übung: [Einen Matrix-Workflow testen](../../exercises/de/36-test-a-matrix-workflow.md)
- Labor: [Eine Multi-Plattform-Matrix ausführen](../../labs/de/36-run-a-multi-platform-matrix.md)
