---
chapter: 23
title: "GitLab Pipeline-Ergebnisse diagnostizieren"
related_notebook: "GitLab CI/CD Grundlagen"
level: Beginner
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/23-gitlab-cicd-grundlagen.md) | [Labor](../../labs/de/23-gitlab-pipeline-fehler-untersuchen.md) | [Quiz](../../quizzes/de/23-gitlab-cicd-grundlagen-quiz.md) | [Roadmap](../../ROADMAP.md)

## GitLab Pipeline-Ergebnisse diagnostizieren

## Ziel

Interpretiere Pipeline-Status, ermittle wahrscheinliche Ursachen und entscheide begruendet ueber Retries.

## Szenario

Drei Merge Requests zeigen: `pending`, weil kein passender Runner frei ist; `failed` wegen einer falschen Test-Assertion; `failed` nach einer bestaetigten temporaeren Dienststoerung.

## Aufgaben

### Aufgabe 1 - Status einordnen

Ordne fuer jeden Fall ein: wartend, laufend, abgeschlossen oder blockiert. Nenne die erste Ansicht, die du pruefst.

**Erwartetes Ergebnis:** Du unterscheidest Queue-Probleme von Befehlsfehlern.

### Aufgabe 2 - Fehlerbelege lesen

Notiere fuer jeden fehlgeschlagenen Job den Befehl, den ersten aussagekraeftigen Fehler und ob die Ursache reproduzierbar oder temporaer wirkt.

**Erwartetes Ergebnis:** Deine Schlussfolgerung beruht auf Logs, nicht nur auf Rot.

### Aufgabe 3 - Naechste Aktion waehlen

Waehle: auf Runner warten oder eskalieren, Fehler beheben und Commit pushen, oder einmal mit begruendetem Anlass wiederholen.

**Erwartetes Ergebnis:** Nur die temporaere Stoerung wird wiederholt.

## Selbstkontrolle

- [ ] Ich kann Pipeline, Job, Stage und Runner erklaeren.
- [ ] Ich kann einen Job-Status im Kontext lesen.
- [ ] Ich unterscheide temporaere und reproduzierbare Fehler.

## Zugehoerige Inhalte

- Notebook: [GitLab CI/CD Grundlagen](../../notebooks/de/23-gitlab-cicd-grundlagen.md)
- Labor: [GitLab Pipeline-Fehler untersuchen](../../labs/de/23-gitlab-pipeline-fehler-untersuchen.md)
- Quiz: [GitLab CI/CD Grundlagen Quiz](../../quizzes/de/23-gitlab-cicd-grundlagen-quiz.md)
