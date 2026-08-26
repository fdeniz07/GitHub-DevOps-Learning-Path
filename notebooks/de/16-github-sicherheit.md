---
chapter: 16
title: "GitHub Security"
part: "GitHub"
level: Einsteiger
estimated_time: 80 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Vorheriges Kapitel: 15](15-github-releases.md) | [Roadmap](../../ROADMAP.md) | Nächstes Kapitel 17: Demnächst

## Lernziele

- Least Privilege erklären;
- Secrets aus Quellcode und Logs fernhalten;
- Dependency Alerts, Dependabot und Code Scanning unterscheiden;
- wichtige Branches schützen;
- auf ein geleaktes Secret richtig reagieren.

## Einführung

Repository-Sicherheit besteht aus Prävention, Erkennung und Reaktion. Zugriffskontrolle, Branch Protection, Secret Scanning, Dependency Alerts und Code Scanning ergänzen sich, ersetzen aber keine verantwortungsvolle Teamarbeit.

## Theorie

Gib Personen und Workflows nur die Rechte, die sie benötigen. Für wichtige Branches können Pull-Request-Reviews, erfolgreiche Statusprüfungen, gelöste Gespräche und das Verbot von Force Pushes verlangt werden.

Secrets gehören in genehmigte Secret Stores oder GitHub Actions Secrets, niemals in Dateien:

```yaml
env:
  API_TOKEN: ${{ secrets.API_TOKEN }}
```

Bei einem geleakten Token gilt: sofort widerrufen, rotieren, Nutzung prüfen, Inhalte und gegebenenfalls Historie bereinigen, Verantwortliche informieren und Verbesserungen dokumentieren.

Dependency Alerts weisen auf bekannte Risiken in Bibliotheken hin. Dependabot kann Updates vorschlagen; diese müssen getestet werden. Code Scanning findet mögliche Schwachstellen im Quellcode und benötigt menschliche Bewertung.

## Best Practices

- Least Privilege für Menschen und Workflows verwenden.
- Default-Branch schützen.
- Alerts regelmäßig bearbeiten.
- `SECURITY.md` mit privatem Meldeweg anbieten.
- Keine Secrets in Issues, Logs oder Pull Requests ausgeben.

## Häufige Fehler

Ein Secret nur aus der aktuellen Datei zu löschen reicht nicht immer. Breite Workflow-Rechte, ignorierte Alerts und ungeprüfte Dependency-Updates erhöhen das Risiko.

## Zusammenfassung

GitHub Security verbindet Zugriffsregeln, Branch-Schutz, Secret-Hygiene, Dependency-Pflege, Code Scanning und Incident Response.

## Nächstes Kapitel

Kapitel 17 eröffnet den GitLab-DevOps-Track.

### Verwandte Inhalte

- Übung: [GitHub-Sicherheitskontrollen prüfen](../../exercises/de/16-github-sicherheitskontrollen-pruefen.md)
- Labor: [Ein GitHub-Repository absichern](../../labs/de/16-github-repository-absichern.md)
- Quiz: [GitHub Security Quiz](../../quizzes/de/16-github-sicherheit-quiz.md)
