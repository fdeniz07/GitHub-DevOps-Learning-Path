---
chapter: 22
title: "Quiz: Releases, Packages und Container Registry"
related_notebook: "Releases, Packages und Container Registry"
related_exercise: "Ein versioniertes Release planen"
related_lab: "Ein versioniertes Package veröffentlichen und nutzen"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/22-releases-packages-und-container-registry.md) | [Übung](../../exercises/de/22-versioniertes-release-planen.md) | [Labor](../../labs/de/22-versioniertes-package-veroeffentlichen-und-nutzen.md) | [Roadmap](../../ROADMAP.md)

## Quiz: Releases, Packages und Container Registry

### Frage 1

Wofür steht die `MINOR`-Zahl in `2.3.1` üblicherweise?

- A. Inkompatible öffentliche Änderung
- B. Rückwärtskompatibles neues Feature
- C. Ersetztes Artefakt
- D. Privater Zugangsschlüssel

**Antwort:** B. Eine Minor-Version steht für eine kompatible neue Fähigkeit.

### Frage 2

Welche Aussage unterscheidet Tag und Release richtig?

- A. Ein Tag markiert einen Commit; ein Release kommuniziert Version und Notes.
- B. Ein Release ändert Quellcode; ein Tag speichert ein Image.
- C. Beide müssen verschiedene Versionsnummern haben.

**Antwort:** A. Das Release ergänzt den Quell-Tag um Auslieferungskontext.

### Frage 3

Richtig oder falsch: Bei einem Fehler darf `1.2.0` neu gebaut und überschrieben werden.

**Antwort:** Falsch. Die unveränderliche Version bleibt erhalten; veröffentliche etwa `1.2.1`.

### Frage 4

Warum sollte Produktion eine feste Image-Version oder einen Digest statt `latest` nutzen?

**Antwort:** Die feste Referenz macht das eingesetzte Artefakt wiederholbar und prüfbar.

### Frage 5

Wer braucht Veröffentlichungsrechte für eine Registry?

**Antwort:** Nur verantwortliche Personen oder freigegebene Automatisierung; Lesende erhalten nach Möglichkeit nur Leserechte.

## Zugehörige Inhalte

- [Notebook](../../notebooks/de/22-releases-packages-und-container-registry.md)
- [Übung](../../exercises/de/22-versioniertes-release-planen.md)
- [Labor](../../labs/de/22-versioniertes-package-veroeffentlichen-und-nutzen.md)
