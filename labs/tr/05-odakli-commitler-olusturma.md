---
chapter: 05
title: "Odaklı Commitler Oluşturma"
related_notebook: "Commitlerle Çalışma"
related_exercise: "Odaklı Commitler Oluşturma"
level: Başlangıç
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/05-commitlerle-calisma.md) | [Alıştırma](../../exercises/tr/05-odakli-commitler-olusturma.md) | [Quiz](../../quizzes/tr/05-commit-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Odaklı Commitler Oluşturma

## Amaç

Dosya değişikliğinden kontrollü commite kadar olan akışı uygulayın.

## Görevler

```bash
git status
git diff
git add README.md
git diff --staged
git commit -m "Improve project overview"
git log --oneline
```

Daha sonra bağımsız bir değişiklik yapıp ayrı bir commit oluşturun.

## Beklenen Sonuç

Geçmişteki iki commitin diff'i yalnızca tek bir konuyu gösterir.

## Sorun Giderme

| Sorun                     | Çözüm                                             |
| ------------------------- | ------------------------------------------------- |
| Yanlış dosya stage edildi | `git reset DOSYA` çalıştırıp tekrar kontrol edin. |
| Mesaj çok genel           | Değişikliği somut bir fiille açıklayın.           |
| Geçmiş anlaşılmıyor       | `git show` ve `git log --stat` kullanın.          |
