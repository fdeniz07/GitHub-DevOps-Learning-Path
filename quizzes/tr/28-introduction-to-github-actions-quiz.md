---
chapter: 28
title: "GitHub Actions'a Giriş Quiz'i"
related_notebook: "GitHub Actions'a Giriş"
related_exercise: "İlk GitHub Actions Workflow'unu Oluştur"
related_lab: "Bir GitHub Actions Workflow'u Çalıştır"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Notebook](../../notebooks/tr/28-introduction-to-github-actions.md) | [Alıştırma](../../exercises/tr/28-create-your-first-github-actions-workflow.md) | [Laboratuvar](../../labs/tr/28-run-a-github-actions-workflow.md) | [Yol Haritası](../../ROADMAP.md)

## Amaç

GitHub Actions'ın amacı, olayları, workflow konumunu ve izinleri ne kadar anladığınızı kontrol edin.

## Sorular

### Soru 1

Bir depo workflow dosyası nerede saklanmalıdır?

- A. `.github/workflows`
- B. `.github/actions`
- C. `workflows/.github`
- D. `actions`

**Cevap:** A. `.github/workflows`

### Soru 2

Event nedir?

- A. Bir job'u çalıştıran makine
- B. Bir workflow'u başlatan şey
- C. Bir step içindeki komut
- D. Bir izin verme işlemi

**Cevap:** B. Bir workflow'u başlatan şey.

### Soru 3

Doğru mu, yanlış mı: `workflow_dispatch` bir workflow'u başlatmak için manuel bir yol sağlayabilir.

**Cevap:** Doğru.

### Soru 4

Yalnızca test yapan bir workflow neden genellikle en az izinleri tanımlamalıdır?

**Beklenen Cevap:** En az izinler, hatalı veya güvenliği ihlal edilmiş bir step'in erişebileceği alanı azaltır.

### Soru 5

`run` ile `uses` arasındaki fark nedir?

**Beklenen Cevap:** `run` bir shell komutu çalıştırır; `uses` yeniden kullanılabilir bir action çağırır.

### Soru 6

### Uygulamalı Senaryo

Deponun kökünde bir workflow var, ancak Actions arayüzünde görünmüyor. İlk olarak neyi kontrol etmelisiniz?

**Beklenen Cevap:** Dosyanın `.github/workflows` altında commit edildiğini ve `.yml` veya `.yaml` uzantısına sahip olduğunu kontrol edin.

## Gözden Geçirme Kontrol Listesi

- [ ] Event'leri ve workflow'ları açıklayabilirim.
- [ ] Gerekli workflow dizinini biliyorum.
- [ ] İzinlerin neden en az düzeyde olması gerektiğini anlıyorum.

### İlgili İçerik

- Notebook: [GitHub Actions'a Giriş](../../notebooks/tr/28-introduction-to-github-actions.md)
- Alıştırma: [İlk GitHub Actions Workflow'unu Oluştur](../../exercises/tr/28-create-your-first-github-actions-workflow.md)
- Laboratuvar: [Bir GitHub Actions Workflow'u Çalıştır](../../labs/tr/28-run-a-github-actions-workflow.md)
