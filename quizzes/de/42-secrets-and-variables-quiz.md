---
chapter: 42
title: "Quiz zu Secrets und Variablen"
related_notebook: "Secrets und Variablen"
related_exercise: "Secrets und Variablen verwalten"
related_lab: "Secrets rotieren und Variablen prüfen"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/42-secrets-and-variables.md) | [Übung](../../exercises/de/42-manage-secrets-and-variables.md) | [Lab](../../labs/de/42-rotate-secrets-and-review-variables.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Secrets und Variablen

## Lernziele

- `secrets` und `vars` unterscheiden.
- Pfade erkennen, über die Zugangsdaten offengelegt werden.
- Rotation und Begrenzung auf Umgebungen erklären.

## Fragen

### Frage 1

Welcher Kontext sollte ein Cloud-Zugriffstoken enthalten?

- A. `${{ vars.CLOUD_TOKEN }}`
- B. `${{ secrets.CLOUD_TOKEN }}`
- C. Ein committeter YAML-Literal
- D. Ein README-Beispiel mit dem echten Wert

**Antwort:** B.

### Frage 2

Richtig oder falsch: Eine GitHub-Actions-Variable ist automatisch vertraulich.

**Antwort:** Falsch. Variablen sind gewöhnliche Konfiguration und sollten nicht als Secrets behandelt werden.

### Frage 3

Warum ist `set -x` in der Nähe von Zugangsdaten gefährlich?

**Erwartete Antwort:** Shell-Tracing kann Befehle und expandierte Werte in Workflow-Logs ausgeben.

### Frage 4

Nenne zwei Aktionen bei der Rotation von Zugangsdaten.

**Erwartete Antwort:** Neue Zugangsdaten erstellen, das Secret aktualisieren, es testen, die alten Zugangsdaten widerrufen und die Änderung festhalten.

### Frage 5 — Praxisszenario

Ein Deployment-Token erscheint in einem Workflow-Log. Was sollte das Team zuerst tun?

**Erwartete Antwort:** Das offengelegte Token sofort widerrufen oder rotieren, den Logging-Pfad entfernen, die Nutzung untersuchen und Audit-Nachweise prüfen.

## Checkliste zur Wiederholung

- [ ] Ich kann vertrauliche Konfiguration einordnen.
- [ ] Ich weiß, dass Variablen nicht automatisch geheim sind.
- [ ] Ich kann Offenlegung in Logs erkennen.
- [ ] Ich kann eine umgebungsbezogene Rotation erklären.

## Weiterführende Links

- Notebook: [Secrets und Variablen](../../notebooks/de/42-secrets-and-variables.md)
- Übung: [Secrets und Variablen verwalten](../../exercises/de/42-manage-secrets-and-variables.md)
- Lab: [Secrets rotieren und Variablen prüfen](../../labs/de/42-rotate-secrets-and-review-variables.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
