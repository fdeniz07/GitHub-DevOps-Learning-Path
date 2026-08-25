---
chapter: 10
title: "GitHub-Grundlagen"
part: "GitHub"
level: Einsteiger
estimated_time: 70 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Vorheriges Kapitel: 09](09-fortgeschrittene-git-techniken.md) | [Roadmap](../../ROADMAP.md) | Nächstes Kapitel 11: Demnächst
>
> **Niveau:** Einsteiger · **Voraussetzungen:** [Kapitel 09: Fortgeschrittene Git-Techniken](09-fortgeschrittene-git-techniken.md)

## Lernziele

- Git und GitHub unterscheiden;
- ein GitHub-Repository erklären;
- Remotes, Clone, Fetch, Pull und Push einordnen;
- lokale Branches mit GitHub verbinden;
- die Grundlagen gemeinsamer Arbeit beschreiben.

## Einführung

Git ist das lokale Versionsverwaltungssystem. GitHub ist eine Plattform, die Git-Repositories hostet und Zusammenarbeit, Reviews, Issues und Automatisierung unterstützt. GitHub ersetzt Git nicht.

## Schlüsselbegriffe

| Begriff           | Erklärung                                                     |
| ----------------- | ------------------------------------------------------------- |
| GitHub-Repository | Online gehostetes Repository mit Zusammenarbeit.              |
| Remote            | Benannte Verbindung zu einem anderen Repository.              |
| Origin            | Häufiger Standardname des geklonten Remotes.                  |
| Push              | Lokale Commits zu einem Remote senden.                        |
| Fetch             | Remote-Informationen laden, ohne den Arbeitsbranch zu ändern. |
| Pull              | Fetch und Integration in den aktuellen Branch.                |

## Theorie

Ein Remote wird häufig mit `origin` bezeichnet:

```bash
git remote -v
git fetch origin
git pull origin main
git push -u origin main
```

Ein Repository kann öffentlich oder privat sein. Zugriff, Branch-Regeln und Review-Prozesse bestimmen, wie sicher und nachvollziehbar Zusammenarbeit abläuft.

### Ein Repository untersuchen

Prüfe README, Lizenz, Issues, Branches, Releases und CONTRIBUTING-Hinweise, bevor du Änderungen erstellst. Ein guter Beitrag beginnt mit dem Verständnis des Projekts.

## Praktische Beispiele

```bash
git clone https://github.com/example/project.git
cd project
git remote -v
git switch -c feature/add-docs
git push -u origin feature/add-docs
```

Der lokale Branch wird dadurch auf GitHub sichtbar und kann später als Pull Request vorgeschlagen werden.

## Best Practices

- Remotes vor Push und Pull prüfen.
- Niemals Zugangstoken in Dateien committen.
- Kleine, fokussierte Branches verwenden.
- Repository-Regeln vor Beiträgen lesen.

## Häufige Fehler

- GitHub mit Git verwechseln;
- in das falsche Repository pushen;
- `pull` ohne Kenntnis des Ziel-Branches ausführen;
- private Daten in öffentliche Repositories stellen.

## Zusammenfassung

Git verwaltet lokale Historie, GitHub hostet und erweitert diese Zusammenarbeit. Remotes verbinden beide Welten. Clone, fetch, pull und push bilden den grundlegenden Austausch.

## Nächstes Kapitel

Kapitel 11 erklärt Clone, Fork, Origin und Upstream im Detail.

### Verwandte Inhalte

- Übung: [Ein GitHub-Repository erkunden](../../exercises/de/10-github-repository-erkunden.md)
- Labor: [Repository klonen und pushen](../../labs/de/10-repository-klonen-und-pushen.md)
- Quiz: [GitHub-Grundlagen Quiz](../../quizzes/de/10-github-grundlagen-quiz.md)
