---
chapter: 50
title: "Bir Hizmeti Enstrümante Etme ve İzleme"
related_notebook: "İzleme ve Gözlemlenebilirlik: Metrikler, Günlükler ve Traces"
related_exercise: "Hizmet İzleme Sinyallerini Tanımlama"
level: Intermediate
estimated_time: 110 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/50-monitoring-and-observability.md) | [Alıştırma](../../exercises/tr/50-define-service-monitoring-signals.md) | [Yol Haritası](../../ROADMAP.md)

# Bir Hizmeti Enstrümante Etme ve İzleme

## Amaç

Küçük bir hizmete yararlı metrikler, yapılandırılmış günlükler, trace'ler, SLO'lar ve eyleme dönük uyarılar ekleyin.

## Çıktılar

- Bir isteği günlükler ve trace span'leri arasında ilişkilendirin.
- Trafik, hatalar, gecikme ve doygunluk için dashboard oluşturun.
- Bir uyarıyı test edin ve runbook'a bağlayın.

## Ön Koşullar

- Notebook ve alıştırmayı tamamlamış olmak.
- HTTP endpoint'i ve telemetri backend'i veya yerel collector'a sahip bir hizmet.
- Test ortamında dashboard ve uyarı oluşturma izni.

## Senaryo

On-call ekibi ödeme olayları sırasında belirsiz CPU uyarıları alıyor. Bunları kullanıcı etkisini gösteren ve yavaş bağımlılığı belirleyen sinyallerle değiştirin.

## Ortam

| Gereksinim      | Değer                                                                    |
| --------------- | ------------------------------------------------------------------------ |
| İşletim sistemi | Windows, Linux veya macOS                                                |
| Yazılım         | Hizmet çalışma zamanı, OpenTelemetry uyumlu collector, dashboard sistemi |
| Sinyaller       | Metrikler, yapılandırılmış günlükler, trace'ler                          |
| Hedef           | 30 gün boyunca %99,9 başarılı geçerli istek                              |

## Görevler

### Görev 1 - Bir isteği enstrümante etme

İstek counter'ı, süre histogramı, hata counter'ı, yapılandırılmış olay ve trace span'i ekleyin. Hizmet, route, durum ve korelasyon ID'sini dahil edin; sırları ve ham kimlik bilgilerini dışarıda bırakın.

**Beklenen Sonuç:** Bir istek metriktan günlüğe ve trace'e kadar izlenebilir.

### Görev 2 - Dashboard oluşturma

İstek oranı, hata oranı, p50 ve p95 gecikme, doygunluk, bağımlılık gecikmesi ve son dağıtımlar için paneller oluşturun.

**Beklenen Sonuç:** Dashboard müşteri etkili bir olay sırasında kararı destekler.

### Görev 3 - Uyarıyı test etme

Sahip ve runbook içeren hata oranı uyarısı tanımlayın, güvenli test penceresinde tetikleyin, kabul edin ve yanıtı kaydedin.

**Beklenen Sonuç:** Uyarı eyleme dönüktür, doğru ekibe yönlenir ve yanıt rehberine bağlıdır.

## Doğrulama Checklist'i

- [ ] Metrikler kararlı adlar ve sınırlı etiketler kullanıyor.
- [ ] Günlükler yapılandırılmış ve sır içermiyor.
- [ ] Trace'ler bağımlılık span'lerini ve korelasyonu içeriyor.
- [ ] SLO ve uyarı eşikleri belgelenmiş.
- [ ] Uyarı testi ve yanıtı kaydedilmiş.

## Sorun Giderme

| Problem                       | Olası neden                                               | Çözüm                                                      |
| ----------------------------- | --------------------------------------------------------- | ---------------------------------------------------------- |
| Yüksek cardinality metrikleri | Kullanıcı ID'leri veya URL'ler etiket olarak kullanılıyor | Sınırlı route ve durum etiketleri kullanın.                |
| Trace korelasyonu eksik       | Yayılım yapılandırılmamış                                 | Çağrılar arasında context propagation etkinleştirin.       |
| Uyarı sayfa oluşturmuyor      | Yanlış bildirim yolu veya süre                            | Yönlendirmeyi test edip uyarı değerlendirmesini inceleyin. |

## En İyi Uygulamalar

- Telemetriyi yararlı, sınırlı, gizlilik duyarlı ve hizmet hedeflerine bağlı tutun.
- Her sayfayı bir sahip ve runbook'a bağlayın.
- Sürümlerden sonra sinyal kalitesini gözden geçirip gürültülü uyarıları kaldırın.

## Özet

Enstrümantasyon; sinyaller ilişkilendirildiğinde, dashboard'lar kararları desteklediğinde ve uyarılar prova edilmiş yanıt ürettiğinde operasyonel değere dönüşür.

## İlgili Bağlantılar

- Notebook: [İzleme ve Gözlemlenebilirlik](../../notebooks/tr/50-monitoring-and-observability.md)
- Alıştırma: [Hizmet izleme sinyallerini tanımlama](../../exercises/tr/50-define-service-monitoring-signals.md)
- Quiz: [İzleme ve gözlemlenebilirlik quizi](../../quizzes/tr/50-monitoring-and-observability-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
