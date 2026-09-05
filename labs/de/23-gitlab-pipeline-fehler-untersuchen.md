---
chapter: 23
title: "GitLab Pipeline-Fehler untersuchen"
related_notebook: "GitLab CI/CD Grundlagen"
related_exercise: "GitLab Pipeline-Ergebnisse diagnostizieren"
level: Beginner
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/23-gitlab-cicd-grundlagen.md) | [Uebung](../../exercises/de/23-gitlab-pipeline-ergebnisse-diagnostizieren.md) | [Quiz](../../quizzes/de/23-gitlab-cicd-grundlagen-quiz.md) | [Roadmap](../../ROADMAP.md)

## GitLab Pipeline-Fehler untersuchen

## Ziel

Nutze GitLab-Pipeline-Informationen, um aus einem fehlgeschlagenen Check eine klare und sichere naechste Aktion zu machen.

## Szenario

Eine Merge-Request-Pipeline scheitert in einem Test-Job. Das Team braucht vor einer Aenderung, einem Retry oder einer Plattform-Eskalation eine kurze Diagnose.

## Voraussetzungen

- Das [Notebook](../../notebooks/de/23-gitlab-cicd-grundlagen.md) und die [Uebung](../../exercises/de/23-gitlab-pipeline-ergebnisse-diagnostizieren.md) sind abgeschlossen.
- Zugriff auf ein GitLab-Projekt mit sichtbarer Pipeline-Historie oder eine Beispiel-Pipeline.

## Aufgaben

### Aufgabe 1 - Ablauf abbilden

1. Bestimme Ausloeser und zugehoerigen Commit oder Merge Request.
2. Liste Stages und Jobs in der angezeigten Reihenfolge auf.
3. Notiere den Status jedes Jobs.

**Erwartetes Ergebnis:** Du kannst erklaeren, was lief, wartet und fehlschlug.

### Aufgabe 2 - Einen Fehler diagnostizieren

1. Oeffne das Log des fehlgeschlagenen Jobs.
2. Notiere Befehl und ersten aussagekraeftigen Fehler.
3. Entscheide, ob lokale Aenderung, Runner-Problem oder temporaere Abhaengigkeit am wahrscheinlichsten ist.

**Erwartetes Ergebnis:** Die Diagnose nennt Belege statt zu raten.

### Aufgabe 3 - Sicher reagieren

1. Bei reproduzierbarem Testfehler: kleinste Korrektur umsetzen oder vorschlagen und neue Pipeline starten.
2. Bei bestaetigter temporaerer Stoerung: einmal wiederholen und Grund notieren.
3. Bei fehlendem Runner: Queue-Status und Job an das verantwortliche Team melden.

**Erwartetes Ergebnis:** Fix, Retry oder Eskalation sind nachvollziehbar.

## Validierungscheckliste

- [ ] Ausloeser und Commit sind festgehalten.
- [ ] Fehlgeschlagener Befehl und Fehler sind bekannt.
- [ ] Die Retry-Entscheidung hat Belege.
- [ ] Das Ergebnis der naechsten Pipeline wurde im Kontext geprueft.

## Fehlerbehebung

| Problem              | Moegliche Ursache                              | Loesung                                           |
| -------------------- | ---------------------------------------------- | ------------------------------------------------- |
| Job bleibt `pending` | Kein passender Runner ist frei.                | Runner-Verfuegbarkeit und Eskalationsweg pruefen. |
| Log ist sehr lang    | Die letzte Zeile ist nur eine Zusammenfassung. | Den ersten Fehler verursachenden Befehl suchen.   |

## Zugehoerige Inhalte

- Notebook: [GitLab CI/CD Grundlagen](../../notebooks/de/23-gitlab-cicd-grundlagen.md)
- Uebung: [GitLab Pipeline-Ergebnisse diagnostizieren](../../exercises/de/23-gitlab-pipeline-ergebnisse-diagnostizieren.md)
- Quiz: [GitLab CI/CD Grundlagen Quiz](../../quizzes/de/23-gitlab-cicd-grundlagen-quiz.md)
