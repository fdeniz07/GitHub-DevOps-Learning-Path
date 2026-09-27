---
chapter: 40
title: "Ein Release für kontinuierliche Auslieferung planen"
related_notebook: "Kontinuierliche Auslieferung"
related_lab: "Ein Release für kontinuierliche Auslieferung stufenweise ausliefern"
related_quiz: "Quiz zur kontinuierlichen Auslieferung"
level: Intermediate
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/40-continuous-delivery.md) | [Lab](../../labs/de/40-stage-a-continuous-delivery-release.md) | [Roadmap](../../ROADMAP.md)

# Ein Release für kontinuierliche Auslieferung planen

## Ziel

Plane eine Release-Pipeline, die einmal baut, das Ergebnis testet, ein unveränderliches Artefakt veröffentlicht und ein Produktionsrelease bei Bedarf verfügbar macht.

## Ergebnisse

Du wirst in der Lage sein:

- Release-Bereitschaft von einem automatischen Produktions-Deployment zu unterscheiden.
- Grenzen für Artefakt, Staging, Freigabe und Rollback zu definieren.
- zu erklären, wie Nachverfolgbarkeit erhalten bleibt.

## Voraussetzungen

- Lies [Kontinuierliche Auslieferung](../../notebooks/de/40-continuous-delivery.md).
- Verstehe Jobs, `needs` und Artefakte in GitHub Actions.
- Kenne den Unterschied zwischen Staging und Produktion.

## Szenario

Ein Webservice wird für Staging und Produktion separat neu gebaut. Das Team möchte einen sichereren Release-Prozess, der einen getesteten Release-Kandidaten erstellt und einer autorisierten Person später die Freigabe für die Produktion ermöglicht.

## Aufgaben

### Aufgabe 1 — Die Stufen abbilden

Entwirf die Stufen `package`, `staging` und `production`. Gib an, von welchem früheren Job jeder Job abhängt.

**Erwartetes Ergebnis:** Der Plan macht die Reihenfolge der Beförderung ausdrücklich sichtbar.

### Aufgabe 2 — Artefakt-Nachweise definieren

Wähle einen Artefaktnamen, eine Prüfsumme, eine Versionskennung und einen Testnachweis. Erkläre, warum die Produktion das von der Paketierungsstufe erstellte Artefakt herunterladen muss.

**Erwartetes Ergebnis:** Das Release lässt sich auf ein getestetes, unveränderliches Artefakt zurückführen.

### Aufgabe 3 — Die Freigabegrenze definieren

Beschreibe, wie eine geschützte Umgebung `production` die Release-Freigabe steuern soll und wie ein Rollback angefordert wird.

**Erwartetes Ergebnis:** Der Plan bewahrt kontinuierliche Auslieferung, ohne unbemerkt zu kontinuierlichem Deployment zu werden.

## Herausforderung

Füge ein Release-Manifest mit Commit-SHA, Hash der Dependency-Lock-Datei, Testergebnis und Build-Zeitstempel hinzu. Erkläre, welche Werte unveränderlich sein müssen.

## Selbstprüfung

- [ ] Ich kann kontinuierliche Auslieferung in einem Satz erklären.
- [ ] Ich habe eine Beförderung nach dem Prinzip „einmal bauen“ entworfen.
- [ ] Ich habe Nachweise für Freigabe und Rollback einbezogen.
- [ ] Ich weiß, warum Neubauen die Nachverfolgbarkeit schwächt.

## Häufige Fehler

| Fehler                                    | Lösung                                                                            |
| ----------------------------------------- | --------------------------------------------------------------------------------- |
| Für die Produktion neu bauen              | Das getestete Artefakt befördern.                                                 |
| Staging als Produktionsfreigabe behandeln | Die Freigabegrenze ausdrücklich halten.                                           |
| Rollback auslassen                        | Ein bekannt funktionierendes Artefakt und eine Wiederherstellungsaktion benennen. |

## Zusammenfassung

Kontinuierliche Auslieferung macht jede akzeptierte Änderung veröffentlichbar und bewahrt gleichzeitig eine bewusste Produktionsentscheidung.

## Weiterführende Links

- Notebook: [Kontinuierliche Auslieferung](../../notebooks/de/40-continuous-delivery.md)
- Lab: [Ein Release für kontinuierliche Auslieferung stufenweise ausliefern](../../labs/de/40-stage-a-continuous-delivery-release.md)
- Quiz: [Quiz zur kontinuierlichen Auslieferung](../../quizzes/de/40-continuous-delivery-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
