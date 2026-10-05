---
chapter: 43
title: "Einen CodeQL-Fund untersuchen"
related_notebook: "CodeQL-Analyse"
related_exercise: "CodeQL-Analyse einführen"
related_quiz: "CodeQL-Quiz"
level: Intermediate
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/43-codeql.md) | [Übung](../../exercises/de/43-introduce-codeql-analysis.md) | [Roadmap](../../ROADMAP.md)

# Einen CodeQL-Fund untersuchen

## Ziel

Führe eine CodeQL-Analyse aus oder untersuche sie und triff eine dokumentierte Entscheidung zu einem Code-Scanning-Fund.

## Ergebnisse

Du wirst in der Lage sein:

- Berechtigungen und Ergebnisse des CodeQL-Workflows zu prüfen.
- einen Fund von der Quelle bis zum Ziel zu verfolgen.
- einen Alert mit Nachweisen zu beheben, nachzuverfolgen oder zurückzuweisen.

## Voraussetzungen

- Schließe Notebook und Übung ab.
- Ein Repository mit aktiviertem CodeQL für eine unterstützte Sprache.
- Berechtigung zum Anzeigen von Code-Scanning-Alerts.

## Szenario

CodeQL meldet einen möglichen Injection-Pfad in einem Webservice. Du musst feststellen, ob nicht vertrauenswürdige Eingaben ein sensibles Ziel erreichen, und eine Behebung empfehlen.

## Umgebung

| Anforderung    | Wert                                            |
| -------------- | ----------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                       |
| Software       | GitHub Actions und CodeQL-fähiges Repository    |
| Zugriff        | Code-Scanning-Alerts und Pull-Request-Prüfungen |

## Aufgaben

### Aufgabe 1 — Analyse prüfen

Untersuche den Workflow auf `github/codeql-action/init@v3`, `github/codeql-action/analyze@v3`, Sprachauswahl, Trigger und `security-events: write`.

**Erwartetes Ergebnis:** Der Workflow kann SARIF-Ergebnisse erzeugen und hochladen.

### Aufgabe 2 — Den Alert verfolgen

Öffne den Alert und identifiziere Quelle, Ziel, Datenfluss, Bereinigung, Schweregrad und erreichbaren Ausführungspfad.

**Erwartetes Ergebnis:** Der Alert wird im Kontext des tatsächlichen Anwendungsverhaltens verstanden.

### Aufgabe 3 — Verantwortlich auflösen

Wende eine Behebung an und teste sie oder weise den Fund mit einer nachweisbasierten Begründung zurück. Halte die Entscheidung und die zuständige Person für die Nachverfolgung fest.

**Erwartetes Ergebnis:** Der Alert wird nicht stillschweigend ignoriert und die gewählte Aktion ist prüfbar.

## Validierungs-Checkliste

- [ ] Workflow-Berechtigungen sind minimal.
- [ ] CodeQL läuft bei den vorgesehenen Ereignissen.
- [ ] Quelle und Ziel sind identifiziert.
- [ ] Eine Behebung ist getestet oder die Nachweise für eine Zurückweisung sind festgehalten.
- [ ] Der Status des Alerts ist aktualisiert.

## Fehlerbehebung

| Problem                           | Mögliche Ursache                                  | Lösung                                             |
| --------------------------------- | ------------------------------------------------- | -------------------------------------------------- |
| Keine Ergebnisse erscheinen       | Upload-Berechtigung fehlt                         | `security-events: write` hinzufügen.               |
| Alert scheint nicht relevant      | Datenfluss ist nicht verstanden                   | Dem Pfad von Quelle zu Ziel folgen.                |
| Behebung schließt den Alert nicht | Die Abfrage erkennt weiterhin den unsicheren Pfad | Bereinigung erneut prüfen und Analyse wiederholen. |

## Best Practices

- Behandle Findings als Untersuchungsansätze und nicht als automatische Urteile.
- Halte Sicherheitsbehebungen klein und decke sie mit Tests ab.
- Plane Analysen, damit Verbesserungen an Abfragen angewendet werden.

## Zusammenfassung

CodeQL-Untersuchung verbindet automatische Analyse mit sorgfältiger Quellprüfung, Tests und verantwortlichen Entscheidungen.

## Weiterführende Links

- Notebook: [CodeQL-Analyse](../../notebooks/de/43-codeql.md)
- Übung: [CodeQL-Analyse einführen](../../exercises/de/43-introduce-codeql-analysis.md)
- Quiz: [CodeQL-Quiz](../../quizzes/de/43-codeql-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
