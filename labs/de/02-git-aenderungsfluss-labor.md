---
chapter: 02
title: "Git-Änderungsfluss-Labor"
related_notebook: "Git-Architektur"
related_exercise: "Git-Bereiche klassifizieren"
level: Beginner
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/02-git-architektur.md) | [Übung](../../exercises/de/02-git-bereiche-klassifizieren.md) | [Quiz](../../quizzes/de/02-git-architektur-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git-Änderungsfluss-Labor

## Ziel

Beobachte, wie eine einzelne Dokumentationsänderung Arbeitsverzeichnis, Staging-Bereich und lokales Repository durchläuft, während unabhängige Arbeit nicht ausgewählt bleibt.

## Lernergebnisse

- Du prüfst einen Dateizustand mit `git status`.
- Du wählst mit `git add` eine einzelne, fokussierte Dateiversion aus.
- Du zeichnest den ausgewählten Snapshot mit `git commit` auf.
- Du bestätigst, dass eine unabhängige Änderung im Arbeitsverzeichnis außerhalb des Commits bleibt.

## Szenario

Das Team möchte heute eine kleine Dokumentationskorrektur in der Projekthistorie haben. Das Menü-Redesign ist jedoch noch nicht fertig. Du musst die Korrektur aufzeichnen, ohne das unfertige Redesign versehentlich hinzuzufügen.

## Voraussetzungen

- Schließe das [Kapitel 02](../../notebooks/de/02-git-architektur.md) und die [Übung](../../exercises/de/02-git-bereiche-klassifizieren.md) ab.
- Git ist installiert sowie Benutzername und E-Mail sind konfiguriert. Wenn die Einrichtung noch fehlt, lies die Befehle als Vorschau und wiederhole das Labor nach Kapitel 03.
- Verwende ein Terminal und einen Texteditor.

## Umgebung vorbereiten

Erstelle `README.md` mit `# Portfolio-Website` und `index.html` mit `<h1>Portfolio</h1>` im Editor. Führe danach diese Befehle aus:

```bash
mkdir git-aenderungsfluss-labor
cd git-aenderungsfluss-labor
git init
git add README.md index.html
git commit -m "chore: Übungsprojekt erstellen"
```

## Aufgaben

### Aufgabe 1 - Unabhängige Änderungen erzeugen

1. Ergänze einen Einrichtungssatz in `README.md`.
2. Ändere die Überschrift in `index.html` in eine unfertige Menünotiz.
3. Führe `git status` aus und notiere die geänderten Dateien.

#### Erwartetes Ergebnis: Arbeitsverzeichnis

Beide Dateien sind im Arbeitsverzeichnis geändert; keine ist vorgemerkt.

### Aufgabe 2 - Dokumentationskorrektur auswählen

1. Führe `git add README.md` aus.
2. Führe erneut `git status` aus.
3. Bestimme, in welchem Abschnitt des Berichts README und index erscheinen.
4. Erkläre, warum nur eine Datei für den Ziel-Commit bereit ist.

#### Erwartetes Ergebnis: Staging-Bereich

Die README-Änderung ist für den nächsten Commit vorgemerkt; die HTML-Änderung bleibt nicht vorgemerkt.

### Aufgabe 3 - Fokussierten Snapshot aufzeichnen

1. Führe `git commit -m "docs: Einrichtungsanleitung verbessern"` aus.
2. Führe `git status` und `git log --oneline -1` aus.
3. Bestätige, dass der Dokumentations-Commit vorhanden ist und die unfertige HTML-Änderung weiterhin gemeldet wird.

#### Erwartetes Ergebnis: Lokales Repository

Das lokale Repository enthält den README-Snapshot; das Arbeitsverzeichnis zeigt weiterhin die unfertige Änderung in `index.html`.

## Prüfliste

- [ ] Ich habe die geänderten Dateien mit `git status` beobachtet.
- [ ] Ich habe nur `README.md` vorgemerkt.
- [ ] Ich habe einen fokussierten Dokumentations-Commit erstellt.
- [ ] `index.html` blieb außerhalb dieses Commits.

## Fehlerbehebung

| Problem                                             | Mögliche Ursache                                                          | Lösung                                                                                                       |
| --------------------------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| Git lehnt den Commit wegen unbekannter Identität ab | Benutzername oder E-Mail ist nicht konfiguriert.                          | Führe `git config --global user.name "Dein Name"` und `git config --global user.email "du@example.com"` aus. |
| Beide Dateien sind vorgemerkt                       | Ein weiter Befehl wie `git add .` wurde verwendet.                        | Führe `git restore --staged index.html` aus und merke danach nur README vor.                                 |
| `git status` ist nach dem Commit sauber             | Die HTML-Änderung wurde nicht vorgenommen oder in den Commit aufgenommen. | Ändere `index.html` erneut und wiederhole die Beobachtung.                                                   |

## Best Practices

- Führe `git status` vor und nach Befehlen aus, die den Zustand verändern.
- Merke Dateien vor, die einen einzigen verständlichen Commit-Zweck unterstützen.
- Lasse unfertige Arbeit im Arbeitsverzeichnis, bis sie bereit ist.

## Nächster Schritt

Prüfe dein Verständnis mit dem [Git-Architektur-Quiz](../../quizzes/de/02-git-architektur-quiz.md).

### Weiterführende Inhalte

- Notebook: [Git-Architektur](../../notebooks/de/02-git-architektur.md)
- Übung: [Git-Bereiche klassifizieren](../../exercises/de/02-git-bereiche-klassifizieren.md)
- Quiz: [Git-Architektur-Quiz](../../quizzes/de/02-git-architektur-quiz.md)
