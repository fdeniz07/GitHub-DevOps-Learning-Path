---
chapter: 15
title: "Tag ile Sürüm Yayınlama"
related_notebook: "GitHub Sürümleri"
related_exercise: "GitHub Sürümü Hazırlama"
level: Başlangıç
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/15-github-surumleri.md) | [Alıştırma](../../exercises/tr/15-github-surumu-hazirla.md) | [Quiz](../../quizzes/tr/15-github-surumleri-quiz.md) | [Yol Haritası](../../ROADMAP.md)

```bash
git status
git switch main
git pull origin main
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git push origin v1.0.0
```

GitHub'da draft release oluşturun; tag, notes ve assetleri kontrol edip onaydan sonra yayınlayın.
