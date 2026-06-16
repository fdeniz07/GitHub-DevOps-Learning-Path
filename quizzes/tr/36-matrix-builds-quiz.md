---
chapter: 36
title: "Matrix Build'leri Quiz'i"
related_notebook: "GitHub Actions Matrix Build'leri"
related_exercise: "Bir Matrix Workflow'unu Test Et"
related_lab: "Çok Platformlu Bir Matrix Çalıştır"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/35-composite-actions.md) | [Notebook](../../notebooks/tr/36-github-actions-matrix-builds.md) | [Alıştırma](../../exercises/tr/36-test-a-matrix-workflow.md) | [Laboratuvar](../../labs/tr/36-run-a-multi-platform-matrix.md) | [Yol Haritası](../../ROADMAP.md)

# Matrix Build'leri Quiz'i

## Öğrenme Hedefleri

- matrix kombinasyonlarını hesaplamak;
- inclusion ve exclusion'ı doğru kullanmak;
- hata davranışını bilinçli olarak seçmek.

## Sorular

### Soru 1

Bir matrix üç işletim sistemine ve iki runtime sürümüne sahip. Exclusion uygulanmadan önce kaç kombinasyon vardır?

- A. 3
- B. 5
- C. 6
- D. 9

**Cevap:** C. 6

### Soru 2

`os` adlı bir matrix değerini hangi ifade okur?

- A. `${{ job.os }}`
- B. `${{ matrix.os }}`
- C. `${{ include.os }}`
- D. `${{ strategy.os }}`

**Cevap:** B. `${{ matrix.os }}`

### Soru 3

Doğru mu, yanlış mı: `exclude`, desteklenmeyen kombinasyonları oluşturulan matrix'ten çıkarır.

**Cevap:** Doğru.

### Soru 4

`fail-fast: false` ne zaman yararlıdır?

**Beklenen Cevap:** Bir kombinasyon başarısız olduktan sonra bile tüm platformların veya sürümlerin sonuçları tanı koymak için değerli olduğunda.

### Soru 5

`include` ne amaçla kullanılır?

**Beklenen Cevap:** Kombinasyonlara metadata ekler veya açıkça belirtilen özel bir kombinasyon ekler.

## Uygulamalı Senaryo

Bir matrix desteklenmeyen bir Windows/runtime çiftine sahip. Ne yapmalısınız ve çalıştırmadan sonra neyi gözden geçirmelisiniz?

**Beklenen Cevap:** Çifti dışlayın; ardından desteklenen her kombinasyonun çalıştığını doğrulamak için genişletilmiş job'ları ve log'ları gözden geçirin.

## Gözden Geçirme Kontrol Listesi

- [ ] Kartezyen çarpımı hesaplayabilirim.
- [ ] `include` ve `exclude` kullanım zamanını biliyorum.
- [ ] `fail-fast` seçimini gerekçelendirebilirim.

### İlgili İçerik

- Önceki bölüm: [Composite Action'lar](../../notebooks/tr/35-composite-actions.md)
- Notebook: [GitHub Actions Matrix Build'leri](../../notebooks/tr/36-github-actions-matrix-builds.md)
- Alıştırma: [Bir Matrix Workflow'unu Test Et](../../exercises/tr/36-test-a-matrix-workflow.md)
- Laboratuvar: [Çok Platformlu Bir Matrix Çalıştır](../../labs/tr/36-run-a-multi-platform-matrix.md)
