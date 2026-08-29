---
chapter: 17
title: "GitLab-Projektgrundlagen erkunden"
related_notebook: "GitLab-Grundlagen"
level: Einsteiger
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Navigation:** [Notebook](../../notebooks/de/17-gitlab-grundlagen.md) | [Labor](../../labs/de/17-gitlab-aenderung-erstellen-und-pruefen.md) | [Quiz](../../quizzes/de/17-gitlab-grundlagen-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Projektgrundlagen erkunden

## Ziel

Untersuche die Struktur und den Zugriffsbedarf eines GitLab-Projekts und ordne die Kollaborationsfunktionen korrekt ein.

## Lernergebnisse

- Namespace, Gruppe, Projekt und Repository aus einem Projektpfad bestimmen;
- Sichtbarkeit und Rollen unterscheiden;
- einen passenden Zugriff nach dem Prinzip der geringsten Berechtigung begründen.

## Voraussetzungen

- Das [Notebook zu GitLab-Grundlagen](../../notebooks/de/17-gitlab-grundlagen.md) wurde bearbeitet.
- Du kannst ein GitLab-Projekt im Browser öffnen.

## Szenario

Eine neue Person soll im Projekt `acme/training/demo-app` die README verbessern. Sie soll Branches und Merge Requests erstellen, aber weder Mitglieder noch Projekteinstellungen verwalten.

## Aufgaben

### Aufgabe 1

Zerlege den Projektpfad in Namespace, Gruppe und Projekt. Suche anschließend Repository, Standard-Branch, Issues und Merge Requests im Projekt.

**Erwartetes Ergebnis:** Du kannst die organisatorische Hierarchie erklären und die wichtigsten Bereiche im Projekt finden.

### Aufgabe 2

Wähle für die neue Person die niedrigste Rolle, die die Arbeit mit Branches und Merge Requests nach der Projektkonfiguration erlaubt. Begründe, warum Maintainer nicht erforderlich ist.

**Erwartetes Ergebnis:** Du unterscheidest Sichtbarkeit von Rolle und begründest eine Berechtigung anhand der Aufgabe.

### Aufgabe 3

Beschreibe den Ablauf für eine README-Änderung: Issue, Branch, Commit, Merge Request und Pipeline. Erkläre auch, was bei einer fehlgeschlagenen Pipeline passiert.

**Erwartetes Ergebnis:** Der Ablauf zeigt eine fokussierte Änderung, ein Review und die Korrektur auf demselben Branch.

## Zusatzaufgabe (optional)

Finde eine Untergruppe in GitLab und erkläre, welchen Vorteil sie gegenüber einer flachen Projektliste bietet.

## Selbstkontrolle

- [ ] Ich kann Gruppe und Projekt unterscheiden.
- [ ] Ich kenne den Unterschied zwischen Sichtbarkeit und Rolle.
- [ ] Ich kann den Zweck von Issue, Merge Request und Pipeline erklären.

## Häufige Fehler

| Fehler                                        | Lösung                                                               |
| --------------------------------------------- | -------------------------------------------------------------------- |
| Sichtbarkeit mit Änderungsrechten verwechseln | Prüfe Mitgliedschaft und Rolle getrennt von der Sichtbarkeit.        |
| Mehr Rechte als nötig vergeben                | Beginne mit der niedrigsten passenden Rolle.                         |
| Pipeline-Fehler vom Merge Request trennen     | Lies den Job-Log, behebe die Ursache und pushe auf denselben Branch. |

## Zusammenfassung

- Der Projektpfad erklärt die Zugehörigkeit eines Projekts.
- Rollen und Sichtbarkeit steuern unterschiedliche Teile des Zugriffs.
- Issues, Merge Requests und Pipelines ergänzen einander im Änderungsablauf.

## Nächster Schritt

Bearbeite das Labor und führe einen kleinen GitLab-Beitrag praktisch durch.

### Verwandte Inhalte

- Notebook: [GitLab-Grundlagen](../../notebooks/de/17-gitlab-grundlagen.md)
- Labor: [GitLab-Änderung erstellen und prüfen](../../labs/de/17-gitlab-aenderung-erstellen-und-pruefen.md)
- Quiz: [GitLab-Grundlagen-Quiz](../../quizzes/de/17-gitlab-grundlagen-quiz.md)
