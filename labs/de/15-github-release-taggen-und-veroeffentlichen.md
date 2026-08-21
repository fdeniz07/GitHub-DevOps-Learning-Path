---
chapter: 15
title: "Ein GitHub Release taggen und veröffentlichen"
related_notebook: "GitHub Releases"
related_exercise: "Ein GitHub Release vorbereiten"
level: Einsteiger
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/15-github-releases.md) | [Übung](../../exercises/de/15-github-release-vorbereiten.md) | [Quiz](../../quizzes/de/15-github-releases-quiz.md) | [Roadmap](../../ROADMAP.md)

## Aufgaben

```bash
git status
git switch main
git pull origin main
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git push origin v1.0.0
```

Erstelle danach auf GitHub einen Draft Release, prüfe Tag, Notes und Assets und veröffentliche erst nach der Freigabe.
