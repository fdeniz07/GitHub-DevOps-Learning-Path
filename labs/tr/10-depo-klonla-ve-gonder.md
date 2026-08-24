---
chapter: 10
title: "Depoyu Klonlama ve Gönderme"
related_notebook: "GitHub Temelleri"
related_exercise: "GitHub Deposunu Keşfetme"
level: Başlangıç
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/10-github-temelleri.md) | [Alıştırma](../../exercises/tr/10-github-deposunu-kesfet.md) | [Quiz](../../quizzes/tr/10-github-temelleri-quiz.md) | [Yol Haritası](../../ROADMAP.md)

```bash
git clone https://github.com/example/project.git
cd project
git switch -c docs/add-note
echo "# Note" > NOTE.md
git add NOTE.md
git commit -m "Add note"
git push -u origin docs/add-note
```

Push öncesinde remote, branch ve status çıktısını kontrol edin. GitHub üzerinde branchi açıp sonraki review adımını açıklayın.
