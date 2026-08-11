---
chapter: 01
title: "Quiz: Warum Versionskontrolle?"
related_notebook: "Warum Versionskontrolle?"
related_exercise: "Versionskontrolle analysieren"
related_lab: "Labor zur manuellen Versionierung"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/01-warum-versionskontrolle.md) | [Übung](../../exercises/de/01-versionskontrolle-analysieren.md) | [Labor](../../labs/de/01-manuelle-versionierung-labor.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Warum Versionskontrolle?

## Zweck

Dieses Quiz prüft dein Verständnis dafür, warum Softwareprojekte eine Historie bedeutungsvoller Änderungen benötigen.

## Lernziele

- Die Probleme erklären, die Versionskontrolle löst.
- Versionskontrolle von einem Backup unterscheiden.
- Wiederherstellung, Nachvollziehbarkeit und gemeinsame Quelle auf eine reale Situation anwenden.

## Abschnitt A - Multiple Choice

### Frage 1

Welche Fähigkeit ist am hilfreichsten, wenn ein Entwickler die Änderung finden muss, durch die eine vorher funktionierende Funktion fehlschlug?

- A. Dateikomprimierung
- B. Versionshistorie
- C. Ein längerer Dateiname
- D. Ein zweiter Monitor

#### Antwort und Erklärung: Frage 1

**B.** Die Versionshistorie erlaubt, Änderungen zwischen dem letzten funktionierenden und dem ersten fehlerhaften Stand zu untersuchen.

### Frage 2

Was bietet eine gemeinsame, verlässliche Quelle einem Entwicklungsteam?

- A. Für jede Person eine eigene finale Kopie
- B. Eine maßgebliche Projekthistorie für koordinierte Arbeit
- C. Eine Garantie für fehlerfreien Code
- D. Einen Ersatz für Kommunikation

#### Antwort und Erklärung: Frage 2

**B.** Das Team kann mit einer vertrauenswürdigen Historie arbeiten, statt zu raten, welche private Kopie aktuell ist.

## Abschnitt B - Richtig / Falsch

### Frage 3

Ein Backup und Versionskontrolle verfolgen exakt denselben Zweck.

#### Antwort und Erklärung: Frage 3

**Falsch.** Ein Backup schützt vor Datenverlust. Versionskontrolle zeichnet auf und erklärt, wie sich ein Projekt verändert.

### Frage 4

Versionskontrolle ist nur dann nützlich, wenn mehrere Entwickler an einem Projekt arbeiten.

#### Antwort und Erklärung: Frage 4

**Falsch.** Auch einzelne Personen profitieren von Wiederherstellung, Experimenten und verständlichen Änderungsgründen.

## Abschnitt C - Kurzantwort

### Frage 5

Warum ist ein Ordner mit dem Namen `projekt-final-final` kein verlässlicher Beleg für den richtigen Projektstand?

#### Erwartete Antwort: Frage 5

Der Name zeigt nicht, was, wann oder warum geändert wurde, ob die Kopie funktioniert oder ob eine andere Kopie maßgeblich ist.

### Frage 6

Nenne einen Unterschied zwischen Git und GitHub.

#### Erwartete Antwort: Frage 6

Git ist ein Versionskontrollsystem, das Repository-Historie aufzeichnet. GitHub ist eine Kollaborationsplattform rund um Git-Repositories.

## Abschnitt D - Praktisches Szenario

### Szenario

Eine Event-Website funktionierte am Montag, aber am Donnerstag schlägt die Registrierung fehl. Das Team besitzt vier unterschiedlich benannte Ordner und ein Backup von Mittwochabend, jedoch keine Aufzeichnung der Änderungen während der Woche.

### Frage

Welche Informationen liefert Versionskontrolle, um die Untersuchung sicherer und gezielter zu machen? Warum reicht das Backup allein nicht aus?

#### Erwartete Antwort: Szenario

Versionskontrolle zeigt die Reihenfolge und den Kontext der Änderungen zwischen dem letzten funktionierenden und dem ersten fehlerhaften Stand. Das Team kann Unterschiede untersuchen und einen bekannten Stand wiederherstellen. Das Backup kann Daten zurückbringen, erklärt aber nicht zwingend die Ursache oder den Zweck einer fehlerhaften Änderung.

## Bewertungsleitfaden

| Ergebnis  | Bewertung                            |
| --------- | ------------------------------------ |
| 90-100%   | Sehr gut                             |
| 75-89%    | Gut                                  |
| 60-74%    | Ausreichend                          |
| Unter 60% | Wiederhole Notebook, Übung und Labor |

## Nächster Schritt

Lerne im nächsten Kapitel, wie Git Projekthistorie modelliert.

### Verwandte Inhalte

- Notebook: [Warum Versionskontrolle?](../../notebooks/de/01-warum-versionskontrolle.md)
- Übung: [Versionskontrolle analysieren](../../exercises/de/01-versionskontrolle-analysieren.md)
- Labor: [Labor zur manuellen Versionierung](../../labs/de/01-manuelle-versionierung-labor.md)
