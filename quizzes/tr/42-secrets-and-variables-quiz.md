---
chapter: 42
title: "Gizli Bilgiler ve Değişkenler Quiz'i"
related_notebook: "Gizli Bilgiler ve Değişkenler"
related_exercise: "Gizli Bilgileri ve Değişkenleri Yönetme"
related_lab: "Gizli Bilgileri Döndürme ve Değişkenleri İnceleme"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/42-secrets-and-variables.md) | [Alıştırma](../../exercises/tr/42-manage-secrets-and-variables.md) | [Lab](../../labs/tr/42-rotate-secrets-and-review-variables.md) | [Yol Haritası](../../ROADMAP.md)

# Gizli Bilgiler ve Değişkenler Quiz'i

## Öğrenme Hedefleri

- `secrets` ve `vars` değerlerini ayırt etmek.
- Kimlik bilgisi açığa çıkma yollarını belirlemek.
- Döndürmeyi ve ortam kapsamını açıklamak.

## Sorular

### Soru 1

Bulut erişim belirteci hangi bağlamda tutulmalıdır?

- A. `${{ vars.CLOUD_TOKEN }}`
- B. `${{ secrets.CLOUD_TOKEN }}`
- C. Kaydedilmiş YAML sabiti
- D. Gerçek değeri içeren README örneği

**Yanıt:** B.

### Soru 2

Doğru mu yanlış mı: GitHub Actions değişkeni otomatik olarak gizlidir.

**Yanıt:** Yanlış. Değişkenler sıradan yapılandırmadır ve gizli bilgi sayılmamalıdır.

### Soru 3

Kimlik bilgileri çevresinde `set -x` neden tehlikelidir?

**Beklenen Yanıt:** Kabuk izleme, komutları ve genişletilmiş değerleri iş akışı günlüklerine yazdırabilir.

### Soru 4

Kimlik bilgisi döndürmede iki işlem belirtin.

**Beklenen Yanıt:** Yeni kimlik bilgisi oluşturmak, gizli bilgiyi güncellemek, test etmek, eskisini iptal etmek ve değişikliği kaydetmek.

### Soru 5 — Uygulamalı Senaryo

Bir dağıtım belirteci iş akışı günlüğünde görünüyor. Ekip önce ne yapmalı?

**Beklenen Yanıt:** Açığa çıkan belirteci hemen iptal etmeli veya döndürmeli, günlükleme yolunu kaldırmalı, kullanımı incelemeli ve denetim kanıtını gözden geçirmelidir.

## İnceleme Kontrol Listesi

- [ ] Hassas yapılandırmayı sınıflandırabiliyorum.
- [ ] Değişkenlerin otomatik olarak gizli olmadığını biliyorum.
- [ ] Günlük açığa çıkmasını belirleyebiliyorum.
- [ ] Ortam kapsamlı döndürmeyi açıklayabiliyorum.

## İlgili Bağlantılar

- Notebook: [Gizli Bilgiler ve Değişkenler](../../notebooks/tr/42-secrets-and-variables.md)
- Alıştırma: [Gizli Bilgileri ve Değişkenleri Yönetme](../../exercises/tr/42-manage-secrets-and-variables.md)
- Lab: [Gizli Bilgileri Döndürme ve Değişkenleri İnceleme](../../labs/tr/42-rotate-secrets-and-review-variables.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
