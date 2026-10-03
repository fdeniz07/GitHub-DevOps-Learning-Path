---
chapter: 31
title: "Einen Workflow mit Job-Abhängigkeiten erstellen"
related_notebook: "GitHub-Actions-Jobs und -Schritte"
related_exercise: "GitHub-Actions-Jobs und -Schritte entwerfen"
level: Beginner
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Notebook](../../notebooks/de/30-yaml-fundamentals.md) | [Notebook](../../notebooks/de/31-github-actions-jobs-and-steps.md) | [Übung](../../exercises/de/31-design-github-actions-jobs-and-steps.md) | [Quiz](../../quizzes/de/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

# Einen Workflow mit Job-Abhängigkeiten erstellen

## Ziel

Erstelle einen Workflow, der unabhängige Prüfungen parallel ausführt und erst veröffentlicht, wenn beide erfolgreich waren.

## Anforderungen

- Ein GitHub-Repository, in dem du eine Workflow-Datei erstellen kannst.
- Ein kleines Projekt mit einem Lint- und Testbefehl oder ungefährliche Platzhalterbefehle.
- Vertrautheit mit YAML und GitHub-Actions-Ausdrücken.

## Aufgaben

### Aufgabe 1 — Den Graphen erstellen

Erstelle die Jobs `prepare`, `lint`, `test` und `package`. Lass `lint` und `test` von `prepare` abhängen; `package` soll von beiden Prüfungen abhängen.

### Aufgabe 2 — Metadaten übertragen

Erstelle eine Schrittausgabe in `prepare`, ordne sie einer Jobausgabe zu und gib sie in `package` aus. Füge keine Zugangsdaten in die Ausgabe ein.

### Aufgabe 3 — Verhalten überprüfen

Öffne die Zusammenfassung des Workflow-Laufs und bestätige den Graphen, den Ausgabewert und das Fehlerverhalten, wenn eine Prüfung fehlschlägt.

## Erwartetes Ergebnis

Die Laufzusammenfassung zeigt parallele Prüfungen, ein explizites `package`-Gatter und eine kleine über `needs` übertragene Ausgabe.

## Validierungs-Checkliste

- [ ] Jobabhängigkeiten sind explizit.
- [ ] Die Ausgabe ist korrekt zugeordnet.
- [ ] Eine fehlschlagende Voraussetzung verhindert das Packaging.
- [ ] Berechtigungen und Protokolle enthalten keine unnötigen Secrets.

## Fehlerbehebung

| Problem                 | Ursache                                                        | Lösung                                              |
| ----------------------- | -------------------------------------------------------------- | --------------------------------------------------- |
| Ausgabe ist leer        | Der Schritt hat keine `id` oder schreibt in die falsche Datei. | Setze eine `id` und schreibe nach `$GITHUB_OUTPUT`. |
| Package startet zu früh | `needs` fehlt.                                                 | Füge jede tatsächliche Voraussetzung hinzu.         |

### Verwandte Inhalte

- Notebook: [GitHub-Actions-Jobs und -Schritte](../../notebooks/de/31-github-actions-jobs-and-steps.md)
- Übung: [GitHub-Actions-Jobs und -Schritte entwerfen](../../exercises/de/31-design-github-actions-jobs-and-steps.md)
- Quiz: [Quiz zu GitHub-Actions-Jobs und -Schritten](../../quizzes/de/31-github-actions-jobs-and-steps-quiz.md)
