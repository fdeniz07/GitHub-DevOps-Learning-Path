---
chapter: 19
title: "Quiz: GitLab-Repositoryzugriff, Klonen und Remote-Workflows"
related_notebook: "GitLab-Repositoryzugriff, Klonen und Remote-Workflows"
related_exercise: "GitLab-Remote untersuchen"
related_lab: "GitLab-Projekt klonen, beitragen und synchronisieren"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/19-gitlab-repositoryzugriff-klonen-und-remote-workflows.md) | [Übung](../../exercises/de/19-gitlab-remote-untersuchen.md) | [Labor](../../labs/de/19-gitlab-projekt-klonen-beitragen-und-synchronisieren.md) | [Roadmap](../../ROADMAP.md)

## Quiz: GitLab-Repositoryzugriff, Klonen und Remote-Workflows

## Zweck

Prüfe, ob du sichere GitLab-Remote-Operationen anhand ihrer Wirkung auswählen kannst.

## Abschnitt A - Multiple Choice

### Frage 1

Welcher Befehl zeigt normalerweise die Fetch- und Push-Adressen eines Klons?

- A. `git remote -v`
- B. `git pull --ff-only`
- C. `git commit`
- D. `git switch`

**Antwort:** A

**Erklärung:** `git remote -v` zeigt die URLs benannter Remotes, einschließlich des üblichen `origin`.

### Frage 2

Welcher erste Befehl informiert über Remote-Änderungen, ohne aktuelle Dateien zu ändern?

- A. `git push`
- B. `git fetch origin`
- C. `git pull`
- D. `git clone`

**Antwort:** B

**Erklärung:** Fetch lädt Remote-Informationen und aktualisiert Remote-Tracking-Referenzen, ohne sie in den aktuellen Branch zu integrieren.

## Abschnitt B - Richtig oder Falsch

### Frage 3

HTTPS und SSH sind Transportoptionen für GitLab; Zugangsdaten gehören nie in Commits oder Dokumentation.

**Antwort:** Richtig

**Erklärung:** Verwende eine freigegebene Zugriffsmethode, aber halte Geheimnisse aus dem Repository fern.

### Frage 4

Jedes GitLab-Projekt verwendet `main` als Standard-Branch und erlaubt Forks.

**Antwort:** Falsch

**Erklärung:** Standard-Branch und Fork-Verfügbarkeit werden pro Projekt konfiguriert.

## Abschnitt C - Kurzantwort

### Frage 5

Worin unterscheiden sich `fetch` und `pull`?

**Erwartete Antwort:** Fetch holt Remote-Informationen ohne Integration. Pull holt Änderungen ab und integriert sie gemäß Konfiguration oder gewählten Optionen in den aktuellen Branch.

### Frage 6

Warum solltest du `origin` vor dem ersten Push prüfen?

**Erwartete Antwort:** Damit der Branch im beabsichtigten Projekt oder Fork statt an einem falschen Ziel veröffentlicht wird.

## Abschnitt D - Praxisszenario

### Szenario

Du hast `docs/remote-hinweis` erstellt und bemerkst neue Commits auf dem geschützten Standard-Branch.

### Frage

Was tust du vor dem Vorschlag deiner Änderung?

**Erwartete Antwort:** Remotes prüfen, Remote-Zustand abrufen, Änderungen am Standard-Branch ansehen, den Basis-Branch bewusst aktualisieren und nur den Feature-Branch pushen. Danach wird nach den Projektregeln ein Merge Request statt eines direkten Pushs auf den geschützten Branch geöffnet.

## Nächster Schritt

Wiederhole bei Bedarf [Notebook](../../notebooks/de/19-gitlab-repositoryzugriff-klonen-und-remote-workflows.md), [Übung](../../exercises/de/19-gitlab-remote-untersuchen.md) und [Labor](../../labs/de/19-gitlab-projekt-klonen-beitragen-und-synchronisieren.md); danach geht es über die [Roadmap](../../ROADMAP.md) weiter.
