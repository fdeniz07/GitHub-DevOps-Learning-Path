---
chapter: 46
title: "Einen Container bauen und ausführen"
related_notebook: "Docker-Grundlagen: Images, Container und Netzwerke"
related_exercise: "Eine Anwendung containerisieren"
level: Anfänger
estimated_time: 90 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/46-docker-fundamentals.md) | [Übung](../../exercises/de/46-containerize-an-application.md) | [Roadmap](../../ROADMAP.md)

# Einen Container bauen und ausführen

## Ziel

Baue ein kleines Dienst-Image, führe es als Nicht-Root-Container aus und zeige das Verhalten von Netzwerk und Volume.

## Ergebnisse

- Ein funktionierendes Dockerfile und Image erzeugen.
- Portveröffentlichung, Nicht-Root-Ausführung und Health-Verhalten prüfen.
- Ausgewählte Daten mit einem benannten Volume persistieren.

## Voraussetzungen

Vor Beginn dieses Labs solltest du Folgendes haben:

- Das zugehörige Notebook und die Übung abgeschlossen.
- Docker Desktop oder Docker Engine.
- Ein Terminal und einen lokalen HTTP-Dienst mit Startbefehl.

## Szenario

Du bereitest einen Dienst für eine gemeinsame Entwicklungsumgebung vor. Das Lab erzeugt ein wiederholbares Image und Nachweise dafür, dass seine Laufzeitannahmen explizit sind.

## Umgebung

| Anforderung    | Wert                                                |
| -------------- | --------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                           |
| Software       | Docker Engine oder Docker Desktop, Git, HTTP-Client |
| Image          | `demo-service:1.0`                                  |
| Host-Port      | `8080`                                              |

## Aufgaben

### Aufgabe 1 - Image bauen

Erstelle `.dockerignore` und ein Dockerfile mit einem dedizierten Nicht-Root-Benutzer. Baue mit `docker build --tag demo-service:1.0 .`.

**Erwartetes Ergebnis:** Das Image wird gebaut, ohne lokale Geheimnisse oder unnötige Ausgaben einzuschließen.

### Aufgabe 2 - Ausführen und untersuchen

Führe `docker run --detach --name demo-service --publish 8080:8080 demo-service:1.0` aus. Rufe den Health-Endpunkt auf, untersuche Logs und führe `docker exec demo-service id` aus.

**Erwartetes Ergebnis:** Der Endpunkt antwortet und die Prozessidentität ist nicht Root.

### Aufgabe 3 - Netzwerk und Speicher testen

Erstelle `docker network create demo-network` und `docker volume create demo-data`. Verbinde den Dienst mit dem Netzwerk und binde das Volume am dokumentierten Datenpfad ein. Entferne und erstelle den Container neu.

**Erwartetes Ergebnis:** Das benannte Volume überlebt den Containeraustausch und die Netzwerkkommunikation nutzt die beabsichtigte Grenze.

## Validierungscheckliste

- [ ] Das Image hat das erwartete Tag.
- [ ] Der Health-Endpunkt antwortet auf Port 8080.
- [ ] Der Containerprozess ist nicht Root.
- [ ] Die Container-Logs enthalten keine Zugangsdaten.
- [ ] Erforderliche Daten überleben den Containeraustausch im benannten Volume.

## Fehlerbehebung

| Problem                         | Mögliche Ursache                               | Lösung                                                                |
| ------------------------------- | ---------------------------------------------- | --------------------------------------------------------------------- |
| Port ist bereits belegt         | Ein anderer Prozess verwendet 8080             | Stoppe ihn oder veröffentliche einen anderen Host-Port.               |
| Zugriff im Container verweigert | Dateien gehören Root                           | Verwende `COPY --chown` und ein beschreibbares Anwendungsverzeichnis. |
| Daten verschwinden              | Daten wurden in die Containersicht geschrieben | Binde `demo-data` am richtigen Pfad ein.                              |

## Best Practices

- Entferne Testcontainer nach dem Lab mit `docker rm --force demo-service`.
- Halte Images unveränderlich und nutze explizite Tags.
- Kopiere niemals `.env`-Dateien mit Geheimnissen in den Build-Kontext.

## Zusammenfassung

Dieses Lab macht Docker-Konzepte zu Nachweisen: ein Nicht-Root-Prozess, beabsichtigte Konnektivität und dauerhafte Daten außerhalb der Containersicht.

## Weiterführende Links

- Notebook: [Docker-Grundlagen](../../notebooks/de/46-docker-fundamentals.md)
- Übung: [Eine Anwendung containerisieren](../../exercises/de/46-containerize-an-application.md)
- Quiz: [Quiz zu Docker-Grundlagen](../../quizzes/de/46-docker-fundamentals-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
