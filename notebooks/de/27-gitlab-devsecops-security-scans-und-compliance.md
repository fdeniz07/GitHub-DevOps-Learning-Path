---
chapter: 27
title: "DevSecOps, Security Scans und Compliance"
part: "GitLab DevOps"
level: Einsteiger
estimated_time: 100 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Kapitel 26](26-gitlab-umgebungen-und-deployments.md) | [Übung](../../exercises/de/27-gitlab-sicherheitsfund-triagieren.md) | [Labor](../../labs/de/27-devsecops-review-ablauf-entwerfen.md) | [Quiz](../../quizzes/de/27-gitlab-devsecops-security-scans-und-compliance-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- DevSecOps als gemeinsame kontinuierliche Sicherheitsarbeit erklären;
- Scan-Kategorien unterscheiden und Funde verantwortungsvoll einordnen;
- Risiken mit Evidenz, Owner und dokumentierten Ausnahmen bearbeiten.

## Einführung

DevSecOps integriert Sicherheit in Planung, Review, CI/CD, Deployment und Betrieb. Automatisierte Scans erzeugen Hinweise; Menschen bewerten Kontext, beheben Risiken und dokumentieren Entscheidungen nachvollziehbar.

## Begriffe

| Begriff             | Bedeutung                                                    |
| ------------------- | ------------------------------------------------------------ |
| SAST                | Statische Analyse von Quellcode auf mögliche Schwachstellen. |
| Dependency Scanning | Prüfung externer Abhängigkeiten auf bekannte Schwachstellen. |
| Secret Detection    | Suche nach zugangsdatenähnlichen Werten im Repository.       |
| Container Scanning  | Prüfung von Image und Paketen auf bekannte Risiken.          |
| Triage              | Bewertung von Gültigkeit, Auswirkung, Priorität und Owner.   |

## Theorie

Scans können potenzielle Codeprobleme, verwundbare Abhängigkeiten, Secrets oder Containerpakete finden. Ein Fund ist ein Signal, kein automatisches Urteil. Frage: Ist er gültig, erreichbar, exponiert, schwerwiegend und zugeordnet?

Bei einem Secret zuerst widerrufen oder rotieren, dann bereinigen und Incident-Prozess befolgen. Bei Abhängigkeiten Version, Nutzung und Exposition prüfen, auf getestete gepatchte Version aktualisieren und Ergebnis dokumentieren. Unsichere Funde brauchen Evidenz und Owner. Ausnahmen benötigen Grund, gegebenenfalls Freigabe sowie Ablauf- oder Prüftermin.

Compliance ist kein einzelner grüner Job. Anforderungen können geschützte Branches, Reviews, Scanresultate, Artifact-Aufbewahrung, Zugriffsprüfung und Deployment-Freigaben umfassen. Issues, Merge Requests, Pipelines und Umgebungen bewahren Belege, ersetzen aber nicht die Prüfung der tatsächlichen Vorgaben.

## Triage-Checkliste

1. Fund und Evidenz lesen, ohne geheime Werte zu kopieren.
2. Komponente, Version, Branch oder Image bestätigen.
3. Gültigkeit, Auswirkung, Erreichbarkeit und Dringlichkeit bewerten.
4. Beheben und verifizieren oder zeitlich begrenzte Ausnahme dokumentieren.
5. Issue, Merge Request, Pipeline und Entscheidung verknüpfen.

## Best Practices

- Relevante Checks früh und konsistent ausführen.
- Jeden Fund einem Owner und einer nächsten Aktion zuordnen.
- Akzeptierte Risiken regelmäßig erneut prüfen.
- Audit-Belege über den gesamten Workflow bewahren.

## Zusammenfassung

DevSecOps macht Sicherheit kontinuierlich und gemeinsam. Scans liefern Signale, Triage schafft begründete Entscheidungen und nachvollziehbare Belege unterstützen Compliance.

### Verwandte Inhalte

- Übung: [GitLab-Sicherheitsfund triagieren](../../exercises/de/27-gitlab-sicherheitsfund-triagieren.md)
- Labor: [DevSecOps-Review-Ablauf entwerfen](../../labs/de/27-devsecops-review-ablauf-entwerfen.md)
- Quiz: [DevSecOps, Security Scans und Compliance Quiz](../../quizzes/de/27-gitlab-devsecops-security-scans-und-compliance-quiz.md)
