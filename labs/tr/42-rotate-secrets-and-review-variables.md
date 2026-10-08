---
chapter: 42
title: "Gizli Bilgileri Döndürme ve Değişkenleri İnceleme"
related_notebook: "Gizli Bilgiler ve Değişkenler"
related_exercise: "Gizli Bilgileri ve Değişkenleri Yönetme"
related_quiz: "Gizli Bilgiler ve Değişkenler Quiz'i"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/42-secrets-and-variables.md) | [Alıştırma](../../exercises/tr/42-manage-secrets-and-variables.md) | [Yol Haritası](../../ROADMAP.md)

# Gizli Bilgileri Döndürme ve Değişkenleri İnceleme

## Amaç

Bir dağıtım iş akışını kimlik bilgisi açığa çıkması açısından denetleyin, yapılandırmayı sınıflandırın ve sandbox kimlik bilgisini güvenle döndürün.

## Sonuçlar

- Ortam kapsamlı gizli bilgileri günlüklemeden kullanmak.
- `secrets` ile `vars` değerlerini ayırmak.
- Oluşturma, test, değiştirme ve iptal döndürme sırasını tamamlamak.

## Ön Koşullar

- Notebook'u ve alıştırmayı tamamlayın.
- Sandbox depo veya ortamına erişin.
- İptal edilebilir geçici bir kimlik bilgisi.

## Senaryo

Bir iş akışında `CLOUD_TOKEN` depo değişkenindedir ve kabuk izleme kullanılır. Belirteci ortam gizli bilgisine taşımalı, açığa çıkma yollarını kaldırmalı ve döndürmelisiniz.

## Ortam

| Gereksinim      | Değer                                       |
| --------------- | ------------------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS                   |
| Yazılım         | GitHub Actions, Git, shell                  |
| Erişim          | Sandbox deposu ve iptal edilebilir belirteç |

## Görevler

### Görev 1 — Yapılandırmayı envanterleyin

İş akışının kullandığı her yapılandırma değerini listeleyin. Hassas veya hassas olmayan olarak işaretleyin ve gereken kapsamı belirleyin.

**Beklenen Sonuç:** Hassas değerler `secrets`, sıradan ayarlar `vars` adayıdır.

### Görev 2 — Açığa çıkmayı kaldırın

Doğrudan değerleri `${{ secrets.CLOUD_TOKEN }}` ve `${{ vars.DEPLOYMENT_URL }}` ile değiştirin. `set -x`, `echo` ifadelerini ve belirteç içerebilecek yapıtları kaldırın.

**Beklenen Sonuç:** Günlükler ve yapıtlar kimlik bilgisini açığa çıkarmaz.

### Görev 3 — Döndürün

Yeni sandbox belirteci oluşturun, ortam gizli bilgisini güncelleyin, güvenli dağıtım testi yapın, eski belirteci iptal edin ve döndürme tarihini kaydedin.

**Beklenen Sonuç:** Yeni belirteç çalışır, eski belirteç artık kimlik doğrulamaz.

## Doğrulama Kontrol Listesi

- [ ] Kimlik bilgisi kaydedilmedi.
- [ ] Hiçbir adım kimlik bilgisini yazdırmıyor.
- [ ] Üretim gizli bilgileri ortama kapsamlı.
- [ ] Yeni kimlik bilgisi test edildi.
- [ ] Eski kimlik bilgisi iptal edildi.

## Sorun Giderme

| Sorun                   | Olası Neden                      | Çözüm                                               |
| ----------------------- | -------------------------------- | --------------------------------------------------- |
| Gizli bilgi boş         | Kapsam veya ad yanlış            | Ortamı ve tam gizli bilgi adını kontrol edin.       |
| Günlükte belirteç var   | Hata ayıklama veya komut çıktısı | Çıktıyı kaldırın ve açığa çıkan belirteci döndürün. |
| Yeni belirteç başarısız | İzin veya hedef uyuşmazlığı      | Kapsamı doğrulayın ve sandbox'ta test edin.         |

## En İyi Uygulamalar

- Eğitim sırasında geçici kimlik bilgileri kullanın.
- Her açığa çıkmadan hemen sonra döndürün.
- Herkese açık yapılandırmayı gizli bilgilerden açıkça ayırın.

## Özet

Kimlik bilgisi güvenliği operasyoneldir: sınıflandırın, kapsamlandırın, günlüklemeyin, döndürün, test edin ve iptal edin.

## İlgili Bağlantılar

- Notebook: [Gizli Bilgiler ve Değişkenler](../../notebooks/tr/42-secrets-and-variables.md)
- Alıştırma: [Gizli Bilgileri ve Değişkenleri Yönetme](../../exercises/tr/42-manage-secrets-and-variables.md)
- Quiz: [Gizli Bilgiler ve Değişkenler Quiz'i](../../quizzes/tr/42-secrets-and-variables-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
