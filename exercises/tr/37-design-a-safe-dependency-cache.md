---
chapter: 37
title: "Güvenli Bir Dependency Cache Tasarlayın"
related_notebook: "GitHub Actions Dependency Caching"
level: Orta
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/36-github-actions-matrix-builds.md) | [Not Defteri](../../notebooks/tr/37-github-actions-dependency-caching.md) | [Lab](../../labs/tr/37-optimize-a-safe-cache-strategy.md) | [Kısa Sınav](../../quizzes/tr/37-dependency-caching-quiz.md) | [Roadmap](../../ROADMAP.md)

# Güvenli Bir Dependency Cache Tasarlayın

## Amaç

Bağımlılık ve secret yönetimini zayıflatmadan kurulum süresini iyileştiren bir cache tasarımı oluşturun.

## Öğrenme Kazanımları

- doğru cache yolunu belirlemek;
- tam bir key ve restore prefix oluşturmak;
- kurulumun lockfile'ı neden hâlâ doğruladığını açıklamak.

## Ön Koşullar

- [GitHub Actions Dependency Caching](../../notebooks/tr/37-github-actions-dependency-caching.md) konusunu tamamlayın.
- Uygulama repository'sinde bir package manager ve lockfile.

## Senaryo

Bir matrix workflow'unda dependency installation yavaş. Her işletim sistemi ve lockfile durumu için package download'larını cache'leyin; kimlik bilgilerini ve build output'unu cache dışında tutun.

## Görevler

### Görev 1

Package manager cache yolunu, lockfile adını ve cache'lenen veriyi değiştirebilecek her matrix boyutunu yazın.

### Beklenen Sonuç

Cache kapsamı tahminlere değil, gözlemlenen proje girdilerine dayanır.

### Görev 2

İşletim sistemi ve lockfile hash'ini içeren tam bir key ile aynı işletim sistemi ve package manager için bir restore prefix oluşturun.

### Beklenen Sonuç

Tam eşleşme özeldir, fallback ise sınırlandırılmış kalır.

### Görev 3

Restore işleminden sonra hangi install komutunun çalıştığını ve `.env`, token'lar ile oluşturulan release dosyalarının neden dışarıda bırakıldığını açıklayın.

### Beklenen Sonuç

Tasarım cache'i bir optimizasyon olarak ele alır ve hassas verileri korur.

## Zorluk

Cache etkin değilken üç çalıştırma boyunca cache hit rate'i ve toplam süreyi karşılaştırın.

## Öz Değerlendirme

- [ ] Key'im her ilgili lockfile'ı içeriyor.
- [ ] Restore prefix'i bilinçli biçimde kullanıyorum.
- [ ] Güvenli olmayan cache içeriklerini belirleyebilirim.

## Yaygın Hatalar

| Hata                                  | Çözüm                                       |
| ------------------------------------- | ------------------------------------------- |
| Lockfile'ı yok saymak                 | Tam key içinde hash'leyin.                  |
| Eski veriye eksiksizmiş gibi güvenmek | Normal locked install komutunu çalıştırın.  |
| Secret'ları cache'lemek               | Yalnızca dependency verilerini cache'leyin. |

## Özet

Yeniden üretilebilir kurulumu ve güvenliği korurken hızı destekleyen sınırlandırılmış bir cache tasarladınız.

### İlgili İçerik

- Not Defteri: [GitHub Actions Dependency Caching](../../notebooks/tr/37-github-actions-dependency-caching.md)
- Lab: [Güvenli Bir Cache Stratejisini Optimize Etme](../../labs/tr/37-optimize-a-safe-cache-strategy.md)
- Kısa Sınav: [Dependency Caching Kısa Sınavı](../../quizzes/tr/37-dependency-caching-quiz.md)
