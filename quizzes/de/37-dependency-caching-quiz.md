---
chapter: 37
title: "Quiz: Abhängigkeits-Caching"
related_notebook: "Abhängigkeits-Caching in GitHub Actions"
related_exercise: "Einen sicheren Abhängigkeits-Cache entwerfen"
related_lab: "Eine sichere Cache-Strategie optimieren"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/de/37-github-actions-dependency-caching.md) | [Übung](../../exercises/de/37-design-a-safe-dependency-cache.md) | [Labor](../../labs/de/37-optimize-a-safe-cache-strategy.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Abhängigkeits-Caching

## Lernziele

- exakte und Fallback-Schlüssel entwerfen;
- Caches von Artefakten unterscheiden;
- Sicherheitsrisiken von Caches erkennen.

## Fragen

### Frage 1

Was sollte normalerweise einen Abhängigkeits-Cache-Schlüssel ändern?

- A. Der Name des Workflow-Autors
- B. Der Inhalt der Lockfile
- C. Die aktuelle Minute der Uhr
- D. Die Issue-Nummer

**Antwort:** B. Der Inhalt der Lockfile.

### Frage 2

Welchen Zweck hat ein Wiederherstellungsschlüssel?

**Erwartete Antwort:** Er stellt ein begrenztes Präfix als Fallback bereit, wenn ein exakter Cache-Schlüssel nicht gefunden wird.

### Frage 3

Richtig oder falsch: Ein Cache ersetzt die Verifizierung der Lockfile durch den Paketmanager.

**Antwort:** Falsch. Die normale gesperrte Installation bleibt maßgeblich.

### Frage 4

Welche Inhalte sollten standardmäßig nicht gecacht werden?

- A. Öffentliche Paket-Downloads
- B. Ein Download-Verzeichnis des Paketmanagers
- C. Zugangsdaten und `.env`-Dateien
- D. Ein Hash der Lockfile

**Antwort:** C. Zugangsdaten und `.env`-Dateien.

### Frage 5

Warum sollten Matrix-Dimensionen manchmal in einem Cache-Schlüssel enthalten sein?

**Erwartete Antwort:** Unterschiedliche Betriebssysteme oder Laufzeiten können inkompatible gecachte Daten erzeugen.

## Praxisszenario

Ein Cache wird erfolgreich wiederhergestellt, aber die Installation mit der Lockfile schlägt fehl. Sollte der Workflow dem Cache vertrauen?

**Erwartete Antwort:** Nein. Untersuche Cache-Pfad und -Schlüssel, behalte aber die gesperrte Installation als Quelle der Wahrheit bei und erstelle den Cache bei Bedarf neu oder verfehle ihn.

## Review-Checkliste

- [ ] Ich kann einen Schlüssel aus relevanten Eingaben erstellen.
- [ ] Ich verstehe die Veralterung von Restore-Keys.
- [ ] Ich kann sensible Cache-Inhalte erkennen.

### Zugehörige Inhalte

- Vorheriges Kapitel: [Matrix-Builds](../../notebooks/de/36-github-actions-matrix-builds.md)
- Notebook: [Abhängigkeits-Caching in GitHub Actions](../../notebooks/de/37-github-actions-dependency-caching.md)
- Übung: [Einen sicheren Abhängigkeits-Cache entwerfen](../../exercises/de/37-design-a-safe-dependency-cache.md)
- Labor: [Eine sichere Cache-Strategie optimieren](../../labs/de/37-optimize-a-safe-cache-strategy.md)
