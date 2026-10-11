---
chapter: 42
title: "Secrets und Variablen"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](41-continuous-deployment.md) | [Roadmap](../../ROADMAP.md) | [Nächstes Kapitel](43-codeql.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- GitHub-Actions-Secrets von gewöhnlichen Variablen unterscheiden.
- Secrets und Variablen referenzieren, ohne Zugangsdaten in Logs offenzulegen.
- Verfahren für Rotation, Gültigkeitsbereich und Berechtigungen der Workflow-Konfiguration entwerfen.

## Einführung

Workflows benötigen Konfiguration wie Deployment-URLs, Feature-Schalter, Tokens und Cloud-Zugangsdaten. GitHub Actions stellt `secrets` für vertrauliche Werte und `vars` für nicht vertrauliche Konfiguration bereit. Eine Variable ist nicht automatisch geheim, nur weil sie in den Repository-Einstellungen gespeichert ist.

## Warum das wichtig ist

Offengelegte Zugangsdaten können lange nach Abschluss eines Workflows unberechtigten Zugriff ermöglichen. Klare Trennung, geringste Rechte, Maskierung und Rotation verringern die Auswirkungen von Fehlern. Sicherheit hängt davon ab, wie ein Wert verwendet wird, nicht nur davon, wo er gespeichert ist.

## Wichtige Begriffe

| Begriff          | Definition                                                                                   |
| ---------------- | -------------------------------------------------------------------------------------------- |
| Secret           | Ein vertraulicher Wert, der von GitHub geschützt ist und kontrolliert verwendet werden soll. |
| Variable         | Nicht vertrauliche Konfiguration, die über den `vars`-Kontext bereitgestellt wird.           |
| Umgebungs-Secret | Ein Secret, das auf eine Umgebung wie `production` begrenzt ist.                             |
| Rotation         | Ersetzen einer Zugangsdaten durch einen neuen Wert und Widerrufen des alten Werts.           |
| Maskierung       | Ersetzen eines vertraulichen Werts in der Logausgabe durch `***`.                            |

## Theorie

Secrets werden über `${{ secrets.NAME }}` referenziert, Variablen über `${{ vars.NAME }}`. Verwende einen Umgebungsbereich, wenn ein Zugangsdaten nur zu einem Deployment-Ziel gehört. Lege Secrets nicht in Quelldateien, widergespiegelte Befehlsargumente, Artefakte, Issue-Texte oder Debug-Ausgaben.

Ein Secret kann trotzdem versehentlich offengelegt werden: Ein Skript kann es ausgeben, ein Tool kann es in eine Fehlermeldung aufnehmen oder ein Angreifer kann einen Workflow verändern, um es zu exfiltrieren. Pull-Request-Workflows aus Forks können im Allgemeinen nicht auf Repository-Secrets zugreifen, was eine wichtige Sicherheitsgrenze darstellt.

### Praktisches Workflow-Beispiel

```yaml
name: Deploy

on:
  workflow_dispatch:

env:
  LOG_LEVEL: ${{ vars.LOG_LEVEL }}

permissions:
  contents: read

jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy application
        env:
          CLOUD_TOKEN: ${{ secrets.CLOUD_TOKEN }}
          DEPLOYMENT_URL: ${{ vars.DEPLOYMENT_URL }}
        run: ./scripts/deploy.sh
```

Das Token wird über die Step-Umgebung übergeben, statt in die Befehlszeile geschrieben zu werden. Das Skript darf `CLOUD_TOKEN` niemals ausgeben. `DEPLOYMENT_URL` ist eine Variable und sollte als öffentliche Konfiguration behandelt werden, sofern sie nicht zusätzlich vertraulich ist.

## Probiere es selbst aus

1. Ordne jeden Konfigurationswert als Secret oder Variable ein.
2. Begrenze ein Produktionszugangsdaten auf die Umgebung `production`.
3. Suche in einem Workflow nach `echo`, Shell-Tracing und Artefakt-Uploads, die Werte offenlegen könnten.
4. Schreibe ein Rotationsverfahren, das die alten Zugangsdaten widerruft.

## Best Practices

- Speichere Zugangsdaten in GitHub-Actions-Secrets oder einem externen Secret Manager.
- Verwende umgebungsbezogene Secrets und minimale Workflow-Berechtigungen.
- Secrets niemals loggen, committen oder hochladen.
- Rotiere Zugangsdaten nach vermuteter Offenlegung und nach einem festgelegten Zeitplan.
- Behandle alle `vars`-Werte als nicht vertrauliche Konfiguration.

## Häufige Fehler

| Fehler                                                    | Warum er Probleme verursacht                                      | So vermeidest du ihn                                   |
| --------------------------------------------------------- | ----------------------------------------------------------------- | ------------------------------------------------------ |
| Annehmen, Variablen seien vertraulich                     | Variablen können für Workflow-Benutzer und in Logs sichtbar sein. | Vertrauliche Werte in `secrets` ablegen.               |
| `set -x` mit Zugangsdaten im Gültigkeitsbereich verwenden | Shell-Tracing kann Befehle und Werte ausgeben.                    | Tracing um vertrauliche Befehle herum deaktivieren.    |
| Ein breit gültiges Produktions-Token wiederverwenden      | Ein Leak betrifft jeden Workflow und Service.                     | Zugangsdaten begrenzen und geringste Rechte verwenden. |

## Zusammenfassung

- Secrets schützen vertrauliche Werte; Variablen liefern gewöhnliche Konfiguration.
- Secrets dürfen nicht geloggt, committed oder hochgeladen werden.
- Gültigkeitsbereich, geringste Rechte und Rotation sind wichtige Kontrollen.

## Weiterführende Links

- Vorheriges Kapitel: [Kontinuierliches Deployment](41-continuous-deployment.md)
- Übung: [Secrets und Variablen verwalten](../../exercises/de/42-manage-secrets-and-variables.md)
- Lab: [Secrets rotieren und Variablen prüfen](../../labs/de/42-rotate-secrets-and-review-variables.md)
- Quiz: [Quiz zu Secrets und Variablen](../../quizzes/de/42-secrets-and-variables-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
- Nächstes Kapitel: [CodeQL](43-codeql.md)
