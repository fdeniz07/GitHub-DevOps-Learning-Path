---
chapter: 02
title: "Git-Bereiche klassifizieren"
related_notebook: "Git-Architektur"
level: Einsteiger
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/02-git-architektur.md) | [Labor](../../labs/de/02-git-aenderungsfluss-labor.md) | [Quiz](../../quizzes/de/02-git-architektur-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git-Bereiche klassifizieren

## Ziel

Projektänderungen den Git-Bereichen zuordnen und entscheiden, welche Änderungen für einen fokussierten Commit ausgewählt werden.

## Lernergebnisse

- Du unterscheidest Arbeitsverzeichnis, Staging-Bereich und lokales Repository.
- Du erklärst den Weg einer Datei durch die lokalen Git-Bereiche.
- Du wählst zusammenhängende Änderungen aus und hältst unfertige oder temporäre Arbeit aus einem Commit heraus.

## Voraussetzungen

- [Kapitel 02: Git-Architektur](../../notebooks/de/02-git-architektur.md) ist abgeschlossen.
- Für diese schriftliche Übung ist keine Git-Installation nötig.

## Szenario

An einem Nachmittag korrigierst du einen defekten Einrichtungslink in `README.md`, beginnst ein unfertiges Menü-Redesign in `index.html` und erstellst `notes.txt` für vorläufige Ideen.

## Aufgaben

### Aufgabe 1 - Aktuellen Zustand zuordnen

Beschreibe, in welchem Git-Bereich die jeweils aktuelle Version der drei Dateien liegt, bevor du eine Auswahl triffst. Begründe deine Zuordnung.

#### Erwartetes Ergebnis: Aktueller Zustand

Du erklärst, dass bearbeitete und neu erstellte Dateien im Arbeitsverzeichnis liegen, bis sie ausgewählt werden.

### Aufgabe 2 - Fokussierte Änderung vorbereiten

Bestimme, welche Dateiversion für einen Commit mit der Nachricht `docs: Einrichtungslink korrigieren` in den Staging-Bereich gehört. Begründe, warum die anderen Dateien nicht ausgewählt werden sollen.

#### Erwartetes Ergebnis: Fokussierte Auswahl

Nur die README-Korrektur wird ausgewählt, weil sie die beabsichtigte Dokumentationsänderung repräsentiert.

### Aufgabe 3 - Entstehende Historie erklären

Erkläre den Zustand von `README.md`, `index.html` und `notes.txt`, nachdem der ausgewählte Snapshot aufgezeichnet wurde.

#### Erwartetes Ergebnis: Entstehende Historie

Das lokale Repository enthält den README-Snapshot; die unfertige Menüarbeit und die temporären Notizen liegen nicht im fokussierten Commit.

## Selbstkontrolle

- [ ] Ich kann die drei lokalen Git-Bereiche nennen.
- [ ] Ich kann erklären, warum das Speichern einer Datei keine Historie erzeugt.
- [ ] Ich kann eine fokussierte Änderung auswählen, ohne unabhängige Arbeit hinzuzufügen.
- [ ] Ich weiß, wann ich `git status` verwende.

## Zusammenfassung

- Das Arbeitsverzeichnis enthält die aktuellen Projektdateien.
- Der Staging-Bereich enthält die Auswahl für den nächsten Snapshot.
- Ein Commit zeichnet den ausgewählten Snapshot im lokalen Repository auf.

### Weiterführende Inhalte

- Notebook: [Git-Architektur](../../notebooks/de/02-git-architektur.md)
- Labor: [Git-Änderungsfluss-Labor](../../labs/de/02-git-aenderungsfluss-labor.md)
- Quiz: [Git-Architektur-Quiz](../../quizzes/de/02-git-architektur-quiz.md)
