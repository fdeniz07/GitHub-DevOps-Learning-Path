---
chapter: 07
title: "Merge ve Çatışmalar Quiz'i"
related_notebook: "Merge ve Merge Çatışmaları"
related_exercise: "Merge Çatışmasını Çözme"
related_lab: "Merge Çatışmasını Çözme"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/07-merge-ve-merge-catismalari.md) | [Alıştırma](../../exercises/tr/07-merge-catismasini-cozme.md) | [Laboratuvar](../../labs/tr/07-merge-catismasini-cozme.md) | [Yol Haritası](../../ROADMAP.md)

# Merge ve Çatışmalar Quiz'i

## Sorular

1. Merge neyi birleştirir?
2. Çatışma ne zaman oluşur?
3. Hangi işaretler committen önce kaldırılmalıdır?
4. Belirsiz merge nasıl iptal edilir?

## Cevaplar

1. İki branchin geçmişini.
2. Git rakip değişiklik arasında otomatik karar veremediğinde.
3. `<<<<<<<`, `=======` ve `>>>>>>>`.
4. `git merge --abort` ile.

## Senaryo

Çözümden sonra status hâlâ çözülmemiş dosya gösteriyor. Ne eksik?

**Cevap:** Dosya kontrol edilip `git add` ile çözülmüş olarak stage edilmeli ve merge commitlenmelidir.
