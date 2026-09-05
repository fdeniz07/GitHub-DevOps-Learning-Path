---
chapter: 25
title: "GitLab-CI-Pipeline verbessern"
related_notebook: "Runner, Variablen, Cache und Artifacts"
related_exercise: "GitLab-CI-Ressourcen auswählen"
level: Einsteiger
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/25-gitlab-runner-variablen-cache-und-artifacts.md) | [Übung](../../exercises/de/25-gitlab-ci-ressourcen-auswaehlen.md) | [Quiz](../../quizzes/de/25-gitlab-runner-variablen-cache-und-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-CI-Pipeline verbessern

## Ziel

Ergänze eine sichere Node.js-Pipeline um Abhängigkeits-Cache und Build-Artifact, ohne Zugangsdaten offenzulegen.

## Aufgaben

### Aufgabe 1 - Runner prüfen

Prüfe den für einen Job geeigneten Runner und seine Tags. Ändere weder Runner-Registrierung noch Secrets.

**Erwartetes Ergebnis:** Du kannst erklären, warum dieser Runner den Job ausführen darf.

### Aufgabe 2 - Cache ergänzen

Cache `.npm/` anhand von `package-lock.json` und nutze `npm ci --cache .npm --prefer-offline`.

**Erwartetes Ergebnis:** Ein Cache-Miss verhindert keine korrekte Installation.

### Aufgabe 3 - Build-Ausgabe sichern

Erzeuge `dist/`, speichere es als Artifact und setze `expire_in: 7 days`.

**Erwartetes Ergebnis:** Das konkrete Build-Ergebnis kann heruntergeladen werden.

## Prüfliste

- [ ] Kein Secret steht in YAML oder Log.
- [ ] Der Cache-Key bezieht sich auf die Lockdatei.
- [ ] Der Artifact-Pfad existiert nach dem Build.

## Fehlerbehebung

| Problem        | Lösung                                      |
| -------------- | ------------------------------------------- |
| Job wartet     | Tags und Runner-Verfügbarkeit prüfen.       |
| Artifact fehlt | Prüfe, ob `dist/` wirklich erzeugt wird.    |
| Cache-Miss     | Installation fortsetzen, Key später prüfen. |

### Verwandte Inhalte

- Notebook: [Runner, Variablen, Cache und Artifacts](../../notebooks/de/25-gitlab-runner-variablen-cache-und-artifacts.md)
- Übung: [GitLab-CI-Ressourcen auswählen](../../exercises/de/25-gitlab-ci-ressourcen-auswaehlen.md)
- Quiz: [Runner, Variablen, Cache und Artifacts Quiz](../../quizzes/de/25-gitlab-runner-variablen-cache-und-artifacts-quiz.md)
