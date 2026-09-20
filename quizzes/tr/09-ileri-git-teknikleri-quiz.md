---
chapter: 09
title: "İleri Git Teknikleri Quiz'i"
related_notebook: "İleri Git Teknikleri"
related_exercise: "Kötü Committen Kurtulma"
related_lab: "Git ile Kurtarma ve Hata Ayıklama"
level: Orta
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/09-ileri-git-teknikleri.md) | [Alıştırma](../../exercises/tr/09-kotu-committen-kurtar.md) | [Laboratuvar](../../labs/tr/09-git-ile-kurtarma-ve-hata-ayiklama.md) | [Yol Haritası](../../ROADMAP.md)

# İleri Git Teknikleri Quiz'i

1. `revert` ne zaman `reset`ten daha uygundur?
2. `stash` ne için kullanılır?
3. Reflog neyi gösterir?
4. `cherry-pick` ne yapar?

**Cevaplar:** Paylaşılmış geçmişte `revert` kullanılır. `stash` tamamlanmamış işi geçici saklar. Reflog yerel ref hareketlerini gösterir. `cherry-pick` tek bir commiti mevcut branche taşır.

## Senaryo

Yanlış commit zaten paylaşılmış. Hangi araç daha güvenlidir?

**Cevap:** `git revert`; çünkü geçmişi yeniden yazmadan ters yönde yeni commit oluşturur.
