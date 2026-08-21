---
chapter: 10
title: "Repository klonen und pushen"
related_notebook: "GitHub-Grundlagen"
related_exercise: "Ein GitHub-Repository erkunden"
level: Einsteiger
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/10-github-grundlagen.md) | [Übung](../../exercises/de/10-github-repository-erkunden.md) | [Quiz](../../quizzes/de/10-github-grundlagen-quiz.md) | [Roadmap](../../ROADMAP.md)

# Repository klonen und pushen

```bash
git clone https://github.com/example/project.git
cd project
git switch -c docs/add-note
echo "# Note" > NOTE.md
git add NOTE.md
git commit -m "Add note"
git push -u origin docs/add-note
```

Prüfe vor dem Push Remote, Branch und Status. Öffne anschließend den Branch auf GitHub und beschreibe den nächsten Review-Schritt.
