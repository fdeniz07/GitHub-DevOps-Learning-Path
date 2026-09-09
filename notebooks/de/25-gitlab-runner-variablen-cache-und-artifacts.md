---
chapter: 25
title: "Runner, Variablen, Cache und Artifacts"
part: "GitLab DevOps"
level: Einsteiger
estimated_time: 100 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Kapitel 24](24-gitlab-ci-yml-pipelines-stages-und-jobs.md) | [Übung](../../exercises/de/25-gitlab-ci-ressourcen-auswaehlen.md) | [Labor](../../labs/de/25-gitlab-ci-pipeline-verbessern.md) | [Quiz](../../quizzes/de/25-gitlab-runner-variablen-cache-und-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- Runner nach Fähigkeit und Vertrauensgrenze auswählen;
- CI/CD-Variablen ohne Offenlegung sensibler Werte nutzen;
- Cache und Artifact anhand ihres Zwecks unterscheiden;
- typische Fehler bei Runnern, Variablen, Caches und Artifacts untersuchen.

## Einführung

Eine Pipeline beschreibt die Arbeit, ein Runner führt sie aus. Variablen liefern Konfiguration, Caches beschleunigen wiederholbare Eingaben und Artifacts bewahren konkrete Ergebnisse auf. Diese Aufgaben dürfen nicht vermischt werden.

## Zentrale Begriffe

| Begriff             | Bedeutung                                                      |
| ------------------- | -------------------------------------------------------------- |
| Runner              | Ein Agent, der CI/CD-Jobs ausführt.                            |
| Runner-Tag          | Eine Kennzeichnung zur Auswahl geeigneter Runner.              |
| Variable            | Ein Konfigurationswert für Pipeline oder Job.                  |
| Geschützte Variable | Nur für Pipelines geschützter Refs verfügbar.                  |
| Maskierte Variable  | Ein Wert, den GitLab in Logs zu verbergen versucht.            |
| Cache               | Wiederverwendbare, reproduzierbare Dateien zur Beschleunigung. |
| Artifact            | Ein bewusst gespeichertes Ergebnis eines Jobs.                 |

## Runner und Vertrauensgrenzen

Runner führen Code aus und bilden damit eine Vertrauensgrenze. Shared Runner bedienen mehrere Projekte, Group Runner eine Gruppe und Project Runner ein Projekt. Verfügbarkeit und Richtlinien hängen von der GitLab-Instanz ab. Tags wählen einen Runner mit benötigten Fähigkeiten, etwa Linux oder Docker.

Verwende für sensible Jobs nur vertrauenswürdige, geschützte Runner und geschützte Branches. Ungeprüfter Code darf nicht auf Runnern mit Produktionszugriff laufen.

## Variablen sicher verwenden

Variablen können in der Oberfläche, auf Gruppen- oder Projektebene oder in YAML definiert sein. Der wirksame Wert hängt von Scope und Instanzkonfiguration ab. Dokumentiere Namenskonventionen und vermeide doppelte Namen. Tokens, Passwörter und Schlüssel gehören in geschützte, maskierte Variablen oder ein freigegebenes Secret-System.

Gib niemals geheime Werte mit `echo` aus und zeige keine vollständige Umgebungsvariablenliste. File-Variablen eignen sich, wenn ein Werkzeug eine Datei erwartet, etwa ein Zertifikat.

## Cache oder Artifact?

| Frage        | Cache                                        | Artifact                                     |
| ------------ | -------------------------------------------- | -------------------------------------------- |
| Zweck        | Reproduzierbare Abhängigkeiten beschleunigen | Job-Ergebnis bewahren                        |
| Beispiel     | `.npm/`                                      | `dist/`                                      |
| Fehlt es?    | Installation lädt erneut                     | Nachfolgender Job kann Ergebnis nicht nutzen |
| Aufbewahrung | Wiederverwendung nach Key                    | Bewusste Ablaufzeit                          |

Ein Cache-Key sollte sich bei Änderungen an `package-lock.json` ändern. Ein Cache-Miss ist meist ein Geschwindigkeitsproblem. Artifact-Pfade müssen nach dem Script existieren und relativ zum Projektverzeichnis stimmen.

## Beispiel: Node.js-Pipeline verbessern

```yaml
default:
  image: node:22-alpine

cache:
  key:
    files:
      - package-lock.json
  paths:
    - .npm/

build:
  script:
    - npm ci --cache .npm --prefer-offline
    - npm run build
  artifacts:
    paths:
      - dist/
    expire_in: 7 days
```

`.npm/` ist ein Cache, weil seine Daten erneut heruntergeladen werden können. `dist/` ist ein Artifact, weil es genau dieses Build-Ergebnis überträgt. Die Ablaufzeit verhindert unbegrenzten Speicherverbrauch.

## Fehlerbehebung

| Problem        | Mögliche Ursache                    | Sichere Reaktion                                                   |
| -------------- | ----------------------------------- | ------------------------------------------------------------------ |
| Job wartet     | Kein passender Runner oder Tag      | Runner-Verfügbarkeit und Tags prüfen.                              |
| Variable leer  | Falscher Scope oder geschützter Ref | Namen und erlaubten Ref prüfen, nicht den Wert ausgeben.           |
| Cache-Miss     | Key geändert oder Cache gelöscht    | Installation fortsetzen und Key nur bei dauerhaften Misses prüfen. |
| Artifact fehlt | Pfad nach Build nicht vorhanden     | Erzeugte Dateien und relativen Pfad prüfen.                        |

## Best Practices

- Runner bewusst auswählen und sensible Jobs schützen.
- Secrets nie in YAML oder Logs schreiben.
- Abhängigkeiten cachen, Build-Ausgaben als Artifacts speichern.
- Für Artifacts enge Pfade und eine Ablaufzeit setzen.

## Zusammenfassung

- Runner führen Jobs aus und sind eine Vertrauensgrenze.
- Variablen konfigurieren Jobs, dürfen aber keine Secrets offenlegen.
- Cache beschleunigt Eingaben; Artifact bewahrt Ergebnisse.

### Verwandte Inhalte

- Übung: [GitLab-CI-Ressourcen auswählen](../../exercises/de/25-gitlab-ci-ressourcen-auswaehlen.md)
- Labor: [GitLab-CI-Pipeline verbessern](../../labs/de/25-gitlab-ci-pipeline-verbessern.md)
- Quiz: [Runner, Variablen, Cache und Artifacts Quiz](../../quizzes/de/25-gitlab-runner-variablen-cache-und-artifacts-quiz.md)
