---
chapter: 46
title: "Docker-Grundlagen: Images, Container und Netzwerke"
part: "DevOps"
level: Anfänger
estimated_time: 75 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](45-security-best-practices.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- erklären, wie Images, Container, Layer, Volumes und Netzwerke zusammenspielen.
- ein kleines Image mit vorhersehbarer Konfiguration und Portzuordnung bauen und ausführen.
- einen Container als Nicht-Root-Benutzer ausführen und eine passende Speicherstrategie auswählen.

## Einführung

Docker verpackt eine Anwendung und ihre Laufzeitabhängigkeiten in ein Image. Ein Container ist ein laufender Prozess, der aus diesem Image erstellt wird. Dadurch entsteht eine wiederholbare Einheit, die auf einem Laptop, einem CI-Runner oder einer Cloud-Plattform ausgeführt werden kann.

## Warum das wichtig ist

Ein Container-Image macht den Laufzeitvertrag eindeutig: Bibliotheken des Basissystems, Anwendungsdateien, Startbefehl und veröffentlichte Schnittstellen werden gemeinsam beschrieben. Wer die Grenzen zwischen unveränderlichen Image-Layern und beschreibbarem Containerzustand versteht, vermeidet Datenverlust, fragile Builds und unsichere Standardeinstellungen.

## Schlüsselbegriffe

| Begriff             | Definition                                                                                           |
| ------------------- | ---------------------------------------------------------------------------------------------------- |
| Image               | Ein unveränderliches, geschichtetes Paket zum Erstellen von Containern.                              |
| Container           | Ein isolierter Prozess mit einer aus einem Image abgeleiteten Dateisystem- und Netzwerkansicht.      |
| Volume              | Persistenter, von Docker verwalteter Speicher, der in einen oder mehrere Container eingebunden wird. |
| Netzwerk            | Eine virtuelle Verbindung, über die Container per Name und Richtlinie kommunizieren.                 |
| Registry            | Ein Dienst, der Images speichert und verteilt.                                                       |
| Nicht-Root-Benutzer | Eine Prozessidentität, die standardmäßig weder den Host noch geschützte Containerpfade ändern kann.  |

## Theorie

Ein Image wird aus Layern aufgebaut. Jede Dockerfile-Anweisung kann einen Layer hinzufügen. Deshalb verbessert es die Cache-Nutzung, wenn stabile Abhängigkeitsschritte vor häufig geänderten Anwendungsdateien stehen. Container fügen über dem Image eine beschreibbare Schicht hinzu, doch diese Schicht ist vergänglich. Daten, die einen Austausch überleben müssen, gehören in ein Volume oder einen externen Dienst.

Ein Bridge-Netzwerk ermöglicht die Kommunikation zwischen Containern über Dienstnamen. Veröffentlichte Ports verbinden einen Container-Port mit dem Host, zum Beispiel `-p 8080:8080`. Das Veröffentlichen unterscheidet sich vom Angeben eines Ports im Dockerfile: `EXPOSE` dokumentiert einen vorgesehenen Port, während `-p` die Hostverbindung erstellt.

Führe Anwendungsprozesse als dedizierter Nicht-Root-Benutzer aus. Ein Nicht-Root-Standard begrenzt die Auswirkungen einer kompromittierten Anwendung und macht Probleme mit Dateibesitz früh sichtbar. Das Anwendungsverzeichnis muss lesbar sein, und jedes beschreibbare Verzeichnis muss diesem Benutzer gehören.

## Praktische Beispiele

### Ein kleines Image bauen

```dockerfile
FROM python:3.12-slim

WORKDIR /app
RUN useradd --create-home --uid 10001 appuser
COPY --chown=appuser:appuser requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY --chown=appuser:appuser . .
USER appuser
EXPOSE 8080
CMD ["python", "app.py"]
```

Bauen und ausführen:

```bash
docker build --tag demo-service:1.0 .
docker run --rm --name demo-service --publish 8080:8080 demo-service:1.0
```

Das Image enthält die Anwendung und ihre Abhängigkeiten. Der Container ist vergänglich, und der Prozess läuft als `appuser` statt als Root.

### Ein Volume und ein Netzwerk verwenden

```bash
docker network create demo-network
docker volume create demo-data
docker run -d --name database --network demo-network --mount source=demo-data,target=/var/lib/data busybox sleep 3600
docker run --rm --network demo-network demo-service:1.0
```

Das benannte Volume bleibt nach dem Entfernen des Containers erhalten. Das benutzerdefinierte Netzwerk gibt den Containern einen stabilen DNS-Namen wie `database`.

## Selbst ausprobieren

1. Erstelle einen minimalen HTTP-Dienst mit einem `/health`-Endpunkt.
2. Füge seinem Dockerfile einen Nicht-Root-Benutzer hinzu und prüfe ihn mit `docker exec <container> id`.
3. Starte zwei Container in einem benutzerdefinierten Netzwerk und verbinde dich über den Dienstnamen mit einem davon.
4. Stoppe und entferne einen Container und prüfe anschließend, welche Daten im Volume erhalten geblieben sind.

## Best Practices

- Verwende kleine, gepflegte Basis-Images und pinne wichtige Laufzeitversionen.
- Halte Images unveränderlich; injiziere umgebungsspezifische Konfiguration zur Laufzeit.
- Verwende `.dockerignore`, um Zugangsdaten, Build-Ausgaben und lokale Caches auszuschließen.
- Vergib explizite Namen, Healthchecks, Ressourcenlimits und Nicht-Root-Benutzer.
- Verwende Volumes nur für Zustand, der erhalten bleiben muss; bevorzuge für Produktionsdaten verwaltete Datenbanken.

## Häufige Fehler

| Fehler                                            | Warum er Probleme verursacht                                  | So vermeidest du ihn                                        |
| ------------------------------------------------- | ------------------------------------------------------------- | ----------------------------------------------------------- |
| Daten nur in der beschreibbaren Schicht speichern | Die Daten verschwinden beim Austausch des Containers.         | Binde ein Volume ein oder nutze einen externen Datendienst. |
| Jeden Port veröffentlichen                        | Interne Dienste werden vom Host oder Netzwerk aus erreichbar. | Veröffentliche nur erforderliche Einstiegspunkte.           |
| Standardmäßig als Root ausführen                  | Eine Kompromittierung hat größere Auswirkungen.               | Erstelle und wähle einen dedizierten `USER`.                |
| `EXPOSE` mit Portveröffentlichung verwechseln     | Dokumentation erzeugt keine Verbindung.                       | Verwende `--publish` oder eine Plattformspezifikation.      |

## Zusammenfassung

- Images sind unveränderliche geschichtete Pakete; Container sind vergängliche Laufzeitprozesse.
- Volumes speichern Zustand außerhalb der beschreibbaren Containersicht, und Netzwerke ermöglichen kontrollierte Dienstkommunikation.
- Nicht-Root-Ausführung sowie explizite Port- und Speicherentscheidungen sind grundlegende Sicherheitspraktiken für Container.

## Weiterführende Links

- Vorheriges Kapitel: [Sicherheits-Best-Practices](45-security-best-practices.md)
- Übung: [Eine Anwendung containerisieren](../../exercises/de/46-containerize-an-application.md)
- Lab: [Einen Container bauen und ausführen](../../labs/de/46-build-and-run-a-container.md)
- Quiz: [Quiz zu Docker-Grundlagen](../../quizzes/de/46-docker-fundamentals-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
