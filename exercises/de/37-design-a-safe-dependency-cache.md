---
chapter: 37
title: "Einen sicheren Dependency-Cache entwerfen"
related_notebook: "GitHub-Actions-Dependency-Caching"
level: Intermediate
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/de/37-github-actions-dependency-caching.md) | [Lab](../../labs/de/37-optimize-a-safe-cache-strategy.md) | [Quiz](../../quizzes/de/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Einen sicheren Dependency-Cache entwerfen

## Ziel

Entwirf einen Cache, der die Installationszeit verkürzt, ohne den Umgang mit Abhängigkeiten oder Secrets zu schwächen.

## Lernergebnisse

- den korrekten Cache-Pfad identifizieren;
- einen exakten Schlüssel und ein Wiederherstellungspräfix erstellen;
- erklären, warum die Installation weiterhin die Lockfile prüft.

## Voraussetzungen

- [GitHub-Actions-Dependency-Caching](../../notebooks/de/37-github-actions-dependency-caching.md) abgeschlossen.
- Ein Paketmanager und eine Lockfile im Übungs-Repository.

## Szenario

Die Installation von Abhängigkeiten ist in einem Matrix-Workflow langsam. Cache Paket-Downloads für jedes Betriebssystem und jeden Lockfile-Stand, während Credentials und Build-Ausgaben aus dem Cache herausgehalten werden.

## Aufgaben

### Aufgabe 1

Notiere den Cache-Pfad des Paketmanagers, den Namen der Lockfile und jede Matrixdimension, die die zwischengespeicherten Daten verändern kann.

### Erwartetes Ergebnis

Der Cache-Bereich basiert auf beobachteten Projekteingaben statt auf Vermutungen.

### Aufgabe 2

Erstelle einen exakten Schlüssel, der das Betriebssystem und den Hash der Lockfile enthält, sowie ein Wiederherstellungspräfix für dasselbe Betriebssystem und denselben Paketmanager.

### Erwartetes Ergebnis

Ein exakter Treffer ist spezifisch, während ein Fallback begrenzt bleibt.

### Aufgabe 3

Erkläre, welcher Installationsbefehl nach der Wiederherstellung ausgeführt wird und warum `.env`, Tokens und erzeugte Release-Dateien ausgeschlossen werden.

### Erwartetes Ergebnis

Das Design behandelt den Cache als Optimierung und schützt sensible Daten.

## Herausforderung

Vergleiche Cache-Trefferrate und Gesamtdauer mit deaktiviertem Caching über drei Läufe.

## Selbsteinschätzung

- [ ] Mein Schlüssel enthält jede relevante Lockfile.
- [ ] Ich verwende ein Wiederherstellungspräfix bewusst.
- [ ] Ich kann unsichere Cache-Inhalte identifizieren.

## Häufige Fehler

| Fehler                                  | Lösung                                           |
| --------------------------------------- | ------------------------------------------------ |
| Lockfile ignorieren                     | In den exakten Schlüssel hashen.                 |
| Veraltete Daten als vollständig ansehen | Die normale Installation mit Lockfile ausführen. |
| Secrets cachen                          | Nur Abhängigkeitsdaten cachen.                   |

## Zusammenfassung

Du hast einen begrenzten Cache entworfen, der Geschwindigkeit ermöglicht und gleichzeitig reproduzierbare Installation und Sicherheit bewahrt.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Dependency-Caching](../../notebooks/de/37-github-actions-dependency-caching.md)
- Lab: [Eine sichere Cache-Strategie optimieren](../../labs/de/37-optimize-a-safe-cache-strategy.md)
- Quiz: [Quiz zu Dependency-Caching](../../quizzes/de/37-dependency-caching-quiz.md)
