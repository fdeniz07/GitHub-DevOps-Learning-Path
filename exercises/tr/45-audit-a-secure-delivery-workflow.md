---
chapter: 45
title: "Güvenli Teslimat İş Akışını Denetleme"
related_notebook: "Teslimat İş Akışları için Güvenlik En İyi Uygulamaları"
related_lab: "Güvenlik Kontrolleri İncelemesi Çalıştırma"
related_quiz: "Güvenlik En İyi Uygulamaları Quiz'i"
level: Intermediate
estimated_time: 40 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/45-security-best-practices.md) | [Lab](../../labs/tr/45-run-a-security-controls-review.md) | [Yol Haritası](../../ROADMAP.md)

# Güvenli Teslimat İş Akışını Denetleme

## Amaç

Bir CI/CD iş akışını derinlemesine savunma açısından denetleyin ve pratik risk azaltmaları önerin.

## Sonuçlar

- Aşırı izinleri ve korunmayan sürüm yollarını belirlemek.
- Eylem sabitlemesini, gizli bilgileri, dal korumasını ve bağımlılık kontrollerini incelemek.
- Kanıtı kaydetmek ve düzeltmeye öncelik vermek.

## Ön Koşullar

- [Teslimat İş Akışları için Güvenlik En İyi Uygulamaları notebook'unu](../../notebooks/tr/45-security-best-practices.md) okuyun.
- GitHub Actions `permissions`, ortamlar ve `concurrency` değerlerini anlayın.
- CodeQL ve Dependabot'un amacını bilin.

## Senaryo

Bir iş akışı `write-all` kullanıyor, her daldan doğrudan dağıtım yapıyor, bir bulut belirtecini depo değişkeninde saklıyor ve eşzamanlılık kuralına sahip değil. Üretime dağıtılmasına izin verilmeden önce tasarımı denetleyin.

## Görevler

### Görev 1 — Kontrol boşluklarını bulun

Her sorunu listeleyin ve en az ayrıcalık, korumalı ortamlar, dal koruması, gizli bilgi yönetimi, eşzamanlılık veya bağımlılık bakımıyla eşleyin.

**Beklenen Sonuç:** Her bulgunun bir güvenlik ilkesi ve gözlemlenebilir kanıtı vardır.

### Görev 2 — En az değişiklikleri önerin

İzinleri, üretim koşulunu, ortamı ve gizli bilgi başvurusunu yeniden yazın. Bir üretim eşzamanlılık grubu ekleyin.

**Beklenen Sonuç:** Dağıtım işi daha dar yetkiye ve üretime korumalı bir yola sahip olur.

### Görev 3 — Denetim kanıtını tanımlayın

Kontrollerin etkin olduğunu kanıtlayan denetim günlüğü olaylarını, zorunlu kontrolleri, CodeQL sonuçlarını, Dependabot durumunu ve dağıtım kayıtlarını seçin.

**Beklenen Sonuç:** Başka bir inceleyici sözlü iddiaya güvenmeden değişiklikleri doğrulayabilir.

## Meydan Okuma

Bulguları kullanılabilirlik ve etki alanına göre sıralayın. Üretim kimlik bilgilerini etkiliyorsa düşük olasılıklı bir sorunun neden yine de acil ele alınabileceğini açıklayın.

## Öz Değerlendirme

- [ ] Derinlemesine savunma uygulayabiliyorum.
- [ ] `write-all` izinlerini azaltabiliyorum.
- [ ] Gizli bilgi ile değişkeni ayırt edebiliyorum.
- [ ] Denetim günlüklerinden ve zorunlu kontrollerden kanıt adlandırabiliyorum.

## Yaygın Hatalar

| Hata                                   | Çözüm                                                 |
| -------------------------------------- | ----------------------------------------------------- |
| Yalnızca tarayıcıyı düzeltmek          | Taramayı önleme ve erişim kontrolleriyle birleştirin. |
| Dal korumasını dağıtım koruması saymak | Üretim ortamını da koruyun.                           |
| Önerileri kanıtsız kaydetmek           | Her kontrolün nasıl doğrulanacağını tanımlayın.       |

## Özet

Güvenlik denetimi iş akışı yapılandırmasını gerçek kontroller, kanıt ve risk azaltmayla bağlar. Derinlemesine savunma tek bir başarısızlığı daha az yıkıcı hâle getirir.

## İlgili Bağlantılar

- Notebook: [Teslimat İş Akışları için Güvenlik En İyi Uygulamaları](../../notebooks/tr/45-security-best-practices.md)
- Lab: [Güvenlik Kontrolleri İncelemesi Çalıştırma](../../labs/tr/45-run-a-security-controls-review.md)
- Quiz: [Güvenlik En İyi Uygulamaları Quiz'i](../../quizzes/tr/45-security-best-practices-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
