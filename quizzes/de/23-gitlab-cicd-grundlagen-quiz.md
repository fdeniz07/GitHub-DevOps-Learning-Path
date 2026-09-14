---
chapter: 23
title: "GitLab CI/CD Grundlagen Quiz"
related_notebook: "GitLab CI/CD Grundlagen"
related_exercise: "GitLab Pipeline-Ergebnisse diagnostizieren"
related_lab: "GitLab Pipeline-Fehler untersuchen"
level: Beginner
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/23-gitlab-cicd-grundlagen.md) | [Uebung](../../exercises/de/23-gitlab-pipeline-ergebnisse-diagnostizieren.md) | [Labor](../../labs/de/23-gitlab-pipeline-fehler-untersuchen.md) | [Roadmap](../../ROADMAP.md)

## GitLab CI/CD Grundlagen Quiz

## Abschnitt A - Multiple Choice

### Frage 1

Welche konzeptionelle Rolle hat ein GitLab Runner?

- A. Er speichert die Repository-Historie.
- B. Er uebernimmt und fuehrt Jobs aus.
- C. Er genehmigt Merge Requests.
- D. Er schreibt die Pipeline-Konfiguration.

**Antwort:** B

**Erklaerung:** Ein Runner stellt die Ausfuehrungsumgebung fuer wartende Jobs bereit.

### Frage 2

Welcher Status beschreibt einen erstellten Job, der auf einen Runner wartet?

- A. `pending`
- B. `passed`
- C. `canceled`
- D. `skipped`

**Antwort:** A

**Erklaerung:** `pending` bedeutet, dass die Ausfuehrung noch nicht begonnen hat.

## Abschnitt B - Wahr oder Falsch

### Frage 3

Eine fehlgeschlagene Test-Assertion sollte normalerweise so oft wiederholt werden, bis sie besteht.

**Antwort:** Falsch

**Erklaerung:** Ein reproduzierbarer Testfehler ist ein Hinweis, der behoben oder untersucht werden muss.

### Frage 4

Ein Push oder Merge Request kann je nach Projektregeln eine Pipeline ausloesen.

**Antwort:** Wahr

**Erklaerung:** Pipelines reagieren auf konfigurierte Ereignisse und koennen auch Zeitplaene oder manuelle Aktionen nutzen.

## Abschnitt C - Kurzantwort

### Frage 5

Wie unterscheiden sich Job und Stage?

**Erwartete Antwort:** Ein Job ist eine ausfuehrbare Arbeitseinheit; eine Stage gruppiert Jobs als geordneten Punkt im Pipeline-Ablauf.

### Frage 6

Nenne zwei Belege aus einem fehlgeschlagenen Job.

**Erwartete Antwort:** Zum Beispiel fehlgeschlagener Befehl, erster aussagekraeftiger Fehler, Ausloeser, Commit, Runner- oder Queue-Status und Log-Kontext.

## Praxisszenario

Ein Job scheiterte waehrend einer bestaetigten externen Dienststoerung. Welche Aktion ist sicher?

**Erwartete Antwort:** Einmal mit notiertem Grund wiederholen und das neue Ergebnis pruefen. Bei erneutem Fehler eskalieren statt endlos zu wiederholen.

## Zugehoerige Inhalte

- Notebook: [GitLab CI/CD Grundlagen](../../notebooks/de/23-gitlab-cicd-grundlagen.md)
- Uebung: [GitLab Pipeline-Ergebnisse diagnostizieren](../../exercises/de/23-gitlab-pipeline-ergebnisse-diagnostizieren.md)
- Labor: [GitLab Pipeline-Fehler untersuchen](../../labs/de/23-gitlab-pipeline-fehler-untersuchen.md)
