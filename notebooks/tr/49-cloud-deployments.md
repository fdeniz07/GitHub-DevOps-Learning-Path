---
chapter: 49
title: "Bulut Dağıtım Modelleri, Yapılandırma ve Geri Dönüş"
part: "DevOps"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](48-container-registries.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Sanal makineleri, yönetilen konteyner hizmetlerini ve orkestratörleri karşılaştırmak.
- Yapılandırmayı ve sırları uygulama imajından ayırmak.
- Health check'ler, rollout kapıları ve uygulanabilir bir geri dönüş planı tasarlamak.

## Giriş

Bulut dağıtımı, test edilmiş bir yapıtın bulut sağlayıcısı tarafından işletilen ortama kontrollü taşınmasıdır. Sağlayıcı sanal makineleri, konteyner çalışma zamanını, küme zamanlayıcısını veya uygulama platformunun tamamını yönetebilir. Seçiminiz operasyonel ihtiyaçlara, ekip yeteneğine ve ağ ile çalışma zamanı davranışı üzerindeki gerekli kontrole uymalıdır.

## Bu Neden Önemli?

Başarılı dağıtım yalnızca yükleme değildir. Güvenli biçimde yapılandırma almalı, bir health signal sunmalı, trafiği yönetmeli ve hızlı bir kurtarma yolu sağlamalıdır. Açık dağıtım modelleri ve geri dönüş prosedürleri olay sırasında tahmini azaltır.

## Temel Terimler

| Terim                       | Tanım                                                                                     |
| --------------------------- | ----------------------------------------------------------------------------------------- |
| VM dağıtımı                 | Uygulamanın ekip veya sağlayıcı tarafından yönetilen sanal makinelerde çalıştırılması.    |
| Yönetilen konteyner hizmeti | Ana makine altyapısının çoğunu yönetirken konteyner çalıştıran platform.                  |
| Orkestratör                 | Konteynerlerin yerleşimini, ölçeklenmesini, ağını ve yaşam döngüsünü yöneten zamanlayıcı. |
| Readiness check             | Bir örneğin trafik alıp alamayacağını belirleyen sinyal.                                  |
| Liveness check              | Sağlıksız bir sürecin yeniden başlatılıp başlatılmayacağını belirleyen sinyal.            |
| Rollback                    | Hizmeti daha önce bilinen iyi bir sürüme veya yapılandırmaya döndürme.                    |

## Teori

Sanal makineler geniş kontrol sağlar, ancak patch uygulama, kapasite planlama ve ana makine operasyonları gerektirir. Yönetilen konteyner hizmetleri ana makine işini azaltır ve orta düzey platform gereksinimleri olan durum bilgisi taşımayan hizmetlere uygundur. Orkestratörler gelişmiş zamanlama, hizmet keşfi ve kademeli teslimat sağlar; ancak daha güçlü platform uzmanlığı ve yönetişim gerektirir.

URL'ler, feature flag'ler, kaynak sınırları ve ortam adları gibi yapılandırmalar dağıtım sistemi tarafından enjekte edilmelidir. Sırlar yönetilen bir secret store'da bulunmalı ve yalnızca ihtiyaç duyan sürece sunulmalıdır. Mümkün olduğunda imaj tüm ortamlarda aynı olmalıdır.

Health check'ler farklı soruları yanıtlamalıdır. Readiness trafiğin gelip gelmemesi gerektiğini söyler. Liveness yeniden başlatmanın süreci kurtarıp kurtaramayacağını söyler. Dağıtım readiness'i beklemeli, hata oranını ve gecikmeyi izlemeli, sürüm kapıları ihlal ederse durmalı veya geri dönmelidir.

## Uygulamalı Örnekler

### Konteyner hizmeti yapılandırması

```yaml
service: checkout-api
image: registry.example.com/platform/checkout@sha256:abc123
port: 8080
environment:
  ASPNETCORE_ENVIRONMENT: Production
  ORDERS_API_URL: https://orders.internal
secrets:
  - name: DATABASE_PASSWORD
    ref: secret://prod/checkout/database-password
health:
  readiness: /health/ready
  liveness: /health/live
resources:
  cpu: 500m
  memory: 512Mi
```

İmaj digest ile seçilir; ortam yapılandırması ve sırlar platform tarafından sağlanır. Hizmet, üretim parolasını imajına gömmemelidir.

### Rollout ve rollback taslağı

```bash
cloud deploy checkout-api --image registry.example.com/platform/checkout@sha256:abc123 --wait-for-ready
cloud observe checkout-api --window 10m --signals error-rate,p95-latency
cloud rollback checkout-api --to revision checkout-api-2026-09-22
```

Komut adları örnek platform işlemleridir. Önemli sıra; değişmez yapıt, readiness kapısı, gözlem penceresi ve prova edilmiş önceki sürümdür.

## Kendiniz Deneyin

1. Durum bilgisi taşımayan bir HTTP hizmeti için dağıtım modeli seçin ve operasyonel ödünleşimi gerekçelendirin.
2. Tüm yapılandırma değerlerini listeleyip her birini genel yapılandırma veya sır olarak sınıflandırın.
3. Readiness ve liveness uç noktalarını ve başlangıç hoşgörü süresini tanımlayın.
4. Hata oranı, gecikme ve başarısız health check'lere dayalı rollback tetikleyicileri yazın.

## En İyi Uygulamalar

- Aynı test edilmiş imajı ortamlar arasında yükseltin ve digest ile dağıtın.
- Altyapı ve uygulama yapılandırmasını sürümlü tutun, sırları dışsallaştırın.
- Trafik göndermeden önce readiness kapılarını ve yeniden başlatma döngülerinden kaçınan liveness check'lerini kullanın.
- Dağıtımları gözlemlenebilir, sınırlı ve geri döndürülebilir yapın.
- Geri dönüşü test edin ve kimin onaylayabileceğini veya çalıştırabileceğini belgeleyin.

## Yaygın Hatalar

| Hata                                          | Neden sorun çıkarır                                                           | Nasıl önlenir                               |
| --------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------- |
| Her ortam için yeniden derlemek               | Test ve üretim yapıtları farklılaşır.                                         | Tek bir değişmez imajı yükseltin.           |
| Sırları imaj katmanlarına koymak              | İmajı olan herkes onları kurtarabilir.                                        | Sırları çalışma zamanında enjekte edin.     |
| Her amaç için tek check kullanmak             | Hazır olmayan uygulama trafik alabilir veya sağlıklı iş yeniden başlayabilir. | Readiness ve liveness'ı ayırın.             |
| Geri dönüşü yalnızca kâğıt üzerinde planlamak | Operatörler olay sırasında zaman kaybeder.                                    | Gerçek sürümlerle geri dönüş provası yapın. |

## Özet

- Bulut modelleri operasyonel kontrolü yönetilen sorumlulukla dengeler.
- Çalışma zamanı yapılandırması ve sırlar değişmez imajların dışında kalmalıdır.
- Health check'ler, rollout kapıları, gözlemlenebilirlik ve prova edilmiş rollback dağıtımı kurtarılabilir kılar.

## İlgili Bağlantılar

- Önceki bölüm: [Konteyner registry'leri](48-container-registries.md)
- Alıştırma: [Bulut dağıtımı planlama](../../exercises/tr/49-plan-a-cloud-deployment.md)
- Lab: [Bir uygulamayı buluta dağıtma](../../labs/tr/49-deploy-an-application-to-the-cloud.md)
- Quiz: [Bulut dağıtımları quizi](../../quizzes/tr/49-cloud-deployments-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
