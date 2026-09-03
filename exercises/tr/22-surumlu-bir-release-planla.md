---
chapter: 22
title: "Sürümlü bir release planla"
related_notebook: "Release'ler, Package'ler ve Container Registry"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/22-releaseler-packageler-ve-container-registry.md) | [Laboratuvar](../../labs/tr/22-surumlu-package-yayinla-ve-kullan.md) | [Quiz](../../quizzes/tr/22-releaseler-packageler-ve-container-registry-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Sürümlü bir release planla

## Amaç

Uyumlu yeni bir özellik ve hata düzeltmesi için izlenebilir bir release planlamak.

## Senaryo

Mevcut sürüm `1.4.0`. Ekip isteğe bağlı bir dışa aktarma biçimi ekliyor ve raporlardaki yanlış tarihleri düzeltiyor. Genel API'de kırıcı değişiklik yok.

## Görevler

### Görev 1 - Sürümleri seç

Özellik için sonraki sürümü, daha sonraki düzeltme için de sonraki sürümü seçin. Her biri için neden `MINOR` veya `PATCH` olduğunu açıklayın.

### Görev 2 - Release kanıtını tanımla

Bir tag adı, üç release note maddesi ve yayımlanacak package veya image sürümünü yazın. Tüm sürümler aynı olmalıdır.

### Görev 3 - Tüketimi koru

Registry ad alanının sahibini, kimin yayınlayabileceğini, kimin okuyabileceğini ve neden `latest` kullanılmaması gerektiğini açıklayın.

## Beklenen Sonuç

Planınız semantik sürümü, kaynak tag'ini, release notes'u, değişmez registry artefaktını ve en az yetki kararını bağlar.

## Öz Değerlendirme

- [ ] Özellik release'i ile patch release'ini ayırabiliyorum.
- [ ] Tag ile release'in farklı amaçlarını açıklayabiliyorum.
- [ ] Değişmez sürümün faydasını biliyorum.

## İlgili İçerik

- [Notebook](../../notebooks/tr/22-releaseler-packageler-ve-container-registry.md)
- [Laboratuvar](../../labs/tr/22-surumlu-package-yayinla-ve-kullan.md)
- [Quiz](../../quizzes/tr/22-releaseler-packageler-ve-container-registry-quiz.md)
