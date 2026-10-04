---
chapter: 38
title: "Build-Artefakte zwischen Jobs teilen"
related_notebook: "GitHub-Actions-Artefakte"
related_exercise: "Workflow-Artefakte veröffentlichen und verwenden"
level: Intermediate
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/de/38-github-actions-artifacts.md) | [Übung](../../exercises/de/38-publish-and-consume-workflow-artifacts.md) | [Quiz](../../quizzes/de/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# Build-Artefakte zwischen Jobs teilen

## Ziel

Erstelle einen Producer-Consumer-Workflow, der Builddateien sicher überträgt, validiert und aufbewahrt.

## Lernergebnisse

- Jobgrenzen mit `needs` modellieren;
- benannte Artefakte hoch- und herunterladen;
- Aufbewahrungs- und Validierungssteuerungen anwenden.

## Szenario

Ein Build-Job erzeugt ein Paket und einen Testbericht. Ein Prüfjob validiert den Bericht und ein Job zur Releasevorbereitung erhält nur das validierte Paket. Kein Job darf annehmen, dass Dateien auf seinem Runner bestehen bleiben.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- Ein deterministischer Build- oder Testbefehl.
- Ein Repository, in dem Workflow-Läufe überprüft werden können.

## Umgebung einrichten

| Anforderung    | Wert                                          |
| -------------- | --------------------------------------------- |
| Betriebssystem | Von GitHub gehosteter Ubuntu-Runner           |
| Software       | GitHub Actions und das Buildtool des Projekts |
| Version        | Vom Übungsprojekt unterstützte Versionen      |

## Aufgaben

### Aufgabe 1 — Begrenzte Artefakte erzeugen

1. Baue in ein eigenes Ausgabeverzeichnis.
2. Lade Paket und Bericht als getrennte benannte Artefakte hoch.
3. Lege eine kurze Aufbewahrung für den Bericht und eine richtlinienkonforme Aufbewahrung für das Paket fest.

**Erwartetes Ergebnis:** Artefakte enthalten nur die vorgesehenen Dateien und haben klare Lebenszyklen.

### Aufgabe 2 — Über eine Grenze hinweg prüfen

1. Mache den Prüfjob vom Build-Job abhängig.
2. Lade den Bericht in ein sauberes Verzeichnis herunter.
3. Validiere erwartete Dateinamen und Inhalte, bevor du fortfährst.

**Erwartetes Ergebnis:** Der Consumer erhält eine explizite Eingabe und lehnt einen ungültigen Bericht ab.

### Aufgabe 3 — Ein Release vorbereiten

1. Lade nur das Paketartefakt in den Release-Job herunter.
2. Überprüfe eine Prüfsumme oder ein anderes für das Projekt passendes Integritätssignal.
3. Deaktiviere die Veröffentlichung, bis die Validierung erfolgreich ist.

**Erwartetes Ergebnis:** Die Releasevorbereitung verwendet eine Übergabe von Dateien mit geringsten Berechtigungen.

## Validierungs-Checkliste

- [ ] Jeder Consumer hat eine explizite `needs`-Beziehung.
- [ ] Artefaktnamen können zwischen Matrix-Jobs nicht kollidieren.
- [ ] Die Aufbewahrung entspricht Wert und Vertraulichkeit.
- [ ] Heruntergeladene Dateien werden vor der Verwendung validiert.
- [ ] Kein Secret und kein vollständiger Workspace werden hochgeladen.

## Fehlerbehebung

| Problem                         | Mögliche Ursache                                    | Lösung                                                      |
| ------------------------------- | --------------------------------------------------- | ----------------------------------------------------------- |
| Artefakt fehlt                  | Producer ist fehlgeschlagen oder der Name weicht ab | Producer und exakten Namen prüfen.                          |
| Dateien sind nicht vorhanden    | Jobs verwenden getrennte Runner                     | Artefakt ausdrücklich herunterladen.                        |
| Release verwendet falsche Datei | Breiter Pfad oder wiederverwendeter Name            | Pfade begrenzen und Lauf- oder Matrixidentität einbeziehen. |

## Best Practices

- Behandle Artefaktinhalte als nicht vertrauenswürdig, bis sie geprüft wurden.
- Halte Releaseberechtigungen auf den kleinstmöglichen Job begrenzt.
- Dokumentiere, warum die Aufbewahrungswerte angemessen sind.

## Zusammenfassung

Das Labor macht die Bewegung von Dateien über Jobgrenzen hinweg explizit, begrenzt und überprüfbar.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Artefakte](../../notebooks/de/38-github-actions-artifacts.md)
- Übung: [Workflow-Artefakte veröffentlichen und verwenden](../../exercises/de/38-publish-and-consume-workflow-artifacts.md)
- Quiz: [Quiz zu Artefakten](../../quizzes/de/38-artifacts-quiz.md)
