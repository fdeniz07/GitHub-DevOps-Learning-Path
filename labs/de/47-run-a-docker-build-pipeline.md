---
chapter: 47
title: "Eine Docker-Build-Pipeline ausführen"
related_notebook: "Reproduzierbare Docker-Build-Pipelines"
related_exercise: "Eine Docker-Build-Pipeline entwerfen"
level: Fortgeschritten
estimated_time: 100 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/47-docker-build-pipelines.md) | [Übung](../../exercises/de/47-design-a-docker-build-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Eine Docker-Build-Pipeline ausführen

## Ziel

Implementiere eine lokale oder CI-Pipeline, die ein unveränderliches Container-Artefakt baut, testet, scannt und dokumentiert.

## Ergebnisse

- Ein mehrstufiges Dockerfile und eine Abhängigkeits-Lockdatei verwenden.
- Tests gegen das gebaute Image ausführen.
- Scan- und Build-Nachweise vor der Veröffentlichung erzeugen.

## Voraussetzungen

- Notebook und Übung abgeschlossen.
- Docker und ein Projekt mit reproduzierbarer Abhängigkeitsinstallation.
- Ein Schwachstellenscanner wie Trivy, lokal installiert oder in CI verfügbar.

## Szenario

Ein Dienst-Image ist groß geworden und wird vor den Tests veröffentlicht. Verbessere die Pipeline, damit das Laufzeit-Image kleiner ist und Veröffentlichung bei Test- oder Scanfehler blockiert wird.

## Umgebung

| Anforderung    | Wert                                                |
| -------------- | --------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                           |
| Software       | Docker, Projekttest-Runner, Trivy oder gleichwertig |
| Image-Tag      | `service:${GIT_COMMIT}`                             |
| Nachweise      | Testlog, Scanbericht, SBOM                          |

## Aufgaben

### Aufgabe 1 - Build- und Laufzeitstufen erstellen

Verschiebe Kompilierungs- und Testabhängigkeiten in eine Build-Stufe. Kopiere nur die Laufzeitausgabe in die finale Stufe und setze einen Nicht-Root-Benutzer.

**Erwartetes Ergebnis:** Das Laufzeit-Image enthält keine Compiler und keine Quellcodeverwaltungsmetadaten.

### Aufgabe 2 - Image testen

Baue mit einem Commit-basierten Tag, starte das Image, führe Tests oder Smoke-Checks aus und speichere die Ausgabe als Artefakt.

**Erwartetes Ergebnis:** Tests prüfen dasselbe Image, das gescannt und veröffentlicht wird.

### Aufgabe 3 - Scannen und Gate setzen

Führe `trivy image --severity HIGH,CRITICAL --exit-code 1 service:${GIT_COMMIT}` aus. Erzeuge eine SBOM und dokumentiere jede genehmigte, befristete Ausnahme.

**Erwartetes Ergebnis:** Eine fehlgeschlagene Richtlinie verhindert Veröffentlichung und ein erfolgreicher Lauf bewahrt Nachweise.

## Validierungscheckliste

- [ ] Der Build-Kontext schließt Geheimnisse und lokale Artefakte aus.
- [ ] Die mehrstufige Ausgabe enthält nur Laufzeitanforderungen.
- [ ] Tests laufen gegen das finale Image.
- [ ] Der Scan zielt auf den exakten Commit-Tag.
- [ ] SBOM und Logs werden aufbewahrt.

## Fehlerbehebung

| Problem                                   | Mögliche Ursache                               | Lösung                                                                         |
| ----------------------------------------- | ---------------------------------------------- | ------------------------------------------------------------------------------ |
| Cache verbirgt eine Abhängigkeitsänderung | Lockdatei fehlt im Cache-Schlüssel             | Lockdateiinhalt in den Schlüssel aufnehmen.                                    |
| Scanner meldet Basis-Schwachstellen       | Laufzeit-Basis-Image ist veraltet              | Basis-Image aktualisieren oder eine zeitlich begrenzte Ausnahme dokumentieren. |
| Veröffentlichung läuft nach Fehler        | Jobs sind nicht durch Abhängigkeiten verbunden | Test- und Scan-Jobs vor Veröffentlichung verlangen.                            |

## Best Practices

- Artefaktwirksame Eingaben pinnen und den Quell-Commit speichern.
- Scanrichtlinie vom Image-Build-Code trennen, aber in der Pipeline erzwingen.
- Ausnahmen zuständigkeitsgebunden, begründet und automatisch ablaufend machen.

## Zusammenfassung

Eine vertrauenswürdige Build-Pipeline erzeugt ein getestetes Laufzeit-Image, scannt es und bewahrt Nachweise vor jedem Registry-Push.

## Weiterführende Links

- Notebook: [Reproduzierbare Docker-Build-Pipelines](../../notebooks/de/47-docker-build-pipelines.md)
- Übung: [Eine Docker-Build-Pipeline entwerfen](../../exercises/de/47-design-a-docker-build-pipeline.md)
- Quiz: [Quiz zu Docker-Build-Pipelines](../../quizzes/de/47-docker-build-pipelines-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
