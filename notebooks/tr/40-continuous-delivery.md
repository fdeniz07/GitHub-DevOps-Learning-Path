---
chapter: 40
title: "Sürekli Teslimat"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Intermediate
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](39-continuous-integration.md) | [Yol Haritası](../../ROADMAP.md) | [Sonraki Bölüm](41-continuous-deployment.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Sürekli teslimatı sürekli entegrasyon ve dağıtımdan ayırt etmek.
- Üretime otomatik dağıtım yapmadan üretime hazır olduğunu kanıtlayan bir sürüm hattı modellemek.
- Onayları, yapıtları, ortamları ve sürüm kanıtlarını sorumlu şekilde kullanmak.

## Giriş

Sürekli teslimat (CD), yazılımı her zaman sürümlenebilir durumda tutar. Kabul edilen her değişiklik otomatik derleme, test ve paketleme aşamalarından geçer; böylece sürüm isteğe bağlı olarak yayımlanabilir. Son üretim kararı yine bilinçli bir onay gerektirebilir.

## Bunun Önemi

İstediği zaman sürüm yayımlayabilen bir ekip, riskli sürüm hafta sonlarına daha az bağımlıdır. Sürekli teslimat teknik hazır olma durumunu iş kararından ayırır. Bu ayrım geri alma planlamasını, uyumluluk kanıtını ve paydaş onayını kolaylaştırır.

## Temel Terimler

| Terim            | Tanım                                                                                               |
| ---------------- | --------------------------------------------------------------------------------------------------- |
| Sürekli teslimat | Kabul edilen her değişikliğin sürüme otomatik hazırlanması ve üretim sürümünün isteğe bağlı olması. |
| Sürüm adayı      | Sürüm için önerilen, test edilmiş yapıt.                                                            |
| Ortam            | Yapılandırması ve koruma kuralları olan adlandırılmış dağıtım hedefi.                               |
| Onay kapısı      | Korumalı bir işlemden önce geçilmesi gereken bilinçli kontrol.                                      |

## Teori

Bir teslimat hattı normalde bir kez derler, derlemeyi test eder, değişmez bir yapıt yayımlar ve aynı yapıtı ortamlar arasında ilerletir. Hazırlama ve üretim için ayrı ayrı derlemek farklı ikili dosyalar üretebilir ve izlenebilirliği zayıflatır.

Sürekli teslimat, her değişikliğin otomatik olarak üretime ulaşması anlamına gelmez. Değişikliğin hazır olması ve kuruluşun ne zaman yayımlayacağını seçebilmesi anlamına gelir. Korumalı bir üretim ortamı inceleyiciler, değişiklik kaydı veya dağıtım penceresi gerektirebilir.

### Uygulamalı İş Akışı Örneği

```yaml
name: Continuous Delivery

on:
  push:
    branches: [main]

permissions:
  contents: read
  actions: read

jobs:
  package:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build and test
        run: ./scripts/build-and-test.sh
      - name: Create release artifact
        run: tar -czf application.tgz app/
      - uses: actions/upload-artifact@v4
        with:
          name: release-candidate
          path: application.tgz

  release-ready:
    needs: package
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: release-candidate
      - name: Validate release metadata
        run: sha256sum application.tgz
```

İş akışı bir sürüm adayı hazırlar ve kanıtları kaydeder. Daha sonraki bir üretim işi korumalı `production` ortamını hedefleyebilir ve onay gerektirebilir; böylece teslimat ile dağıtım arasındaki ayrım korunur.

## Kendiniz Deneyin

1. Derleme, test, paketleme ve hazırlama aşamalarını tanımlayın.
2. Tek bir değişmez yapıt yükleyin ve hazırlama aşamasında indirin.
3. Otomatik ilerletmeyi etkinleştirmeden korumalı bir üretim ortamı ekleyin.
4. Onay ve geri alma karar noktalarını belgeleyin.

## En İyi Uygulamalar

- Bir kez derleyin ve aynı değişmez yapıtı ilerletin.
- Sürüm üstverisini, sağlama toplamlarını ve test sonuçlarını izlenebilir tutun.
- Üretim onaylarını açık ve denetlenebilir tutun.
- Uygulama yapılandırmasını yapıttan ayırın.
- Bir hattı sürüme hazır ilan etmeden önce geri almayı test edin.

## Yaygın Hatalar

| Hata                                                 | Neden sorun oluşturur                                                    | Nasıl önlenir                                             |
| ---------------------------------------------------- | ------------------------------------------------------------------------ | --------------------------------------------------------- |
| Her ortam için yeniden derlemek                      | Test edilen yapıt dağıtılan yapıttan farklı olabilir.                    | Tek bir yapıtı ilerletin.                                 |
| Her otomatik hattı dağıtım olarak adlandırmak        | Teslimat sürüme hazır olmayı içerir, üretime ilerletmeyi zorunlu kılmaz. | Onay sınırını açıkça belirtin.                            |
| Hazırlamayı tüm üretim davranışlarının kanıtı saymak | Ortamlar veri, ölçek ve yapılandırmada farklı olabilir.                  | Yapılandırmayı karşılaştırın ve kritik yolları test edin. |

## Özet

- Sürekli teslimat, test edilmiş yazılımı sürüme hazır tutar.
- Sürüme hazır olma otomatikleştirilebilir, üretim onayı ise bilinçli kalabilir.
- Değişmez yapıtlar, korumalı ortamlar ve geri alma kanıtı denetimi iyileştirir.

## İlgili Bağlantılar

- Önceki bölüm: [Sürekli entegrasyon](39-continuous-integration.md)
- Alıştırma: [Sürekli teslimat sürümünü planlama](../../exercises/tr/40-plan-a-continuous-delivery-release.md)
- Lab: [Sürekli teslimat sürümünü hazırlama](../../labs/tr/40-stage-a-continuous-delivery-release.md)
- Quiz: [Sürekli teslimat quiz'i](../../quizzes/tr/40-continuous-delivery-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
- Sonraki bölüm: [Sürekli dağıtım](41-continuous-deployment.md)
