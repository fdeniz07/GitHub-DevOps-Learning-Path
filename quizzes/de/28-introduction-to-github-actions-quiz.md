---
chapter: 28
title: "Quiz: Einführung in GitHub Actions"
related_notebook: "Einführung in GitHub Actions"
related_exercise: "Deinen ersten GitHub-Actions-Workflow erstellen"
related_lab: "Einen GitHub-Actions-Workflow ausführen"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/28-introduction-to-github-actions.md) | [Übung](../../exercises/de/28-create-your-first-github-actions-workflow.md) | [Labor](../../labs/de/28-run-a-github-actions-workflow.md) | [Roadmap](../../ROADMAP.md)

## Zweck

Überprüfe dein Verständnis des Zwecks von GitHub Actions, von Ereignissen, dem Speicherort von Workflows und von Berechtigungen.

## Fragen

### Frage 1

Wo muss eine Workflow-Datei eines Repositorys gespeichert werden?

- A. `.github/workflows`
- B. `.github/actions`
- C. `workflows/.github`
- D. `actions`

**Antwort:** A. `.github/workflows`

### Frage 2

Was ist ein Ereignis?

- A. Eine Maschine, die einen Job ausführt
- B. Etwas, das einen Workflow startet
- C. Ein Befehl innerhalb eines Schritts
- D. Eine Berechtigungsvergabe

**Antwort:** B. Etwas, das einen Workflow startet.

### Frage 3

Richtig oder falsch: `workflow_dispatch` kann eine manuelle Möglichkeit zum Starten eines Workflows bereitstellen.

**Antwort:** Richtig.

### Frage 4

Warum sollte ein Workflow, der nur Tests ausführt, normalerweise minimale Berechtigungen deklarieren?

**Erwartete Antwort:** Minimale Berechtigungen verringern den Zugriff, der einem fehlerhaften oder kompromittierten Schritt zur Verfügung steht.

### Frage 5

Was ist der Unterschied zwischen `run` und `uses`?

**Erwartete Antwort:** `run` führt einen Shell-Befehl aus; `uses` ruft eine wiederverwendbare Action auf.

### Frage 6

### Praxisszenario

Ein Workflow befindet sich im Stammverzeichnis des Repositorys, erscheint aber nicht in der Actions-Oberfläche. Was solltest du zuerst prüfen?

**Erwartete Antwort:** Prüfe, ob die Datei unter `.github/workflows` committed ist und die Erweiterung `.yml` oder `.yaml` besitzt.

## Review-Checkliste

- [ ] Ich kann Ereignisse und Workflows erklären.
- [ ] Ich kenne das erforderliche Workflow-Verzeichnis.
- [ ] Ich verstehe, warum Berechtigungen minimal sein sollten.

### Zugehörige Inhalte

- Notebook: [Einführung in GitHub Actions](../../notebooks/de/28-introduction-to-github-actions.md)
- Übung: [Deinen ersten GitHub-Actions-Workflow erstellen](../../exercises/de/28-create-your-first-github-actions-workflow.md)
- Labor: [Einen GitHub-Actions-Workflow ausführen](../../labs/de/28-run-a-github-actions-workflow.md)
