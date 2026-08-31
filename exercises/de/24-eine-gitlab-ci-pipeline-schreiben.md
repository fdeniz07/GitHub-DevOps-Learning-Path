---
chapter: 24
title: "Eine GitLab-CI-Pipeline schreiben"
related_notebook: ".gitlab-ci.yml, Pipelines, Stages und Jobs"
level: Beginner
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Kapitel 23](../../notebooks/de/23-gitlab-cicd-grundlagen.md) | [Notebook](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md) | [Labor](../../labs/de/24-eine-gitlab-ci-pipeline-pruefen.md) | [Quiz](../../quizzes/de/24-gitlab-ci-yml-pipelines-stages-und-jobs-quiz.md) | [Roadmap](../../ROADMAP.md)

## Eine GitLab-CI-Pipeline schreiben

## Ziel

Erstelle und erklaere eine lesbare `.gitlab-ci.yml` fuer ein kleines Node.js-Projekt.

## Szenario

Das Projekt bietet `npm run lint`, `npm test` und `npm run build`. Lint und Tests sollen eine Aenderung pruefen, bevor der Build laeuft. Deployment, Cache-Einrichtung und Geheimnisse gehoeren nicht zu dieser Uebung.

## Aufgaben

### Aufgabe 1 - YAML strukturieren

Schreibe im Wurzelverzeichnis eine `.gitlab-ci.yml` mit der `stages`-Liste `verify` und `build`. Fuege die Maps `lint` und `test` in `verify` ein; beide erhalten eine `script`-Liste.

**Erwartetes Ergebnis:** Die Einrueckung ist einheitlich, jeder Schluessel hat einen Doppelpunkt und jedes Listenelement beginnt mit `-`.

### Aufgabe 2 - Gemeinsame Umgebung hinzufuegen

Ergaenze `default` mit `image: node:22-alpine` und `before_script` mit `npm ci`. Erklaere, warum die einzelnen Hauptbefehle weiterhin in den jeweiligen `script`-Abschnitten stehen.

**Erwartetes Ergebnis:** Die Umgebung wird geteilt, waehrend Lint und Test als getrennte Aufgaben sichtbar bleiben.

### Aufgabe 3 - Regeln und Abhaengigkeit

Verwende `workflow: rules` fuer Merge-Request-Ereignisse und Pushes und lehne andere Quellen ab. Ergaenze `build` mit `needs: [test]`. Erklaere `'$CI_PIPELINE_SOURCE == "merge_request_event"'` und zeichne `test -> build`.

**Erwartetes Ergebnis:** Du unterscheidest Pipeline-Erstellung von der Ausfuehrungsreihenfolge.

### Aufgabe 4 - Sicher pruefen

Nutze CI Lint und pruefe den Graphen nach einer kleinen, geheimnisfreien Aenderung. Notiere bei einem Fehler den ersten fehlgeschlagenen Befehl und seine Meldung statt wiederholt zu starten.

**Erwartetes Ergebnis:** Deine Pruefung enthaelt Belege, aber keine sensiblen Werte.

## Selbstkontrolle

- [ ] Ich unterscheide YAML-Map und YAML-Liste.
- [ ] Ich kann parallele Lint- und Test-Jobs begruenden.
- [ ] Ich kann `workflow: rules`, Job-`rules` und `needs` unterscheiden.

## Zugehoerige Inhalte

- Notebook: [.gitlab-ci.yml, Pipelines, Stages und Jobs](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md)
- Labor: [Eine GitLab-CI-Pipeline pruefen](../../labs/de/24-eine-gitlab-ci-pipeline-pruefen.md)
- Quiz: [Kapitel-24-Quiz](../../quizzes/de/24-gitlab-ci-yml-pipelines-stages-und-jobs-quiz.md)
