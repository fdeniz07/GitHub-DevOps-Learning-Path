---
chapter: 38
title: "Quiz: Artefakte"
related_notebook: "Artefakte in GitHub Actions"
related_exercise: "Workflow-Artefakte veröffentlichen und verwenden"
related_lab: "Build-Artefakte zwischen Jobs teilen"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/de/38-github-actions-artifacts.md) | [Übung](../../exercises/de/38-publish-and-consume-workflow-artifacts.md) | [Labor](../../labs/de/38-share-build-artifacts-between-jobs.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Artefakte

## Lernziele

- den Transfer von Artefakten zwischen Jobs erklären;
- Aufbewahrungs- und Benennungsrichtlinien auswählen;
- Dateien an einer Job-Grenze validieren.

## Fragen

### Frage 1

Warum benötigt ein Workflow Artefakte, um eine Datei von einem Job in einen anderen zu übertragen?

- A. Jobs verwenden immer denselben Runner
- B. Jobs haben isolierte Runner und Arbeitsbereiche
- C. Artefakte ersetzen alle Ausgaben
- D. Artefakte machen Tests optional

**Antwort:** B. Jobs haben isolierte Runner und Arbeitsbereiche.

### Frage 2

Was steuert `retention-days`?

**Erwartete Antwort:** Wie lange das hochgeladene Artefakt verfügbar bleibt, vorbehaltlich der Grenzen des Repositorys oder der Organisation.

### Frage 3

Richtig oder falsch: Ein Cache ist der beste Ort für ein Release-Paket, das verfügbar bleiben muss.

**Antwort:** Falsch. Verwende ein Artefakt oder einen Release-Mechanismus mit bewusst festgelegter Aufbewahrung und Validierung.

### Frage 4

Wie können Matrix-Jobs Kollisionen bei Artefaktnamen vermeiden?

**Erwartete Antwort:** Nimm Matrixwerte oder eine andere eindeutige Identität der Ausführung in den Artefaktnamen auf.

### Frage 5

Was sollte ein Release-Job tun, bevor er ein heruntergeladenes Artefakt ausführt oder veröffentlicht?

**Erwartete Antwort:** Validiere die erwarteten Dateien und ihre Integrität, gegebenenfalls mit Prüfsummen oder Signaturen.

## Praxisszenario

Ein Consumer-Job lädt ein Artefakt mit einem Shell-Skript herunter und führt es sofort aus. Wie sieht ein sichereres Workflow-Design aus?

**Erwartete Antwort:** Beschränke den Upload-Pfad, lade in ein sauberes Verzeichnis herunter, validiere Inhalt und Integrität und gewähre erst nach der Validierung nur die erforderlichen Berechtigungen.

## Review-Checkliste

- [ ] Ich kann Artefakte, Caches und Ausgaben unterscheiden.
- [ ] Ich kann eine Produzent-Consumer-Grenze modellieren.
- [ ] Ich kann eine verantwortungsvolle Aufbewahrungsdauer auswählen.

### Zugehörige Inhalte

- Vorheriges Kapitel: [Abhängigkeits-Caching](../../notebooks/de/37-github-actions-dependency-caching.md)
- Notebook: [Artefakte in GitHub Actions](../../notebooks/de/38-github-actions-artifacts.md)
- Übung: [Workflow-Artefakte veröffentlichen und verwenden](../../exercises/de/38-publish-and-consume-workflow-artifacts.md)
- Labor: [Build-Artefakte zwischen Jobs teilen](../../labs/de/38-share-build-artifacts-between-jobs.md)
