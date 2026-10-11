---
chapter: 35
title: "Composite-Actions in GitHub Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](34-writing-custom-github-actions.md) | [Übung](../../exercises/de/35-build-a-reusable-composite-action.md) | [Lab](../../labs/de/35-package-a-composite-action.md) | [Quiz](../../quizzes/de/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels können Sie:

- erklären, wann eine Composite-Action nützlich ist;
- Action-Eingaben, Ausgaben, Metadaten und Shell-Schritte definieren;
- eine lokale Composite-Action aus einem Workflow aufrufen;
- wiederverwendbare und sichere Action-Grenzen entwerfen.

## Einführung

Eine Composite-Action paketiert mehrere gewöhnliche Workflow-Schritte hinter einer wiederverwendbaren Schnittstelle. Sie ist nützlich, wenn mehrere Workflows dieselbe Einrichtung, Validierung oder Reporting-Sequenz wiederholen. Die Action hält den Workflow lesbar, während ihre `action.yml`-Datei Eingaben und Ausgaben dokumentiert.

## Wichtige Begriffe

| Begriff          | Bedeutung                                                                             |
| ---------------- | ------------------------------------------------------------------------------------- |
| Composite-Action | Eine Action, die als Folge von Workflow-Schritten implementiert ist.                  |
| Eingabe          | Ein Wert, den der aufrufende Workflow bereitstellt.                                   |
| Ausgabe          | Ein benannter Wert, den die Action späteren Schritten zurückgibt.                     |
| Metadatendatei   | `action.yml` oder `action.yaml`, die die Action beschreibt.                           |
| Lokale Action    | Eine im selben Repository gespeicherte Action, die über einen Pfad referenziert wird. |

## Theorie

### Struktur einer Action

Eine lokale Action hat normalerweise ein eigenes Verzeichnis und eine `action.yml`-Datei:

```text
.github/actions/report-context/
  action.yml
```

Die Metadaten deklarieren Name, Beschreibung, Eingaben, Ausgaben und die `runs`-Konfiguration der Action. Eine Composite-Action verwendet `runs.using: composite` und gibt für jeden Schritt eine ausdrückliche `shell` an.

### Eingaben und Ausgaben

Eingaben machen eine wiederholte Workflow-Sequenz konfigurierbar, ohne ihre Implementierung zu kopieren. Geben Sie Eingaben nützliche Beschreibungen und sichere Standardwerte, sofern ein solcher Standard existiert. Ausgaben sollten nur stabile, bewusst ausgewählte Ergebnisse bereitstellen. Ein Schritt schreibt eine Ausgabe in die `GITHUB_OUTPUT`-Datei des Runners, und die Action ordnet diese Schrittausgabe ihrem öffentlichen Ausgabenamen zu.

### Beispiel: Eine lokale Composite-Action

```yaml
name: Report context
description: Show the selected runtime and expose a normalized label
inputs:
  runtime:
    description: Runtime name to report
    required: true
outputs:
  label:
    description: Normalized runtime label
    value: ${{ steps.label.outputs.value }}
runs:
  using: composite
  steps:
    - id: label
      shell: bash
      env:
        RUNTIME: ${{ inputs.runtime }}
      run: echo "value=${RUNTIME,,}" >> "$GITHUB_OUTPUT"
    - shell: bash
      env:
        RUNTIME: ${{ inputs.runtime }}
      run: echo "Using runtime: $RUNTIME"
```

Der Workflow ruft die Action über einen relativen Pfad auf und kann ihre Ausgabe verwenden:

```yaml
- id: context
  uses: ./.github/actions/report-context
  with:
    runtime: python
- run: echo "Label: ${{ steps.context.outputs.label }}"
```

Die `id` ist beim aufrufenden Schritt erforderlich, damit spätere Ausdrücke auf seine Ausgaben zugreifen können.

### Grenzen und Sicherheit

Halten Sie eine Action auf eine wiederholbare Verantwortung konzentriert. Übergeben Sie Werte über `with` und `env`, statt Shell-Befehle aus nicht vertrauenswürdigen Zeichenketten zu erstellen. Vermeiden Sie die Ausgabe von Tokens, verwenden Sie im aufrufenden Workflow minimale Berechtigungen und fixieren Sie Drittanbieter-Actions auf geprüfte Referenzen. Eine Composite-Action übernimmt die Berechtigungen und den Runner-Kontext ihres Aufrufers; sie bildet keine Sicherheitsgrenze.

## Probieren Sie es selbst aus

1. Erstellen Sie eine lokale Action, die eine Verzeichniseingabe akzeptiert.
2. Fügen Sie einen Schritt hinzu, der Dateien in diesem Verzeichnis auflistet und die Dateianzahl als Ausgabe bereitstellt.
3. Rufen Sie die Action aus einem Workflow auf und geben Sie die Ausgabe aus.

## Best Practices

- Halten Sie `action.yml` klein und dokumentieren Sie jede Eingabe und Ausgabe.
- Verwenden Sie Umgebungsvariablen für Shell-Daten und setzen Sie Pfade in Anführungszeichen.
- Validieren Sie erforderliche Eingaben, bevor Sie Arbeit ausführen.
- Testen Sie die Action in einem Workflow auf denselben Runner-Typen, die sie verwenden wird.
- Behandeln Sie lokale Actions als Code: Prüfen, versionieren und ändern Sie sie bewusst.

## Häufige Fehler

| Fehler                                   | Warum er Probleme verursacht                                   | So vermeiden Sie ihn                                                                 |
| ---------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------ |
| `shell` weglassen                        | Composite-Schritte benötigen eine ausdrückliche Shell.         | Setzen Sie für jeden `run`-Schritt `shell`.                                          |
| Ausgabe in die falsche Datei schreiben   | Spätere Schritte erhalten eine leere Ausgabe.                  | Hängen Sie `name=value` an `GITHUB_OUTPUT` an.                                       |
| Eingabe direkt in einen Befehl einbetten | Nicht vertrauenswürdiger Text kann die Shell-Syntax verändern. | Übergeben Sie die Eingabe über eine in Anführungszeichen gesetzte Umgebungsvariable. |
| Annahme, die Action isoliere Secrets     | Die Action läuft im Kontext des Aufrufers.                     | Verwenden Sie minimale Berechtigungen und geben Sie keine Secrets aus.               |

## Zusammenfassung

- Composite-Actions paketieren wiederverwendbare Workflow-Schritte.
- Eingaben konfigurieren eine Action; Ausgaben stellen bewusst ausgewählte Ergebnisse bereit.
- `action.yml` ist der öffentliche Vertrag der Action.
- Wiederverwendung verbessert Konsistenz, ersetzt aber keine Sicherheitskontrollen des Workflows.

### Verwandte Inhalte

- Übung: [Eine wiederverwendbare Composite-Action erstellen](../../exercises/de/35-build-a-reusable-composite-action.md)
- Lab: [Eine Composite-Action paketieren](../../labs/de/35-package-a-composite-action.md)
- Quiz: [Quiz zu Composite-Actions](../../quizzes/de/35-composite-actions-quiz.md)
