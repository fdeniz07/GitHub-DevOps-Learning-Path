---
chapter: 03
title: "Git installieren und konfigurieren"
related_notebook: "Git installieren"
related_exercise: "Git-Einrichtung prüfen"
level: Einsteiger
estimated_time: 40 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/03-git-installieren.md) | [Übung](../../exercises/de/03-git-einrichtung-pruefen.md) | [Quiz](../../quizzes/de/03-git-installieren-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git installieren und konfigurieren

## Ziel

Installiere Git, prüfe die Verfügbarkeit im neuen Terminal und konfiguriere eine Commit-Identität.

## Aufgaben

1. Öffne [Git Downloads](https://git-scm.com/downloads) und wähle die passende offizielle Installationsmethode.
1. Schließe nach der Installation alle offenen Terminals und öffne ein neues.
1. Prüfe Git:

```bash
git --version
```

1. Ersetze die Platzhalter und prüfe die Werte:

```bash
git config --global user.name "Dein Name"
git config --global user.email "du@example.com"
git config --global --get user.name
git config --global --get user.email
```

## Erwartetes Ergebnis

Das Terminal zeigt eine Git-Version sowie den Namen und die E-Mail-Adresse, die Git für zukünftige Commits verwendet.

## Fehlerbehebung

| Problem                            | Lösung                                                     |
| ---------------------------------- | ---------------------------------------------------------- |
| `git` wird nicht erkannt           | Neues Terminal öffnen, dann Installation oder PATH prüfen. |
| Commit meldet unbekannte Identität | Beide globalen Identitätswerte setzen und wieder auslesen. |

### Weiterführende Inhalte

- Notebook: [Git installieren](../../notebooks/de/03-git-installieren.md)
- Übung: [Git-Einrichtung prüfen](../../exercises/de/03-git-einrichtung-pruefen.md)
- Quiz: [Git installieren - Quiz](../../quizzes/de/03-git-installieren-quiz.md)
