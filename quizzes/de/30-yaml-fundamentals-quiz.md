---
chapter: 30
title: "Quiz: YAML-Grundlagen"
related_notebook: "YAML-Grundlagen für GitHub Actions"
related_exercise: "GitHub-Actions-YAML üben"
related_lab: "Einen gültigen Actions-Workflow erstellen"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/30-yaml-fundamentals.md) | [Übung](../../exercises/de/30-practice-github-actions-yaml.md) | [Labor](../../labs/de/30-build-a-valid-actions-workflow.md) | [Roadmap](../../ROADMAP.md)

## Zweck

Überprüfe dein Verständnis von YAML-Zuordnungen, Listen, Einrückung, Ausdrücken und häufigen Fehlern.

## Fragen

### Frage 1

Was vermittelt die Einrückung in YAML?

- A. Das Veröffentlichungsdatum der Datei
- B. Die Eltern-Kind-Struktur
- C. Das Betriebssystem des Runners
- D. Den geheimen Wert des Workflows

**Antwort:** B. Die Eltern-Kind-Struktur.

### Frage 2

Welche Syntax beginnt ein Listenelement in einem Block?

- A. `:`
- B. `#`
- C. `-`
- D. `${{ }}`

**Antwort:** C. `-`

### Frage 3

Richtig oder falsch: Tabs sind ein sicherer Ersatz für Leerzeichen bei der YAML-Einrückung.

**Antwort:** Falsch.

### Frage 4

Welche Form ist ein GitHub-Actions-Ausdruck?

- A. `if: github.ref == main`
- B. `if: ${{ github.ref == 'refs/heads/main' }}`
- C. `if -> github.ref`
- D. `if: [github.ref]`

**Antwort:** B. `if: ${{ github.ref == 'refs/heads/main' }}`

### Frage 5

Was kann passieren, wenn ein Listenelement unter dem falschen Schlüssel eingerückt ist?

**Erwartete Antwort:** Der Parser kann die Datei ablehnen oder das Element als zu einem anderen übergeordneten Element gehörend interpretieren. Dadurch ändert sich das Verhalten des Workflows.

### Frage 6

### Praxisszenario

Der Text `name: Build #1` zeigt nur `Build` als Wert an. Warum?

**Erwartete Antwort:** Das nicht in Anführungszeichen gesetzte `#` beginnt einen Kommentar. Verwende `name: "Build #1"`, wenn das Zeichen Teil des Werts ist.

## Review-Checkliste

- [ ] Ich kann Zuordnungen, Listen und Skalare erkennen.
- [ ] Ich kann Einrückung und die Grenzen von Ausdrücken erklären.
- [ ] Ich kann häufige YAML-Fehler vor dem Ausführen des Workflows benennen.

### Zugehörige Inhalte

- Notebook: [YAML-Grundlagen für GitHub Actions](../../notebooks/de/30-yaml-fundamentals.md)
- Übung: [GitHub-Actions-YAML üben](../../exercises/de/30-practice-github-actions-yaml.md)
- Labor: [Einen gültigen Actions-Workflow erstellen](../../labs/de/30-build-a-valid-actions-workflow.md)
