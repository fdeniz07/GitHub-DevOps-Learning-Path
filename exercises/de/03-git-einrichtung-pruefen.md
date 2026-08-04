---
chapter: 03
title: "Git-Einrichtung prüfen"
related_notebook: "Git installieren"
level: Einsteiger
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Navigation:** [Notebook](../../notebooks/de/03-git-installieren.md) | [Labor](../../labs/de/03-git-installieren-und-konfigurieren.md) | [Quiz](../../quizzes/de/03-git-installieren-quiz.md) | [Roadmap](../../ROADMAP.md)

# Git-Einrichtung prüfen

## Ziel

Prüfe Git im Terminal und eine bewusste globale Commit-Identität.

## Szenario

Git soll installiert sein, aber ein Commit schlägt fehl. Sammle Terminal-Belege, bevor du Einstellungen veränderst.

## Aufgaben

1. Führe `git --version` aus und notiere, ob eine Version erscheint.
1. Lies `user.name` und `user.email` aus:

```bash
git config --global --get user.name
git config --global --get user.email
```

1. Bestimme für jede Bedingung die kleinste Korrektur.

| Zustand                                         | Kleinster nächster Schritt                                  |
| ----------------------------------------------- | ----------------------------------------------------------- |
| Git wird in einem alten Terminal nicht gefunden | Neues Terminal öffnen und `git --version` erneut ausführen. |
| `user.email` ist leer                           | `user.email` setzen und den Wert erneut lesen.              |
| Arbeitsrepository fordert Organisations-E-Mail  | Freigegebene E-Mail vor dem Commit konfigurieren.           |

## Selbstkontrolle

- [ ] Ich kann Git ohne Repository prüfen.
- [ ] Ich kann Name und E-Mail vor einem Commit auslesen.

### Weiterführende Inhalte

- Notebook: [Git installieren](../../notebooks/de/03-git-installieren.md)
- Labor: [Git installieren und konfigurieren](../../labs/de/03-git-installieren-und-konfigurieren.md)
- Quiz: [Git installieren - Quiz](../../quizzes/de/03-git-installieren-quiz.md)
