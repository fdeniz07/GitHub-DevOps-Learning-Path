---
chapter: 47
title: "Quiz zu Docker-Build-Pipelines"
related_notebook: "Reproduzierbare Docker-Build-Pipelines"
related_exercise: "Eine Docker-Build-Pipeline entwerfen"
related_lab: "Eine Docker-Build-Pipeline ausführen"
level: Fortgeschritten
estimated_time: 20 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/47-docker-build-pipelines.md) | [Übung](../../exercises/de/47-design-a-docker-build-pipeline.md) | [Lab](../../labs/de/47-run-a-docker-build-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Docker-Build-Pipelines

## Lernziele

- Reproduzierbare und cachefähige Docker-Builds entwerfen.
- Mehrstufige Builds verwenden und das finale Image scannen.
- Veröffentlichung an Tests und Sicherheitsnachweise koppeln.

## Fragen

### Frage 1

Was ist der Hauptvorteil eines mehrstufigen Dockerfiles?

- A. Es garantiert keine Schwachstellen
- B. Es hält Build-Werkzeuge aus dem Laufzeit-Image heraus
- C. Es macht Tests überflüssig
- D. Es macht Tags unveränderlich

**Antwort:** B. Build- und Laufzeitbelange werden getrennt.

### Frage 2

Warum sollte eine Abhängigkeits-Lockdatei den Cache-Schlüssel beeinflussen?

**Antwort:** Eine Abhängigkeitsänderung muss den gecachten Wiederherstellungsschritt invalidieren, damit das Image die deklarierten Versionen nutzt.

### Frage 3

Richtig oder falsch: Das Scannen von Quellabhängigkeiten allein beweist, dass der finale Container sicher ist.

**Antwort:** Falsch. Das finale Image enthält zusätzlich Pakete des Basisbetriebssystems und Laufzeitdateien.

### Frage 4

Nenne zwei nützliche Build-Nachweise.

**Erwartete Antwort:** Beispiele sind Testlogs, ein Schwachstellen-Scanbericht, eine SBOM, Herkunftsmetadaten und die Quell-Commit-Kennung.

### Frage 5

Wann sollte ein geschützter Registry-Veröffentlichungsjob laufen?

**Antwort:** Nach bestandenen Tests, Imageprüfungen und Scan-Gates und nur in einem Kontext, der sicher auf Veröffentlichungszugangsdaten zugreifen kann.

### Frage 6

Warum ist `latest` eine schlechte Deployment-Identität?

**Erwartete Antwort:** Sie ist veränderlich und kann im Laufe der Zeit auf andere Bytes zeigen. Verwende einen Commit-Tag für Nachverfolgbarkeit und einen Digest für das Deployment.

## Praktisches Szenario

Eine Pipeline baut ein Image aus einem frei beweglichen Basis-Tag, testet Quellcode, scannt nur das Repository und pusht vor dem Scanjob. Nenne die vier wichtigsten Änderungen.

**Erwartete Antwort:** Basis-Eingabe kontrollieren oder pinnen, das finale Image testen, das finale Laufzeit-Image scannen und Veröffentlichung von erfolgreichen Tests und Scanrichtlinie abhängig machen. Commit und Image-Digest speichern.

## Prüfcheckliste

- [ ] Ich verstehe mehrstufige Builds.
- [ ] Ich kann Cache-Invalidierung erklären.
- [ ] Ich kann das finale Image scannen.
- [ ] Ich kann Veröffentlichung nach Qualitäts-Gates platzieren.
- [ ] Ich kann Reproduzierbarkeitsnachweise nennen.

## Weiterführende Links

- Notebook: [Reproduzierbare Docker-Build-Pipelines](../../notebooks/de/47-docker-build-pipelines.md)
- Übung: [Eine Docker-Build-Pipeline entwerfen](../../exercises/de/47-design-a-docker-build-pipeline.md)
- Lab: [Eine Docker-Build-Pipeline ausführen](../../labs/de/47-run-a-docker-build-pipeline.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
