---
chapter: 37
title: "Eine sichere Cache-Strategie optimieren"
related_notebook: "Abhängigkeits-Caching mit GitHub Actions"
related_exercise: "Einen sicheren Abhängigkeits-Cache entwerfen"
level: Intermediate
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/de/37-github-actions-dependency-caching.md) | [Übung](../../exercises/de/37-design-a-safe-dependency-cache.md) | [Quiz](../../quizzes/de/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Eine sichere Cache-Strategie optimieren

## Ziel

Miss und verbessere die Zeit für die Installation von Abhängigkeiten, während Reproduzierbarkeit und Cache-Sicherheit erhalten bleiben.

## Lernergebnisse

- cachebare Abhängigkeitsdaten erkennen;
- einen Schlüssel und ein Wiederherstellungspräfix erstellen und testen;
- unsicheres oder unwirksames Caching erkennen.

## Szenario

Dein Matrix-Workflow installiert wiederholt dieselben Abhängigkeiten. Füge Caching für den Paketmanager hinzu, vergleiche Läufe und überprüfe, dass eine geänderte Lockdatei den exakten Schlüssel ungültig macht.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- Eine Lockdatei und ein wiederholbarer Befehl zur Installation von Abhängigkeiten.
- Die Berechtigung, den Workflow mehrmals auszuführen.

## Umgebung einrichten

| Anforderung    | Wert                                                   |
| -------------- | ------------------------------------------------------ |
| Betriebssystem | Der vom Projekt verwendete gehostete GitHub-Runner     |
| Software       | Paketmanager des Projekts und GitHub Actions           |
| Version        | In der Lockdatei des Repositorys deklarierte Versionen |

## Aufgaben

### Aufgabe 1 — Ausgangsbasis

1. Führe den Workflow ohne Cache aus.
2. Halte Installationsdauer und Abhängigkeitsbefehl fest.
3. Identifiziere Pfade, die nicht gecacht werden dürfen.

**Erwartetes Ergebnis:** Du hast eine messbare Ausgangsbasis und eine Datenklassifizierung.

### Aufgabe 2 — Den Cache hinzufügen

1. Caches das Downloadverzeichnis des Paketmanagers.
2. Bilde den Schlüssel aus Runner-System und Hash der Lockdatei.
3. Füge ein Wiederherstellungspräfix für dasselbe System hinzu.

**Erwartetes Ergebnis:** Der Cache ist auf kompatible Eingaben begrenzt und fehlt nach Änderungen an der Lockdatei.

### Aufgabe 3 — Sicherheit und Nutzen überprüfen

1. Führe den Workflow zweimal aus und vergleiche Trefferstatus und Dauer.
2. Ändere die Lockdatei in einem kontrollierten Branch und führe den Workflow erneut aus.
3. Bestätige, dass die gesperrte Installation weiterhin ausgeführt wird und kein geheimer Pfad gecacht wird.

**Erwartetes Ergebnis:** Der Cache verbessert wiederholte Läufe, ohne zur Quelle der Wahrheit für Abhängigkeiten zu werden.

## Validierungs-Checkliste

- [ ] Der Cachepfad enthält nur Abhängigkeitsdaten.
- [ ] Der exakte Schlüssel enthält alle relevanten Lockdateien.
- [ ] Der Wiederherstellungsschlüssel ist bewusst breit, aber begrenzt.
- [ ] Die gesperrte Installation läuft nach der Wiederherstellung.
- [ ] Die Ergebnisse zeigen, ob Caching geholfen hat.

## Fehlerbehebung

| Problem                             | Mögliche Ursache                      | Lösung                                                   |
| ----------------------------------- | ------------------------------------- | -------------------------------------------------------- |
| Jeder Lauf verfehlt den Cache       | Der Schlüssel ändert sich unerwartet  | Prüfe Lockdateipfade und Matrixwerte.                    |
| Installation schlägt weiterhin fehl | Cache ist unvollständig oder veraltet | Behalte die normale gesperrte Installation bei.          |
| Vertrauliche Dateien erscheinen     | Cachepfad ist zu breit                | Begrenze den Pfad und rotiere offengelegte Zugangsdaten. |

## Best Practices

- Erstelle vor der Optimierung eine Ausgangsbasis.
- Bevorzuge das Caching über eine Setup-Action, wenn es zum Paketmanager passt.
- Entferne einen Cache, der ohne messbaren Nutzen zusätzliche Komplexität erzeugt.

## Zusammenfassung

Du hast Caching als messbare Optimierung bewertet und die reproduzierbare Installation unter Kontrolle behalten.

### Verwandte Inhalte

- Notebook: [Abhängigkeits-Caching mit GitHub Actions](../../notebooks/de/37-github-actions-dependency-caching.md)
- Übung: [Einen sicheren Abhängigkeits-Cache entwerfen](../../exercises/de/37-design-a-safe-dependency-cache.md)
- Quiz: [Quiz zum Abhängigkeits-Caching](../../quizzes/de/37-dependency-caching-quiz.md)
