---
chapter: 30
title: "GitHub-Actions-YAML üben"
related_notebook: "YAML-Grundlagen für GitHub Actions"
level: Beginner
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/30-yaml-fundamentals.md) | [Lab](../../labs/de/30-build-a-valid-actions-workflow.md) | [Quiz](../../quizzes/de/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ziel

Repariere und erweitere einen Workflow, indem du YAML-Maps, -Listen, Einrückung und Ausdrücke anwendest.

## Lernergebnisse

- YAML-Werte als Maps, Listen oder Skalare klassifizieren;
- Einrückung reparieren, ohne die beabsichtigte Hierarchie zu verändern;
- einen gut lesbaren Actions-Ausdruck hinzufügen.

## Voraussetzungen

- Lies das Notebook zu Kapitel 30.
- Verwende einen Editor, der Leerzeichen und Tabs anzeigen kann.

## Szenario

Beginne mit dieser beabsichtigten Struktur und schreibe sie als gültiges Workflow-YAML: ein Workflow namens `YAML practice`, ein manueller Trigger, eine schreibgeschützte `contents`-Berechtigung und ein `validate`-Job mit einem Checkout-Schritt und einem Befehlsschritt.

## Aufgaben

### Aufgabe 1

Schreibe den Workflow mit zwei Leerzeichen pro Einrückungsebene. Verwende eine Blockliste für `steps` und eine Map für den Job.

### Erwartetes Ergebnis: YAML-Hierarchie

Die Struktur macht `runs-on` und `steps` zu untergeordneten Elementen von `validate` und die Eigenschaften der Schritte zu untergeordneten Elementen ihrer Listeneinträge.

### Aufgabe 2

Füge einem Berichtsschritt `if: ${{ github.ref == 'refs/heads/main' }}` hinzu. Behalte den Ausdruck als Skalarwert des Schlüssels `if` bei.

### Erwartetes Ergebnis: Bedingter Wert

Actions wertet den Schritt bedingt aus, statt ihn als neue YAML-Hierarchie zu behandeln.

### Aufgabe 3

Prüfe die Datei auf Tabs, uneinheitliche Einrückung, nicht quotierte `#`-Daten und einen Listeneintrag auf der falschen Ebene.

### Erwartetes Ergebnis: Prüfergebnisse

Du kannst jedes mögliche Parser- oder Verhaltensproblem benennen und es vor einem Lauf korrigieren.

## Herausforderung

Wandle eine Inline-Branch-Liste in eine Blockliste um und füge einen zweiten Branch hinzu, ohne das übergeordnete Element des Triggers zu verändern.

## Selbsteinschätzung

- [ ] Ich kann Maps und Listen visuell erkennen.
- [ ] Ich verwende Leerzeichen konsequent.
- [ ] Ich kann erklären, wo der Ausdruck ausgewertet wird.

## Häufige Fehler

| Fehler                                               | Lösung                                                             |
| ---------------------------------------------------- | ------------------------------------------------------------------ |
| Einen Schritt unter dem falschen Schlüssel einrücken | Jeden Listeneintrag an seinem gleichgeordneten Eintrag ausrichten. |
| Tabs verwenden                                       | Tabs durch Leerzeichen ersetzen.                                   |
| Ausdrucksbegrenzungen vergessen                      | `${{ ... }}` für den Actions-Ausdruck verwenden.                   |

## Zusammenfassung

Lesbares YAML hängt von einer korrekten Hierarchie ab. Kleine Einrückungsfehler können die Bedeutung eines Workflows verändern, selbst wenn die Datei fast richtig aussieht.

### Verwandte Inhalte

- Notebook: [YAML-Grundlagen für GitHub Actions](../../notebooks/de/30-yaml-fundamentals.md)
- Lab: [Einen gültigen Actions-Workflow erstellen](../../labs/de/30-build-a-valid-actions-workflow.md)
- Quiz: [Quiz zu YAML-Grundlagen](../../quizzes/de/30-yaml-fundamentals-quiz.md)
