---
chapter: 21
title: "Einen kleinen Merge Request prüfen"
related_notebook: "GitLab Merge Requests und Code Review"
level: Einsteiger
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Vorheriges Kapitel](../../notebooks/de/20-gitlab-work-items-issues-und-planung.md) | [Notebook](../../notebooks/de/21-gitlab-merge-requests-und-code-review.md) | [Labor](../../labs/de/21-kleine-aenderung-reviewen-und-merken.md) | [Quiz](../../quizzes/de/21-gitlab-merge-requests-und-code-review-quiz.md)

## Einen kleinen Merge Request prüfen

## Ziel

Übe ein fokussiertes, konstruktives Review für einen Dokumentations-MR.

## Szenario

Ein MR ergänzt einen Setup-Befehl in der README. Die Beschreibung sagt, der Befehl sei getestet; der Diff ändert aber zusätzlich unzusammenhängende Überschriften-Großschreibung.

## Aufgaben

### Aufgabe 1 - Absicht prüfen

Prüfe Titel, verknüpftes Work Item, Ziel-Branch und Kriterium: Neue Mitwirkende finden und nutzen den dokumentierten Befehl.

### Aufgabe 2 - Änderung untersuchen

Vergleiche den Befehl mit der Projektdokumentation. Entscheide, ob die unzusammenhängende Formatierung in diesen MR gehört.

### Aufgabe 3 - Feedback schreiben

Schreibe bei einem falschen oder fehlenden Befehl einen notwendigen Kommentar, andernfalls eine Freigabe. Formuliere für die Formatierung einen separaten, nicht blockierenden Vorschlag.

**Beispiel:** `Frage: Wurde dieser Befehl im aktuellen Projekt geprüft? Das Akzeptanzkriterium verlangt einen ausführbaren Befehl.`

### Aufgabe 4 - Merge-Bereitschaft entscheiden

Nenne die Nachweise: erforderliche Freigaben, gelöste erforderliche Diskussionen und erfolgreiche Pflicht-Pipeline.

## Selbstkontrolle

- [ ] Ich habe die Absicht vor Stilfragen geprüft.
- [ ] Ich unterscheide blockierendes Finding und Vorschlag.
- [ ] Ich kenne die erforderlichen Merge-Nachweise.

## Verwandte Inhalte

- Vorheriges Kapitel: [GitLab Work Items, Issues und Planung](../../notebooks/de/20-gitlab-work-items-issues-und-planung.md)
- Notebook: [GitLab Merge Requests und Code Review](../../notebooks/de/21-gitlab-merge-requests-und-code-review.md)
- Labor: [Kleine Änderung reviewen und mergen](../../labs/de/21-kleine-aenderung-reviewen-und-merken.md)
- Quiz: [GitLab Merge Requests und Code Review Quiz](../../quizzes/de/21-gitlab-merge-requests-und-code-review-quiz.md)
