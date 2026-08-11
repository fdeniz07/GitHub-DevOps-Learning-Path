---
chapter: 02
title: "Git-Architektur-Quiz"
related_notebook: "Git-Architektur"
related_exercise: "Git-Bereiche klassifizieren"
related_lab: "Git-Änderungsfluss-Labor"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/02-git-architektur.md) | [Übung](../../exercises/de/02-git-bereiche-klassifizieren.md) | [Labor](../../labs/de/02-git-aenderungsfluss-labor.md) | [Roadmap](../../ROADMAP.md)

# Git-Architektur-Quiz

## Ziel

Dieses Quiz prüft dein Verständnis der drei lokalen Git-Bereiche und des Weges von einer bearbeiteten Datei zur aufgezeichneten Historie.

## Lernziele

- Arbeitsverzeichnis, Staging-Bereich und lokales Repository definieren.
- Den Zweck von `git add`, `git commit` und `git status` erklären.
- Entscheiden, welche Änderungen in einen fokussierten Commit gehören.

## Abschnitt A - Multiple Choice

### Frage 1

In welchem Git-Bereich liegen Dateien, die du gerade im Projektordner bearbeitest?

- A. Lokales Repository
- B. Arbeitsverzeichnis
- C. Entferntes Repository
- D. Versionsarchiv

#### Antwort und Erklärung: Frage 1

**B.** Das Arbeitsverzeichnis enthält aktuelle Projektdateien, die du bearbeiten kannst.

### Frage 2

Was ist die Hauptaufgabe des Staging-Bereichs?

- A. Eine Änderung dauerhaft zu veröffentlichen
- B. Ein Backup jeder Datei zu speichern
- C. Genaue Dateiversionen für den nächsten Commit auszuwählen
- D. Änderungen an Teammitglieder zu senden

#### Antwort und Erklärung: Frage 2

**C.** Der Staging-Bereich ist die bewusste Auswahl für den nächsten aufgezeichneten Snapshot.

## Abschnitt B - Richtig oder falsch

### Frage 3

Eine bearbeitete Datei zu speichern fügt sie automatisch zur Git-Historie hinzu.

#### Antwort und Erklärung: Frage 3

**Falsch.** Speichern verändert das Arbeitsverzeichnis. Erst ein Commit macht die ausgewählte Version zur lokalen Historie.

### Frage 4

Ein Commit teilt die Änderung automatisch mit Teammitgliedern.

#### Antwort und Erklärung: Frage 4

**Falsch.** Ein Commit zeichnet Historie lokal auf. Entferntes Teilen folgt in späteren Kapiteln.

## Abschnitt C - Kurzantwort

### Frage 5

Wobei hilft dir `git status`?

#### Erwartete Antwort: Frage 5

Der Befehl meldet, ob Dateien nicht verfolgt, im Arbeitsverzeichnis geändert oder für den nächsten Commit vorgemerkt sind.

### Frage 6

Du merkst eine README-Korrektur vor und bearbeitest README anschließend erneut. Welche Version ist für den Commit bereit?

#### Erwartete Antwort: Frage 6

Vorgemerkt ist die Version zum Zeitpunkt von `git add`. Die spätere Bearbeitung bleibt eine getrennte Änderung im Arbeitsverzeichnis, bis sie erneut ausgewählt wird.

## Abschnitt D - Anwendungsszenario

### Szenario

Du korrigierst einen defekten Link in `README.md`, beginnst ein unfertiges Menü-Redesign in `index.html` und erstellst temporäre `notes.txt`. Das Team braucht heute einen klaren Dokumentations-Commit.

### Frage

Welche Datei sollst du vormerken und committen? Welche Dateien sollen warum außerhalb des Commits bleiben?

#### Erwartete Antwort: Szenario

Merke nur die README-Korrektur vor und committe sie, weil sie zum Zweck des Commits passt. Das unfertige Menü und die temporären Notizen bleiben außerhalb, damit die Historie fokussiert und verständlich bleibt.

## Bewertungsrichtlinie

| Ergebnis  | Bewertung                             |
| --------- | ------------------------------------- |
| 90-100%   | Sehr gut                              |
| 75-89%    | Gut                                   |
| 60-74%    | Ausreichend                           |
| Unter 60% | Notebook, Übung und Labor wiederholen |

## Nächster Schritt

Gehe zu Kapitel 03 weiter, um Git für den täglichen Einsatz zu installieren und zu konfigurieren.

### Weiterführende Inhalte

- Notebook: [Git-Architektur](../../notebooks/de/02-git-architektur.md)
- Übung: [Git-Bereiche klassifizieren](../../exercises/de/02-git-bereiche-klassifizieren.md)
- Labor: [Git-Änderungsfluss-Labor](../../labs/de/02-git-aenderungsfluss-labor.md)
