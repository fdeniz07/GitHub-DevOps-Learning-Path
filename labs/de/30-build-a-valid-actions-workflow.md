---
chapter: 30
title: "Einen gültigen Actions-Workflow erstellen"
related_notebook: "YAML-Grundlagen für GitHub Actions"
related_exercise: "GitHub-Actions-YAML üben"
level: Beginner
estimated_time: 55 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Notebook](../../notebooks/de/30-yaml-fundamentals.md) | [Übung](../../exercises/de/30-practice-github-actions-yaml.md) | [Quiz](../../quizzes/de/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ziel

Erstelle und überprüfe einen gültigen GitHub-Actions-Workflow, der YAML-Struktur, Berechtigungen, Listen und einen Ausdruck demonstriert.

## Lernergebnisse

- verschachtelte Maps und Listen mit konsistenter Einrückung erstellen;
- die Struktur eines Workflows durch Lesen seiner Hierarchie validieren;
- erklären, wann ein Ausdruck einen Schritt steuert.

## Szenario

Erstelle einen Validierungsworkflow für ein Übungsrepository. Er soll bei Pushes auf `main` und bei einem manuellen Start laufen, eine schreibgeschützte `contents`-Berechtigung verwenden und bedingt eine Nachricht ausgeben, wenn der Ref `main` ist.

## Voraussetzungen

- Das zugehörige Notebook und die Übung abgeschlossen.
- Ein GitHub-Übungsrepository.
- Ein Editor, der für das Einfügen von Leerzeichen konfiguriert ist.

## Umgebung einrichten

| Anforderung    | Wert                                              |
| -------------- | ------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                         |
| Software       | GitHub-Repository und YAML-fähiger Editor         |
| Version        | Jeder aktuell unterstützte Browser und Git-Client |

## Aufgaben

### Aufgabe 1 - Das Dokument aufbauen

#### Schritte: Das Dokument aufbauen

1. Erstelle `.github/workflows/yaml-validation.yml`.
2. Füge `name`, eine `on`-Map, `permissions` und eine `jobs`-Map hinzu.
3. Verwende eine Blockliste für zwei Schritte: Checkout und einen bedingten Befehl.

#### Erwartetes Ergebnis: Workflow-Hierarchie

Die Einrückung zeigt einen Job, der eine geordnete Liste aus zwei Schritt-Maps enthält.

### Aufgabe 2 - Die Hierarchie überprüfen

#### Schritte: Die Hierarchie überprüfen

1. Markiere jedes Map-Eltern- und Listen-Elternelement in der Datei.
2. Suche nach Tabs und versehentlicher nachgestellter Einrückung.
3. Bestätige, dass der Ausdruck der Wert von `if` und kein eigener YAML-Schlüssel ist.

#### Erwartetes Ergebnis: Eindeutige Struktur

Das Dokument ist lesbar und seine beabsichtigte Hierarchie eindeutig.

### Aufgabe 3 - Ausführen und überprüfen

#### Schritte: Ausführen und überprüfen

1. Committe den Workflow und starte ihn durch ein konfiguriertes Ereignis.
2. Prüfe das Jobprotokoll und das Ergebnis des bedingten Schritts.
3. Ändere Ereignis oder Ref in einem kontrollierten Branch und vergleiche das Verhalten.

#### Erwartetes Ergebnis: Bedingtes Verhalten

Der Workflow läuft und das Verhalten des bedingten Schritts entspricht dem Ausdruck.

## Validierungs-Checkliste

- [ ] Für die Einrückung werden keine Tabs verwendet.
- [ ] `steps` ist eine Liste unter dem Job.
- [ ] Berechtigungen sind explizit und minimal.
- [ ] Der Ausdruck verwendet `${{ ... }}`.
- [ ] Der committete Workflow läuft erfolgreich.

## Fehlerbehebung

| Problem                             | Mögliche Ursache                             | Lösung                                                                                  |
| ----------------------------------- | -------------------------------------------- | --------------------------------------------------------------------------------------- |
| Workflow lässt sich nicht parsen    | Einrückung oder Zeichensetzung ist ungültig. | Vergleiche jedes Kindelement mit seinem Elternteil und nutze einen YAML-fähigen Editor. |
| Bedingter Schritt wird übersprungen | Der aktuelle Ref ist nicht `main`.           | Bestätige den Ereigniskontext, bevor du den Ausdruck änderst.                           |
| Ein literales `#` verschwindet      | Es begann einen Kommentar.                   | Setze den Skalar mit dem literalen Zeichen in Anführungszeichen.                        |

## Best Practices

- Validiere die Struktur, bevor du Laufzeitbefehle änderst.
- Bevorzuge für die Größe der Sammlung den klarsten Listenstil.
- Halte Bedingungen so kurz, dass ein Reviewer sie erklären kann.

## Zusammenfassung

Dieses Labor verbindet YAML-Syntax mit echtem Actions-Verhalten: Einrückung erzeugt Struktur, Ausdrücke steuern Werte und ein gültiger Workflow macht die Struktur in einem Lauf beobachtbar.

### Verwandte Inhalte

- Notebook: [YAML-Grundlagen für GitHub Actions](../../notebooks/de/30-yaml-fundamentals.md)
- Übung: [GitHub-Actions-YAML üben](../../exercises/de/30-practice-github-actions-yaml.md)
- Quiz: [Quiz zu YAML-Grundlagen](../../quizzes/de/30-yaml-fundamentals-quiz.md)
