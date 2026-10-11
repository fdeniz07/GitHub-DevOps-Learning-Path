---
chapter: 33
title: "y"
part: "GitHub Actions"
level: Intermediate
estimated_time: 80 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](32-github-runners.md) | [Übung](../../exercises/de/33-review-a-marketplace-action.md) | [Lab](../../labs/de/33-harden-a-marketplace-action.md) | [Quiz](../../quizzes/de/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- erklären, wie Marketplace-Actions Eingaben erhalten und Ausgaben bereitstellen;
- Action-Referenzen auf einen prüfbaren Commit fixieren und Abwägungen bei Updates bewerten;
- die Berechtigungen, den Quellcode, die Wartung, Abhängigkeiten und den Umgang mit Daten einer Action prüfen.

## Einführung

Marketplace-Actions bündeln wiederverwendbare Automatisierung. Sie können wiederholten Code vermeiden, führen aber Code innerhalb Ihrer Workflow-Umgebung aus. Behandeln Sie eine Action wie eine Abhängigkeit eines Drittanbieters mit einer Prüfung der Lieferkette und nicht wie harmlose YAML-Dekoration.

## Wichtige Begriffe

| Begriff         | Definition                                                                         |
| --------------- | ---------------------------------------------------------------------------------- |
| Action-Referenz | Eigentümer, Repository und Ref nach `uses:`.                                       |
| Commit-Pin      | Eine unveränderliche Commit-SHA, die eine exakte Revision auswählt.                |
| Eingabe         | Ein Wert, der einer Action über `with` übergeben wird.                             |
| Ausgabe         | Ein benannter Wert, den eine Action für spätere Schritte verfügbar macht.          |
| Lieferkette     | Personen, Code, Abhängigkeiten, Releases und Infrastruktur, die Software erzeugen. |

## Theorie

### Eingaben und Ausgaben

```yaml
- id: metadata
  uses: actions/checkout@v4
  with:
    fetch-depth: 0
```

Eingaben sind spezifisch für die jeweilige Action. Lesen Sie daher die Metadaten und Dokumentation der Action, statt Namen zu erraten. Ausgaben sind ebenfalls spezifisch für die Action und werden normalerweise über `steps.metadata.outputs.<name>` verwendet, nachdem eine `id` vergeben wurde.

### Fixieren für Reproduzierbarkeit

Ein Haupt-Tag wie `@v4` erhält kompatible Updates, kann sich aber im Laufe der Zeit ändern. Eine vollständige Commit-SHA wählt eine exakte Revision und unterstützt reproduzierbare Reviews:

```yaml
- uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683
```

Ein Pin ist nur nützlich, wenn geprüft wurde, dass die SHA zum beabsichtigten Upstream-Release gehört. Automatisieren Sie Update-Vorschläge und prüfen Sie deren Diffs, statt Pins stillschweigend zu ändern.

### Prüfung der Lieferkette

Untersuchen Sie vor der Einführung Quellcode und `action.yml`, Release-Historie, Maintainer, Berechtigungen, Abhängigkeiten von Drittanbietern, Installationsverhalten, Netzwerkzugriff und Umgang mit Secrets. Die Action sollte nur die benötigten Berechtigungen erhalten, und der Workflow sollte vermeiden, sensible Werte an nicht vertrauenswürdigen Action-Code weiterzugeben.

## Best Practices

- Bevorzugen Sie gut gewartete Actions mit transparentem Quellcode und transparenter Release-Historie.
- Fixieren Sie Produktions-Actions auf geprüfte Commit-SHAs oder verwenden Sie eine genehmigte Organisationsrichtlinie.
- Dokumentieren Sie, warum einer Action vertraut wird und wie Updates geprüft werden.
- Übergeben Sie nur notwendige Eingaben und Berechtigungen.
- Testen Sie Ausgabe-Verhalten und Fehlerbehandlung zunächst in einem kleinen Workflow, bevor Sie die Action breit einsetzen.

## Häufige Fehler

| Fehler                                                          | Risiko                                                    | Besserer Ansatz                                               |
| --------------------------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------- |
| Eine Action kopieren, ohne Metadaten zu lesen                   | Eingaben oder Berechtigungen können falsch sein.          | Prüfen Sie zuerst Metadaten und Quellcode.                    |
| Einem veränderlichen Tag in einem kritischen Workflow vertrauen | Verhalten kann sich ohne lokalen Diff ändern.             | Fixieren und geprüfte Updates automatisieren.                 |
| Einer Action weitreichende `GITHUB_TOKEN`-Berechtigungen geben  | Eine Kompromittierung hat einen größeren Wirkungsbereich. | Berechtigungen nach dem Prinzip der geringsten Rechte setzen. |
| Popularität als Sicherheitsprüfung behandeln                    | Auch populärer Code kann riskante Abhängigkeiten haben.   | Herkunft, Quellcode und Verhalten prüfen.                     |

## Zusammenfassung

Marketplace-Actions sind ausführbare Abhängigkeiten. Eingaben und Ausgaben definieren ihre Schnittstelle, Commit-Pins verbessern die Reproduzierbarkeit, und eine Prüfung der Lieferkette begrenzt verborgene Risiken.

### Verwandte Inhalte

- Vorheriges Notebook: [GitHub-Actions-Runner](32-github-runners.md)
- Übung: [Eine Marketplace-Action prüfen](../../exercises/de/33-review-a-marketplace-action.md)
- Lab: [Eine Marketplace-Action härten](../../labs/de/33-harden-a-marketplace-action.md)
- Quiz: [Quiz zu GitHub-Marketplace-Actions](../../quizzes/de/33-github-marketplace-actions-quiz.md)
