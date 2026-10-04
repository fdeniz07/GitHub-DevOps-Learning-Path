---
chapter: 40
title: "Ein Release für kontinuierliche Auslieferung stufenweise ausliefern"
related_notebook: "Kontinuierliche Auslieferung"
related_exercise: "Ein Release für kontinuierliche Auslieferung planen"
related_quiz: "Quiz zur kontinuierlichen Auslieferung"
level: Intermediate
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/40-continuous-delivery.md) | [Übung](../../exercises/de/40-plan-a-continuous-delivery-release.md) | [Roadmap](../../ROADMAP.md)

# Ein Release für kontinuierliche Auslieferung stufenweise ausliefern

## Ziel

Erstelle ein Release-Artefakt, teste es in Staging und dokumentiere die Produktionsbereitschaft, ohne die Produktion automatisch zu deployen.

## Ergebnisse

Du wirst in der Lage sein:

- Package-, Staging- und Produktionsjobs zu trennen.
- ein unveränderliches Artefakt zwischen Jobs zu übertragen.
- eine Freigabegrenze und einen Rollback-Plan nachzuweisen.

## Voraussetzungen

- Schließe Notebook und Übung ab.
- Verstehe `needs`, `upload-artifact` und `download-artifact`.
- Verfüge über einen Build-Befehl für das Projekt.

## Szenario

Ein Service benötigt einen reproduzierbaren Release-Kandidaten. Du erstellst einen Workflow, der einmal paketiert, in Staging validiert und die Produktion hinter einer geschützten Umgebung belässt.

## Umgebung

| Anforderung    | Wert                                                |
| -------------- | --------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                           |
| Software       | GitHub Actions, Git, Build-Tool des Projekts        |
| Zugriff        | Berechtigung zum Erstellen einer Umgebung `staging` |

## Aufgaben

### Aufgabe 1 — Einmal paketieren

Erstelle einen Job `package`, der die Anwendung baut, testet, archiviert und sie als `release-candidate` hochlädt.

**Erwartetes Ergebnis:** Nach einem erfolgreichen Build ist ein benanntes Artefakt verfügbar.

### Aufgabe 2 — Staging validieren

Erstelle einen Job `staging` mit `needs: package`, lade das Artefakt herunter, prüfe seine Prüfsumme und führe einen Smoke-Test aus.

**Erwartetes Ergebnis:** Staging testet genau das Paket, das für das Release vorgesehen ist.

### Aufgabe 3 — Produktionsbereitschaft dokumentieren

Erstelle eine geschützte Umgebung `production` und schreibe die Schritte für Freigabe, Nachweise und Rollback auf. Konfiguriere keine automatische Beförderung.

**Erwartetes Ergebnis:** Die Pipeline kann bei Bedarf ein Release erstellen, deployt aber nicht unbemerkt in die Produktion.

## Validierungs-Checkliste

- [ ] Das Artefakt wird einmal gebaut.
- [ ] Staging lädt das hochgeladene Artefakt herunter.
- [ ] Eine Prüfsumme oder Version wird festgehalten.
- [ ] Die Produktion besitzt eine Freigabegrenze.
- [ ] Rollback verwendet ein bekannt funktionierendes Artefakt.

## Fehlerbehebung

| Problem                             | Mögliche Ursache                                      | Lösung                                           |
| ----------------------------------- | ----------------------------------------------------- | ------------------------------------------------ |
| Artefakt nicht verfügbar            | Job-Abhängigkeit oder Artefaktname unterscheidet sich | `needs` und `name` prüfen.                       |
| Staging verwendet einen neuen Build | Build-Befehle existieren in Staging                   | Neubau entfernen und das Artefakt herunterladen. |
| Freigabe wird umgangen              | Regeln für die Umgebung fehlen                        | Schutz für `production` konfigurieren.           |

## Best Practices

- Halte Artefakte unveränderlich und nachvollziehbar.
- Zeichne Test- und Prüfsummen-Nachweise auf.
- Teste Rollback vor einem echten Release.

## Zusammenfassung

Dieses Lab trennt technische Release-Bereitschaft von der bewussten Entscheidung zur Produktionsfreigabe.

## Weiterführende Links

- Notebook: [Kontinuierliche Auslieferung](../../notebooks/de/40-continuous-delivery.md)
- Übung: [Ein Release für kontinuierliche Auslieferung planen](../../exercises/de/40-plan-a-continuous-delivery-release.md)
- Quiz: [Quiz zur kontinuierlichen Auslieferung](../../quizzes/de/40-continuous-delivery-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
