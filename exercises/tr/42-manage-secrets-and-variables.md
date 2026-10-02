---
chapter: 42
title: "Gizli Bilgileri ve Değişkenleri Yönetme"
related_notebook: "Gizli Bilgiler ve Değişkenler"
related_lab: "Gizli Bilgileri Döndürme ve Değişkenleri İnceleme"
related_quiz: "Gizli Bilgiler ve Değişkenler Quiz'i"
level: Intermediate
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/42-secrets-and-variables.md) | [Lab](../../labs/tr/42-rotate-secrets-and-review-variables.md) | [Yol Haritası](../../ROADMAP.md)

# Gizli Bilgileri ve Değişkenleri Yönetme

## Amaç

İş akışı yapılandırmasını doğru sınıflandırın ve kimlik bilgilerini kullanmak, kapsamlandırmak ve döndürmek için güvenli bir yol tasarlayın.

## Sonuçlar

- `${{ secrets.NAME }}` ile `${{ vars.NAME }}` arasında seçim yapmak.
- Günlük ve yapıt açığa çıkma yollarını belirlemek.
- Kimlik bilgisi döndürme kontrol listesi oluşturmak.

## Ön Koşullar

- [Gizli Bilgiler ve Değişkenler notebook'unu](../../notebooks/tr/42-secrets-and-variables.md) okuyun.
- GitHub depo ve ortam ayarlarını anlayın.
- Temel kabuk ortam değişkenlerini bilin.

## Senaryo

Bir dağıtım iş akışı `CLOUD_TOKEN`, `DEPLOYMENT_URL`, `LOG_LEVEL` ve `FEATURE_FLAG` kullanıyor. Mevcut dosya hata ayıklarken tüm adım ortam değişkenlerini yazdırıyor. Değerleri sınıflandırmalı ve açığa çıkma risklerini kaldırmalısınız.

## Görevler

### Görev 1 — Değerleri sınıflandırın

`CLOUD_TOKEN` değerini gizli bilgi olarak işaretleyin. Diğer değerlerin değişken olup olmadığına veya gerçek hassasiyetlerine göre gizli bilgiye taşınıp taşınmayacağına karar verin.

**Beklenen Sonuç:** Hassas kimlik bilgileri sıradan yapılandırmadan ayrılır.

### Görev 2 — Adımı yeniden yazın

Belirteci `env:` üzerinden `${{ secrets.CLOUD_TOKEN }}` ile geçirin ve herkese açık ayarları `${{ vars.NAME }}` ile geçirin. Değerleri açığa çıkarabilecek kabuk izlemeyi ve tanılama çıktısını kaldırın.

**Beklenen Sonuç:** Dağıtım komutu kimlik bilgilerini yazdırmadan yapılandırmayı alır.

### Görev 3 — Döndürmeyi planlayın

Yeni kimlik bilgisi oluşturma, ortam gizli bilgisini güncelleme, dağıtımı test etme, eski kimlik bilgisini iptal etme ve değişikliği kaydetme adımlarını yazın.

**Beklenen Sonuç:** Döndürme gereksiz kesintiyi önleyen bir sıraya sahiptir.

## Meydan Okuma

Bir gizli bilginin güvenilmeyen pull request veya fork koduna neden açılmaması gerektiğini açıklayın.

## Öz Değerlendirme

- [ ] Değişkenlerin otomatik olarak gizli olmadığını biliyorum.
- [ ] Olası günlük açığa çıkma noktalarını bulabiliyorum.
- [ ] Kimlik bilgisini döndürüp iptal edebiliyorum.
- [ ] Üretim gizli bilgisini bir ortama kapsamlandırabiliyorum.

## Yaygın Hatalar

| Hata                                              | Çözüm                                                          |
| ------------------------------------------------- | -------------------------------------------------------------- |
| Belirteçleri YAML içine koymak                    | Bunun yerine `secrets` kullanın.                               |
| Maskelemenin her sızıntıyı düzelttiğini varsaymak | Önce yazdırmayı ve yapıt yüklemeyi engelleyin.                 |
| Her yerde tek kimlik bilgisi kullanmak            | Kimlik bilgilerini kapsamlandırın ve en az ayrıcalık kullanın. |

## Özet

Gizli bilgiler kimlik bilgilerini korur; değişkenler sıradan yapılandırma sağlar. Güvenli kullanım kapsamlı erişim, günlükleme yapmama ve düzenli döndürme gerektirir.

## İlgili Bağlantılar

- Notebook: [Gizli Bilgiler ve Değişkenler](../../notebooks/tr/42-secrets-and-variables.md)
- Lab: [Gizli Bilgileri Döndürme ve Değişkenleri İnceleme](../../labs/tr/42-rotate-secrets-and-review-variables.md)
- Quiz: [Gizli Bilgiler ve Değişkenler Quiz'i](../../quizzes/tr/42-secrets-and-variables-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
