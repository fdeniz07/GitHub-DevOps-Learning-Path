---
chapter: 29
title: "Workflow Anatomisi Quiz'i"
related_notebook: "GitHub Actions Workflow Anatomisi"
related_exercise: "Bir GitHub Actions Workflow'unu İzle"
related_lab: "Workflow Çalıştırmasını Gözden Geçir"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Notebook](../../notebooks/tr/29-github-actions-workflow-anatomy.md) | [Alıştırma](../../exercises/tr/29-trace-a-github-actions-workflow.md) | [Laboratuvar](../../labs/tr/29-review-workflow-execution.md) | [Yol Haritası](../../ROADMAP.md)

## Amaç

Bir workflow'u tetikleyicisinden job'larına ve step'lerine kadar okuyup okuyamadığınızı kontrol edin.

## Sorular

### Soru 1

Bir workflow'daki iş birimlerini hangi anahtar içerir?

- A. `steps`
- B. `jobs`
- C. `runs-on`
- D. `permissions`

**Cevap:** B. `jobs`

### Soru 2

`needs: inspect` neyi ifade eder?

- A. Aynı job içindeki `inspect` adlı bir step'i
- B. `inspect` job'una olan bağımlılığı
- C. Bir runner etiketini
- D. Bir tetikleyici filtresini

**Cevap:** B. `inspect` job'una olan bağımlılığı.

### Soru 3

Doğru mu, yanlış mı: Bir job içindeki step'ler normalde sırayla çalışır.

**Cevap:** Doğru.

### Soru 4

Doğru mu, yanlış mı: Bir job'da gerçekleştirilen checkout işlemi, dosyaları otomatik olarak diğer tüm job'larda kullanılabilir hale getirir.

**Cevap:** Yanlış. Job'lar normalde ayrı runner'lar kullanır.

### Soru 5

Tetikleyici filtreleri neden önemlidir?

**Beklenen Cevap:** Hangi depo değişikliklerinin veya olayların otomasyonu başlatacağını tanımlar; gürültüyü azaltırken bilinçli bir doğrulama sınırı belirler.

### Soru 6

### Uygulamalı Senaryo

`report` job'u `inspect` tamamlanmadan başlıyor. Neye bakmalısınız?

**Beklenen Cevap:** `report` job'unun `needs: inspect` tanımlayıp tanımlamadığını kontrol edin; bağımlılık olmadığında bağımsız job'lar paralel çalışabilir.

## Gözden Geçirme Kontrol Listesi

- [ ] Üst düzey workflow anahtarlarını tanımlayabilirim.
- [ ] Job bağımlılıklarını ve yalıtımını anlıyorum.
- [ ] Bir çalıştırmayı event'ten step'e kadar izleyebilirim.

### İlgili İçerik

- Notebook: [GitHub Actions Workflow Anatomisi](../../notebooks/tr/29-github-actions-workflow-anatomy.md)
- Alıştırma: [Bir GitHub Actions Workflow'unu İzle](../../exercises/tr/29-trace-a-github-actions-workflow.md)
- Laboratuvar: [Workflow Çalıştırmasını Gözden Geçir](../../labs/tr/29-review-workflow-execution.md)
