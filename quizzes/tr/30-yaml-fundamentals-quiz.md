---
chapter: 30
title: "YAML Temelleri Quiz'i"
related_notebook: "GitHub Actions için YAML Temelleri"
related_exercise: "GitHub Actions YAML'ını Uygula"
related_lab: "Geçerli Bir Actions Workflow'u Oluştur"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Notebook](../../notebooks/tr/30-yaml-fundamentals.md) | [Alıştırma](../../exercises/tr/30-practice-github-actions-yaml.md) | [Laboratuvar](../../labs/tr/30-build-a-valid-actions-workflow.md) | [Yol Haritası](../../ROADMAP.md)

## Amaç

YAML map'lerini, listelerini, girintiyi, ifadeleri ve yaygın hataları ne kadar anladığınızı kontrol edin.

## Sorular

### Soru 1

YAML'da girinti neyi ifade eder?

- A. Dosyanın yayımlanma tarihini
- B. Üst-alt yapısını
- C. Runner işletim sistemini
- D. Workflow secret değerini

**Cevap:** B. Üst-alt yapısı.

### Soru 2

Bir blok liste öğesini hangi söz dizimi başlatır?

- A. `:`
- B. `#`
- C. `-`
- D. `${{ }}`

**Cevap:** C. `-`

### Soru 3

Doğru mu, yanlış mı: YAML girintisinde tab karakterleri boşlukların güvenli bir alternatifidir.

**Cevap:** Yanlış.

### Soru 4

Hangisi bir GitHub Actions ifadesidir?

- A. `if: github.ref == main`
- B. `if: ${{ github.ref == 'refs/heads/main' }}`
- C. `if -> github.ref`
- D. `if: [github.ref]`

**Cevap:** B. `if: ${{ github.ref == 'refs/heads/main' }}`

### Soru 5

Bir liste öğesi yanlış anahtarın altında girintilendiğinde ne olabilir?

**Beklenen Cevap:** Ayrıştırıcı dosyayı reddedebilir veya öğeyi farklı bir üst öğeye aitmiş gibi yorumlayarak workflow davranışını değiştirebilir.

### Soru 6

### Uygulamalı Senaryo

`name: Build #1` metni neden değer olarak yalnızca `Build` ifadesini gösterir?

**Beklenen Cevap:** Tırnak içine alınmamış `#` bir yorum başlatır. Karakter değerin parçasıysa `name: "Build #1"` kullanın.

## Gözden Geçirme Kontrol Listesi

- [ ] Map'leri, listeleri ve scalar değerleri tanımlayabilirim.
- [ ] Girintiyi ve ifade sınırlarını açıklayabilirim.
- [ ] Workflow'u çalıştırmadan önce yaygın YAML hatalarını sayabilirim.

### İlgili İçerik

- Notebook: [GitHub Actions için YAML Temelleri](../../notebooks/tr/30-yaml-fundamentals.md)
- Alıştırma: [GitHub Actions YAML'ını Uygula](../../exercises/tr/30-practice-github-actions-yaml.md)
- Laboratuvar: [Geçerli Bir Actions Workflow'u Oluştur](../../labs/tr/30-build-a-valid-actions-workflow.md)
