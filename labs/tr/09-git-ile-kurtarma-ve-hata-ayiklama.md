---
chapter: 09
title: "Git ile Kurtarma ve Hata Ayıklama"
related_notebook: "İleri Git Teknikleri"
related_exercise: "Kötü Committen Kurtulma"
level: Orta
estimated_time: 40 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/09-ileri-git-teknikleri.md) | [Alıştırma](../../exercises/tr/09-kotu-committen-kurtar.md) | [Quiz](../../quizzes/tr/09-ileri-git-teknikleri-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git ile Kurtarma ve Hata Ayıklama

## Amaç

`restore`, `reset`, `revert`, `stash`, `reflog` ve `cherry-pick` komutlarını izole depoda uygulayın.

## Görevler

1. Birkaç küçük commit oluşturun.
2. `git stash` ile çalışmaya ara verin.
3. Yerel değişikliği geri alın.
4. `git revert` ile ters commit oluşturun.
5. `git reflog` ile commit kimliği bulun.
6. Seçilen commiti `git cherry-pick` ile taşıyın.

## Kontrol Listesi

- [ ] Her işlemden önce `git status` kontrol edildi.
- [ ] Paylaşılmış geçmiş yeniden yazılmadı.
- [ ] Kurtarma sonrası diff ve log incelendi.
