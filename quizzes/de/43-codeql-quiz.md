---
chapter: 43
title: "CodeQL-Quiz"
related_notebook: "CodeQL-Analyse"
related_exercise: "CodeQL-Analyse einführen"
related_lab: "Einen CodeQL-Fund untersuchen"
level: Intermediate
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/43-codeql.md) | [Übung](../../exercises/de/43-introduce-codeql-analysis.md) | [Lab](../../labs/de/43-triage-a-codeql-finding.md) | [Roadmap](../../ROADMAP.md)

# CodeQL-Quiz

## Lernziele

- Semantische CodeQL-Analyse erklären.
- Erforderliche Workflow-Berechtigungen erkennen.
- Alerts anhand von Datenfluss-Nachweisen untersuchen.

## Fragen

### Frage 1

Was analysiert CodeQL?

- A. Nur Commit-Nachrichten
- B. Code als Daten mithilfe von Abfragen
- C. Nur die Verfügbarkeit von Deployments
- D. Die Download-Geschwindigkeit von Paketen

**Antwort:** B.

### Frage 2

Welche Berechtigung erlaubt üblicherweise den Upload von Code-Scanning-Ergebnissen?

**Erwartete Antwort:** `security-events: write`.

### Frage 3

Richtig oder falsch: Jeder CodeQL-Alert beweist, dass eine ausnutzbare Schwachstelle existiert.

**Antwort:** Falsch. Der Alert erfordert eine Untersuchung von Erreichbarkeit, Bereinigung und Kontext.

### Frage 4

Was sind Quelle und Ziel in einem Datenfluss-Fund?

**Erwartete Antwort:** Eine Quelle ist der Ort, an dem Daten eintreten oder nicht vertrauenswürdig werden; ein Ziel ist eine sensible Operation, die mit diesen Daten unsicher sein kann.

### Frage 5 — Praxisszenario

Ein Alert verfolgt Benutzereingaben bis zu einer Datenbankabfrage, aber vor der Abfrage wird eine Funktion zur validierten Parametrisierung verwendet. Was solltest du tun?

**Erwartete Antwort:** Implementierung und Aufrufpfad prüfen, das Verhalten testen und eine begründete Zurückweisung nur dann dokumentieren, wenn die Bereinigung nachweislich wirksam ist.

## Checkliste zur Wiederholung

- [ ] Ich verstehe semantische Analyse.
- [ ] Ich kenne die Upload-Berechtigung.
- [ ] Ich kann die Untersuchung von Quelle zu Ziel beschreiben.
- [ ] Ich kann eine Behebung oder Zurückweisung dokumentieren.

## Weiterführende Links

- Notebook: [CodeQL-Analyse](../../notebooks/de/43-codeql.md)
- Übung: [CodeQL-Analyse einführen](../../exercises/de/43-introduce-codeql-analysis.md)
- Lab: [Einen CodeQL-Fund untersuchen](../../labs/de/43-triage-a-codeql-finding.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
