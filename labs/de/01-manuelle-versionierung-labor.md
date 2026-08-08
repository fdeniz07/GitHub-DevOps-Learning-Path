---
chapter: 01
title: "Labor zur manuellen Versionierung"
related_notebook: "Warum Versionskontrolle?"
related_exercise: "Versionskontrolle analysieren"
level: Beginner
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/01-warum-versionskontrolle.md) | [Übung](../../exercises/de/01-versionskontrolle-analysieren.md) | [Quiz](../../quizzes/de/01-warum-versionskontrolle-quiz.md) | [Roadmap](../../ROADMAP.md)

# Labor zur manuellen Versionierung

## Ziel

Erlebe die Unsicherheit manueller Projektkopien und bestimme, welche Fähigkeiten der Versionskontrolle ein kleines Entwicklungsprojekt benötigt. Dieses Labor verwendet absichtlich keine Git-Befehle.

## Lernergebnisse

- Du erstellst mehrere manuell versionierte Projektkopien.
- Du erkennst Situationen, in denen sich ein funktionierender Stand oder ein Änderungsgrund nicht sicher bestimmen lässt.
- Du verbindest die Unsicherheit mit Historie, Wiederherstellung, Nachvollziehbarkeit und einer gemeinsamen Quelle.

## Szenario

Du erstellst mit einer anderen Person eine Campus-Event-Website. Vor einem größeren Redesign kopiert ihr Ordner, um "sicher" zu sein. Am Ende sollt ihr beide begründen können, mit welcher Kopie weitergearbeitet werden soll.

## Voraussetzungen

- Bearbeite [Kapitel 01](../../notebooks/de/01-warum-versionskontrolle.md) und die [Übung](../../exercises/de/01-versionskontrolle-analysieren.md).
- Nutze Dateimanager und Texteditor.

## Umgebung einrichten

| Anforderung    | Wert                        |
| -------------- | --------------------------- |
| Betriebssystem | Windows, Linux oder macOS   |
| Software       | Dateimanager und Texteditor |
| Version        | Eine aktuelle Version       |

Erstelle einen leeren Arbeitsordner namens `manuelle-versionierung-labor`.

## Aufgaben

### Aufgabe 1 - Erstes Projekt anlegen

1. Erstelle den Ordner `campus-events` mit einer `index.html`, die einen Eventtitel und einen Registrierungshinweis enthält.
2. Ergänze eine `README.md` mit dem Hinweis, dass die Seite zur Prüfung bereit ist.
3. Kopiere den Ordner als `campus-events-final`.

#### Erwartetes Ergebnis: Erstes Projekt

Du besitzt zwei Ordner, die wie ein gültiger Projektstand aussehen.

### Aufgabe 2 - Änderung und Fehler einführen

1. Ändere im ursprünglichen Ordner den Eventtitel und ergänze eine Anmeldefrist.
2. Entferne einen Teil des Registrierungshinweises, sodass er unklar wird.
3. Kopiere den Ordner als `campus-events-final-v2`.

#### Erwartetes Ergebnis: Veränderte Kopie

Du hast eine neuer wirkende Kopie mit einer gewünschten Änderung und einem versteckten Problem.

### Aufgabe 3 - Widersprüchliche Korrekturen erzeugen

1. Korrigiere in `campus-events-final` den Registrierungshinweis und ändere den README-Status in "genehmigt".
2. Kopiere diesen Ordner als `campus-events-diese-version`.
3. Vergleiche alle Ordner: Welcher Eventtitel ist gewünscht? Welcher Hinweis ist korrekt? Welche README ist aktuell? Was wurde in jedem Ordner geändert und warum?
4. Nenne für jede Frage, die du nicht sicher beantworten kannst, die fehlende Fähigkeit der Versionskontrolle.

#### Erwartetes Ergebnis: Widersprüchliche Korrekturen

Du kannst zeigen, dass überzeugende Ordnernamen keine verlässliche Historie, keinen Wiederherstellungspunkt und keine gemeinsame Quelle schaffen.

## Validierungscheckliste

- [ ] Ich habe mindestens drei plausible Projektkopien erstellt.
- [ ] Mindestens zwei Kopien unterscheiden sich in mehr als einer Datei.
- [ ] Ich habe Fragen notiert, die Ordnernamen nicht beantworten können.
- [ ] Ich habe jede Unsicherheit einem Nutzen der Versionskontrolle zugeordnet.

## Best Practices

- Nutze eine maßgebliche Projekthistorie statt konkurrierender "finaler" Ordner.
- Halte den Zweck einer bedeutsamen Änderung fest, bevor Kontext verloren geht.
- Verwende Backups für Verlustschutz und Versionskontrolle für die Projektentwicklung.

## Nächster Schritt

Prüfe dein Verständnis mit dem [Quiz: Warum Versionskontrolle?](../../quizzes/de/01-warum-versionskontrolle-quiz.md).

### Verwandte Inhalte

- Notebook: [Warum Versionskontrolle?](../../notebooks/de/01-warum-versionskontrolle.md)
- Übung: [Versionskontrolle analysieren](../../exercises/de/01-versionskontrolle-analysieren.md)
- Quiz: [Quiz: Warum Versionskontrolle?](../../quizzes/de/01-warum-versionskontrolle-quiz.md)
