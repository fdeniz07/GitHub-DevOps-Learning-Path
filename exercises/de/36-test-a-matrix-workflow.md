---
chapter: 36
title: "Einen Matrix-Workflow testen"
related_notebook: "GitHub-Actions-Matrix-Builds"
level: Intermediate
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/35-composite-actions.md) | [Notebook](../../notebooks/de/36-github-actions-matrix-builds.md) | [Lab](../../labs/de/36-run-a-multi-platform-matrix.md) | [Quiz](../../quizzes/de/36-matrix-builds-quiz.md) | [Roadmap](../../ROADMAP.md)

# Einen Matrix-Workflow testen

## Ziel

Entwirf eine Matrix, die unterstützte Kombinationen aus Laufzeit und Betriebssystem testet, ohne nicht unterstützte Fälle zu verbergen.

## Lernergebnisse

- die von einer Matrix erzeugten Kombinationen berechnen;
- `include` und `exclude` bewusst verwenden;
- eine sinnvolle `fail-fast`-Strategie auswählen.

## Voraussetzungen

- [GitHub-Actions-Matrix-Builds](../../notebooks/de/36-github-actions-matrix-builds.md) abgeschlossen.
- Ein Repository mit einem kleinen Testbefehl.

## Szenario

Dein Projekt unterstützt zwei Laufzeiten auf Ubuntu und Windows, aber eine alte Laufzeit wird unter Windows nicht unterstützt. Drücke diese Richtlinie in einem Job aus.

## Aufgaben

### Aufgabe 1

Schreibe eine Matrix mit `os: [ubuntu-latest, windows-latest]` und zwei Laufzeitwerten. Liste jede anfängliche Kombination auf.

### Erwartetes Ergebnis

Du kannst das kartesische Produkt vor dem Anwenden von Ausschlüssen angeben.

### Aufgabe 2

Schließe die nicht unterstützte Kombination aus und setze `fail-fast` abhängig davon, ob eine plattformübergreifende Diagnose wichtig ist.

### Erwartetes Ergebnis

Nur unterstützte Kombinationen werden ausgeführt, und die Fehlerstrategie ist bewusst gewählt.

### Aufgabe 3

Gib beide Matrixwerte im Job aus und prüfe, ob die Laufzusammenfassung ein eindeutiges Ergebnis pro Kombination enthält.

### Erwartetes Ergebnis

Jeder Job ist anhand seines Betriebssystems und seiner Laufzeit identifizierbar.

## Herausforderung

Verwende `include`, um eine experimentelle Kombination als nicht blockierend zu markieren, und erkläre den Zielkonflikt.

## Selbsteinschätzung

- [ ] Ich kann die erweiterten Kombinationen vorhersagen.
- [ ] Ich kann einen Ausschluss begründen.
- [ ] Ich kann die Wirkung von `fail-fast` erklären.

## Häufige Fehler

| Fehler                                  | Lösung                                           |
| --------------------------------------- | ------------------------------------------------ |
| Nicht unterstützte Kombinationen testen | Unterstützungsrichtlinie mit `exclude` kodieren. |
| Mehrdeutige Protokolle                  | Matrixdimensionen in jedem Job ausgeben.         |
| Nützliche Diagnosen abbrechen           | `fail-fast` anhand des Ziels auswählen.          |

## Zusammenfassung

Du hast eine Unterstützungsrichtlinie als lesbare, begrenzte Matrix ausgedrückt, statt Jobs zu duplizieren.

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Matrix-Builds](../../notebooks/de/36-github-actions-matrix-builds.md)
- Lab: [Eine Multi-Plattform-Matrix ausführen](../../labs/de/36-run-a-multi-platform-matrix.md)
- Quiz: [Quiz zu Matrix-Builds](../../quizzes/de/36-matrix-builds-quiz.md)
