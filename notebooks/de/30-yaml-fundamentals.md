---
chapter: 30
title: "YAML-Grundlagen für GitHub Actions"
part: "GitHub Actions"
level: Beginner
estimated_time: 90 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](27-gitlab-devsecops-security-scans-and-compliance.md) | [Übung](../../exercises/de/30-practice-github-actions-yaml.md) | [Lab](../../labs/de/30-build-a-valid-actions-workflow.md) | [Quiz](../../quizzes/de/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels können Sie:

- YAML-Maps, Listen, Skalare und Kommentare unterscheiden;
- Einrückung verwenden, um verschachtelte GitHub-Actions-Konfiguration auszudrücken;
- häufige YAML-Fehler erkennen, bevor sie eine Workflow-Ausführung erreichen;
- grundlegende GitHub-Actions-Ausdrücke lesen und sie von der YAML-Struktur getrennt halten.

## Einführung

YAML ist ein für Menschen lesbares Format zur Serialisierung von Daten. GitHub Actions verwendet YAML zur Beschreibung von Workflows. Daher gehören Leerraum und Satzzeichen zur Bedeutung der Konfiguration. Eine Datei kann optisch plausibel aussehen und trotzdem in eine andere Struktur geparst werden als beabsichtigt.

## Wichtige Begriffe

| Begriff    | Bedeutung                                                          |
| ---------- | ------------------------------------------------------------------ |
| Map        | Schlüssel-Wert-Paare in der Form `key: value`.                     |
| Liste      | Eine geordnete Sammlung, deren Einträge mit `-` beginnen.          |
| Skalar     | Ein einzelner Wert, etwa eine Zeichenkette, Zahl oder ein Boolean. |
| Einrückung | Führende Leerzeichen, die die Eltern-Kind-Struktur ausdrücken.     |
| Ausdruck   | Ein Actions-Wert in der Form `${{ ... }}`.                         |

## Theorie

### Maps und Listen

Maps beschreiben benannte Eigenschaften:

```yaml
job:
  runs-on: ubuntu-latest
  timeout-minutes: 10
```

Listen beschreiben geordnete Einträge:

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v4
  - name: Test
    run: ./scripts/test.sh
```

Die beiden Schritte sind Listeneinträge. Jeder Eintrag enthält seine eigene Map aus Eigenschaften. Die Einrückung zeigt, dass `name`, `uses` und `run` zum Eintrag und nicht zur Wurzel des Dokuments gehören.

### Einrückung

Verwenden Sie Leerzeichen konsistent. YAML verwendet keine geschweiften Klammern, um Verschachtelung anzuzeigen, und Tabulatoren sind in Standard-YAML keine gültige Einrückung. Im folgenden Beispiel gehört `branches` zu `push`:

```yaml
on:
  push:
    branches:
      - main
```

Eine Änderung der Einrückung kann `branches` einem anderen übergeordneten Schlüssel zuordnen oder einen Parserfehler erzeugen.

### Skalare, Anführungszeichen und Kommentare

Zeichenketten können ohne oder mit Anführungszeichen geschrieben werden. Setzen Sie Werte in Anführungszeichen, wenn Satzzeichen oder YAML-Schlüsselwörter den beabsichtigten Typ unklar machen könnten. Ein `#` beginnt einen Kommentar, wenn es nicht innerhalb einer Zeichenkette in Anführungszeichen steht:

```yaml
name: "Build #1"
timeout-minutes: 10
# This comment explains the validation boundary.
```

Verstecken Sie benötigte Workflow-Konfiguration nicht in Kommentaren. Kommentare helfen Reviewern, konfigurieren Actions aber nicht.

### Ausdrücke

GitHub-Actions-Ausdrücke sind in YAML-Werte eingebettet:

```yaml
if: ${{ github.ref == 'refs/heads/main' }}
```

Der Map-Schlüssel ist `if`; der Ausdruck ist sein skalarer Wert. Ausdrücke können Kontexte und Funktionen lesen, ersetzen aber nicht die YAML-Einrückung. Halten Sie Shell-Interpolation und Actions-Ausdrücke getrennt, wenn Sie `run`-Befehle schreiben.

## Praktisches Beispiel

Dieser gültige Workflow kombiniert Maps, Listen, einen Kommentar und einen Ausdruck:

```yaml
name: YAML practice
on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout source
        uses: actions/checkout@v4
      - name: Run validation on the default branch
        if: ${{ github.ref == 'refs/heads/main' }}
        run: echo "Validation branch is main"
```

Die Workflow-Map enthält eine listenähnliche `on`-Konfiguration und eine `jobs`-Map. Die `steps`-Liste enthält zwei Maps. Der zweite Schritt wird übersprungen, wenn die Ref nicht `main` ist; der Workflow selbst kann für andere konfigurierte Ereignisse weiterhin gestartet werden.

## Probieren Sie es selbst aus

1. Wandeln Sie die Inline-Liste `branches: [main]` in eine Blockliste um.
2. Fügen Sie einen zweiten Branch hinzu, ohne die Einrückung des übergeordneten Elements zu ändern.
3. Fügen Sie einen Schritt mit `uses` und `run` hinzu und erklären Sie, warum ein Schritt normalerweise nur eine Ausführungsmethode wählen sollte.
4. Markieren Sie jede Einrückungsebene mit zwei Leerzeichen und vergleichen Sie die entstehende Hierarchie.

## Best Practices

- Verwenden Sie zwei Leerzeichen pro Ebene und niemals Tabulatoren für die Einrückung.
- Richten Sie Maps und Listen optisch aus, damit Reviewer die Zugehörigkeit erkennen können.
- Setzen Sie mehrdeutige Zeichenketten in Anführungszeichen und halten Sie Kommentare kurz und nützlich.
- Validieren Sie die YAML-Struktur, bevor Sie einen Laufzeitfehler von Actions untersuchen.

## Häufige Fehler

| Fehler                                                  | Warum er Probleme verursacht                                     | So vermeiden Sie ihn                                             |
| ------------------------------------------------------- | ---------------------------------------------------------------- | ---------------------------------------------------------------- |
| Tabulatoren für die Einrückung verwenden                | YAML-Parser können die Datei ablehnen.                           | Konfigurieren Sie den Editor für Leerzeichen.                    |
| Einen Listeneintrag falsch ausrichten                   | Ein Schritt oder Trigger wird Kind des falschen Schlüssels.      | Vergleichen Sie jedes `-` mit seinem übergeordneten Schlüssel.   |
| `if: github.ref == ...` ohne Ausdruckssyntax schreiben  | Der Wert wird möglicherweise nicht wie beabsichtigt ausgewertet. | Verwenden Sie die dokumentierte Form `${{ ... }}` für Ausdrücke. |
| `#` außerhalb von Anführungszeichen als Daten behandeln | Der restliche Text wird zum Kommentar.                           | Setzen Sie Werte mit einem wörtlichen `#` in Anführungszeichen.  |
| Inline- und Blockform unachtsam mischen                 | Die resultierende Struktur wird schwer prüfbar.                  | Wählen Sie für jede kleine Sammlung die klarste Form.            |

## Zusammenfassung

YAML stellt die Actions-Konfiguration durch einrückungsbasierte Maps und Listen dar. Ausdrücke sind Werte innerhalb dieser Struktur. Konsistente Leerzeichen, klare Verschachtelung und bewusst gesetzte Anführungszeichen verhindern viele Workflow-Fehler, bevor ein Lauf startet.

### Verwandte Inhalte

- Übung: [GitHub-Actions-YAML üben](../../exercises/de/30-practice-github-actions-yaml.md)
- Lab: [Einen gültigen Actions-Workflow erstellen](../../labs/de/30-build-a-valid-actions-workflow.md)
- Quiz: [Quiz zu YAML-Grundlagen](../../quizzes/de/30-yaml-fundamentals-quiz.md)
