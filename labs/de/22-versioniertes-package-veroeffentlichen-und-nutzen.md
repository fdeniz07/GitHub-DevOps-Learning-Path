---
chapter: 22
title: "Ein versioniertes Package veröffentlichen und nutzen"
related_notebook: "Releases, Packages und Container Registry"
related_exercise: "Ein versioniertes Release planen"
level: Einsteiger
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/22-releases-packages-und-container-registry.md) | [Übung](../../exercises/de/22-versioniertes-release-planen.md) | [Quiz](../../quizzes/de/22-releases-packages-und-container-registry-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ein versioniertes Package veröffentlichen und nutzen

## Ziel

Übe Planung und Prüfung für die Veröffentlichung und Nutzung einer unveränderlichen Package- oder Container-Image-Version.

## Voraussetzungen

- Ein Trainingsprojekt mit aktivierter Package- oder Container Registry.
- Rechte zum Veröffentlichen eines Testartefakts und Lesen aus einem Consumer-Projekt.
- Von der Plattform verwaltete CI-Anmeldung. Keine Tokens oder Passwörter in Dateien, Befehlen oder Notizen speichern.

## Aufgaben

### Aufgabe 1 - Release vorbereiten

1. Geprüften Commit wählen und eine Version wie `1.0.0` festlegen.
2. Passenden Tag erstellen und Release Notes zu Wirkung und Prüfung formulieren.
3. Namensraum sowie berechtigte Personen oder Automatisierung bestätigen.

### Aufgabe 2 - Einmal veröffentlichen

1. Die erlaubte CI-Veröffentlichungsmethode außerhalb der Versionsverwaltung konfigurieren.
2. Package oder Image bauen und `1.0.0` veröffentlichen.
3. In der Registry Name, Version oder Tag, Besitz und Zeitstempel prüfen.

### Aufgabe 3 - Explizit nutzen

1. Im Consumer genau `1.0.0` statt `latest` anfordern.
2. Den passenden Prüfprozess ausführen.
3. Eine Korrektur als neue Patch-Version planen, ohne `1.0.0` zu ersetzen.

## Erwartetes Ergebnis

Der Consumer nutzt exakt das zum Release gehörende Artefakt; die veröffentlichte Ursprungsversion bleibt unverändert.

## Prüfliste

- [ ] Tag, Release und Registry-Version stimmen überein.
- [ ] Release Notes erklären die Wirkung.
- [ ] Veröffentlichungsrechte sind auf berechtigte Stelle begrenzt.
- [ ] Nutzung erfolgt per fester Version oder Digest.
- [ ] Keine Zugangsdaten liegen im Repository.

## Zugehörige Inhalte

- [Notebook](../../notebooks/de/22-releases-packages-und-container-registry.md)
- [Übung](../../exercises/de/22-versioniertes-release-planen.md)
- [Quiz](../../quizzes/de/22-releases-packages-und-container-registry-quiz.md)
