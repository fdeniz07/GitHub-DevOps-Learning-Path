---
chapter: 42
title: "Secrets und Variablen verwalten"
related_notebook: "Secrets und Variablen"
related_lab: "Secrets rotieren und Variablen prüfen"
related_quiz: "Quiz zu Secrets und Variablen"
level: Intermediate
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/42-secrets-and-variables.md) | [Lab](../../labs/de/42-rotate-secrets-and-review-variables.md) | [Roadmap](../../ROADMAP.md)

# Secrets und Variablen verwalten

## Ziel

Ordne Workflow-Konfiguration korrekt ein und entwirf eine sichere Methode zur Verwendung, Begrenzung und Rotation von Zugangsdaten.

## Ergebnisse

Du wirst in der Lage sein:

- zwischen `${{ secrets.NAME }}` und `${{ vars.NAME }}` zu wählen.
- Pfade zu erkennen, über die Logs und Artefakte Werte offenlegen.
- eine Checkliste für die Rotation von Zugangsdaten zu erstellen.

## Voraussetzungen

- Lies [Secrets und Variablen](../../notebooks/de/42-secrets-and-variables.md).
- Verstehe GitHub-Repository- und Umgebungseinstellungen.
- Kenne grundlegende Shell-Umgebungsvariablen.

## Szenario

Ein Deployment-Workflow verwendet `CLOUD_TOKEN`, `DEPLOYMENT_URL`, `LOG_LEVEL` und `FEATURE_FLAG`. Die aktuelle Datei gibt beim Debugging alle Step-Umgebungsvariablen aus. Du musst die Werte einordnen und Risiken der Offenlegung entfernen.

## Aufgaben

### Aufgabe 1 — Werte einordnen

Markiere `CLOUD_TOKEN` als Secret. Entscheide für jeden anderen Wert anhand seiner tatsächlichen Vertraulichkeit, ob er eine Variable bleiben oder in ein Secret verschoben werden soll.

**Erwartetes Ergebnis:** Vertrauliche Zugangsdaten sind von gewöhnlicher Konfiguration getrennt.

### Aufgabe 2 — Den Schritt umschreiben

Übergib das Token über `env:` mit `${{ secrets.CLOUD_TOKEN }}` und öffentliche Einstellungen mit `${{ vars.NAME }}`. Entferne Shell-Tracing und Diagnoseausgaben, die Werte offenlegen könnten.

**Erwartetes Ergebnis:** Der Deployment-Befehl erhält Konfiguration, ohne Zugangsdaten auszugeben.

### Aufgabe 3 — Rotation planen

Schreibe Schritte, um neue Zugangsdaten zu erstellen, das Environment-Secret zu aktualisieren, sie per Deployment-Test zu prüfen, die alten Zugangsdaten zu widerrufen und die Änderung festzuhalten.

**Erwartetes Ergebnis:** Die Rotation hat eine Reihenfolge, die unnötige Ausfallzeiten vermeidet.

## Herausforderung

Erkläre, warum ein Secret nicht gegenüber Code aus einem nicht vertrauenswürdigen Pull Request oder Fork offengelegt werden darf.

## Selbstprüfung

- [ ] Ich weiß, dass Variablen nicht automatisch geheim sind.
- [ ] Ich kann mögliche Offenlegung in Logs finden.
- [ ] Ich kann Zugangsdaten rotieren und widerrufen.
- [ ] Ich kann ein Produktions-Secret auf eine Umgebung begrenzen.

## Häufige Fehler

| Fehler                                    | Lösung                                                 |
| ----------------------------------------- | ------------------------------------------------------ |
| Tokens in YAML eintragen                  | Stattdessen `secrets` referenzieren.                   |
| Annehmen, Maskierung behebe jedes Leak    | Zuerst Ausgabe und Artefakt-Uploads verhindern.        |
| Eine Zugangsdaten überall wiederverwenden | Zugangsdaten begrenzen und geringste Rechte verwenden. |

## Zusammenfassung

Secrets schützen Zugangsdaten; Variablen liefern gewöhnliche Konfiguration. Sichere Verwendung erfordert begrenzten Zugriff, keine Logs und regelmäßige Rotation.

## Weiterführende Links

- Notebook: [Secrets und Variablen](../../notebooks/de/42-secrets-and-variables.md)
- Lab: [Secrets rotieren und Variablen prüfen](../../labs/de/42-rotate-secrets-and-review-variables.md)
- Quiz: [Quiz zu Secrets und Variablen](../../quizzes/de/42-secrets-and-variables-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
