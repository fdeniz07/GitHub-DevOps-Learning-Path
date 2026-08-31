---
chapter: 27
title: "GitLab-Sicherheitsfund triagieren"
related_notebook: "DevSecOps, Security Scans und Compliance"
level: Einsteiger
estimated_time: 30 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/27-gitlab-devsecops-security-scans-und-compliance.md) | [Labor](../../labs/de/27-devsecops-review-ablauf-entwerfen.md) | [Quiz](../../quizzes/de/27-gitlab-devsecops-security-scans-und-compliance-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Sicherheitsfund triagieren

## Ziel

Treffe für einen Dependency-Scan-Fund eine evidenzbasierte, dokumentierte Entscheidung.

## Szenario

`example-lib` 2.3.1 hat eine bekannte Schwachstelle. Das Paket wird nur für einen optionalen lokalen Entwicklungsbefehl benutzt; eine gepatchte Version ist verfügbar.

## Aufgaben

1. Notiere Version, Nutzung, Severity-Quelle, Owner und Termin.
2. Bestimme Evidenz für Erreichbarkeit und Auswirkung.
3. Plane Update, Test, Merge Request und Verifikation; eine Ausnahme braucht Grund und Ablaufdatum.

**Erwartetes Ergebnis:** Der Fund wird nachvollziehbar behoben oder begründet befristet behandelt.

### Verwandte Inhalte

- Notebook: [DevSecOps, Security Scans und Compliance](../../notebooks/de/27-gitlab-devsecops-security-scans-und-compliance.md)
- Labor: [DevSecOps-Review-Ablauf entwerfen](../../labs/de/27-devsecops-review-ablauf-entwerfen.md)
- Quiz: [DevSecOps, Security Scans und Compliance Quiz](../../quizzes/de/27-gitlab-devsecops-security-scans-und-compliance-quiz.md)
