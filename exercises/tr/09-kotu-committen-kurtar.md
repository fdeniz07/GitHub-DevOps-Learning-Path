---
chapter: 09
title: "Kötü Committen Kurtulma"
related_notebook: "İleri Git Teknikleri"
level: Orta
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/09-ileri-git-teknikleri.md) | [Laboratuvar](../../labs/tr/09-git-ile-kurtarma-ve-hata-ayiklama.md) | [Quiz](../../quizzes/tr/09-ileri-git-teknikleri-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Kötü Committen Kurtulma

## Amaç

Farklı hata türleri için doğru Git kurtarma tekniğini seçin.

## Görevler

1. Stage edilmemiş yanlış değişikliği `git restore` ile geri alın.
2. Yerel yanlış commit için `git reset`i inceleyin.
3. Paylaşılmış yanlış commit için `git revert` kullanın.
4. Tamamlanmamış işi `git stash` ile park edin.
5. Eski konumu `git reflog` ile bulun.

## Beklenen Sonuç

Kararı, geçmişin paylaşılmış olup olmadığına ve hedeflenen sonuca göre verebilirsiniz.

## Öz Kontrol

- [ ] Yıkıcı komuttan önce status çalıştırıyorum.
- [ ] Paylaşılmış geçmişte `revert` kullanıyorum.
- [ ] Stash'in geçici amacını biliyorum.
