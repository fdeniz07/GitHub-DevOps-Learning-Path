---
chapter: 45
title: "Güvenlik Kontrolleri İncelemesi Çalıştırma"
related_notebook: "Teslimat İş Akışları için Güvenlik En İyi Uygulamaları"
related_exercise: "Güvenli Teslimat İş Akışını Denetleme"
related_quiz: "Güvenlik En İyi Uygulamaları Quiz'i"
level: Intermediate
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/45-security-best-practices.md) | [Alıştırma](../../exercises/tr/45-audit-a-secure-delivery-workflow.md) | [Yol Haritası](../../ROADMAP.md)

# Güvenlik Kontrolleri İncelemesi Çalıştırma

## Amaç

Depo, iş akışı, bağımlılık ve üretim kontrollerini derinlemesine savunma yaklaşımıyla inceleyin.

## Sonuçlar

- En az ayrıcalığı ve korumalı dağıtım yollarını doğrulamak.
- CodeQL, Dependabot, dal koruması ve denetim kanıtını incelemek.
- Önceliklendirilmiş düzeltme eylemleri üretmek.

## Ön Koşullar

- Notebook'u ve alıştırmayı tamamlayın.
- İlgili ayarlara depo yönetimi veya okuma erişimi.
- İncelenecek iş akışı ve bağımlılık bildirimi.

## Senaryo

Üretim lansmanından önce ekip bağımsız bir kontrol incelemesi istiyor. İş akışını, depo ayarlarını, bağımlılıkları, gizli bilgileri ve denetim olaylarını inceleyip boşlukları önceliğe göre raporlayacaksınız.

## Ortam

| Gereksinim      | Değer                                                            |
| --------------- | ---------------------------------------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS                                        |
| Yazılım         | GitHub deposu, Git, bağımlılık araçları                          |
| Erişim          | Actions, ortamlar, dal koruması, güvenlik ve denetim görünümleri |

## Görevler

### Görev 1 — İş akışı yetkisini inceleyin

Üst düzey ve iş düzeyi `permissions`, eylem başvuruları, güvenilmeyen girdiler, `environment` ve `concurrency` değerlerini inceleyin. Aşırı erişimi ve tedarik zinciri endişelerini kaydedin.

**Beklenen Sonuç:** İş akışı riskleri somut dosya veya ayar kanıtına sahiptir.

### Görev 2 — Depo kontrollerini inceleyin

Korumalı dalları, zorunlu incelemeleri, zorunlu durum kontrollerini, korumalı ortamları, gizli bilgi kapsamını, CodeQL durumunu ve Dependabot yapılandırmasını doğrulayın.

**Beklenen Sonuç:** Önleyici ve tespit edici kontroller birlikte incelenir.

### Görev 3 — Raporu üretin

Yakın tarihli değişiklikleri doğrulamak için denetim günlüğünü ve dağıtım geçmişini kullanın. Bulguları etki, olasılık ve düzeltme çabasına göre sıralayın. Sahipler ve bitiş tarihleri atayın.

**Beklenen Sonuç:** Rapor pratik bir düzeltme planını destekler.

## Doğrulama Kontrol Listesi

- [ ] İş akışı izinleri kontrol edildi.
- [ ] Üçüncü taraf eylem başvuruları incelendi.
- [ ] Gizli bilgiler ve ortam koruması kontrol edildi.
- [ ] Dal koruması ve zorunlu kontroller doğrulandı.
- [ ] CodeQL ve Dependabot kanıtı incelendi.
- [ ] Bulguların sahipleri ve öncelikleri var.

## Sorun Giderme

| Sorun                                            | Olası Neden           | Çözüm                                              |
| ------------------------------------------------ | --------------------- | -------------------------------------------------- |
| Ayar kullanılamıyor                              | Depo erişimi yetersiz | Salt okunur denetim erişimi isteyin.               |
| Belgelenen kontrol etkin değil                   | Yapılandırma sapması  | Canlı depo ayarını doğrulayın.                     |
| Çok sayıda düşük değerli bulgu acilleri gizliyor | Risk sıralaması yok   | Etki alanına ve kullanılabilirliğe göre sıralayın. |

## En İyi Uygulamalar

- Her bulguyla kanıt bağlantılarını ve zaman damgalarını saklayın.
- İş akışı değişikliklerinden sonra kontrolleri yeniden inceleyin.
- Güvenlik incelemesini lansman ritüeli değil, tekrarlanan etkinlik sayın.

## Özet

Güvenli teslimat incelemesi kontrollerin etkin, katmanlı ve kanıtla desteklendiğini doğrular. İlkeleri sorumlu işe dönüştürür.

## İlgili Bağlantılar

- Notebook: [Teslimat İş Akışları için Güvenlik En İyi Uygulamaları](../../notebooks/tr/45-security-best-practices.md)
- Alıştırma: [Güvenli Teslimat İş Akışını Denetleme](../../exercises/tr/45-audit-a-secure-delivery-workflow.md)
- Quiz: [Güvenlik En İyi Uygulamaları Quiz'i](../../quizzes/tr/45-security-best-practices-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
