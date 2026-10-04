---
chapter: 39
title: "Eine Pipeline für kontinuierliche Integration erstellen"
related_notebook: "Kontinuierliche Integration"
related_exercise: "Einen Workflow für kontinuierliche Integration entwerfen"
related_quiz: "Quiz zur kontinuierlichen Integration"
level: Beginner
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/39-continuous-integration.md) | [Übung](../../exercises/de/39-design-a-continuous-integration-workflow.md) | [Roadmap](../../ROADMAP.md)

# Eine Pipeline für kontinuierliche Integration erstellen

## Ziel

Erstelle und überprüfe einen GitHub-Actions-CI-Workflow für ein kleines Python-Projekt.

## Ergebnisse

Du wirst in der Lage sein:

- Validierung bei Pull Requests und Pushes auf `main` auszulösen.
- Abhängigkeiten in einem reproduzierbaren Runner zu installieren und Tests auszuführen.
- eine fehlgeschlagene erforderliche Prüfung zu beobachten und zu korrigieren.

## Voraussetzungen

- Schließe Notebook und Übung ab.
- Zugriff auf ein GitHub-Repository und einen funktionierenden Python-Testbefehl.
- Git und einen Texteditor.

## Szenario

Dein Team möchte jede vorgeschlagene Änderung vor dem Zusammenführen prüfen. Du fügst einen Workflow hinzu, öffnest eine Teständerung und untersuchst die resultierende Prüfung.

## Umgebung

| Anforderung    | Wert                                         |
| -------------- | -------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                    |
| Software       | Git, GitHub-Konto, Python 3.12               |
| Repository     | Ein Projekt mit `requirements.txt` und Tests |

## Aufgaben

### Aufgabe 1 — Den Workflow hinzufügen

Erstelle `.github/workflows/ci.yml` mit `pull_request`, `push` auf `main`, `permissions: contents: read`, Checkout, Python-Setup, Abhängigkeitsinstallation und `python -m pytest`.

**Erwartetes Ergebnis:** GitHub erkennt den Workflow und startet ihn für einen Pull Request.

### Aufgabe 2 — Feedback auslösen

Öffne einen Branch, nimm eine kleine test-sichere Änderung vor und erstelle einen Pull Request. Untersuche den Workflow-Lauf und die Prüfungszusammenfassung.

**Erwartetes Ergebnis:** Die Validierungsprüfung meldet im Pull Request Erfolg.

### Aufgabe 3 — Verhalten bei Testfehlern prüfen

Verwende einen temporären Branch, um einen fehlschlagenden Test einzuführen, beobachte die fehlgeschlagene Prüfung und korrigiere ihn anschließend.

**Erwartetes Ergebnis:** Der Fehler ist sichtbar und der korrigierte Commit bringt die Prüfung wieder zum Erfolg.

## Validierungs-Checkliste

- [ ] Die Workflow-Datei liegt unter `.github/workflows`.
- [ ] Beide erforderlichen Trigger sind vorhanden.
- [ ] Die Berechtigungen sind schreibgeschützt.
- [ ] Abhängigkeiten werden erfolgreich installiert.
- [ ] Tests laufen und melden einen Status.
- [ ] Ein fehlschlagender Test blockiert die erforderliche Prüfung.

## Fehlerbehebung

| Problem                            | Mögliche Ursache                         | Lösung                                                                  |
| ---------------------------------- | ---------------------------------------- | ----------------------------------------------------------------------- |
| Workflow startet nicht             | YAML-Speicherort oder Trigger ist falsch | `.github/workflows` und `on` prüfen.                                    |
| Importfehler                       | Abhängigkeiten wurden nicht installiert  | `requirements.txt` und Setup-Schritt prüfen.                            |
| Testprüfung ist nicht erforderlich | Branch Protection ist unvollständig      | Den exakten Prüfnamen zu den erforderlichen Statusprüfungen hinzufügen. |

## Best Practices

- Halte den Workflow reproduzierbar und fokussiert.
- Verwende klare Schrittbezeichnungen und bewahre nützliche Logs auf.
- Behebe Flaky Tests, statt sie mit Wiederholungen zu verbergen.

## Zusammenfassung

Du hast eine CI-Feedbackschleife erstellt, die Änderungen vor dem Zusammenführen validiert und `main` beobachtbar hält.

## Weiterführende Links

- Notebook: [Kontinuierliche Integration](../../notebooks/de/39-continuous-integration.md)
- Übung: [Einen Workflow für kontinuierliche Integration entwerfen](../../exercises/de/39-design-a-continuous-integration-workflow.md)
- Quiz: [Quiz zur kontinuierlichen Integration](../../quizzes/de/39-continuous-integration-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
