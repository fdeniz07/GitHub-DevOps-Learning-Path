---
chapter: 48
title: "Ein Container-Image pushen und scannen"
related_notebook: "Container-Registries, Tags, Digests und Authentifizierung"
related_exercise: "Ein Image in einer Container-Registry veröffentlichen"
level: Fortgeschritten
estimated_time: 90 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/48-container-registries.md) | [Übung](../../exercises/de/48-publish-an-image-to-a-container-registry.md) | [Roadmap](../../ROADMAP.md)

# Ein Container-Image pushen und scannen

## Ziel

Veröffentliche ein versioniertes Image in einer privaten Registry, scanne es und speichere den für das Deployment verwendeten Digest.

## Ergebnisse

- Mit einem beschränkten Registry-Token authentifizieren.
- Release- und Commit-Tags anwenden, ohne sie mit unveränderlicher Identität zu verwechseln.
- Scan-Ergebnisse prüfen und das Image per Digest pullen.

## Voraussetzungen

- Notebook und Übung abgeschlossen.
- Private Test-Registry und Nicht-Administrator-Token.
- Docker und ein Scanner wie Trivy.

## Szenario

Ein Release-Kandidat muss für ein Deploymentsystem verfügbar sein, während ein Sicherheitsprüfer seinen Inhalt kontrolliert. Der Prüfer benötigt einen stabilen Digest und Nachweise über die Scanrichtlinie.

## Umgebung

| Anforderung    | Wert                                             |
| -------------- | ------------------------------------------------ |
| Betriebssystem | Windows, Linux oder macOS                        |
| Registry       | `registry.example.com/platform`                  |
| Release-Image  | `service:1.4.2`                                  |
| Scanrichtlinie | Bei `HIGH`- und `CRITICAL`-Befunden fehlschlagen |

## Aufgaben

### Aufgabe 1 - Sicher authentifizieren

Verwende `docker login registry.example.com` mit einem geschützten Token. Bestätige, dass die Identität nur in das Test-Repository pushen kann und Zugangsdaten nicht ausgegeben werden.

**Erwartetes Ergebnis:** Die Authentifizierung gelingt, ohne das Geheimnis offenzulegen oder unabhängigen Schreibzugriff zu gewähren.

### Aufgabe 2 - Pushen und scannen

Tagge und pushe `registry.example.com/platform/service:1.4.2` und `registry.example.com/platform/service:git-a1b2c3d`. Scanne das gepushte Image und speichere den Bericht.

**Erwartetes Ergebnis:** Beide Tags existieren, das Scan-Ergebnis bleibt erhalten und Richtlinienfehler blockieren die Release-Freigabe.

### Aufgabe 3 - Digest-Pull prüfen

Speichere den Digest aus der Registry, pulle mit `service@sha256:...` und vergleiche lokale Image-Identität mit der Registry-Antwort.

**Erwartetes Ergebnis:** Die Deployment-Referenz identifiziert exakt die gescannten Bytes.

## Validierungscheckliste

- [ ] Push-Zugangsdaten sind beschränkt und geschützt.
- [ ] Release- und Commit-Tags sind vorhanden.
- [ ] Das finale Image wurde gescannt.
- [ ] Scan-Nachweise bleiben erhalten.
- [ ] Der Digest-Pull gelingt.

## Fehlerbehebung

| Problem                             | Mögliche Ursache                                     | Lösung                                                       |
| ----------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------ |
| `denied: requested access`          | Token hat keine Repository-Berechtigung              | Beschränkten Push-Zugriff auf das Test-Repository anfordern. |
| Tag kann nicht überschrieben werden | Registry erzwingt Unveränderlichkeit                 | Neues Release- oder Commit-Tag verwenden.                    |
| Digest unterscheidet sich lokal     | Anderes Manifest oder andere Plattform wurde gepullt | Plattform speichern und Registry-Manifest vergleichen.       |

## Best Practices

- Kurzlebige Zugangsdaten oder Workload-Identität in CI verwenden.
- Nach dem Push und vor der Deployment-Freigabe scannen.
- Lesbare Release-Tags behalten, aber per Digest deployen.

## Zusammenfassung

Registry-Operationen sind erst abgeschlossen, wenn Authentifizierung, Scan, Aufbewahrung und Digest-Nachweis beim Artefakt übereinstimmen.

## Weiterführende Links

- Notebook: [Container-Registries](../../notebooks/de/48-container-registries.md)
- Übung: [Ein Image in einer Container-Registry veröffentlichen](../../exercises/de/48-publish-an-image-to-a-container-registry.md)
- Quiz: [Quiz zu Container-Registries](../../quizzes/de/48-container-registries-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
