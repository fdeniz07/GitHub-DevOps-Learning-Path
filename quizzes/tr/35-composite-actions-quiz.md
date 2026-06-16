---
chapter: 35
title: "Composite Action'lar Quiz'i"
related_notebook: "GitHub Actions Composite Action'ları"
related_exercise: "Yeniden Kullanılabilir Bir Composite Action Oluştur"
related_lab: "Bir Composite Action'ı Paketle"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Notebook](../../notebooks/tr/35-composite-actions.md) | [Alıştırma](../../exercises/tr/35-build-a-reusable-composite-action.md) | [Laboratuvar](../../labs/tr/35-package-a-composite-action.md) | [Yol Haritası](../../ROADMAP.md)

# Composite Action'lar Quiz'i

## Öğrenme Hedefleri

- bir composite action'ın yapısını ve sözleşmesini tanımak;
- input'ları output'lardan ayırmak;
- güvenli action sınırlarını belirlemek.

## Sorular

### Soru 1

Hangi `runs.using` değeri bir composite action'ı tanımlar?

- A. `node20`
- B. `docker`
- C. `composite`
- D. `workflow`

**Cevap:** C. `composite`

### Soru 2

Bir action output'u tüketilirken çağıran step neden bir `id` gerektirir?

**Beklenen Cevap:** `id`, sonraki ifadeler için `steps.check.outputs.result` gibi sabit bir yol sağlar.

### Soru 3

Doğru mu, yanlış mı: Bir composite action secret'ları çağıranından otomatik olarak yalıtır.

**Cevap:** Yanlış. Çağıranın bağlamında çalışır ve en az ayrıcalıkla tasarlanmalıdır.

### Soru 4

Bir composite action bir step output'unu nereye yazmalıdır?

**Beklenen Cevap:** `name=value` ifadesini `GITHUB_OUTPUT` tarafından referans verilen dosyaya eklemelidir.

### Soru 5

Bir input'u doğrudan shell komutuna yerleştirmekten daha güvenli olan nedir?

**Beklenen Cevap:** Input'u bir environment variable üzerinden geçirmek ve shell içinde tırnak içine almak.

## Uygulamalı Senaryo

Yerel bir action, kullanıcı tarafından sağlanan branch adını doğrudan bir shell komutunun içinde yazdırıyor. Riski belirleyin ve bir düzeltme önerin.

**Beklenen Cevap:** Doğrudan yerleştirme shell söz dizimini değiştirebilir. Değeri `env` üzerinden geçirin, tırnak içine alın ve uygun olduğunda doğrulayın.

## Gözden Geçirme Kontrol Listesi

- [ ] `action.yml` dosyasını açıklayabilirim.
- [ ] Bir output'u eşleştirebilirim.
- [ ] Yeniden kullanımın yalıtım olmadığını anlıyorum.

### İlgili İçerik

- Notebook: [GitHub Actions Composite Action'ları](../../notebooks/tr/35-composite-actions.md)
- Alıştırma: [Yeniden Kullanılabilir Bir Composite Action Oluştur](../../exercises/tr/35-build-a-reusable-composite-action.md)
- Laboratuvar: [Bir Composite Action'ı Paketle](../../labs/tr/35-package-a-composite-action.md)
