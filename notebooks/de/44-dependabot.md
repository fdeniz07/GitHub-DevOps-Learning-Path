---
chapter: 44
title: "Dependabot-Updates"
part: "Continuous Integration & Continuous Delivery"
level: Intermediate
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](43-codeql.md) | [Roadmap](../../ROADMAP.md) | [Nächstes Kapitel](45-security-best-practices.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- erklären, wie Dependabot veraltete Abhängigkeiten identifiziert und Updates vorschlägt.
- Update-Zeitpläne, Gruppen und Limits für Pull Requests konfigurieren.
- Pull Requests für Dependency-Updates prüfen, testen und sicher zusammenführen.

## Einführung

Dependabot überwacht Dependency-Manifeste und Lock-Dateien und öffnet anschließend Pull Requests für verfügbare Versionsupdates oder Sicherheitsbehebungen. Dadurch werden vergessene Abweichungen bei Abhängigkeiten reduziert, aber Automatisierung macht nicht jedes Update sicher. Die vorgeschlagene Änderung benötigt weiterhin Review, Tests und eine Release-Entscheidung.

## Warum das wichtig ist

Abhängigkeiten bringen Funktionalität und Risiko mit sich. Ihre Aktualisierung kann Sicherheitspatches und Fehlerbehebungen liefern, während unvorsichtige Upgrades Breaking Changes einführen können. Ein konsistenter Update-Prozess macht Dependency-Hygiene zu einem normalen Teil der Auslieferung.

## Wichtige Begriffe

| Begriff             | Definition                                                                    |
| ------------------- | ----------------------------------------------------------------------------- |
| Abhängigkeit        | Ein externes Paket oder eine Action, die ein Projekt benötigt.                |
| Manifest            | Eine Datei, die Abhängigkeiten und Versionsbedingungen deklariert.            |
| Lock-Datei          | Eine Datei, die aufgelöste Abhängigkeitsversionen festhält.                   |
| Update-Pull-Request | Eine von Dependabot erstellte vorgeschlagene Abhängigkeitsänderung.           |
| Gruppiertes Update  | Mehrere kompatible Updates, die in einem Pull Request zusammengefasst werden. |

## Theorie

Die Dependabot-Konfiguration liegt in `.github/dependabot.yml`. Jeder Update-Eintrag benennt ein Ökosystem, ein Verzeichnis und einen Zeitplan. `open-pull-requests-limit`, `groups` und Ignore-Regeln helfen, das Rauschen zu kontrollieren, aber Ignore-Regeln sollten überprüft werden, damit sie keine wichtigen Sicherheitsupdates verbergen.

Jedes Update sollte CI bestehen und ein dem Risiko angemessenes menschliches Review erhalten. Prüfe Release Notes, Kompatibilität, Änderungen an Lock-Dateien, transitive Abhängigkeiten und das Verhalten in der Produktion. Updates von Actions verdienen dieselbe Aufmerksamkeit wie Bibliotheksupdates.

### Praktisches Konfigurationsbeispiel

```yaml
version: 2
updates:
  - package-ecosystem: pip
    directory: "/"
    schedule:
      interval: weekly
    open-pull-requests-limit: 5
    groups:
      production-dependencies:
        dependency-type: production

  - package-ecosystem: github-actions
    directory: "/"
    schedule:
      interval: monthly
```

Diese Konfiguration prüft Python-Abhängigkeiten wöchentlich und GitHub Actions monatlich. Eine Gruppe kann die Zahl der Pull Requests reduzieren, aber prüfe vor dem Zusammenführen den vollständigen Diff und das Testergebnis.

## Probiere es selbst aus

1. Füge einen Dependabot-Eintrag für das Projektökosystem hinzu.
2. Wähle einen Zeitplan und ein sinnvolles Limit für Pull Requests.
3. Untersuche ein Update auf direkte und transitive Änderungen.
4. Führe es erst zusammen, wenn CI, Sicherheitsprüfungen und Kompatibilitätsreview erfolgreich sind.

## Best Practices

- Prüfe Release Notes und Changelogs, bevor du Updates zusammenführst.
- Halte Lock-Dateien synchron und teste den aufgelösten Abhängigkeitsgraphen.
- Aktualisiere GitHub Actions ebenso wie Anwendungsbibliotheken.
- Verwende Gruppierung mit Bedacht und vermeide breite Ignore-Regeln.
- Priorisiere Sicherheitsupdates und bewahre gleichzeitig einen regelmäßigen Wartungsrhythmus.

## Häufige Fehler

| Fehler                                  | Warum er Probleme verursacht                                           | So vermeidest du ihn                                 |
| --------------------------------------- | ---------------------------------------------------------------------- | ---------------------------------------------------- |
| Jeden PR automatisch zusammenführen     | Ein Breaking Update kann ungeprüft die Produktion erreichen.           | Tests und passendes Review verlangen.                |
| Änderungen an der Lock-Datei ignorieren | Der tatsächlich aufgelöste Graph kann sich vom Manifest unterscheiden. | Lock-Datei-Updates prüfen und committen.             |
| Veraltete Ignore-Regeln bestehen lassen | Verwundbare Pakete bleiben dauerhaft festgesetzt.                      | Ignores mit Verantwortlichem und Ablaufdatum prüfen. |

## Zusammenfassung

- Dependabot automatisiert Vorschläge für Dependency-Updates, nicht die endgültige Entscheidung.
- Review, Tests, Release Notes und Lock-Datei-Prüfung bleiben notwendig.
- Geplante Pflege und sinnvolle Gruppierung reduzieren Risiko und Rauschen.

## Weiterführende Links

- Vorheriges Kapitel: [CodeQL](43-codeql.md)
- Übung: [Dependabot-Updates konfigurieren](../../exercises/de/44-configure-dependabot-updates.md)
- Lab: [Ein Dependabot-Update prüfen](../../labs/de/44-review-a-dependabot-update.md)
- Quiz: [Dependabot-Quiz](../../quizzes/de/44-dependabot-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
- Nächstes Kapitel: [Security Best Practices](45-security-best-practices.md)
