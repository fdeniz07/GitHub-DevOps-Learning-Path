---
chapter: 50
title: "İzleme ve Gözlemlenebilirlik: Metrikler, Günlükler ve Traces"
part: "DevOps"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](49-cloud-deployments.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Bir hizmet için yararlı metrikleri, yapılandırılmış günlükleri ve dağıtık trace'leri seçmek.
- Kullanıcının gördüğü güvenilirliği açıklayan SLI'lar ve SLO'lar tanımlamak.
- Bağlam, sahiplik ve eskalasyon yollarıyla eyleme dönük uyarılar oluşturmak.

## Giriş

İzleme, CPU kullanımı veya istek sayısı gibi bilinen sinyalleri raporlar. Gözlemlenebilirlik, metrikleri, günlükleri, trace'leri ve dağıtım bağlamını birleştirerek ekibin bilinmeyen sistem durumunu açıklamasına yardım eder. İyi enstrümantasyon teknik davranışı kullanıcı deneyimine bağlar.

## Bu Neden Önemli?

Kullanıcılar yavaş veya başarısız istekler yaşarken bir hizmet çalışıyor görünebilir. Sinyaller bu hataları görünür kılar, operatörlerin sorumlu bağımlılığı bulmasına yardım eder ve sürüm kararları için kanıt sağlar. Açık hedefler olmadan ekipler olayları kaçırır veya uyarı yorgunluğu oluşturur.

## Temel Terimler

| Terim        | Tanım                                                   |
| ------------ | ------------------------------------------------------- |
| Metrik       | Zaman içinde kaydedilen sayısal ölçüm.                  |
| Günlük       | Gerçekleşen bir şeyi açıklayan zaman damgalı olay.      |
| Trace        | Bir isteğin birden çok hizmet içinden geçtiği yol.      |
| Span         | Bir trace içindeki zamanlanmış işlem.                   |
| SLI          | Hizmet davranışının ölçülen göstergesi.                 |
| SLO          | Tanımlı zaman aralığında bir SLI için hedef.            |
| Hata bütçesi | Bir SLO'nun ima ettiği tolere edilebilir güvenilmezlik. |

## Teori

Metrikler dashboard'lar ve uyarılar için verimlidir. Counter'lar istek ve hata gibi toplamları ölçer; gauge'lar mevcut değerleri ölçer; histogram'lar gecikme gibi dağılımları açıklar. Kullanıcı deneyimi büyük ölçüde değiştiğinde ortalamalar yerine oranları ve yüzdelikleri tercih edin.

Yapılandırılmış günlükler zaman damgası, önem, hizmet, ortam, istek veya trace ID'si, olay adı ve güvenli bağlam içermelidir. Onaylı bir neden olmadan parolaları, erişim token'larını veya kişisel verileri günlüğe yazmayın. Trace'ler hizmet sınırları boyunca span'leri bağlar ve zamanın veya hataların nerede biriktiğini belirlemeye yardım eder.

SLI, başarılı isteklerin oranı gibi bir ölçümdür. SLO, 30 gün boyunca %99,9 başarılı istek gibi hedeftir. Uyarılar yalnızca bir kaynak değiştiğinde değil, eylem gerektiren kullanıcı etkili bir durum oluştuğunda tetiklenmelidir.

## Uygulamalı Örnekler

### HTTP isteğini enstrümante etme

```python
from time import perf_counter
import logging

logger = logging.getLogger(__name__)


def handle_request(request, metrics, tracer):
    with tracer.start_as_current_span("checkout.request") as span:
        started = perf_counter()
        try:
            response = process_checkout(request)
            metrics.requests_total.add(1, {"route": "/checkout", "status": str(response.status)})
            return response
        except Exception as error:
            span.record_exception(error)
            logger.exception("checkout_failed", extra={"request_id": request.id})
            metrics.failures_total.add(1, {"route": "/checkout"})
            raise
        finally:
            metrics.request_duration.record(perf_counter() - started, {"route": "/checkout"})
```

İstek bir süre metriği, başarı veya hata counter'ı, trace span'i ve yapılandırılmış hata olayı üretir. `request_id`, sırları açığa çıkarmadan korelasyonu destekler.

### SLO ve uyarı tanımlama

```yaml
slo:
  name: checkout-availability
  sli: successful_requests / valid_requests
  target: 99.9%
  window: 30d
alert:
  name: CheckoutHighErrorRate
  condition: error_rate > 1% for 10m
  owner: checkout-oncall
  runbook: docs/runbooks/checkout-high-error-rate.md
```

SLO kullanıcıya dönük bir hedef ifade eder. Uyarı süre, sahip ve runbook içerir; böylece kimsenin eyleme geçemeyeceği bir bildirime dönüşmez.

## Kendiniz Deneyin

1. Bir checkout veya API hizmeti için üç kullanıcıya dönük SLI tanımlayın.
2. Korelasyon ID'si ile yapılandırılmış günlükleme ekleyin ve hassas alanları çıkarın.
3. Bir API, veritabanı ve harici ödeme sağlayıcısı boyunca trace çizin.
4. Sahipleri ve runbook bağlantıları olan bir warning ve bir critical uyarı yazın.

## En İyi Uygulamalar

- Altın sinyalleri enstrümante edin: gecikme, trafik, hatalar ve doygunluk.
- Tutarlı adlar, etiketler, trace ID'leri ve saklama ilkeleri kullanın.
- Her düşük seviyeli dalgalanmayı değil, belirtileri ve SLO riskini uyarın.
- Dashboard'ları kararlara odaklayın ve uyarıları runbook'lara bağlayın.
- Sürümlerden sonra telemetrileri gözden geçirip gürültülü veya kullanılmayan sinyalleri kaldırın.

## Yaygın Hatalar

| Hata                                 | Neden sorun çıkarır                                    | Nasıl önlenir                                            |
| ------------------------------------ | ------------------------------------------------------ | -------------------------------------------------------- |
| Yalnızca CPU'ya uyarı vermek         | CPU normal görünürken kullanıcılar başarısız olabilir. | Kullanıcıya dönük SLI'ları uyarın.                       |
| Ham istek gövdelerini günlüğe yazmak | Sırlar veya kişisel veriler sızabilir.                 | Yalnızca güvenli yapılandırılmış alanları günlüğe yazın. |
| Gecikmede ortalamaları kullanmak     | Yavaş uç değerler ortalamada kaybolur.                 | Yüzdelikleri ve histogramları kullanın.                  |
| Sahibi olmayan uyarılar oluşturmak   | Kimin yanıt vereceği bilinmez.                         | On-call ekibi ve runbook atayın.                         |

## Özet

- Metrikler trendleri gösterir, günlükler olayları açıklar, trace'ler dağıtık işi bağlar.
- SLI'lar kullanıcıya dönük davranışı ölçer; SLO'lar güvenilirlik hedeflerini açıklaştırır.
- Eyleme dönük uyarılar anlamlı eşik, süre, sahip ve yanıt rehberliği gerektirir.

## İlgili Bağlantılar

- Önceki bölüm: [Bulut dağıtımları](49-cloud-deployments.md)
- Alıştırma: [Hizmet izleme sinyallerini tanımlama](../../exercises/tr/50-define-service-monitoring-signals.md)
- Lab: [Bir hizmeti enstrümante edip izleme](../../labs/tr/50-instrument-and-monitor-a-service.md)
- Quiz: [İzleme ve gözlemlenebilirlik quizi](../../quizzes/tr/50-monitoring-and-observability-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
