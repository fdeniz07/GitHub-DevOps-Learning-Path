---
chapter: 41
title: "Sürekli Dağıtım"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Intermediate
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](40-continuous-delivery.md) | [Yol Haritası](../../ROADMAP.md) | [Sonraki Bölüm](42-secrets-and-variables.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Doğrulanmış değişikliklerin otomatik olarak üretime nasıl ilerletildiğini açıklamak.
- Otomatik dağıtım iş akışı için üretim ilerletme kontrolleri tasarlamak.
- Aşamalı teslimatı, geri almayı, izlemeyi ve korumalı ortamları birleştirmek.

## Giriş

Sürekli dağıtım, teslimat hattını geçen her değişikliği otomatik olarak üretime ilerletme uygulamasıdır. Üretim sürümü kararı otomatik olduğu için sürekli teslimattan daha güçlüdür. Bu nedenle otomasyon yalnızca son bir `deploy` komutundan değil, güvenilir kontrollerden oluşmalıdır.

## Bunun Önemi

Otomatik üretim ilerletme değere ulaşma süresini kısaltabilir ve elle sürüm işini azaltabilir. Ancak zayıf testlerin, güvensiz izinlerin ve yetersiz gözlemlenebilirliğin maliyetini artırır. Dağıtım sistemi başarısızlığı algılayabildiğini ve değişikliği durdurabildiğini veya geri alabildiğini kanıtlamalıdır.

## Temel Terimler

| Terim            | Tanım                                                                    |
| ---------------- | ------------------------------------------------------------------------ |
| Sürekli dağıtım  | Gerekli doğrulama başarıldıktan sonra üretime otomatik ilerletme.        |
| Aşamalı teslimat | Canary, blue-green veya yüzde tabanlı kullanıma alma ile kademeli sürüm. |
| Geri alma        | Üretimi bilinen iyi bir sürüme döndürme.                                 |
| Sağlık kontrolü  | Hizmet davranışını değerlendirmek için kullanılan otomatik sinyal.       |

## Teori

Sürekli dağıtım güvenilir bir zincir gerektirir: kaynak doğrulama, yapıt bütünlüğü, dağıtım yetkilendirmesi, sağlık kontrolleri ve geri alma. Üretim ilerletme kontrolleri otomatik ve test edilebilir olmalıdır. Korumalı bir ortam yine gerekli inceleyicileri veya politikaları tanımlayabilir; ancak her zaman insan bekleyen bir onay tam otomatik dağıtım değil, sürekli teslimattır.

Aşamalı teslimat etki alanını azaltır. Canary sürümü trafiğin küçük bir yüzdesini yeni sürüme gönderebilir ve hata oranı, gecikme veya sağlık kontrolleri eşikleri aşarsa durabilir. Özellik bayrakları kod dağıtımını özellik etkinleştirmesinden ayırabilir; ancak bayrakların sahibi ve temizleme planı olmalıdır.

### Uygulamalı İş Akışı Örneği

```yaml
name: Continuous Deployment

on:
  workflow_run:
    workflows: [Continuous Delivery]
    types: [completed]

permissions:
  contents: read
  deployments: write

jobs:
  deploy:
    if: ${{ github.event.workflow_run.conclusion == 'success' }}
    runs-on: ubuntu-latest
    environment: production
    concurrency:
      group: production
      cancel-in-progress: false
    steps:
      - name: Deploy canary
        run: ./scripts/deploy.sh --strategy canary --percent 10
      - name: Verify health
        run: ./scripts/check-health.sh --timeout 300
      - name: Promote traffic
        run: ./scripts/deploy.sh --strategy promote
```

`if` ifadesi başarısız bir teslimat iş akışından sonra ilerletmeyi engeller. `concurrency` çakışan üretim değişikliklerini önler. Dağıtım betikleri gerçek sağlık kontrolleri ve geri alma davranışı uygulamalıdır; YAML tek başına güvenliği garanti edemez.

## Kendiniz Deneyin

1. Test edilmiş yapıttan üretime ilerleme yolunu çizin.
2. Sağlık sinyallerini seçin ve durma eşiklerini tanımlayın.
3. Bir canary adımı ve otomatik geri alma komutu ekleyin.
4. Sağlık kontrolü başarısız olduğunda ne olacağını test edin.

## En İyi Uygulamalar

- İlerletmeyi yalnızca testler ve yapıt doğrulaması güvenilir olduktan sonra otomatikleştirin.
- Aşamalı kullanıma alma ve açık sağlık eşikleri kullanın.
- Geri almayı hızlı, belgeli ve düzenli test edilmiş tutun.
- Çakışan sürümleri önlemek için üretim `concurrency` kullanın.
- Dağıtım üstverisini ve denetim olaylarını kaydedin.

## Yaygın Hatalar

| Hata                               | Neden sorun oluşturur                                | Nasıl önlenir                                                  |
| ---------------------------------- | ---------------------------------------------------- | -------------------------------------------------------------- |
| Hız için tüm kontrolleri kaldırmak | Hatalı bir değişiklik her kullanıcıyı etkileyebilir. | Ölçülebilir kontrolleri ve aşamalı teslimatı otomatikleştirin. |
| Geri alma yolunun olmaması         | Kurtarma acil elle yapılan işe bağlı kalır.          | Bilinen iyi bir yapıtı saklayın ve geri almayı prova edin.     |
| İzleme olmadan dağıtmak            | Hata önce kullanıcılar tarafından fark edilir.       | İlerletmeyi sağlık sinyallerine ve uyarılara bağlayın.         |

## Özet

- Sürekli dağıtım doğrulanmış değişiklikleri otomatik olarak üretime ilerletir.
- Otomatik ilerletme test, sağlık kontrolü, kullanıma alma kontrolü ve geri alma gerektirir.
- En az ayrıcalık, eşzamanlılık ve denetlenebilirlik otomasyondan sonra da önemlidir.

## İlgili Bağlantılar

- Önceki bölüm: [Sürekli teslimat](40-continuous-delivery.md)
- Alıştırma: [Denetimli dağıtım tasarlama](../../exercises/tr/41-design-a-controlled-deployment.md)
- Lab: [Denetimli dağıtım çalıştırma](../../labs/tr/41-run-a-controlled-deployment.md)
- Quiz: [Sürekli dağıtım quiz'i](../../quizzes/tr/41-continuous-deployment-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
- Sonraki bölüm: [Gizli bilgiler ve değişkenler](42-secrets-and-variables.md)
