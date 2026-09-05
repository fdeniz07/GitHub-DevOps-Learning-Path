---
chapter: 20
title: "Kleine GitLab-Auslieferung planen"
related_notebook: "GitLab Work Items, Issues und Planung"
related_exercise: "GitLab Work Items triagieren"
level: Einsteiger
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/20-gitlab-work-items-issues-und-planung.md) | [Übung](../../exercises/de/20-gitlab-work-items-triagieren.md) | [Quiz](../../quizzes/de/20-gitlab-work-items-issues-und-planung-quiz.md) | [Roadmap](../../ROADMAP.md)

## Kleine GitLab-Auslieferung planen

## Ziel

Eine kleine Dokumentationsverbesserung von einem GitLab Work Item oder Issue bis zu einem prüfbaren Merge Request planen und nachverfolgen.

## Szenario

Neue Contributors finden den Befehl für Projektprüfungen nicht. Das Team möchte ihn im aktuellen Dokumentations-Milestone im README ergänzen.

## Voraussetzungen

- Das [Notebook](../../notebooks/de/20-gitlab-work-items-issues-und-planung.md) und die [Übung](../../exercises/de/20-gitlab-work-items-triagieren.md) sind abgeschlossen.
- Du darfst in einem GitLab-Projekt Issues, Branches und Merge Requests erstellen.
- Git und ein Webbrowser sind verfügbar.

## Aufgaben

### Aufgabe 1 - Auslieferungsreifes Item erstellen

1. Erstelle ein Work Item oder Issue mit einem ergebnisorientierten Titel.
2. Beschreibe fehlende Information, Zielgruppe und Nicht-Ziel.
3. Ergänze Kriterien, Labels, Assignee und aktuellen Milestone.

**Erwartetes Ergebnis:** Der Eintrag ist anhand seiner Kriterien abnehmbar und erscheint, falls verfügbar, in der Planungsansicht.

### Aufgabe 2 - Umsetzung verbinden

1. Erstelle einen fokussierten Branch, etwa `123-pruefbefehl-dokumentieren`.
2. Ergänze die kleinste vollständige README-Änderung und prüfe den Diff lokal.
3. Pushe den Branch und öffne einen Merge Request zum richtigen Ziel-Branch.

**Erwartetes Ergebnis:** Branch und Merge Request verweisen eindeutig auf das Work Item.

### Aufgabe 3 - Review-Nachweis abschließen

1. Verknüpfe den Merge Request mit dem Item und nutze bei Bedarf eine unterstützte Schließreferenz.
2. Beschreibe Änderung und Prüfung.
3. Prüfe Kommentare, Pipeline und Kriterien vor dem Merge.

**Erwartetes Ergebnis:** Planung, Umsetzung, Prüfung und Abschluss bleiben als zusammenhängender Nachweis sichtbar.

## Validierungscheckliste

- [ ] Der Titel beschreibt ein Ergebnis.
- [ ] Kriterien sind beobachtbar.
- [ ] Labels und Milestone passen zur Taxonomie.
- [ ] Branch und Merge Request sind verknüpft.
- [ ] Review und erforderliche Prüfungen sind abgeschlossen.

## Fehlerbehebung

| Problem                            | Ursache                                         | Lösung                                                                             |
| ---------------------------------- | ----------------------------------------------- | ---------------------------------------------------------------------------------- |
| Kein Board sichtbar                | Edition oder Berechtigung unterstützt es nicht. | Nutze Labels und Milestones und kläre verfügbare Ansichten mit der Projektleitung. |
| Item schließt nach dem Merge nicht | Referenz oder Ziel-Branch wurde nicht erkannt.  | Prüfe Projektregeln und schließe erst nach erfüllten Kriterien manuell.            |

## Verwandte Inhalte

- Notebook: [GitLab Work Items, Issues und Planung](../../notebooks/de/20-gitlab-work-items-issues-und-planung.md)
- Übung: [GitLab Work Items triagieren](../../exercises/de/20-gitlab-work-items-triagieren.md)
- Quiz: [GitLab Work Items, Issues und Planung Quiz](../../quizzes/de/20-gitlab-work-items-issues-und-planung-quiz.md)
