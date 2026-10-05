---
chapter: 41
title: "Ein kontrolliertes Deployment ausführen"
related_notebook: "Kontinuierliches Deployment"
related_exercise: "Ein kontrolliertes Deployment entwerfen"
related_quiz: "Quiz zum kontinuierlichen Deployment"
level: Intermediate
estimated_time: 90 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/41-continuous-deployment.md) | [Übung](../../exercises/de/41-design-a-controlled-deployment.md) | [Roadmap](../../ROADMAP.md)

# Ein kontrolliertes Deployment ausführen

## Ziel

Simuliere ein automatisiertes Canary-Deployment mit Health Checks, Concurrency-Schutz und Rollback.

## Ergebnisse

Du wirst in der Lage sein:

- ein getestetes Artefakt durch eine Canary-Stufe zu befördern.
- bei einem ungesunden Signal zu stoppen.
- Nachweise für Deployment und Rollback aufzuzeichnen.

## Voraussetzungen

- Schließe Notebook und Übung ab.
- Verfüge über ein Staging-Artefakt und einen Testendpunkt.
- Verstehe GitHub-Umgebungs- und Concurrency-Einstellungen.

## Szenario

Ein Service ist bereit für kontinuierliches Deployment, aber der Produktionsdatenverkehr muss schrittweise freigegeben werden. Du leitest 10 % des Datenverkehrs weiter, prüfst den Zustand und beförderst den Datenverkehr oder führst ein Rollback aus.

## Umgebung

| Anforderung    | Wert                                                      |
| -------------- | --------------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                                 |
| Software       | GitHub Actions, Shell, Testservice                        |
| Zugriff        | Eine Nichtproduktions- oder Sandbox-Umgebung `production` |

## Aufgaben

### Aufgabe 1 — Den Deployment-Job konfigurieren

Erstelle einen Produktionsjob mit `environment: production`, `concurrency.group: production` und `cancel-in-progress: false`.

**Erwartetes Ergebnis:** Überlappende Produktions-Deployments werden verhindert.

### Aufgabe 2 — Den Canary deployen

Führe einen Deployment-Befehl mit einer Einstellung für 10 % des Datenverkehrs aus. Zeichne Commit-SHA, Artefaktkennung, Startzeit und Benutzer oder Workflow-Lauf auf.

**Erwartetes Ergebnis:** Der Canary ist nachvollziehbar und im Umfang begrenzt.

### Aufgabe 3 — Prüfen und wiederherstellen

Führe Health Checks aus. Bei einem Fehler führst du Rollback aus und bewahrst die Nachweise des fehlgeschlagenen Releases auf. Bei Erfolg beförderst du den Datenverkehr.

**Erwartetes Ergebnis:** Die Entscheidung basiert auf messbarer Gesundheit und der Service kann wiederhergestellt werden.

## Validierungs-Checkliste

- [ ] Ein Canary wird vor dem vollständigen Datenverkehr deployt.
- [ ] Health Checks haben ausdrückliche Schwellenwerte.
- [ ] Produktions-Concurrency ist konfiguriert.
- [ ] Rollback ist ausführbar.
- [ ] Deployment-Nachweise werden aufbewahrt.

## Fehlerbehebung

| Problem                                | Mögliche Ursache                      | Lösung                                                         |
| -------------------------------------- | ------------------------------------- | -------------------------------------------------------------- |
| Zwei Releases überschneiden sich       | `concurrency` fehlt oder ist falsch   | Eine stabile Produktionsgruppe verwenden.                      |
| Canary wird trotz Fehler befördert     | Health-Ergebnis wird ignoriert        | Den Schritt fehlschlagen lassen und die Beförderung absichern. |
| Rollback findet die alte Version nicht | Artefaktaufbewahrung ist unzureichend | Ein bekannt funktionierendes Artefakt aufbewahren.             |

## Best Practices

- Verwende eine Sandbox zum Üben des Deployments.
- Halte Schwellenwerte ausdrücklich und beobachtbar.
- Übe Rollback, bevor du automatische Beförderung aktivierst.

## Zusammenfassung

Kontrolliertes Deployment verbindet Automatisierung mit messbaren Sicherheitsgrenzen und nicht mit manueller Hoffnung.

## Weiterführende Links

- Notebook: [Kontinuierliches Deployment](../../notebooks/de/41-continuous-deployment.md)
- Übung: [Ein kontrolliertes Deployment entwerfen](../../exercises/de/41-design-a-controlled-deployment.md)
- Quiz: [Quiz zum kontinuierlichen Deployment](../../quizzes/de/41-continuous-deployment-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
