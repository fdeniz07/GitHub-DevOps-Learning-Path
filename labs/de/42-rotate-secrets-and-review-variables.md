---
chapter: 42
title: "Secrets rotieren und Variablen prüfen"
related_notebook: "Secrets und Variablen"
related_exercise: "Secrets und Variablen verwalten"
related_quiz: "Quiz zu Secrets und Variablen"
level: Intermediate
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/42-secrets-and-variables.md) | [Übung](../../exercises/de/42-manage-secrets-and-variables.md) | [Roadmap](../../ROADMAP.md)

# Secrets rotieren und Variablen prüfen

## Ziel

Prüfe einen Deployment-Workflow auf Offenlegung von Zugangsdaten, ordne Konfiguration ein und rotiere ein Sandbox-Secret sicher.

## Ergebnisse

Du wirst in der Lage sein:

- umgebungsbezogene Secrets zu verwenden, ohne sie zu loggen.
- `secrets` von `vars` zu trennen.
- eine Rotationssequenz aus Erstellen, Testen, Ersetzen und Widerrufen abzuschließen.

## Voraussetzungen

- Schließe Notebook und Übung ab.
- Zugriff auf ein Sandbox-Repository oder eine Sandbox-Umgebung.
- Ein nicht dauerhaft benötigtes Secret, das widerrufen werden kann.

## Szenario

Ein Workflow enthält `CLOUD_TOKEN` in einer Repository-Variable und verwendet Shell-Tracing. Du musst das Token in ein Environment-Secret verschieben, Offenlegungspfade entfernen und es rotieren.

## Umgebung

| Anforderung    | Wert                                       |
| -------------- | ------------------------------------------ |
| Betriebssystem | Windows, Linux oder macOS                  |
| Software       | GitHub Actions, Git, Shell                 |
| Zugriff        | Sandbox-Repository und widerrufbares Token |

## Aufgaben

### Aufgabe 1 — Konfiguration inventarisieren

Liste jeden vom Workflow verwendeten Konfigurationswert auf. Markiere ihn als vertraulich oder nicht vertraulich und bestimme seinen erforderlichen Gültigkeitsbereich.

**Erwartetes Ergebnis:** Vertrauliche Werte kommen für `secrets` infrage; gewöhnliche Einstellungen verwenden `vars`.

### Aufgabe 2 — Offenlegung entfernen

Ersetze direkte Werte durch `${{ secrets.CLOUD_TOKEN }}` und `${{ vars.DEPLOYMENT_URL }}`. Entferne `set -x`, `echo`-Anweisungen und Artefakte, die das Token enthalten könnten.

**Erwartetes Ergebnis:** Logs und Artefakte legen die Zugangsdaten nicht offen.

### Aufgabe 3 — Rotieren

Erstelle ein neues Sandbox-Token, aktualisiere das Environment-Secret, führe einen sicheren Deployment-Test aus, widerrufe das alte Token und halte das Rotationsdatum fest.

**Erwartetes Ergebnis:** Das neue Token funktioniert und das alte Token authentifiziert nicht mehr.

## Validierungs-Checkliste

- [ ] Keine Zugangsdaten sind committed.
- [ ] Kein Schritt gibt die Zugangsdaten aus.
- [ ] Produktions-Secrets sind auf eine Umgebung begrenzt.
- [ ] Die neuen Zugangsdaten werden getestet.
- [ ] Die alten Zugangsdaten werden widerrufen.

## Fehlerbehebung

| Problem                  | Mögliche Ursache                                 | Lösung                                                 |
| ------------------------ | ------------------------------------------------ | ------------------------------------------------------ |
| Secret ist leer          | Falscher Gültigkeitsbereich oder Name            | Umgebung und exakten Secret-Namen prüfen.              |
| Logs zeigen ein Token    | Debug-Tracing oder Befehlsausgabe                | Ausgabe entfernen und das offengelegte Token rotieren. |
| Neues Token schlägt fehl | Berechtigungen oder Deployment-Ziel passen nicht | Gültigkeitsbereich prüfen und in der Sandbox testen.   |

## Best Practices

- Verwende beim Lernen nicht dauerhaft benötigte Zugangsdaten.
- Rotiere sie sofort nach jeder Offenlegung.
- Halte öffentliche Konfiguration klar von Secrets getrennt.

## Zusammenfassung

Sicherheit von Zugangsdaten ist operativ: einordnen, begrenzen, Logging vermeiden, rotieren, testen und widerrufen.

## Weiterführende Links

- Notebook: [Secrets und Variablen](../../notebooks/de/42-secrets-and-variables.md)
- Übung: [Secrets und Variablen verwalten](../../exercises/de/42-manage-secrets-and-variables.md)
- Quiz: [Quiz zu Secrets und Variablen](../../quizzes/de/42-secrets-and-variables-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
