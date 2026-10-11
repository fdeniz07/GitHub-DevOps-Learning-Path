---
chapter: 36
title: "Matrix-Builds in GitHub Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](35-composite-actions.md) | [Übung](../../exercises/de/36-test-a-matrix-workflow.md) | [Lab](../../labs/de/36-run-a-multi-platform-matrix.md) | [Quiz](../../quizzes/de/36-matrix-builds-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- erklären, wie eine Matrix einen Job in mehrere Kombinationen erweitert;
- `include` und `exclude` verwenden, um unterstützte Kombinationen zu modellieren;
- eine passende `fail-fast`-Richtlinie auswählen;
- Matrixwerte in Schritten lesen und Ergebnisse verständlich halten.

## Einführung

Matrix-Jobs testen dieselbe Workflow-Logik über eine festgelegte Menge von Versionen, Betriebssystemen oder Konfigurationen. Sie reduzieren doppeltes YAML, aber jede Kombination ist ein echter Job mit eigenen Logs, Kosten, Berechtigungen und möglichen Fehlern.

## Wichtige Begriffe

| Begriff     | Bedeutung                                                                               |
| ----------- | --------------------------------------------------------------------------------------- |
| Matrix      | Eine Menge von Dimensionen, aus denen Job-Kombinationen erzeugt werden.                 |
| Kombination | Eine konkrete Menge von Matrixwerten, die als Job ausgeführt wird.                      |
| `include`   | Fügt einer Matrix Werte oder benutzerdefinierte Kombinationen hinzu.                    |
| `exclude`   | Entfernt nicht unterstützte oder unnötige Kombinationen.                                |
| `fail-fast` | Steuert, ob ausstehende oder laufende Matrix-Jobs nach einem Fehler abgebrochen werden. |

## Theorie

### Kartesisches Produkt

Wenn eine Matrix drei Betriebssysteme und zwei Laufzeitversionen enthält, erzeugt sie zunächst sechs Kombinationen. Dies ist ein kartesisches Produkt: Jeder Wert einer Dimension wird mit jedem Wert der anderen Dimension kombiniert. Verwenden Sie Dimensionen nur, wenn die Kombinationen sinnvoll und unterstützt sind.

```yaml
strategy:
  fail-fast: false
  matrix:
    os: [ubuntu-latest, windows-latest]
    python: ["3.11", "3.12"]
    exclude:
      - os: windows-latest
        python: "3.11"
```

Referenzieren Sie Werte mit Ausdrücken wie `${{ matrix.os }}` und `${{ matrix.python }}`. Ein Job kann `matrix.os` für `runs-on` verwenden, während ein Schritt den Laufzeitwert für die Einrichtung verwendet.

### Include und Sonderfälle

`include` kann Metadaten zu passenden Kombinationen hinzufügen oder eine neue Kombination ergänzen:

```yaml
matrix:
  os: [ubuntu-latest, windows-latest]
  node: [20, 22]
  include:
    - os: ubuntu-latest
      node: 22
      coverage: true
  exclude:
    - os: windows-latest
      node: 20
```

Ein eingeschlossener Wert sollte eine unterstützte Ausnahme beschreiben und keine versehentliche Abweichung verbergen. Prüfen Sie die erweiterten Kombinationen in der Workflow-Ausführung.

### Fail-Fast auswählen

Der Standardwert `fail-fast: true` kann Runner-Zeit sparen, wenn eine Kombination den gesamten Test ungültig macht. Setzen Sie ihn auf `false`, wenn jedes Ergebnis von Betriebssystem oder Laufzeit für die Diagnose wertvoll ist. Sie können eine experimentelle Kombination auch über einen eingeschlossenen Wert mit `continue-on-error` markieren. Tun Sie dies sichtbar und erklären Sie, warum sie nicht blockierend ist.

## Praktisches Beispiel

```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, windows-latest]
        version: ["3.11", "3.12"]
        exclude:
          - os: windows-latest
            version: "3.11"
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.version }}
      - run: python --version
```

Dieser Workflow erstellt drei Jobs. Jeder Job meldet sein Betriebssystem und seine Python-Version separat.

## Best Practices

- Beschränken Sie die Matrix auf unterstützte Kombinationen.
- Verwenden Sie `fail-fast: false`, wenn plattformübergreifende Nachweise wichtig sind.
- Beschriften Sie Logs und Artefakte mit Matrixwerten, um Verwechslungen zu vermeiden.
- Verwenden Sie `include` für ausdrückliche Ausnahmen und dokumentieren Sie deren Grund.
- Berücksichtigen Sie Runner-Kosten und Warteschlangenzeit, bevor Sie Dimensionen hinzufügen.

## Häufige Fehler

| Fehler                                | Auswirkung                                     | Korrektur                                  |
| ------------------------------------- | ---------------------------------------------- | ------------------------------------------ |
| Jede mögliche Version hinzufügen      | Langsame, teure und unübersichtliche Läufe.    | Eine begründete Support-Richtlinie testen. |
| `matrix.` in einem Ausdruck vergessen | Der Wert wird nicht aufgelöst.                 | `${{ matrix.dimension }}` verwenden.       |
| `fail-fast` blind verwenden           | Nützliche Diagnosejobs werden abgebrochen.     | Richtlinie bewusst auswählen.              |
| Falsche Kombination ausschließen      | Eine unterstützte Plattform wird nie getestet. | Erweiterte Matrix prüfen.                  |

## Zusammenfassung

Matrix-Builds verwandeln eine Job-Definition in kontrollierte Kombinationen. `include` und `exclude` drücken Ausnahmen aus, während `fail-fast` Geschwindigkeit und diagnostische Abdeckung ausbalanciert.

### Verwandte Inhalte

- Vorheriges Kapitel: [Composite-Actions](35-composite-actions.md)
- Übung: [Einen Matrix-Workflow testen](../../exercises/de/36-test-a-matrix-workflow.md)
- Lab: [Eine Multi-Plattform-Matrix ausführen](../../labs/de/36-run-a-multi-platform-matrix.md)
- Quiz: [Quiz zu Matrix-Builds](../../quizzes/de/36-matrix-builds-quiz.md)
