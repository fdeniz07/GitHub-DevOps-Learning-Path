---
chapter: 50
title: "Hizmet İzleme Sinyallerini Tanımlama"
related_notebook: "İzleme ve Gözlemlenebilirlik: Metrikler, Günlükler ve Traces"
level: Intermediate
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/50-monitoring-and-observability.md) | [Lab](../../labs/tr/50-instrument-and-monitor-a-service.md) | [Yol Haritası](../../ROADMAP.md)

# Hizmet İzleme Sinyallerini Tanımlama

## Amaç

Bir HTTP hizmeti için küçük ve eyleme dönük bir gözlemlenebilirlik modeli tasarlayın.

## Çıktılar

- Metrikleri, yapılandırılmış günlük alanlarını ve trace span'lerini seçin.
- Kullanıcıya dönük davranıştan SLI ve SLO tanımlayın.
- Eşikler, sahipler ve runbook bağlantıları olan uyarılar yazın.

## Ön Koşullar

- [İzleme ve Gözlemlenebilirlik](../../notebooks/tr/50-monitoring-and-observability.md) bölümünü okuyun.
- HTTP durum kodlarını, gecikmeyi ve temel telemetri kavramlarını anlayın.
- Günlüklerde kimlik bilgilerini ve kişisel verileri korumayı bilin.

## Senaryo

Bir ödeme API'si yalnızca CPU kullanımını raporluyor. Müşteriler aralıklı yavaş istekler bildiriyor; ancak ekip API'nin, veritabanının veya ödeme sağlayıcısının sorumlu olup olmadığını belirleyemiyor.

## Görevler

### Görev 1 - Sinyalleri seçme

API ve bağımlılıkları için istek oranı, hata oranı, gecikme dağılımı, doygunluk, yapılandırılmış olaylar ve trace span'leri tanımlayın.

**Beklenen Sonuç:** Sinyal kümesi kullanıcı etkisini açıklar ve bağımlılık analizini destekler.

### Görev 2 - Güvenilirlik hedeflerini tanımlama

Kullanılabilirlik SLI'ı ve 30 günlük SLO yazın. Hangi isteklerin geçerli olduğunu ve hangi hataların hedefe sayılacağını belirtin.

**Beklenen Sonuç:** Hedef ölçülebilir ve kullanıcılar için anlamlıdır.

### Görev 3 - Uyarılar oluşturma

Süre, sahip, önem, runbook URL'si ve eskalasyon yolu içeren warning ve critical uyarıları yazın. Asla günlüğe yazılmaması gereken alanları listeleyin.

**Beklenen Sonuç:** Uyarılar operatör eylemine yol açar ve sırları veya kişisel verileri açığa çıkarmaz.

## Meydan Okuma

Tek kısa süreli bir hata için sayfa oluşturmadan hata bütçesinin hızlı tüketimini algılayan burn-rate uyarısı tanımlayın.

## Öz Değerlendirme

- [ ] Metrikleri, günlükleri ve trace'leri ayırabilirim.
- [ ] Ham altyapı metriği yerine SLI tanımlayabilirim.
- [ ] Eyleme dönük uyarı oluşturabilirim.
- [ ] Hassas günlük içeriğini belirleyebilirim.

## Yaygın Hatalar

| Hata                                             | Çözüm                                                       |
| ------------------------------------------------ | ----------------------------------------------------------- |
| Yalnızca CPU'ya uyarı vermek                     | Kullanıcıya dönük gecikme ve hata sinyalleri ekleyin.       |
| Token'ları veya istek gövdelerini günlüğe yazmak | Güvenli tanımlayıcılar yazın ve hassas alanları maskeleyin. |
| Sahipleri ve runbook'ları atlamak                | Her uyarıya yanıt metadatası ekleyin.                       |

## Özet

Yararlı gözlemlenebilirlik hizmet davranışını kullanıcı etkisine bağlar ve operatörlere güvenli hareket için yeterli bağlam verir.

## İlgili Bağlantılar

- Notebook: [İzleme ve Gözlemlenebilirlik](../../notebooks/tr/50-monitoring-and-observability.md)
- Lab: [Bir hizmeti enstrümante edip izleme](../../labs/tr/50-instrument-and-monitor-a-service.md)
- Quiz: [İzleme ve gözlemlenebilirlik quizi](../../quizzes/tr/50-monitoring-and-observability-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
