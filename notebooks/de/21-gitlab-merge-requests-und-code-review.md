---
chapter: 21
title: "GitLab Merge Requests und Code Review"
part: "GitLab DevOps"
level: Einsteiger
estimated_time: 60 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Vorheriges Kapitel](20-gitlab-work-items-issues-und-planung.md) | [Übung](../../exercises/de/21-kleinen-merge-request-pruefen.md) | [Labor](../../labs/de/21-kleine-aenderung-reviewen-und-merken.md) | [Quiz](../../quizzes/de/21-gitlab-merge-requests-und-code-review-quiz.md)

## Lernziele

- einen fokussierten Merge Request (MR) mit Kontext erstellen;
- Code, Freigaben und Diskussionen konstruktiv prüfen;
- Pipelines und Merge-Anforderungen vor dem Mergen bewerten.

## Einführung

Ein Merge Request macht eine Branch-Änderung sichtbar, bevor sie in einen gemeinsamen Branch gelangt. Er dokumentiert Änderung, Review, Freigaben und automatisierte Nachweise.

## Theorie

| Begriff       | Bedeutung                                                     |
| ------------- | ------------------------------------------------------------- |
| Merge Request | Vorschlag, einen Quell-Branch in einen Ziel-Branch zu mergen. |
| Freigabe      | Erforderliche oder optionale Entscheidung eines Reviewers.    |
| Diskussion    | Kommentar-Thread, oft an einer Codezeile.                     |
| Pipeline      | Automatische Jobs wie Tests, Linting oder Build.              |

### Ein gut prüfbarer MR

Ein MR sollte so klein sein, dass Zweck und Risiko verständlich bleiben. Beschreibe Problem, Lösung, Prüfung und offene Folgearbeit. Wähle den richtigen Ziel-Branch und verknüpfe das zugehörige Issue oder Work Item.

```text
Titel: Befehl für Projektprüfungen erläutern
Warum: Neue Mitwirkende finden den Befehl nicht.
Was: Den geprüften Befehl in README.md ergänzen.
Prüfung: Befehl lokal ausgeführt.
```

### Praktischer Review-Ablauf

1. Beschreibung und Akzeptanzkriterien lesen.
2. Diff auf Korrektheit, Umfang, Tests und unbeabsichtigte Änderungen prüfen.
3. Diskussionen, erforderliche Freigaben und Pipeline prüfen.
4. Erforderliche Threads lösen und Änderungen erneut prüfen.
5. Nur bei erfüllten Projektanforderungen mergen.

### Konstruktive Kommentare

Nenne Beobachtung, Auswirkung und einen hilfreichen nächsten Schritt. Blockiere nur bei Fehlern, Sicherheitsrisiken, verletzten Anforderungen oder vereinbarten Standards.

```text
Vorschlag: Dieser Text verrät den Kontostatus. Können wir die neutrale Meldung
aus den Akzeptanzkriterien verwenden und einen Test dafür ergänzen?
```

## Review-Arten und Anforderungen

- **Selbst-Review:** Autor prüft den Diff vor der Anfrage.
- **Peer Review:** Eine andere Person prüft Verhalten und Wartbarkeit.
- **Erforderliche Freigabe:** Regeln können Rollen oder eine Anzahl von Reviewern verlangen.
- **Diskussions-Review:** Erforderliche Threads müssen vor dem Merge gelöst sein.
- **Pipeline-Review:** Erfolgreiche Pflichtjobs sind Nachweise, aber kein Ersatz für Menschen.

Geschützte Branches können Freigaben, erfolgreiche Pipelines, gelöste Diskussionen oder einen aktuellen Quell-Branch verlangen. Die genauen Regeln stehen in den Projekteinstellungen.

## Best Practices

- Halte jeden MR bei einer zusammenhängenden, testbaren Änderung.
- Gib Zweck und Prüfnachweise klar an.
- Trenne notwendige Findings von optionalen Vorschlägen.
- Umgehe keine fehlgeschlagenen Pflichtprüfungen.

## Häufige Fehler

| Fehler                                      | Besserer Weg                                     |
| ------------------------------------------- | ------------------------------------------------ |
| Feature, Aufräumen und Formatierung mischen | Unabhängige Arbeit in fokussierte MRs teilen.    |
| Jede Präferenz blockieren                   | Auswirkung erklären und Vorschläge kennzeichnen. |
| Pipeline ohne Diff-Prüfung vertrauen        | Code und Anforderungen zusätzlich prüfen.        |

## Zusammenfassung

Kleine MRs, klare Kommentare, vollständige Freigaben, gelöste Diskussionen und Pflicht-Pipelines machen das Mergen nachvollziehbar und zuverlässig.

## Üben

Nutze die [Übung](../../exercises/de/21-kleinen-merge-request-pruefen.md), das [Labor](../../labs/de/21-kleine-aenderung-reviewen-und-merken.md) und das [Quiz](../../quizzes/de/21-gitlab-merge-requests-und-code-review-quiz.md).
