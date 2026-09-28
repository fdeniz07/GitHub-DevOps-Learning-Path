---
chapter: 46
title: "Eine Anwendung containerisieren"
related_notebook: "Docker-Grundlagen: Images, Container und Netzwerke"
level: Anfänger
estimated_time: 40 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/46-docker-fundamentals.md) | [Lab](../../labs/de/46-build-and-run-a-container.md) | [Roadmap](../../ROADMAP.md)

# Eine Anwendung containerisieren

## Ziel

Verpacke eine kleine HTTP-Anwendung als Nicht-Root-Docker-Image und führe sie mit expliziten Port-, Netzwerk- und Speicherentscheidungen aus.

## Ergebnisse

- Schreibe ein fokussiertes Dockerfile und eine `.dockerignore`.
- Baue ein Image mit vorhersehbarem Tag und veröffentlichtem Port und führe es aus.
- Erkläre, welche Daten in ein Volume gehören, und prüfe den Containerbenutzer.

## Voraussetzungen

- Lies [Docker-Grundlagen](../../notebooks/de/46-docker-fundamentals.md).
- Docker Desktop oder Docker Engine ist installiert.
- Eine kleine Anwendung mit dokumentiertem Startbefehl.

## Szenario

Ein Team hat einen lokalen Dienst, der auf einem Entwicklerrechner funktioniert, aber schwer reproduzierbar ist. Erstelle einen Containervertrag, den ein anderer Entwickler ohne Installation der Laufzeit bauen und ausführen kann.

## Aufgaben

### Aufgabe 1 - Build-Kontext erstellen

Füge ein Dockerfile, `.dockerignore` und einen Health-Endpunkt hinzu. Schließe `.git`, lokale Geheimnisse, Caches und Testausgaben aus dem Build-Kontext aus.

**Erwartetes Ergebnis:** Der Build-Kontext enthält nur zum Bauen und Ausführen des Dienstes benötigte Dateien.

### Aufgabe 2 - Bauen und ausführen

Baue `demo-service:1.0` und führe es mit `--publish 8080:8080` aus. Prüfe den Endpunkt mit Browser oder HTTP-Client.

**Erwartetes Ergebnis:** Der Dienst antwortet auf Port 8080 und der Container kann ohne Löschen der Quelldateien entfernt werden.

### Aufgabe 3 - Isolationsentscheidungen prüfen

Führe `docker exec <container> id` aus, untersuche die Portzuordnung und binde bei benötigtem Zustand ein benanntes Volume am Anwendungsdatenverzeichnis ein.

**Erwartetes Ergebnis:** Der Prozess ist nicht Root, der veröffentlichte Port ist beabsichtigt und persistente Daten liegen außerhalb der beschreibbaren Containersicht.

## Herausforderung

Füge ein benutzerdefiniertes Netzwerk und einen zweiten Testcontainer hinzu. Verbinde dich per Containername mit dem Dienst und erkläre, warum der interne Dienstport in Produktion nicht am Host veröffentlicht werden sollte.

## Selbsteinschätzung

- [ ] Ich kann den Unterschied zwischen Image und Container erklären.
- [ ] Ich kann ein Image mit explizitem Tag bauen und ausführen.
- [ ] Ich kann Nicht-Root-Ausführung prüfen.
- [ ] Ich kann zwischen Volume und vergänglichem Containerspeicher wählen.

## Häufige Fehler

| Fehler                                       | Lösung                                                       |
| -------------------------------------------- | ------------------------------------------------------------ |
| Geheimnisse in das Image kopieren            | `.dockerignore` und Secret-Injektion zur Laufzeit verwenden. |
| Als Root ausführen                           | Einen dedizierten Benutzer erstellen und `USER` setzen.      |
| Annehmen, `EXPOSE` veröffentliche einen Port | `--publish` verwenden, wenn Hostzugriff erforderlich ist.    |

## Zusammenfassung

Eine gute Containerübung macht den Laufzeitvertrag sichtbar: kleiner Build-Kontext, explizite Portzuordnung, Nicht-Root-Ausführung und bewusste Persistenz.

## Weiterführende Links

- Notebook: [Docker-Grundlagen](../../notebooks/de/46-docker-fundamentals.md)
- Lab: [Einen Container bauen und ausführen](../../labs/de/46-build-and-run-a-container.md)
- Quiz: [Quiz zu Docker-Grundlagen](../../quizzes/de/46-docker-fundamentals-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
