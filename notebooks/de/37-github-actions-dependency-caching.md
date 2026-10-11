---
chapter: 37
title: "Abhängigkeits-Caching in GitHub Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](36-github-actions-matrix-builds.md) | [Übung](../../exercises/de/37-design-a-safe-dependency-cache.md) | [Lab](../../labs/de/37-optimize-a-safe-cache-strategy.md) | [Quiz](../../quizzes/de/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- erklären, was Abhängigkeits-Caching leistet und was es nicht garantiert;
- stabile Cache-Schlüssel mit nützlichen Wiederherstellungsschlüsseln entwerfen;
- veraltete, branchübergreifende oder nicht vertrauenswürdige Cache-Daten vermeiden;
- messen, ob Caching einen Workflow verbessert.

## Einführung

Die Installation von Abhängigkeiten kann einen großen Teil der CI-Zeit beanspruchen. Ein Cache speichert wiederverwendbare Daten des Paketmanagers zwischen Workflow-Läufen, sodass ein späterer Lauf unveränderte Abhängigkeiten nicht erneut herunterladen muss. Ein Cache ist eine Optimierung und keine Quelle der Wahrheit: Lockfile und Paketmanager müssen die Abhängigkeitsmenge weiterhin prüfen.

## Wichtige Begriffe

| Begriff                     | Bedeutung                                                                                                       |
| --------------------------- | --------------------------------------------------------------------------------------------------------------- |
| Cache-Schlüssel             | Exakte Kennung, mit der ein gespeicherter Cache gefunden wird.                                                  |
| Wiederherstellungsschlüssel | Präfix, mit dem bei einem Fehlschlag des exakten Schlüssels ein älterer kompatibler Cache gefunden wird.        |
| Cache-Pfad                  | Verzeichnis, dessen Daten wiederverwendet werden können.                                                        |
| Cache-Treffer               | Ein passender Cache wurde wiederhergestellt.                                                                    |
| Cache-Poisoning             | Nicht vertrauenswürdige Daten werden in einen Cache eingefügt und später als vertrauenswürdige Daten verwendet. |

## Theorie

### Schlüssel entwerfen

Ein nützlicher Schlüssel enthält Betriebssystem, Laufzeit, Abhängigkeitsmanager und einen Hash des Lockfiles. Für einen Matrix-Job müssen Sie die Matrixdimensionen einbeziehen, die den Cache-Inhalt verändern. Beispiel:

```yaml
key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
restore-keys: |
  ${{ runner.os }}-npm-
```

Der exakte Schlüssel liefert einen präzisen Treffer. Das Wiederherstellungspräfix kann einen älteren Cache zurückgeben. Das kann Zeit sparen, darf aber weder eine frische Installation noch die Prüfung des Lockfiles umgehen.

### Sichere Cache-Inhalte

Cachen Sie möglichst Download-Daten des Paketmanagers. Vermeiden Sie das Cachen von Zugangsdaten, erzeugten Secrets, Deployment-Ausgaben oder beliebigem Workspace-Zustand. Verwenden Sie einen Cache nicht als Mechanismus zur Datenübergabe zwischen Jobs; Job-Grenzen sollten Artefakte oder ausdrückliche Ausgaben verwenden.

### Beispiel mit einer Setup-Action

Viele Setup-Actions bieten eine Cache-Option für Paketmanager:

```yaml
- uses: actions/setup-node@v4
  with:
    node-version: 22
    cache: npm
- run: npm ci
```

Die Setup-Action leitet einen Cache-Pfad und einen Lockfile-Schlüssel für den Paketmanager ab. Der Installationsbefehl bleibt maßgeblich und sollte einen Lockfile-erzwingenden Modus wie `npm ci` verwenden.

Für ausdrückliche Kontrolle verwenden Sie die Cache-Action:

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.cache/pip
    key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.lock') }}
    restore-keys: |
      ${{ runner.os }}-pip-
- run: python -m pip install -r requirements.lock
```

### Cache-Sicherheit und Geltungsbereich

Caches werden nach Plattformregeln und Schlüsselbereich geteilt. Ein Pull Request aus einem nicht vertrauenswürdigen Fork darf keine Daten schreiben können, denen ein privilegierter Workflow später vertraut. Stellen Sie niemals einen Cache an einem Ort wieder her, der ausführbaren Quellcode, Action-Code oder Zugangsdaten überschreiben kann. Verwenden Sie für sensible Workflows enge Schlüssel, vertrauenswürdige Branches oder gar keinen Cache.

## Best Practices

- Hashen Sie jedes Lockfile, das die gecachte Abhängigkeitsmenge steuert.
- Beziehen Sie Matrixdimensionen ein, wenn sie den Cache beeinflussen.
- Installieren Sie nach der Wiederherstellung eines Caches aus dem Lockfile.
- Cachen Sie Downloads statt Secrets oder Build-Ausgaben, sofern das Risiko nicht verstanden und akzeptiert ist.
- Vergleichen Sie Trefferquoten und Dauer, bevor Sie einen Cache beibehalten.

## Häufige Fehler

| Fehler                                                          | Risiko                                                             | Korrektur                                         |
| --------------------------------------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------- |
| Nur nach Betriebssystem schlüsseln                              | Inkompatible Abhängigkeiten können wiederverwendet werden.         | Lockfiles hashen und Laufzeitdetails einbeziehen. |
| Daten aus dem Wiederherstellungsschlüssel als aktuell behandeln | Veraltete Pakete werden möglicherweise als vollständig angenommen. | Die normale Lockfile-Installation ausführen.      |
| `.env` oder Zugangsdaten cachen                                 | Secrets können in gemeinsamem Speicher bestehen bleiben.           | Sensible Pfade ausschließen.                      |
| Cache für eine Job-Grenze verwenden                             | Datenfluss wird undurchsichtig und unsicher.                       | Artefakte oder Job-Ausgaben verwenden.            |

## Zusammenfassung

Caching reduziert wiederholte Downloads, aber Paketinstallation und Lockfile-Prüfung bleiben die Quelle der Wahrheit. Exakte Schlüssel liefern Korrektheit; Wiederherstellungsschlüssel bieten einen kontrollierten Fallback. Cachen Sie nur Daten, die sicher wiederverwendet werden können.

### Verwandte Inhalte

- Vorheriges Kapitel: [Matrix-Builds](36-github-actions-matrix-builds.md)
- Übung: [Einen sicheren Abhängigkeits-Cache entwerfen](../../exercises/de/37-design-a-safe-dependency-cache.md)
- Lab: [Eine sichere Cache-Strategie optimieren](../../labs/de/37-optimize-a-safe-cache-strategy.md)
- Quiz: [Quiz zu Abhängigkeits-Caching](../../quizzes/de/37-dependency-caching-quiz.md)
