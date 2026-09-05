---
chapter: 26
title: "Kontrolliertes GitLab-Deployment planen"
related_notebook: "Umgebungen und Deployments"
related_exercise: "GitLab-Umgebungen planen"
level: Einsteiger
estimated_time: 50 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/26-gitlab-umgebungen-und-deployments.md) | [Übung](../../exercises/de/26-gitlab-umgebungen-planen.md) | [Quiz](../../quizzes/de/26-gitlab-umgebungen-und-deployments-quiz.md) | [Roadmap](../../ROADMAP.md)

# Kontrolliertes GitLab-Deployment planen

## Ziel

Entwirf einen sicheren Staging-zu-Produktion-Ablauf ohne echte Zugangsdaten oder Live-Deployment.

## Aufgaben

1. Ergänze Trainingsjobs für `staging` und manuelles `production` mit Umgebungsnamen.
2. Erstelle Checkliste: Artifact-ID, erfolgreiche Pipeline, Freigabe, Smoke Test, Monitoring-Owner.
3. Schreibe Rollback mit letzter guter Version und Bestätigung.

## Prüfliste

- [ ] Produktion ist bewusster geschützter Entscheidungspunkt.
- [ ] Keine Secrets stehen in YAML.
- [ ] Dasselbe Artifact wird gefördert.
- [ ] Rollback ist vorab dokumentiert.

### Verwandte Inhalte

- Notebook: [Umgebungen und Deployments](../../notebooks/de/26-gitlab-umgebungen-und-deployments.md)
- Übung: [GitLab-Umgebungen planen](../../exercises/de/26-gitlab-umgebungen-planen.md)
- Quiz: [Umgebungen und Deployments Quiz](../../quizzes/de/26-gitlab-umgebungen-und-deployments-quiz.md)
