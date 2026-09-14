---
chapter: 25
title: "Runner, Variablen, Cache und Artifacts Quiz"
related_notebook: "Runner, Variablen, Cache und Artifacts"
related_exercise: "GitLab-CI-Ressourcen auswählen"
related_lab: "GitLab-CI-Pipeline verbessern"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/25-gitlab-runner-variablen-cache-und-artifacts.md) | [Übung](../../exercises/de/25-gitlab-ci-ressourcen-auswaehlen.md) | [Labor](../../labs/de/25-gitlab-ci-pipeline-verbessern.md) | [Roadmap](../../ROADMAP.md)

# Runner, Variablen, Cache und Artifacts Quiz

### Frage 1

Was ist normalerweise ein Artifact?

- A. Heruntergeladene npm-Pakete
- B. Die Build-Ausgabe `dist/`
- C. Ein Deployment-Token
- D. Ein Runner-Tag

**Antwort:** B. Artifacts bewahren konkrete Job-Ausgaben; Caches beschleunigen Eingaben.

### Frage 2

Warum ist ein Runner sicherheitsrelevant?

**Antwort:** Er führt Job-Code aus und bildet eine Vertrauensgrenze.

### Richtig oder falsch

`echo $DEPLOY_TOKEN` ist bei maskierter Variable sicher.

**Antwort:** Falsch. Secrets dürfen nicht absichtlich in Logs ausgegeben werden.

### Kurzantwort

Warum soll ein Cache-Key eine Lockdatei berücksichtigen?

**Erwartete Antwort:** Damit sich Wiederverwendung ändert, wenn sich Abhängigkeiten ändern.

### Szenario

Das Artifact `dist/` wird nicht gefunden.

**Erwartete Antwort:** Prüfe die Build-Ausgabe und den relativen Pfad; ersetze das Artifact nicht durch einen Cache.

### Verwandte Inhalte

- Notebook: [Runner, Variablen, Cache und Artifacts](../../notebooks/de/25-gitlab-runner-variablen-cache-und-artifacts.md)
- Übung: [GitLab-CI-Ressourcen auswählen](../../exercises/de/25-gitlab-ci-ressourcen-auswaehlen.md)
- Labor: [GitLab-CI-Pipeline verbessern](../../labs/de/25-gitlab-ci-pipeline-verbessern.md)
