---
chapter: 48
title: "Ein Image in einer Container-Registry veröffentlichen"
related_notebook: "Container-Registries, Tags, Digests und Authentifizierung"
level: Fortgeschritten
estimated_time: 40 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/48-container-registries.md) | [Lab](../../labs/de/48-push-and-scan-a-container-image.md) | [Roadmap](../../ROADMAP.md)

# Ein Image in einer Container-Registry veröffentlichen

## Ziel

Veröffentliche ein versioniertes Image mit Authentifizierung nach dem Prinzip der geringsten Rechte und speichere seinen unveränderlichen Digest.

## Ergebnisse

- Eine vollständig qualifizierte Registry-Image-Referenz erstellen.
- Getrennte Push- und Pull-Berechtigungen verwenden.
- Erklären, warum ein Deployment einen Digest statt eines frei beweglichen Tags verwenden sollte.

## Voraussetzungen

- Lies [Container-Registries](../../notebooks/de/48-container-registries.md).
- Zugriff auf eine private Test-Registry.
- Docker und ein für diese Registry geeigneter Token.

## Szenario

Ein Serviceteam muss Release `1.4.2` veröffentlichen und gleichzeitig einen Commit-Tag für Untersuchung und Rollback bewahren. Das Release muss nachvollziehbar sein und darf keine Zugangsdaten in Logs offenlegen.

## Aufgaben

### Aufgabe 1 - Referenzen definieren

Wähle `registry.example.com/platform/service:1.4.2` und einen Commit-Tag wie `git-a1b2c3d`. Dokumentiere, welcher Tag für Menschen und welcher Bezeichner für Automatisierung bestimmt ist.

**Erwartetes Ergebnis:** Die Release-Richtlinie trennt Auffindbarkeits-Tags von unveränderlichen Deployment-Referenzen.

### Aufgabe 2 - Authentifizieren und pushen

Verwende `docker login registry.example.com` mit einem geschützten Token, tagge das lokale Image und pushe beide Tags. Lege den Token weder in ein Dockerfile noch in die Shell-Historie.

**Erwartetes Ergebnis:** Die Registry enthält beide Tags und die Push-Identität besitzt keinen unabhängigen administrativen Zugriff.

### Aufgabe 3 - Digest speichern

Untersuche das gepushte Image, speichere den Repository-Digest und pulle es mit `registry.example.com/platform/service@sha256:...`.

**Erwartetes Ergebnis:** Eine zweite Umgebung ruft das exakte Manifest ab, das zu den Release-Nachweisen gehört.

## Herausforderung

Entwirf eine Aufbewahrungsregel, die jedes Produktions-Release, die letzten fünf Rollback-Kandidaten und Scan-Nachweise bewahrt und nicht referenzierte Entwicklungs-Tags löscht.

## Selbsteinschätzung

- [ ] Ich kann Tags und Digests erklären.
- [ ] Ich kann einen Registry-Token auf das erforderliche Repository beschränken.
- [ ] Ich kann den Digest speichern und per Digest deployen.
- [ ] Ich kann eine Rollback-Aufbewahrungsanforderung beschreiben.

## Häufige Fehler

| Fehler                               | Lösung                                              |
| ------------------------------------ | --------------------------------------------------- |
| Release-Tags überschreiben           | Release-Tags per Richtlinie unveränderlich machen.  |
| Ein Admin-Token teilen               | Repository-beschränkte Push-Zugangsdaten verwenden. |
| Images ohne Rollback-Analyse löschen | Referenzierte Releases und Kandidaten aufbewahren.  |

## Zusammenfassung

Registry-Publishing ist ein Artefaktkontrollproblem: Nutze klare Tags, beschränkte Authentifizierung, unveränderliche Digests, Aufbewahrung und Audit-Nachweise.

## Weiterführende Links

- Notebook: [Container-Registries](../../notebooks/de/48-container-registries.md)
- Lab: [Ein Container-Image pushen und scannen](../../labs/de/48-push-and-scan-a-container-image.md)
- Quiz: [Quiz zu Container-Registries](../../quizzes/de/48-container-registries-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
