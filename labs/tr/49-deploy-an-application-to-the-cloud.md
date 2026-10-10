---
chapter: 49
title: "Bir Uygulamayı Buluta Dağıtma"
related_notebook: "Bulut Dağıtım Modelleri, Yapılandırma ve Geri Dönüş"
related_exercise: "Bulut Dağıtımı Planlama"
level: Intermediate
estimated_time: 120 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/49-cloud-deployments.md) | [Alıştırma](../../exercises/tr/49-plan-a-cloud-deployment.md) | [Yol Haritası](../../ROADMAP.md)

# Bir Uygulamayı Buluta Dağıtma

## Amaç

Harici yapılandırma, health check'ler ve doğrulanmış rollback ile tek bir değişmez konteyner imajı dağıtın.

## Çıktılar

- Sırları gömmeden bir bulut hizmeti yapılandırın.
- Trafiği readiness'e göre yönetin ve dağıtımı gözlemleyin.
- Kanıt kullanarak bilinen iyi bir sürüme rollback yapın.

## Ön Koşullar

- Notebook ve alıştırmayı tamamlamış olmak.
- Bulut test aboneliği ve konteyner hizmeti dağıtma izni.
- Registry'de imaj ve health endpoint.

## Senaryo

Bir checkout hizmeti staging'den production'a yükseltilmelidir. Hizmet veritabanı parolası ve upstream URL kullanır; sürüm yöneticisi test edilmiş rollback yolu ister.

## Ortam

| Gereksinim      | Değer                               |
| --------------- | ----------------------------------- |
| İşletim sistemi | Windows, Linux veya macOS           |
| Yazılım         | Cloud CLI, Docker, registry erişimi |
| Yapıt           | Değişmez imaj digest'i              |
| Health yolları  | `/health/ready`, `/health/live`     |

## Görevler

### Görev 1 - Hizmeti yapılandırma

İmaj digest'ini, 8080 portunu, kaynak sınırlarını, readiness yolunu, liveness yolunu ve secret-store referansını belirten dağıtım tanımı oluşturun.

**Beklenen Sonuç:** İmajda veya repository manifestinde hiçbir kimlik bilgisi saklanmaz.

### Görev 2 - Staging'e dağıtma

Digest'i staging'e dağıtın, readiness'i bekleyin, health endpoint'ini çağırın ve sürüm ile dağıtım olaylarını kaydedin. Hata oranını ve p95 gecikmeyi en az on dakika gözlemleyin.

**Beklenen Sonuç:** Hizmet hazırdır ve kanıt, sürüm kapısında regresyon olmadığını gösterir.

### Görev 3 - Yükseltme ve rollback

Aynı digest'i gerekli onayla production'a yükseltin. Başarısız kapıyı tetikleyin veya simüle edin, önceki sürüme dönün ve hizmet sağlığını doğrulayın.

**Beklenen Sonuç:** Operatörler önceki bilinen iyi sürümü belirleyip geri yükleyebilir.

## Doğrulama Checklist'i

- [ ] Dağıtılan imaj digest ile tanımlı.
- [ ] Yapılandırma ve sırlar dışsallaştırılmış.
- [ ] Readiness ve liveness kontrolleri amaçlandığı gibi farklı davranıyor.
- [ ] Production onayından önce staging kanıtı mevcut.
- [ ] Rollback önceki sürümü geri yüklüyor.

## Sorun Giderme

| Problem              | Olası neden                                | Çözüm                                                   |
| -------------------- | ------------------------------------------ | ------------------------------------------------------- |
| Hizmet hazır olmuyor | Yanlış port veya bağımlılık yapılandırması | Başlangıç günlüklerini ve readiness yanıtını inceleyin. |
| Secret eksik         | Kimlik secret referansını okuyamıyor       | Gerekli en küçük çalışma zamanı iznini verin.           |
| Rollback adayı yok   | Eski sürüm silindi                         | Rollback adaylarını saklayıp test edin.                 |

## En İyi Uygulamalar

- Dağıtım ve çalışma zamanı erişimi için ayrı bulut kimlikleri kullanın.
- Kaynak sınırları uygulayın ve rollout sırasında doygunluğu gözlemleyin.
- Sürümü, digest'i, onayı, health kanıtını ve rollback sonucunu kaydedin.

## Özet

Bulut dağıtımı yapılandırması, health kapıları, gözlem penceresi ve kurtarma yolu test edildiğinde operasyonel olarak tamamdır.

## İlgili Bağlantılar

- Notebook: [Bulut Dağıtım Modelleri](../../notebooks/tr/49-cloud-deployments.md)
- Alıştırma: [Bulut dağıtımı planlama](../../exercises/tr/49-plan-a-cloud-deployment.md)
- Quiz: [Bulut dağıtımları quizi](../../quizzes/tr/49-cloud-deployments-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
