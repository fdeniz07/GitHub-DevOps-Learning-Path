---
chapter: 11
title: "Klonen, Fork und Remotes"
part: "GitHub"
level: Einsteiger
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Vorheriges Kapitel: 10](10-github-grundlagen.md) | [Roadmap](../../ROADMAP.md) | Nächstes Kapitel 12: Demnächst
>
> **Niveau:** Einsteiger · **Voraussetzungen:** [Kapitel 10: GitHub-Grundlagen](10-github-grundlagen.md)

## Lernziele

- Clone und Fork unterscheiden;
- `origin` und `upstream` erklären;
- mehrere Remotes verwalten;
- lokale Arbeit mit dem Originalprojekt synchronisieren;
- den üblichen Open-Source-Beitragsablauf beschreiben.

## Theorie

Ein Clone kopiert ein Repository auf den eigenen Computer. Ein Fork erstellt dagegen eine eigene Kopie auf GitHub. Typischer Ablauf:

```bash
git clone https://github.com/your-user/project.git
cd project
git remote add upstream https://github.com/project-owner/project.git
git fetch upstream
git switch main
git merge upstream/main
```

`origin` zeigt meist auf den eigenen Fork, `upstream` auf das Originalprojekt. Änderungen werden auf den eigenen Fork gepusht; der Pull Request geht zum Upstream.

### Remotes prüfen

```bash
git remote -v
git remote get-url origin
git remote rename origin github-origin
git remote remove upstream
```

Verwende Namen, die die Beziehung verständlich machen.

## Best Practices

- Vor fetch und push das Remote prüfen.
- Upstream regelmäßig synchronisieren.
- Nicht direkt in fremde geschützte Branches pushen.
- Fork, Clone und Remote nicht als dasselbe betrachten.

## Häufige Fehler

- `origin` und `upstream` vertauschen;
- Änderungen aus dem Original nicht abrufen;
- auf einen falschen Fork pushen;
- lokale Branches ohne aktuellen Zielstand erstellen.

## Zusammenfassung

Clone ist lokal, Fork ist eine eigene Online-Kopie. Mit `origin` und `upstream` kann ein Beitrag sicher zwischen Fork und Originalprojekt synchronisiert werden.

## Nächstes Kapitel

Kapitel 12 behandelt Pull Requests und Code-Review.

### Verwandte Inhalte

- Übung: [Ein Remote-Repository untersuchen](../../exercises/de/11-remote-repository-untersuchen.md)
- Labor: [Fork erstellen und synchronisieren](../../labs/de/11-fork-erstellen-und-synchronisieren.md)
- Quiz: [Clone, Fork und Remote Quiz](../../quizzes/de/11-klonen-fork-und-remotes-quiz.md)
