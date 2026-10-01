---
chapter: 34
title: "Özel Bir GitHub Action'ı Tasarlayın"
related_notebook: "Özel GitHub Actions Yazma"
level: Orta
estimated_time: 40 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/33-github-marketplace-actions.md) | [Not Defteri](../../notebooks/tr/34-writing-custom-github-actions.md) | [Lab](../../labs/tr/34-build-and-test-a-custom-action.md) | [Kısa Sınav](../../quizzes/tr/34-writing-custom-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Özel Bir GitHub Action'ı Tasarlayın

## Amaç

Bir action türü seçin ve kararlı, test edilebilir bir public contract tanımlayın.

## Senaryo

Üç repository aynı metadata hesaplamasını tekrarlıyor. Maintainer'lar, job izinlerini gizlemeden veya gereksiz altyapı oluşturmadan yeniden kullanılabilir bir bileşen istiyor.

## Görevler

1. Composite, JavaScript, Docker action veya reusable workflow arasından seçim yapın.
2. Doğrulama kurallarıyla birlikte `action.yml` input ve output'larını taslak hâline getirin.
3. Geçerli input, geçersiz input, output değerleri ve çağıran bir workflow için testler tanımlayın.
4. `v1` ve breaking change'ler için bir versioning policy önerin.

## Beklenen Sonuç

Seçimi, contract'ı, testleri ve release politikasını açıklayan küçük bir tasarım teslim edersiniz.

## Öz Değerlendirme

- [ ] Özel bir action'ın ne zaman gerekli olduğunu açıklayabilirim.
- [ ] Bir action'ı reusable workflow'dan ayırt edebilirim.
- [ ] Public interface'in nasıl test edileceğini açıklayabilirim.

### İlgili İçerik

- Not Defteri: [Özel GitHub Actions Yazma](../../notebooks/tr/34-writing-custom-github-actions.md)
- Lab: [Özel Bir Action Oluşturma ve Test Etme](../../labs/tr/34-build-and-test-a-custom-action.md)
- Kısa Sınav: [Özel GitHub Actions Yazma Kısa Sınavı](../../quizzes/tr/34-writing-custom-github-actions-quiz.md)
