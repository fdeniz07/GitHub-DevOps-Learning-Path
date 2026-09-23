---
chapter: 28
title: "Einen GitHub-Actions-Workflow ausführen"
related_notebook: "Einführung in GitHub Actions"
related_exercise: "Den ersten GitHub-Actions-Workflow erstellen"
level: Beginner
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/28-introduction-to-github-actions.md) | [Übung](../../exercises/de/28-create-your-first-github-actions-workflow.md) | [Quiz](../../quizzes/de/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ziel

Erstelle, committe, starte und überprüfe einen minimalen GitHub-Actions-Workflow.

## Lernergebnisse

- einen Workflow dort ablegen, wo GitHub ihn erkennt;
- einen Workflow durch ein Repository-Ereignis und einen manuellen Start ausführen;
- Job- und Schrittergebnisse überprüfen, ohne vertrauliche Daten offenzulegen.

## Szenario

Du führst Automatisierung in ein Repository ein. Dieses erste Labor überprüft den Bereitstellungspfad mit einem ungefährlichen Statusbefehl, bevor spätere Kapitel Build- und Testlogik ergänzen.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- Ein GitHub-Repository und die Berechtigung, einen Workflow zu committen.
- Ein Browser und ein Git-Client.

## Umgebung einrichten

| Anforderung    | Wert                                         |
| -------------- | -------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                    |
| Software       | Git und ein Texteditor                       |
| Repository     | Ein Übungsrepository ohne Produktionseinsatz |

## Aufgaben

### Aufgabe 1 - Den Workflow erstellen

#### Schritte: Den Workflow erstellen

1. Erstelle `.github/workflows`.
2. Füge einen Workflow mit `push` für `main`, `workflow_dispatch`, `contents: read` und einem Job hinzu.
3. Verwende Schritte für Checkout und `git status --short`.

#### Erwartetes Ergebnis: Committer Workflow

Die committete Datei ist im Repository unter `.github/workflows` sichtbar.

### Aufgabe 2 - Einen Lauf starten und überprüfen

#### Schritte: Starten und überprüfen

1. Öffne die Actions-Ansicht des Repositorys.
2. Wähle den Workflow und nutze die Steuerung für den manuellen Start oder pushe den Workflow-Branch entsprechend seinem Trigger.
3. Öffne den Job und klappe beide Schritte auf.

#### Erwartetes Ergebnis: Erfolgreicher Lauf

Der Lauf zeigt einen erfolgreichen Job mit getrennten Protokollen für Checkout und den Statusbefehl.

### Aufgabe 3 - Belege festhalten

#### Schritte: Belege festhalten

1. Halte Ereignis, Commit, Workflowname, Jobname und den finalen Status fest.
2. Bestätige, dass kein Secret- oder Tokenwert in den Protokollen erscheint.
3. Erkläre, warum `contents: read` ausreichend war.

#### Erwartetes Ergebnis: Laufprotokoll

Du erstellst ein kleines, sicheres Laufprotokoll, das ein anderer Reviewer verstehen kann.

## Validierungs-Checkliste

- [ ] Der Workflow liegt unter `.github/workflows`.
- [ ] Der Workflow startet durch ein konfiguriertes Ereignis.
- [ ] Der Job und beide Schritte werden erfolgreich abgeschlossen.
- [ ] Die Berechtigungen sind explizit und schreibgeschützt.
- [ ] Die Protokolle enthalten keine vertraulichen Werte.

## Fehlerbehebung

| Problem                         | Mögliche Ursache                        | Lösung                                                                    |
| ------------------------------- | --------------------------------------- | ------------------------------------------------------------------------- |
| Workflow fehlt                  | Dateipfad oder Commit ist falsch.       | Prüfe `.github/workflows` und den Branch mit der Datei.                   |
| Manueller Start nicht verfügbar | Dem Workflow fehlt `workflow_dispatch`. | Füge den Trigger hinzu und committe ihn.                                  |
| Job scheitert vor dem Befehl    | YAML oder Aktionsreferenz ist ungültig. | Lies den ersten fehlschlagenden Schritt und prüfe Einrückung und Version. |

## Best Practices

- Verwende für den ersten Lauf ein Übungsrepository.
- Behandle Protokolle als für Mitwirkende sichtbar und gib niemals Secrets aus.
- Halte Ereignis und Commit fest, wenn du Belege dokumentierst.

## Zusammenfassung

Dieses Labor verwandelt eine Workflow-Definition in überprüfbare Belege: Ein konfiguriertes Ereignis startet einen Lauf, ein Runner führt Schritte aus und Protokolle zeigen das Ergebnis.

### Verwandte Inhalte

- Notebook: [Einführung in GitHub Actions](../../notebooks/de/28-introduction-to-github-actions.md)
- Übung: [Den ersten GitHub-Actions-Workflow erstellen](../../exercises/de/28-create-your-first-github-actions-workflow.md)
- Quiz: [Einführung in GitHub Actions - Quiz](../../quizzes/de/28-introduction-to-github-actions-quiz.md)
