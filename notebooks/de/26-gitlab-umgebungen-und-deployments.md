---
chapter: 26
title: "Umgebungen und Deployments"
part: "GitLab DevOps"
level: Einsteiger
estimated_time: 90 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Kapitel 25](25-gitlab-runner-variablen-cache-und-artifacts.md) | [Übung](../../exercises/de/26-gitlab-umgebungen-planen.md) | [Labor](../../labs/de/26-kontrolliertes-gitlab-deployment-planen.md) | [Quiz](../../quizzes/de/26-gitlab-umgebungen-und-deployments-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- Umgebung und Deployment unterscheiden;
- einen kontrollierten Weg von Staging nach Produktion beschreiben;
- Verifikation, Freigabe und Rollback vor einem Release planen.

## Einführung

Eine Umgebung ist ein benanntes Ziel wie `review`, `staging` oder `production`. Ein Deployment liefert eine konkrete Version dorthin. GitLab kann diese Beziehung dokumentieren, damit ein Team sieht, welche Version wo läuft.

## Begriffe

| Begriff    | Bedeutung                                         |
| ---------- | ------------------------------------------------- |
| Umgebung   | Benanntes Deployment-Ziel.                        |
| Deployment | Aufzeichnung der Auslieferung einer Version.      |
| Review App | Temporäre Umgebung für Branch oder Merge Request. |
| Staging    | Produktionsnahe Umgebung zur Validierung.         |
| Rollback   | Rückkehr zu einer bekannten sicheren Version.     |

## Theorie

Erzeuge ein Build-Artefakt einmal, teste es und fördere genau dieses Artefakt weiter. Der typische Weg lautet Review -> Staging -> Produktion. Jede Umgebung braucht Zweck, Verantwortlichkeit und Zugriffsregel.

```yaml
deploy_staging:
  stage: deploy
  environment:
    name: staging
  script:
    - ./scripts/deploy.sh staging

deploy_production:
  stage: deploy
  environment:
    name: production
  when: manual
  script:
    - ./scripts/deploy.sh production
```

Der Befehl ist projektspezifisch. Secrets gehören nicht in die Datei. Produktion braucht stärkere Grenzen als Staging: geschützte Umgebung, schmale Berechtigungen und bei passendem Risiko eine manuelle Freigabe.

Vor einer Förderung prüfst du Artefakt-ID, Pipeline, Änderungsumfang und Freigabe. Danach prüfst du etwa Health Endpoint, Fehlerrate und kritischen Nutzerfluss. Ein Rollback-Plan benennt letzte gute Version, Verantwortliche und Erfolgsnachweis.

## Best Practices

- Jede Umgebung erhält Zweck, Owner und Zugriffsregel.
- Fördere getestete Artifacts statt neu zu bauen.
- Plane Verifikation und Rollback vor dem Release.

## Häufige Fehler

| Fehler                                 | Besser                                           |
| -------------------------------------- | ------------------------------------------------ |
| Direkt aus ungeprüftem Branch deployen | Review und erfolgreiche Checks voraussetzen.     |
| Kein Rollback-Ziel kennen              | Vorher sichere Version und Ablauf dokumentieren. |

## Zusammenfassung

Umgebungen machen Ziele sichtbar. Kontrollierte Förderung, geschützte Produktion und geplanter Rollback verringern Auslieferungsrisiko.

### Verwandte Inhalte

- Übung: [GitLab-Umgebungen planen](../../exercises/de/26-gitlab-umgebungen-planen.md)
- Labor: [Kontrolliertes GitLab-Deployment planen](../../labs/de/26-kontrolliertes-gitlab-deployment-planen.md)
- Quiz: [Umgebungen und Deployments Quiz](../../quizzes/de/26-gitlab-umgebungen-und-deployments-quiz.md)
