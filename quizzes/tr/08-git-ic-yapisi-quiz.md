---
chapter: 08
title: "Git'in İç Yapısı Quiz'i"
related_notebook: "Git'in İç Yapısı"
related_exercise: "Git Nesnelerini İnceleme"
related_lab: "Git Deposu İçini Keşfetme"
level: Orta
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/08-git-ic-yapisi.md) | [Alıştırma](../../exercises/tr/08-git-nesnelerini-incele.md) | [Laboratuvar](../../labs/tr/08-git-depo-icini-kesfet.md) | [Yol Haritası](../../ROADMAP.md)

# Git'in İç Yapısı Quiz'i

1. Blob ne saklar?
2. Branch neyi gösterir?
3. Tree ne işe yarar?
4. Nesne türünü hangi komut gösterir?

**Cevaplar:** Blob dosya içeriğini saklar. Branch bir commiti gösterir. Tree klasör ve dosyaları nesnelere bağlar. `git cat-file -t` türü gösterir.

## Senaryo

Git eski bir commiti nasıl bulabilir?

**Cevap:** Nesneler ve referanslar geçmiş durumları ve aralarındaki ilişkileri sakladığı için.
