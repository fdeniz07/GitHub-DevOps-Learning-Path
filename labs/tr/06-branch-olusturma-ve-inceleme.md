---
chapter: 06
title: "Branch Oluşturma ve İnceleme"
related_notebook: "Dallanma Stratejileri"
related_exercise: "Feature Branch Oluşturma"
level: Başlangıç
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/06-dallanma-stratejileri.md) | [Alıştırma](../../exercises/tr/06-feature-branch-olusturma.md) | [Quiz](../../quizzes/tr/06-dallanma-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Branch Oluşturma ve İnceleme

## Amaç

Bir değişikliği feature branchte geliştirip kontrollü biçimde birleştirin.

## Görevler

```bash
git switch main
git switch -c feature/add-status-note
git branch --show-current
echo "Status" > STATUS.md
git add STATUS.md
git commit -m "Add status note"
git switch main
git merge feature/add-status-note
git branch -d feature/add-status-note
```

Her önemli adımdan sonra status çıktısını inceleyin.

## Beklenen Sonuç

Değişiklik izole olarak geliştirilir, merge edilir ve tamamlanan branch silinir.

## Sorun Giderme

| Sorun                | Çözüm                                         |
| -------------------- | --------------------------------------------- |
| Yanlış branchtesiniz | `git branch --show-current` ile kontrol edin. |
| Branch silinemiyor   | Commitlerin merge edildiğini doğrulayın.      |
| Geçmiş anlaşılmıyor  | `git log --graph --oneline --all` kullanın.   |
