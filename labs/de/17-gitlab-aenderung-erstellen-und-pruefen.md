---
chapter: 17
title: "GitLab-Änderung erstellen und prüfen"
related_notebook: "GitLab-Grundlagen"
related_exercise: "GitLab-Projektgrundlagen erkunden"
level: Einsteiger
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Navigation:** [Notebook](../../notebooks/de/17-gitlab-grundlagen.md) | [Übung](../../exercises/de/17-gitlab-projektgrundlagen-erkunden.md) | [Quiz](../../quizzes/de/17-gitlab-grundlagen-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Änderung erstellen und prüfen

## Ziel

Führe eine kleine Dokumentationsänderung kontrolliert von einem Issue über einen Branch und Merge Request bis zur Pipeline-Prüfung durch.

## Lernergebnisse

- einen Issue und einen fokussierten Branch erstellen;
- einen Merge Request mit Kontext und Testinformation öffnen;
- Review- oder Pipeline-Rückmeldungen vor einem Merge verarbeiten.

## Szenario

Die README eines Projekts enthält keinen lokalen Setup-Befehl. Das Team möchte den Hinweis ergänzen, ohne direkt auf den Standard-Branch zu schreiben.

## Voraussetzungen

- Bearbeite zuvor das [Notebook](../../notebooks/de/17-gitlab-grundlagen.md) und die [Übung](../../exercises/de/17-gitlab-projektgrundlagen-erkunden.md).
- Du hast Zugriff auf ein GitLab-Übungsprojekt und Git ist eingerichtet.

## Umgebung

| Anforderung    | Wert                                       |
| -------------- | ------------------------------------------ |
| Betriebssystem | Windows, Linux oder macOS                  |
| Software       | Git und aktueller Webbrowser               |
| GitLab-Zugriff | Rolle für Branch- und Merge-Request-Arbeit |

## Aufgaben

### Aufgabe 1 - Issue und Branch erstellen

**Schritte**

1. Erstelle ein Issue mit Kontext und erwartetem README-Hinweis.
2. Klone das Projekt oder aktualisiere deine lokale Kopie.
3. Erstelle den Branch `docs/setup-befehl`.

**Erwartetes Ergebnis:** Issue und Branch beschreiben dieselbe klar abgegrenzte Aufgabe.

### Aufgabe 2 - Änderung committen und pushen

**Schritte**

1. Ergänze Befehl und kurze Erklärung in der README.
2. Prüfe den Diff und committe mit einer fokussierten Nachricht.
3. Pushe den Branch mit `git push -u origin docs/setup-befehl`.

**Erwartetes Ergebnis:** Der Remote-Branch enthält nur die beabsichtigte Änderung.

### Aufgabe 3 - Merge Request prüfen

**Schritte**

1. Öffne einen Merge Request zum richtigen Ziel-Branch und verknüpfe das Issue.
2. Prüfe Diff, Kommentare, Konflikte und Pipeline.
3. Behebe angeforderte Änderungen oder Pipeline-Fehler auf demselben Branch; merge erst nach erfüllten Anforderungen.

**Erwartetes Ergebnis:** Der Merge Request dokumentiert Änderung, Review und technische Prüfung.

## Prüfliste

- [ ] Issue und Merge Request erklären Zweck und Prüfung.
- [ ] Source- und Target-Branch sind korrekt.
- [ ] Der Diff enthält nur die README-Änderung.
- [ ] Erforderliche Reviews und Pipeline-Jobs sind erfolgreich.

## Fehlerbehebung

| Problem                                      | Ursache                              | Lösung                                                 |
| -------------------------------------------- | ------------------------------------ | ------------------------------------------------------ |
| Der Branch erscheint nicht im Merge Request. | Er wurde nicht gepusht.              | Führe den Push-Befehl aus und aktualisiere die Seite.  |
| Unerwartete Commits sind sichtbar.           | Falscher Ausgangs- oder Ziel-Branch. | Prüfe Branches und trenne fremde Änderungen.           |
| Ein Job schlägt fehl.                        | Eine Prüfung meldet ein Problem.     | Lies den Job-Log, behebe die Ursache und pushe erneut. |

## Best Practices

- Verknüpfe Umsetzung und Arbeitskontext über ein Issue.
- Halte Branch, Commit und Merge Request auf eine Änderung begrenzt.
- Umgehe fehlgeschlagene erforderliche Prüfungen nicht.

## Zusatzaufgabe (optional)

Bitte eine andere Person um ein Review und formuliere einen Kommentar mit Datei, Beobachtung und gewünschtem Ergebnis.

## Zusammenfassung

- GitLab verbindet Planung, Branches, Review und Automatisierung.
- Auch kleine Änderungen profitieren von einem klaren Merge Request.
- Ein Merge erfolgt erst nach geklärten Rückmeldungen und Prüfungen.

## Nächster Schritt

Bearbeite das Quiz und überprüfe dein Verständnis der GitLab-Grundlagen.

### Verwandte Inhalte

- Notebook: [GitLab-Grundlagen](../../notebooks/de/17-gitlab-grundlagen.md)
- Übung: [GitLab-Projektgrundlagen erkunden](../../exercises/de/17-gitlab-projektgrundlagen-erkunden.md)
- Quiz: [GitLab-Grundlagen-Quiz](../../quizzes/de/17-gitlab-grundlagen-quiz.md)
