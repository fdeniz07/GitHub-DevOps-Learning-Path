---
chapter: 35
title: "Quiz: Composite Actions"
related_notebook: "GitHub-Actions-Composite-Actions"
related_exercise: "Eine wiederverwendbare Composite Action erstellen"
related_lab: "Eine Composite Action paketieren"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/35-composite-actions.md) | [Übung](../../exercises/de/35-build-a-reusable-composite-action.md) | [Labor](../../labs/de/35-package-a-composite-action.md) | [Roadmap](../../ROADMAP.md)

# Quiz: Composite Actions

## Lernziele

- die Struktur und den Vertrag einer Composite Action erkennen;
- Eingaben von Ausgaben unterscheiden;
- sichere Grenzen für Actions identifizieren.

## Fragen

### Frage 1

Welcher Wert von `runs.using` kennzeichnet eine Composite Action?

- A. `node20`
- B. `docker`
- C. `composite`
- D. `workflow`

**Antwort:** C. `composite`

### Frage 2

Warum benötigt ein aufrufender Schritt eine `id`, wenn er eine Action-Ausgabe verwendet?

**Erwartete Antwort:** Die ID gibt späteren Ausdrücken einen stabilen Pfad wie `steps.check.outputs.result`.

### Frage 3

Richtig oder falsch: Eine Composite Action isoliert Secrets automatisch von ihrem Aufrufer.

**Antwort:** Falsch. Sie läuft im Kontext des Aufrufers und muss nach dem Prinzip der geringsten Berechtigung entworfen werden.

### Frage 4

Wohin sollte eine Composite Action eine Schritt-Ausgabe schreiben?

**Erwartete Antwort:** Sie sollte `name=value` an die Datei anhängen, auf die `GITHUB_OUTPUT` verweist.

### Frage 5

Was ist sicherer, als eine Eingabe direkt in einen Shell-Befehl einzusetzen?

**Erwartete Antwort:** Übergib die Eingabe über eine Umgebungsvariable und setze sie in der Shell in Anführungszeichen.

## Praxisszenario

Eine lokale Action gibt einen vom Benutzer bereitgestellten Branchnamen direkt innerhalb eines Shell-Befehls aus. Identifiziere das Risiko und schlage eine Korrektur vor.

**Erwartete Antwort:** Direkte Interpolation kann die Shell-Syntax verändern. Übergib den Wert über `env`, setze ihn in Anführungszeichen und validiere ihn, wenn es angemessen ist.

## Review-Checkliste

- [ ] Ich kann `action.yml` erklären.
- [ ] Ich kann eine Ausgabe zuordnen.
- [ ] Ich verstehe, dass Wiederverwendung keine Isolation bedeutet.

### Zugehörige Inhalte

- Notebook: [GitHub-Actions-Composite-Actions](../../notebooks/de/35-composite-actions.md)
- Übung: [Eine wiederverwendbare Composite Action erstellen](../../exercises/de/35-build-a-reusable-composite-action.md)
- Labor: [Eine Composite Action paketieren](../../labs/de/35-package-a-composite-action.md)
