---
chapter: 33
title: "Bir Marketplace Action'ını İnceleyin"
related_notebook: "GitHub Marketplace Action'ları"
level: Orta
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/32-github-runners.md) | [Not Defteri](../../notebooks/tr/33-github-marketplace-actions.md) | [Lab](../../labs/tr/33-harden-a-marketplace-action.md) | [Kısa Sınav](../../quizzes/tr/33-github-marketplace-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Bir Marketplace Action'ını İnceleyin

## Amaç

Bir action'ı iş akışına eklemeden önce kanıta dayalı bir supply-chain incelemesi yapın.

## Senaryo

Bir pull request, build metadata'sını yayımlamak için `@v4` kullanan bir Marketplace action'ı eklemeyi öneriyor.

## Görevler

1. Input'lar, output'lar, runtime ve gerekli izinler için action metadata'sını inceleyin.
2. Kaynağı, release'leri, maintainer'ları, bağımlılıkları ve network davranışını inceleyin.
3. Değiştirilebilir referansı doğrulanmış bir commit SHA ile değiştirin ve güncelleme sürecini belgeleyin.

## Beklenen Sonuç

Güveni, en az ayrıcalık ilkesini, sabitlemeyi ve test kanıtını açıklayan kısa bir inceleme kaydı hazırlarsınız.

## Öz Değerlendirme

- [ ] Input'ları kullanmadan önce action metadata'sını okudum.
- [ ] Bir commit SHA'nın yeniden üretilebilirliği neden artırdığını anlıyorum.
- [ ] Eksik supply-chain kanıtlarını belirleyebilirim.

### İlgili İçerik

- Not Defteri: [GitHub Marketplace Action'ları](../../notebooks/tr/33-github-marketplace-actions.md)
- Lab: [Bir Marketplace Action'ını Güçlendirme](../../labs/tr/33-harden-a-marketplace-action.md)
- Kısa Sınav: [GitHub Marketplace Action'ları Kısa Sınavı](../../quizzes/tr/33-github-marketplace-actions-quiz.md)
