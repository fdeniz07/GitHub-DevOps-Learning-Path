---
chapter: 41
title: "Denetimli Dağıtım Tasarlama"
related_notebook: "Sürekli Dağıtım"
related_lab: "Denetimli Dağıtım Çalıştırma"
related_quiz: "Sürekli Dağıtım Quiz'i"
level: Intermediate
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/41-continuous-deployment.md) | [Lab](../../labs/tr/41-run-a-controlled-deployment.md) | [Yol Haritası](../../ROADMAP.md)

# Denetimli Dağıtım Tasarlama

## Amaç

Etki alanını sınırlayan ve başarısız dağıtımlardan kurtulan otomatik üretim ilerletme kontrolleri tasarlayın.

## Sonuçlar

- Sağlık sinyallerini ve kullanıma alma eşiklerini belirlemek.
- `concurrency` ve korumalı `production` ortamını uygun kullanmak.
- Otomatik geri alma davranışını açıklamak.

## Ön Koşullar

- [Sürekli Dağıtım notebook'unu](../../notebooks/tr/41-continuous-deployment.md) okuyun.
- Sürüm yapıtlarını ve ortam korumasını anlayın.
- Temel HTTP sağlık kontrollerini ve dağıtım terimlerini bilin.

## Senaryo

Bir ekip geniş kullanıcı tabanına sahip bir hizmet için sürekli dağıtım istiyor. Her başarılı teslimat %10 canary dağıtmalı, sağlığı doğrulamalı ve yalnızca hata oranı ile gecikme sınırlar içinde kaldığında trafiği ilerletmelidir.

## Görevler

### Görev 1 — İlerletme kapılarını tanımlayın

Canary için sağlık sinyallerini, gözlem süresini ve durma eşiklerini seçin.

**Beklenen Sonuç:** İlerletme kararı öznel değil ölçülebilir olur.

### Görev 2 — Çakışan sürümleri önleyin

Bir üretim `concurrency` grubu ekleyin ve dağıtım sırasında `cancel-in-progress: false` değerinin neden uygun olabileceğini açıklayın.

**Beklenen Sonuç:** İki üretim dağıtımı aynı anda ortamı değiştiremez.

### Görev 3 — Geri almayı tasarlayın

Sağlık doğrulaması başarısız olursa iş akışının ne yapacağını açıklayın. Bilinen iyi yapıtı ve saklanacak denetim bilgilerini ekleyin.

**Beklenen Sonuç:** Başarısızlık ilerletmeyi durdurur ve hizmeti öngörülebilir biçimde geri yükler.

## Meydan Okuma

Bu hizmet için canary ve blue-green dağıtımı karşılaştırın. Birini seçin ve operasyonel maliyeti gerekçelendirin.

## Öz Değerlendirme

- [ ] Teslimat ile dağıtımı ayırt edebiliyorum.
- [ ] Nesnel sağlık eşikleri tanımladım.
- [ ] Üretim eşzamanlılığını ekledim.
- [ ] Otomatik geri almayı açıklayabiliyorum.

## Yaygın Hatalar

| Hata                                               | Çözüm                                               |
| -------------------------------------------------- | --------------------------------------------------- |
| Yüklemeden hemen sonra ilerletmek                  | Önce canary'yi gözlemleyin.                         |
| İki sürümü eşzamanlı dağıtmak                      | Bir üretim `concurrency` grubu kullanın.            |
| Başarısızlığı kullanıcıların bildirmesine güvenmek | Sağlık kontrollerini ve uyarıları otomatikleştirin. |

## Özet

Sürekli dağıtım ancak otomatik ilerletme ölçülebilir kapılara, sınırlı görünürlüğe ve test edilmiş geri alma yoluna sahip olduğunda güvenlidir.

## İlgili Bağlantılar

- Notebook: [Sürekli Dağıtım](../../notebooks/tr/41-continuous-deployment.md)
- Lab: [Denetimli Dağıtım Çalıştırma](../../labs/tr/41-run-a-controlled-deployment.md)
- Quiz: [Sürekli Dağıtım Quiz'i](../../quizzes/tr/41-continuous-deployment-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
