---
chapter: 47
title: "Eine Docker-Build-Pipeline entwerfen"
related_notebook: "Reproduzierbare Docker-Build-Pipelines"
level: Fortgeschritten
estimated_time: 45 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/47-docker-build-pipelines.md) | [Lab](../../labs/de/47-run-a-docker-build-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Eine Docker-Build-Pipeline entwerfen

## Ziel

Entwirf einen CI-Workflow, der ein reproduzierbares Docker-Image baut, testet, scannt und veröffentlicht.

## Ergebnisse

- Build-, Test-, Scan- und Veröffentlichungsstufen sicher anordnen.
- Cache-Eingaben und unveränderliche Image-Bezeichner auswählen.
- Eine Schwachstellenrichtlinie und einen Ausnahmevermerk definieren.

## Voraussetzungen

- Lies [Reproduzierbare Docker-Build-Pipelines](../../notebooks/de/47-docker-build-pipelines.md).
- Verstehe Dockerfiles, Lockdateien, CI-Jobs und Registry-Authentifizierung.
- Zugriff auf eine CI-Plattform oder einen YAML-Editor.

## Szenario

Ein Team veröffentlicht derzeit ein Image, bevor Tests fertig sind, und verwendet `latest` für Deployments. Entwirf den Workflow neu, damit das finale Image vor der Veröffentlichung getestet und gescannt wird.

## Aufgaben

### Aufgabe 1 - Pipeline-Stufen abbilden

Zeichne oder liste Checkout, Abhängigkeitswiederherstellung, Unit-Tests, Image-Build, Image-Test, Schwachstellen-Scan, SBOM-Erzeugung und Veröffentlichung.

**Erwartetes Ergebnis:** Jede Stufe hat einen Grund und hängt von früheren Nachweisen ab.

### Aufgabe 2 - Reproduzierbare Eingaben definieren

Lege Lockdatei, Basis-Image-Richtlinie, Commit-Tag, Build-Kontext und Cache-Schlüssel fest. Gib an, welche Änderungen den Abhängigkeits-Cache invalidieren.

**Erwartetes Ergebnis:** Ein Prüfer erkennt, wann zwei Builds unterschiedliche Ergebnisse liefern sollten.

### Aufgabe 3 - Qualitäts-Gates hinzufügen

Schreibe einen Workflow-Ausschnitt, der bei vereinbarten `HIGH`- und `CRITICAL`-Befunden fehlschlägt und nur das mit dem geprüften Commit getaggte Image veröffentlicht.

**Erwartetes Ergebnis:** Pull-Request-Code kann keine Produktionszugangsdaten nutzen, und fehlgeschlagene Scans werden nicht gefördert.

## Herausforderung

Füge Herkunfts- und SBOM-Artefakte zum Workflow hinzu und beschreibe, wie ein Release-Prüfer sie mit dem Image-Digest verbindet.

## Selbsteinschätzung

- [ ] Ich kann erklären, warum mehrstufige Builds Laufzeitinhalte reduzieren.
- [ ] Ich kann Cache-Optimierung von einem Sicherheits-Gate unterscheiden.
- [ ] Ich kann das finale Laufzeit-Image scannen.
- [ ] Ich kann Veröffentlichung vor bestandenen Tests verhindern.

## Häufige Fehler

| Fehler                                           | Lösung                                                |
| ------------------------------------------------ | ----------------------------------------------------- |
| `latest` als Release-Identität wiederverwenden   | Mit Commit taggen und per Digest deployen.            |
| Nur Quelldateien scannen                         | Das finale Image einschließlich Basispaketen scannen. |
| Veröffentlichungszugang mit Pull Requests teilen | Geschützte Veröffentlichungsjobs isolieren.           |

## Zusammenfassung

Eine Docker-Build-Pipeline sollte Nachweise in der richtigen Reihenfolge erzeugen und nur ein getestetes, gescanntes und nachvollziehbares Image veröffentlichen.

## Weiterführende Links

- Notebook: [Reproduzierbare Docker-Build-Pipelines](../../notebooks/de/47-docker-build-pipelines.md)
- Lab: [Eine Docker-Build-Pipeline ausführen](../../labs/de/47-run-a-docker-build-pipeline.md)
- Quiz: [Quiz zu Docker-Build-Pipelines](../../quizzes/de/47-docker-build-pipelines-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
