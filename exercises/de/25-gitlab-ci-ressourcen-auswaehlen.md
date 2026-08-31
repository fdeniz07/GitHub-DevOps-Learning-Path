---
chapter: 25
title: "GitLab-CI-Ressourcen auswählen"
related_notebook: "Runner, Variablen, Cache und Artifacts"
level: Einsteiger
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/25-gitlab-runner-variablen-cache-und-artifacts.md) | [Labor](../../labs/de/25-gitlab-ci-pipeline-verbessern.md) | [Quiz](../../quizzes/de/25-gitlab-runner-variablen-cache-und-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-CI-Ressourcen auswählen

## Ziel

Wähle sichere Runner, Variablen, Caches und Artifacts für ein kleines Webprojekt.

## Szenario

Ein Node.js-Projekt hat Lint-, Test-, Build- und privaten Deployment-Job. `dist/` ist Build-Ausgabe, `.npm/` kann wiederverwendet werden und ein Deployment-Token darf in ungeschützten Pipelines nicht verfügbar sein.

## Aufgaben

### Aufgabe 1

Wähle passende Runner für Prüf- und Deployment-Jobs. Begründe die unterschiedliche Vertrauensgrenze.

**Erwartetes Ergebnis:** Der Deployment-Job nutzt einen geschützten vertrauenswürdigen Runner.

### Aufgabe 2

Ordne `NODE_ENV`, Deployment-Token, `.npm/` und `dist/` als sichtbare Variable, geschützte maskierte Variable, Cache oder Artifact ein.

**Erwartetes Ergebnis:** Du erklärst, warum ein Cache kein Build-Ergebnis ersetzt.

### Aufgabe 3

Entwirf einen Cache-Key mit `package-lock.json` und lege sieben Tage Artifact-Aufbewahrung fest.

**Erwartetes Ergebnis:** Abhängigkeitsänderungen invalidieren den Cache, Build-Ausgaben bleiben überprüfbar.

## Selbstkontrolle

- [ ] Ich erkenne die Vertrauensgrenze eines Runners.
- [ ] Ich gebe geheime Variablen nicht aus.
- [ ] Ich wähle Cache oder Artifact nach Zweck.

### Verwandte Inhalte

- Notebook: [Runner, Variablen, Cache und Artifacts](../../notebooks/de/25-gitlab-runner-variablen-cache-und-artifacts.md)
- Labor: [GitLab-CI-Pipeline verbessern](../../labs/de/25-gitlab-ci-pipeline-verbessern.md)
- Quiz: [Runner, Variablen, Cache und Artifacts Quiz](../../quizzes/de/25-gitlab-runner-variablen-cache-und-artifacts-quiz.md)
