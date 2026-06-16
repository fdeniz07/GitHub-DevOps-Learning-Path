---
chapter: 37
title: "Dependency Cache'leme Quiz'i"
related_notebook: "GitHub Actions Dependency Cache'leme"
related_exercise: "Güvenli Bir Dependency Cache Tasarla"
related_lab: "Güvenli Bir Cache Stratejisini Optimize Et"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/36-github-actions-matrix-builds.md) | [Notebook](../../notebooks/tr/37-github-actions-dependency-caching.md) | [Alıştırma](../../exercises/tr/37-design-a-safe-dependency-cache.md) | [Laboratuvar](../../labs/tr/37-optimize-a-safe-cache-strategy.md) | [Yol Haritası](../../ROADMAP.md)

# Dependency Cache'leme Quiz'i

## Öğrenme Hedefleri

- kesin ve fallback anahtarları tasarlamak;
- cache'leri artifact'lardan ayırmak;
- cache güvenliği risklerini tanımak.

## Sorular

### Soru 1

Bir dependency cache anahtarını normalde ne değiştirmelidir?

- A. Workflow yazarının adı
- B. Lockfile içeriği
- C. Geçerli saat ve dakika
- D. Issue numarası

**Cevap:** B. Lockfile içeriği.

### Soru 2

Bir restore key'in amacı nedir?

**Beklenen Cevap:** Kesin cache anahtarı bulunamadığında sınırlı bir önek fallback'i sağlar.

### Soru 3

Doğru mu, yanlış mı: Bir cache, package manager'ın lockfile doğrulamasının yerini alır.

**Cevap:** Yanlış. Normal locked install yetkili kaynak olmaya devam eder.

### Soru 4

Aşağıdaki içeriklerden hangisi varsayılan olarak cache'lenmemelidir?

- A. Genel package download'ları
- B. Bir package manager download dizini
- C. Kimlik bilgileri ve `.env` dosyaları
- D. Bir lockfile hash'i

**Cevap:** C. Kimlik bilgileri ve `.env` dosyaları.

### Soru 5

Matrix boyutları neden bazen bir cache anahtarında yer almalıdır?

**Beklenen Cevap:** Farklı işletim sistemleri veya runtime'lar uyumsuz cache'lenmiş veriler üretebilir.

## Uygulamalı Senaryo

Bir cache başarıyla geri yükleniyor, ancak lockfile install başarısız oluyor. Workflow cache'e güvenmeli mi?

**Beklenen Cevap:** Hayır. Cache yolunu ve anahtarını araştırın, ancak locked install'ı doğruluğun kaynağı olarak koruyun ve gerekirse cache'i yeniden oluşturun veya cache kullanmayın.

## Gözden Geçirme Kontrol Listesi

- [ ] İlgili input'lardan bir anahtar oluşturabilirim.
- [ ] Restore key eskimesini anlıyorum.
- [ ] Hassas cache içeriklerini belirleyebilirim.

### İlgili İçerik

- Önceki bölüm: [Matrix Build'leri](../../notebooks/tr/36-github-actions-matrix-builds.md)
- Notebook: [GitHub Actions Dependency Cache'leme](../../notebooks/tr/37-github-actions-dependency-caching.md)
- Alıştırma: [Güvenli Bir Dependency Cache Tasarla](../../exercises/tr/37-design-a-safe-dependency-cache.md)
- Laboratuvar: [Güvenli Bir Cache Stratejisini Optimize Et](../../labs/tr/37-optimize-a-safe-cache-strategy.md)
