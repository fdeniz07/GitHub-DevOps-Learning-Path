---
chapter: 34
title: "Benutzerdefinierte GitHub Actions schreiben"
part: "GitHub Actions"
level: Intermediate
estimated_time: 100 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](33-github-marketplace-actions.md) | [Übung](../../exercises/de/34-design-a-custom-github-action.md) | [Lab](../../labs/de/34-build-and-test-a-custom-action.md) | [Quiz](../../quizzes/de/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- entscheiden, wann eine benutzerdefinierte Action besser geeignet ist als ein wiederverwendbarer Workflow oder ein Shell-Schritt;
- die Rollen von `action.yml`, JavaScript-Actions, Docker-Actions, Eingaben, Ausgaben und Branding beschreiben;
- eine benutzerdefinierte Action für andere Workflows versionieren, testen, dokumentieren und absichern.

## Einführung

Benutzerdefinierte Actions kapseln wiederholte Automatisierung hinter einer stabilen Schnittstelle. Sie sind wertvoll, wenn Verhalten über Repositories hinweg wiederverwendet und von einem Team gepflegt werden soll. Gleichzeitig schaffen sie eine Produktoberfläche: Metadaten, Laufzeitcode, Tests, Release-Versionen und Sicherheitserwartungen.

## Wichtige Begriffe

| Begriff                   | Definition                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------- |
| `action.yml`              | Metadatendatei, die Schnittstelle und Laufzeit einer Action definiert.                |
| JavaScript-Action         | Eine Action, die mit einer Node.js-Laufzeit auf dem Runner ausgeführt wird.           |
| Docker-Action             | Eine Action, die als Container paketiert und ausgeführt wird.                         |
| Composite-Action          | Eine Action, die Workflow-Schritte in YAML gruppiert.                                 |
| Semantische Versionierung | Eine Versionierungskonvention, die kompatible und inkompatible Änderungen vermittelt. |

## Theorie

### Den Action-Typ auswählen

Verwenden Sie eine Composite-Action für eine klare Folge vorhandener Schritte. Verwenden Sie JavaScript, wenn Sie Runner-APIs oder strukturierte Logik benötigen und ohne Container schnell starten möchten. Verwenden Sie Docker, wenn ein kontrollierter Linux-Userspace oder eine Systemabhängigkeit unverzichtbar ist. Ein wiederverwendbarer Workflow ist oft besser, wenn die wiederverwendbare Einheit mehrere Jobs, Berechtigungen, Umgebungen oder eine Matrix-Strategie benötigt.

### Metadaten definieren den Vertrag

```yaml
name: "Collect build metadata"
description: "Creates a short build identifier"
inputs:
  source:
    description: "Text used to derive the identifier"
    required: true
outputs:
  build-id:
    description: "Short identifier for this build"
    value: ${{ steps.collect.outputs.build_id }}
runs:
  using: "node20"
  main: "dist/index.js"
```

Die Metadaten deklarieren, was Aufrufer bereitstellen und erhalten. Halten Sie den Vertrag klein, validieren Sie Eingaben, schreiben Sie Ausgaben über den unterstützten Mechanismus und dokumentieren Sie das Fehlerverhalten.

### JavaScript- und Docker-Laufzeiten

Eine JavaScript-Action hält ihren Quellcode normalerweise in einem lesbaren Verzeichnis und committet den gebündelten `dist`-Einstiegspunkt, den der Runner verwendet. Eine Docker-Action deklariert ein Image oder eine Dockerfile und muss Build-Zeit, Linux-Kompatibilität, Berechtigungen und Image-Wartung berücksichtigen. Keine der beiden Laufzeiten macht Tests oder eine Prüfung der Abhängigkeiten überflüssig.

### Versionierung und Tests

Veröffentlichen Sie ein unveränderliches Release-Tag wie `v1.2.0` und verschieben Sie ein Haupt-Tag wie `v1` nur durch eine geprüfte Aktualisierung. Testen Sie gültige und ungültige Eingaben, Ausgabewerte, Fehler und das Verhalten auf dem unterstützten Runner. Ein kleiner Integrationsworkflow sollte die Action über `uses` ausführen und nicht nur interne Funktionen per Unit-Test prüfen.

## Best Practices

- Halten Sie `action.yml` ausdrücklich, minimal und dokumentiert.
- Validieren Sie Eingaben und geben Sie keine Secrets oder rohen Tokens aus.
- Testen Sie die öffentliche Schnittstelle für jede unterstützte Laufzeit und jedes unterstützte Betriebssystem.
- Committen Sie erzeugte JavaScript-Bundles, wenn der Action-Vertrag dies erfordert.
- Verwenden Sie unveränderliche Releases und kommunizieren Sie inkompatible Änderungen über Hauptversionen.
- Wenden Sie im aufrufenden Workflow das Prinzip der geringsten Berechtigung an.

## Häufige Fehler

| Fehler                                                        | Folge                                                    | Besserer Ansatz                                            |
| ------------------------------------------------------------- | -------------------------------------------------------- | ---------------------------------------------------------- |
| Eine benutzerdefinierte Action für einen lokalen Befehl bauen | Wartungsaufwand übersteigt den Wiederverwendungsvorteil. | Beginnen Sie mit einem gut lesbaren Workflow-Schritt.      |
| Vergessen, das gebündelte JavaScript zu aktualisieren         | Aufrufer führen veralteten Code aus.                     | Erzeugen und testen Sie das Distributionsartefakt.         |
| Eine nicht deklarierte Eingabe lesen                          | Der öffentliche Vertrag ist unklar.                      | Deklarieren und validieren Sie jede Eingabe.               |
| Ein Haupt-Tag ohne Migrationshinweise verschieben             | Verbraucher können unerwartet ausfallen.                 | Verwenden Sie semantische Versionierung und Release Notes. |

## Zusammenfassung

Benutzerdefinierte Actions sind versionierte Softwareschnittstellen. Wählen Sie die passende Laufzeit, definieren Sie den Vertrag in `action.yml`, testen Sie das öffentliche Verhalten und veröffentlichen Sie unveränderliche, prüfbare Versionen.

### Verwandte Inhalte

- Vorheriges Kapitel: [GitHub-Marketplace-Actions](33-github-marketplace-actions.md)
- Übung: [Eine benutzerdefinierte GitHub Action entwerfen](../../exercises/de/34-design-a-custom-github-action.md)
- Lab: [Eine benutzerdefinierte Action bauen und testen](../../labs/de/34-build-and-test-a-custom-action.md)
- Quiz: [Quiz zum Schreiben benutzerdefinierter GitHub Actions](../../quizzes/de/34-writing-custom-github-actions-quiz.md)
