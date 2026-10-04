---
chapter: 35
title: "Eine Composite Action paketieren"
related_notebook: "Composite Actions in GitHub Actions"
related_exercise: "Eine wiederverwendbare Composite Action erstellen"
level: Intermediate
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/35-composite-actions.md) | [Übung](../../exercises/de/35-build-a-reusable-composite-action.md) | [Quiz](../../quizzes/de/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine Composite Action paketieren

## Ziel

Wandle wiederholte Validierungsschritte eines Repositorys in eine lokale Composite Action mit einem dokumentierten Vertrag um.

## Lernergebnisse

- Aktionsmetadaten und Implementierung organisieren;
- erforderliche Eingaben validieren und eine Ausgabe bereitstellen;
- die Action mit passenden Berechtigungen aus einem Workflow aufrufen.

## Szenario

Zwei Workflows wiederholen voneinander unabhängige Prüfungen: Sie validieren ein Verzeichnis, zählen Dateien und melden das Ergebnis. Erstelle eine Action, die ein Verzeichnis akzeptiert und die Anzahl zurückgibt.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- GitHub Actions in einem Übungsrepository aktiviert.
- Ein Verzeichnis, das sicher geprüft werden kann.

## Umgebung einrichten

| Anforderung    | Wert                                          |
| -------------- | --------------------------------------------- |
| Betriebssystem | Jeder unterstützte GitHub-Actions-Runner      |
| Software       | Git, ein Texteditor und ein GitHub-Repository |
| Version        | Aktuell vom Repository unterstützte Versionen |

## Aufgaben

### Aufgabe 1 — Den Vertrag definieren

1. Erstelle `.github/actions/count-files/action.yml`.
2. Deklariere eine erforderliche `directory`-Eingabe und eine `count`-Ausgabe.
3. Füge Beschreibungen hinzu, die einem Workflowautor erklären, wie beide Werte verwendet werden.

**Erwartetes Ergebnis:** Die Metadaten sind verständlich, ohne die Implementierung zu lesen.

### Aufgabe 2 — Sichere Schritte implementieren

1. Validiere, dass das Verzeichnis existiert.
2. Zähle Dateien unter Verwendung einer in Anführungszeichen gesetzten Umgebungsvariablen.
3. Schreibe das Ergebnis nach `GITHUB_OUTPUT`.

**Erwartetes Ergebnis:** Eine ungültige Eingabe schlägt eindeutig fehl und eine gültige Eingabe erzeugt eine numerische Ausgabe.

### Aufgabe 3 — Integrieren und überprüfen

1. Rufe die Action aus einem Workflow auf.
2. Gib die Ausgabe in einem späteren Schritt aus.
3. Überprüfe Berechtigungen und Protokolle auf unnötige Offenlegung.

**Erwartetes Ergebnis:** Die Action funktioniert aus einem aufrufenden Workflow und gibt keine vertraulichen Daten aus.

## Validierungs-Checkliste

- [ ] Jeder `run`-Schritt deklariert eine Shell.
- [ ] Die Action verwendet eine erforderliche Eingabe und eine öffentliche Ausgabe.
- [ ] Der Workflow liest die Ausgabe über die Step-ID des aufrufenden Schritts.
- [ ] Ungültige Verzeichnisse schlagen mit einer hilfreichen Meldung fehl.

## Fehlerbehebung

| Problem                    | Mögliche Ursache                  | Lösung                                                                         |
| -------------------------- | --------------------------------- | ------------------------------------------------------------------------------ |
| Ausgabe ist leer           | Falsche Step-ID oder Ausgabedatei | Prüfe die Ausgabezuordnung und `GITHUB_OUTPUT`.                                |
| Action wird nicht gefunden | Falscher relativer Pfad           | Rufe den exakten Pfad `.github/actions/...` auf.                               |
| Shell-Fehler               | Nicht zitierte Eingabe oder Pfad  | Übergib die Eingabe über eine in Anführungszeichen gesetzte Umgebungsvariable. |

## Best Practices

- Gib jeder Action eine eindeutige Verantwortung.
- Überprüfe Änderungen an Actions wie Workflow-Code.
- Vermeide Secrets in Ausgaben und Protokollen.

## Zusammenfassung

Die Action stellt nun eine wiederverwendbare und testbare Schnittstelle für die Repository-Validierung bereit.

### Verwandte Inhalte

- Notebook: [Composite Actions in GitHub Actions](../../notebooks/de/35-composite-actions.md)
- Übung: [Eine wiederverwendbare Composite Action erstellen](../../exercises/de/35-build-a-reusable-composite-action.md)
- Quiz: [Quiz zu Composite Actions](../../quizzes/de/35-composite-actions-quiz.md)
