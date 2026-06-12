---
chapter: 46
title: "Quiz zu Docker-Grundlagen"
related_notebook: "Docker-Grundlagen: Images, Container und Netzwerke"
related_exercise: "Eine Anwendung containerisieren"
related_lab: "Einen Container bauen und ausführen"
level: Anfänger
estimated_time: 20 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/46-docker-fundamentals.md) | [Übung](../../exercises/de/46-containerize-an-application.md) | [Lab](../../labs/de/46-build-and-run-a-container.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Docker-Grundlagen

## Lernziele

- Images, Container, Volumes und Netzwerke erklären.
- Explizite Ports und Speicherverhalten auswählen.
- Nicht-Root-Ausführung von Containern anwenden.

## Fragen

### Frage 1

Was ist ein Docker-Image?

- A. Nur ein laufender Prozess
- B. Ein unveränderliches, geschichtetes Paket zum Erstellen von Containern
- C. Eine Host-Firewallregel
- D. Eine Registry-Zugangsdaten

**Antwort:** B. Ein Image ist das geschichtete Paket, aus dem ein Container erstellt wird.

### Frage 2

Was geschieht mit Daten, die nur in die beschreibbare Containersicht geschrieben wurden, wenn der Container entfernt wird?

**Antwort:** Sie gehen verloren. Verwende für Zustand, der den Austausch überleben muss, ein benanntes Volume oder einen externen Datendienst.

### Frage 3

Richtig oder falsch: `EXPOSE 8080` veröffentlicht Port 8080 automatisch am Host.

**Antwort:** Falsch. `EXPOSE` dokumentiert die Absicht; `--publish 8080:8080` erstellt die Hostzuordnung.

### Frage 4

Warum sollte eine Anwendung normalerweise als Nicht-Root-Benutzer laufen?

**Antwort:** Das verringert die Auswirkungen einer Kompromittierung und macht Besitz- und Berechtigungsannahmen explizit.

### Frage 5

Wie können zwei Container kommunizieren, ohne ihre Ports am Host zu veröffentlichen?

**Antwort:** Verbinde sie mit demselben benutzerdefinierten Docker-Netzwerk und verwende den Dienstnamen des anderen Containers.

### Frage 6

Welche Speicherwahl eignet sich für einen temporären Cache?

- A. Die beschreibbare Containersicht oder ein vergängliches Volume
- B. Ein Produktionsdatenbankpasswort im Image
- C. Ein öffentlicher Registry-Tag
- D. Ein Host-Port

**Antwort:** A. Ein Cache benötigt keinen dauerhaften Speicher, wenn die Anwendung ihn neu erzeugen kann.

## Praktisches Szenario

Ein Dienst schreibt Uploads nach `/app/uploads`, läuft als Root und wird mit `-p 8080:8080` gestartet. Empfiehl drei Änderungen für ein sichereres Deployment.

**Erwartete Antwort:** Dedizierten Benutzer erstellen, `/app/uploads` auf ein benanntes Volume oder externen Speicher mounten und nur den erforderlichen Host-Port veröffentlichen. Außerdem Health-Verhalten ergänzen und Geheimnisse nicht in das Image kopieren.

## Prüfcheckliste

- [ ] Ich kann Image und Container unterscheiden.
- [ ] Ich kann Volume-Persistenz erklären.
- [ ] Ich kann ein benutzerdefiniertes Netzwerk verwenden.
- [ ] Ich kann einen Nicht-Root-Prozess prüfen.
- [ ] Ich verstehe `EXPOSE` im Unterschied zu `--publish`.

## Weiterführende Links

- Notebook: [Docker-Grundlagen](../../notebooks/de/46-docker-fundamentals.md)
- Übung: [Eine Anwendung containerisieren](../../exercises/de/46-containerize-an-application.md)
- Lab: [Einen Container bauen und ausführen](../../labs/de/46-build-and-run-a-container.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
