---
chapter: 08
title: "Git Deposu İçini Keşfetme"
related_notebook: "Git'in İç Yapısı"
related_exercise: "Git Nesnelerini İnceleme"
level: Orta
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/08-git-ic-yapisi.md) | [Alıştırma](../../exercises/tr/08-git-nesnelerini-incele.md) | [Quiz](../../quizzes/tr/08-git-ic-yapisi-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git Deposu İçini Keşfetme

## Amaç

Güvenli bir deneme deposunun iç yapısını inceleyin.

## Görevler

```bash
git init
echo "# Demo" > README.md
git add README.md
git commit -m "Add demo README"
git rev-parse --show-toplevel
git cat-file -p HEAD
git ls-tree HEAD
git ls-files --stage
```

Çalışma ağacı, index, commit ve tree bilgilerinin nasıl ayrıldığını açıklayın.

## Beklenen Sonuç

Görünür proje dosyalarını Git nesneleriyle ilişkilendirebilirsiniz.

## Güvenlik Notu

`.git` klasörünü yalnızca inceleyin; içindeki dosyaları elle değiştirmeyin.
