---
chapter: 50
title: "İzleme ve Gözlemlenebilirlik Quizi"
related_notebook: "İzleme ve Gözlemlenebilirlik: Metrikler, Günlükler ve Traces"
related_exercise: "Hizmet İzleme Sinyallerini Tanımlama"
related_lab: "Bir Hizmeti Enstrümante Etme ve İzleme"
level: Intermediate
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/50-monitoring-and-observability.md) | [Alıştırma](../../exercises/tr/50-define-service-monitoring-signals.md) | [Lab](../../labs/tr/50-instrument-and-monitor-a-service.md) | [Yol Haritası](../../ROADMAP.md)

# İzleme ve Gözlemlenebilirlik Quizi

## Öğrenme Hedefleri

- Yararlı metrikleri, günlükleri ve trace'leri seçmek.
- SLI'ları, SLO'ları ve hata bütçelerini tanımlamak.
- Operatörlerin eyleme geçebileceği uyarılar oluşturmak.

## Sorular

### Soru 1

Hizmetler arasında tek bir isteği anlamak için hangi sinyal en iyisidir?

- A. Dağıtık trace
- B. Yalnızca CPU gauge'ı
- C. Yalnızca sürüm etiketi
- D. Saklama ilkesi

**Cevap:** A. Trace, hizmet sınırları arasındaki zamanlanmış span'leri bağlar.

### Soru 2

SLI ile SLO arasındaki fark nedir?

**Beklenen Cevap:** SLI, başarılı istekler gibi ölçülen göstergedir. SLO, belirlenmiş zaman penceresinde bu gösterge için hedeftir.

### Soru 3

Doğru mu yanlış mı: Ortalama gecikme kullanıcı deneyimini her zaman iyi açıklar.

**Cevap:** Yanlış. Yüzdelikler ve dağılımlar, ortalamaların gizleyebileceği yavaş uç değerleri ortaya çıkarır.

### Soru 4

Dört altın sinyali adlandırın.

**Beklenen Cevap:** Gecikme, trafik, hatalar ve doygunluk.

### Soru 5

Eyleme dönük bir uyarı neleri içermelidir?

**Beklenen Cevap:** Kullanıcı etkili durum, eşik ve süre, önem, sahip, yönlendirme ve runbook veya yanıt yolu.

### Soru 6

Uygulama günlüklerinden normalde hangi veriler çıkarılmalıdır?

**Cevap:** Parolalar, erişim token'ları, ödeme sırları ve gereksiz kişisel veriler. Güvenli tanımlayıcılar ve maskeleme kullanın.

## Uygulamalı Senaryo

CPU normal, ancak checkout p95 gecikmesi ve ödeme sağlayıcısı span süresi birlikte yükseliyor. Ardından hata oranı SLO eşiğini aşıyor. İncelemeyi ve uyarı yanıtını açıklayın.

**Beklenen Cevap:** Bağımlılık gecikmesini doğrulamak için trace'i kullanın, istek ve yapılandırılmış günlükleri ilişkilendirin, SLO uyarısıyla checkout sahibine sayfa açın, runbook'u izleyin ve kanıtı korurken rollback'i veya bağımlılık azaltmayı değerlendirin.

## İnceleme Checklist'i

- [ ] Metrikler, günlükler ve trace'ler arasında seçim yapabilirim.
- [ ] SLI ve SLO tanımlayabilirim.
- [ ] Hata bütçelerini anlıyorum.
- [ ] Hassas günlüklemeden kaçınabilirim.
- [ ] Sahibi ve runbook'u olan uyarı yazabilirim.

## İlgili Bağlantılar

- Notebook: [İzleme ve Gözlemlenebilirlik](../../notebooks/tr/50-monitoring-and-observability.md)
- Alıştırma: [Hizmet izleme sinyallerini tanımlama](../../exercises/tr/50-define-service-monitoring-signals.md)
- Lab: [Bir hizmeti enstrümante edip izleme](../../labs/tr/50-instrument-and-monitor-a-service.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
