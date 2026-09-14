---
chapter: 24
title: ".gitlab-ci.yml, Pipelines, Stages und Jobs Quiz"
related_notebook: ".gitlab-ci.yml, Pipelines, Stages und Jobs"
related_exercise: "Eine GitLab-CI-Pipeline schreiben"
related_lab: "Eine GitLab-CI-Pipeline pruefen"
level: Beginner
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Kapitel 23](../../notebooks/de/23-gitlab-cicd-grundlagen.md) | [Notebook](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md) | [Uebung](../../exercises/de/24-eine-gitlab-ci-pipeline-schreiben.md) | [Labor](../../labs/de/24-eine-gitlab-ci-pipeline-pruefen.md) | [Roadmap](../../ROADMAP.md)

## .gitlab-ci.yml, Pipelines, Stages und Jobs Quiz

## Multiple Choice

### Frage 1

Wo sucht GitLab normalerweise die Pipeline-Konfiguration?

- A. In jedem Unterordner `pipelines`
- B. Im Repository-Wurzelverzeichnis als `.gitlab-ci.yml`
- C. Im Home-Verzeichnis des Runners
- D. Nur im Wiki des Default-Branches

**Antwort:** B

**Erklaerung:** GitLab liest `.gitlab-ci.yml` aus dem betreffenden Commit im Wurzelverzeichnis.

### Frage 2

Was kann mit zwei erfolgreichen Jobs in derselben Stage passieren?

- A. Sie laufen zwingend alphabetisch.
- B. Sie duerfen bei verfuegbaren Runnern parallel laufen.
- C. Sie teilen automatisch Dateien.
- D. Sie erstellen getrennte Pipelines.

**Antwort:** B

**Erklaerung:** Eine Stage ordnet spaetere Stages, ist aber keine serielle Warteschlange ihrer Jobs.

### Frage 3

Welches Konstrukt entscheidet, ob GitLab ueberhaupt eine Pipeline erstellt?

- A. `workflow: rules`
- B. `after_script`
- C. `needs`
- D. `image`

**Antwort:** A

**Erklaerung:** `workflow: rules` entscheidet ueber die Erstellung; Job-`rules` ueber die Aufnahme einzelner Jobs.

## Richtig oder Falsch

### Frage 4

Tabulatoren duerfen in YAML statt Leerzeichen fuer Einrueckung stehen.

**Antwort:** Falsch

**Erklaerung:** Verwende einheitlich Leerzeichen; Tabs koennen YAML ungueltig machen.

### Frage 5

`needs: [test]` beschreibt eine Abhaengigkeit vom Test zum deklarierenden Job.

**Antwort:** Richtig

**Erklaerung:** Der deklarierende Job benoetigt ein erfolgreiches Testergebnis.

## Kurzantwort

### Frage 6

Welche Aufgaben haben `before_script`, `script` und `after_script`?

**Erwartete Antwort:** `before_script` bereitet vor, `script` erledigt die Hauptarbeit und `after_script` laeuft danach fuer sichere Diagnose oder Aufraeumen, ohne Fehler zu verdecken.

### Frage 7

Was untersuchst du zuerst bei einem fehlgeschlagenen Job?

**Erwartete Antwort:** Den ersten fehlgeschlagenen Befehl, die Fehlermeldung und den Kontext im Log; bei Bedarf danach Graph und Regeln.

## Praxisszenario

Eine Merge-Request-Pipeline soll Lint und Tests ausfuehren, aber nicht fuer eine unpassende Quelle entstehen. Schreibe den Ausdruck fuer ein Merge-Request-Ereignis und nenne die zweite Ebene, die einen einzelnen Job steuert.

**Erwartete Antwort:** `if: '$CI_PIPELINE_SOURCE == "merge_request_event"'`; Job-`rules` steuern die Aufnahme eines einzelnen Jobs.

## Zugehoerige Inhalte

- Notebook: [.gitlab-ci.yml, Pipelines, Stages und Jobs](../../notebooks/de/24-gitlab-ci-yml-pipelines-stages-und-jobs.md)
- Uebung: [Eine GitLab-CI-Pipeline schreiben](../../exercises/de/24-eine-gitlab-ci-pipeline-schreiben.md)
- Labor: [Eine GitLab-CI-Pipeline pruefen](../../labs/de/24-eine-gitlab-ci-pipeline-pruefen.md)
