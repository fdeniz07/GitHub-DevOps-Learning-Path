---
chapter: 08
title: "Git Nesnelerini İnceleme"
related_notebook: "Git'in İç Yapısı"
level: Orta
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/08-git-ic-yapisi.md) | [Laboratuvar](../../labs/tr/08-git-depo-icini-kesfet.md) | [Quiz](../../quizzes/tr/08-git-ic-yapisi-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git Nesnelerini İnceleme

## Amaç

Bir commit'i, tree yapısını ve ilişkili dosyaları plumbing komutlarıyla inceleyin.

## Görevler

1. Bir commit oluşturun.
2. `git rev-parse HEAD` çalıştırın.
3. `git cat-file -t HEAD` ile türü kontrol edin.
4. `git cat-file -p HEAD` ile içeriği okuyun.
5. `git ls-tree HEAD` ile treeyi gösterin.

## Beklenen Sonuç

Commitin tree ve blob nesnelerine nasıl referans verdiğini açıklayabilirsiniz.

## Öz Kontrol

- [ ] Ref ile nesne arasındaki farkı biliyorum.
- [ ] `.git` dosyalarını elle değiştirmiyorum.
- [ ] Bir commitin tree yapısını gösterebiliyorum.
