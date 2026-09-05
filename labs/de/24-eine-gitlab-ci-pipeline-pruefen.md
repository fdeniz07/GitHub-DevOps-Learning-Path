---
chapter: 24
title: "Eine GitLab-CI-Pipeline pruefen"
related_notebook: ".gitlab-ci.yml, Pipelines, Stages und Jobs"
related_exercise: "Eine GitLab-CI-Pipeline schreiben"
level: Beginner
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Kapitel 23](../../notebooks/de/23-gitlab-cicd-grundlagen.md) | [Notebook](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md) | [Uebung](../../exercises/de/24-eine-gitlab-ci-pipeline-schreiben.md) | [Quiz](../../quizzes/de/24-gitlab-ci-yml-pipelines-stages-und-jobs-quiz.md) | [Roadmap](../../ROADMAP.md)

## Eine GitLab-CI-Pipeline pruefen

## Ziel

Finde Konfigurations- und Ablaufprobleme in einer vorgeschlagenen Node.js-Pipeline und erstelle eine sichere Korrektur.

## Szenario

Ein Teammitglied reicht diese Datei zur Pruefung ein:

```yaml
stages:
  - verify
    - build

lint:
  stage: verify
  image: node:22-alpine
  script: npm run lint

test:
  stage: verify
  script:
    - npm test

build:
  stage: build
  needs: test
  script:
    - npm run build
```

## Voraussetzungen

- Das [Notebook](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md) ist abgeschlossen.
- GitLab CI Lint oder eine bereitgestellte Validierungsumgebung ist verfuegbar.

## Aufgaben

### Aufgabe 1 - Struktur pruefen

Finde den Einrueckungsfehler unter `stages`. Bestimme, welche Werte YAML-Listen und welche Maps sind. Erklaere, warum `script: npm run lint` gueltig sein kann, eine Liste aber bei wachsenden Jobs klarer ist.

**Erwartetes Ergebnis:** Du trennst Syntaxfehler von Stil- und Wartbarkeitsfragen.

### Aufgabe 2 - Job-Modell korrigieren

Erstelle eine korrigierte Datei mit expliziten Stages `verify` und `build`, gemeinsamem Node-Image, `npm ci` sowie getrennten Skripten fuer Lint, Test und Build. Formuliere die Build-Abhaengigkeit von Test als Liste.

**Erwartetes Ergebnis:** Lint und Test duerfen parallel laufen; Build hat einen eindeutigen Nachweis.

### Aufgabe 3 - Erstellung steuern

Ergaenze `workflow: rules` fuer Merge-Request-Ereignisse und Pushes, danach `when: never`. Erklaere, warum diese Entscheidung vor Job-`rules` erfolgt.

**Erwartetes Ergebnis:** Unpassende Quellen erzeugen keine Pipeline.

### Aufgabe 4 - Validieren und diagnostizieren

Fuehre CI Lint aus, lies den Graphen und starte nur eine harmlose Validierungspipeline. Halte bei einem Fehler Befehl und erste Fehlermeldung fest. Fuege keine Zugangsdaten, Deploy-Befehle oder Cache-Konfiguration hinzu.

**Erwartetes Ergebnis:** Es liegen gueltige Konfiguration, Graph-Beleg und eine dokumentierte Fehlerreaktion vor.

## Pruefliste

- [ ] Alle YAML-Listenelemente sind ausgerichtet.
- [ ] Die Wurzeldatei heisst `.gitlab-ci.yml`.
- [ ] Pipeline-Regeln und Job-Abhaengigkeiten sind erklaert.
- [ ] Vor einem Retry werden Logs gelesen.

## Zugehoerige Inhalte

- Notebook: [.gitlab-ci.yml, Pipelines, Stages und Jobs](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md)
- Uebung: [Eine GitLab-CI-Pipeline schreiben](../../exercises/de/24-eine-gitlab-ci-pipeline-schreiben.md)
- Quiz: [Kapitel-24-Quiz](../../quizzes/de/24-gitlab-ci-yml-pipelines-stages-und-jobs-quiz.md)
