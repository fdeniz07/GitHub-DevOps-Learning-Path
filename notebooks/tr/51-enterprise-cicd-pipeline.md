---
chapter: 51
title: "Kurumsal CI/CD Pipeline'ları ve Platform Yönetişimi"
part: "DevOps"
level: Advanced
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](50-monitoring-and-observability.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Yönetilen ortamlar ve onaylarla kurumsal bir teslimat akışı tasarlamak.
- Denetlenebilirliği, platform sahipliğini, görev ayrılığını ve yeniden kullanılabilir şablonları açıklamak.
- Ekip özerkliğini güvenli ve tutarlı teslimat standartlarıyla dengelemek.

## Giriş

Kurumsal CI/CD birçok ekibi, hizmeti, ortamı, uyumluluk yükümlülüğünü ve dağıtım yolunu koordine eder. Amaç her ekibin yavaş bir merkezi süreci izlemesi değildir. Amaç yeniden kullanılabilir otomasyon, açık sahiplik, ilke kontrolleri ve meşru farklılıklar için yeterli esneklik sağlayan güvenli döşeli yollar sunmaktır.

## Bu Neden Önemli?

Ölçek büyüdüğünde belgelenmemiş manuel bir onay veya kopyalanmış bir workflow güvenilirlik ve denetim riski olur. Standart şablonlar sapmayı azaltır, korumalı ortamlar hassas eylemleri kontrol eder ve sahiplik sınırları hataların çözümünü kolaylaştırır. İyi yönetişim ekipleri mühendislik kararının yerine geçmeden destekler.

## Temel Terimler

| Terim                         | Tanım                                                                          |
| ----------------------------- | ------------------------------------------------------------------------------ |
| Ortam                         | Yapılandırma, erişim ve kontrollere sahip adlandırılmış dağıtım hedefi.        |
| Promotion                     | Aynı yapıtı daha sonraki bir ortama taşıma.                                    |
| Görev ayrılığı                | Bir kişinin önemli kontrolleri tek başına aşamaması için sorumlulukları bölme. |
| Denetlenebilirlik             | Kimin neyi değiştirdiğini, onayladığını ve dağıttığını yeniden oluşturabilme.  |
| Platform ekibi                | Paylaşılan teslimat yetenekleri ve döşeli yollar sağlayan ekip.                |
| Yeniden kullanılabilir şablon | Ürün ekiplerinin tutarlı biçimde kullandığı sürümlü otomasyon.                 |

## Teori

Yönetilen bir pipeline genellikle değişikliği doğrular, tek bir değişmez yapıt oluşturur, onu tarar ve imzalar, daha düşük bir ortama dağıtır, doğrulama çalıştırır ve aynı yapıtı staging'den production'a yükseltir. Onaylar zararsız her otomatik adımdan sonra değil, risk sınırlarında bulunmalıdır.

Ortam kontrolleri kimin dağıtabileceğini, hangi kontrollerin gerektiğini, sırların nasıl kapsamlandırılacağını ve bir onayın ne kadar geçerli kalacağını tanımlamalıdır. Denetim kayıtları kaynak commit'ini, workflow çalışmasını, yapıt digest'ini, test ve tarama sonuçlarını, onaylayanı, dağıtım zamanını ve sonucunu bağlamalıdır.

Platform ekipleri paylaşılan pipeline framework'ünden, runner'larından, kimlik entegrasyonundan, şablonlardan ve ilke kontrollerinden sorumludur. Ürün ekipleri hizmet davranışına, testlere, operasyonel hazırlığa ve hizmet düzeyi hedeflerine sahiptir. Yeniden kullanılabilir şablonlar güvenli parametreler sunmalı, girdileri doğrulamalı ve sürüm oluşturma ile kullanımdan kaldırma ilkesine sahip olmalıdır.

## Uygulamalı Örnekler

### Yeniden kullanılabilir workflow şablonu

```yaml
name: Governed service delivery
on:
  workflow_call:
    inputs:
      image:
        required: true
        type: string
      service:
        required: true
        type: string
jobs:
  promote:
    permissions:
      contents: read
      deployments: write
    uses: platform/.github/.github/workflows/promote.yml@v3
    with:
      image: ${{ inputs.image }}
      service: ${{ inputs.service }}
    secrets: inherit
```

Platform uygulamanın ve sürümün sahibidir. Bir hizmet yapıtı ve hizmet kimliğini sağlar; çağrılan workflow ortak kontrolleri uygular. Production yine de korumalı bir ortam ve açık onay ilkesi kullanmalıdır.

### Promotion kaydı

```text
service: checkout-api
commit: a1b2c3d
image: registry.example.com/platform/checkout@sha256:abc123
workflow_run: 18742
staging_result: passed
production_approval: release-manager@example.com
production_time: 2026-09-23T14:20:00Z
```

Bu kayıt, denetim veya olay incelemesi sırasında dağıtımı açıklanabilir kılar.

## Kendiniz Deneyin

1. Pull request'ten production'a yapıt, test, tarama, onay ve rollback kapıları olan bir pipeline çizin.
2. Platform ekibine, hizmet ekibine, güvenlik ekibine ve sürüm onaylayıcısına sorumluluklar atayın.
3. Tek bir production dağıtımını yeniden oluşturmak için gereken minimum denetim kaydını tanımlayın.
4. İlkeyi aşmadan hizmet farklılıklarına izin veren şablon girdilerini listeleyin.

## En İyi Uygulamalar

- Bir kez derleyin ve aynı değişmez yapıtı kontrollü ortamlardan yükseltin.
- İlkeyi sürümlü, yeniden kullanılabilir şablonlara koyun ve şablon değişikliklerini bağımsız test edin.
- En az ayrıcalık, korumalı ortamlar, görev ayrılığı ve kısa ömürlü kimlik bilgileri kullanın.
- Sahipliği, eskalasyonu, denetim kanıtını ve rollback sorumluluklarını açıkça belirtin.
- Kalite kontrollerini aşan ekipleri ödüllendirmeden teslimat performansını ölçün.

## Yaygın Hatalar

| Hata                                    | Neden sorun çıkarır                                 | Nasıl önlenir                                      |
| --------------------------------------- | --------------------------------------------------- | -------------------------------------------------- |
| Her ortamda yeniden derlemek            | Test kanıtı artık production byte'larını açıklamaz. | Bir yapıtı digest ile yükseltin.                   |
| Ekipler arasında workflow kopyalamak    | Düzeltmeler ve kontroller zamanla sapar.            | Sürümlü yeniden kullanılabilir şablonlar sağlayın. |
| Her yere onay eklemek                   | Anlamlı riski azaltmadan teslimat yavaşlar.         | Onayları risk sınırlarına koyun.                   |
| Tüm hizmet kararlarını merkezileştirmek | Platform darboğaz olur.                             | Ürün sahipliğini hizmet ekiplerinde tutun.         |

## Özet

- Kurumsal CI/CD otomasyonu, yönetişimi, sahipliği ve kanıtı birleştirir.
- Yeniden kullanılabilir şablonlar ve korumalı ortamlar hesap verebilirliği gizlemeden döşeli yollar oluşturur.
- Bir kez derleme, görev ayrılığı ve denetlenebilir dağıtım kayıtları güvenli ölçeği destekler.

## İlgili Bağlantılar

- Önceki bölüm: [İzleme ve gözlemlenebilirlik](50-monitoring-and-observability.md)
- Alıştırma: [Kurumsal CI/CD pipeline'ı tasarlama](../../exercises/tr/51-design-an-enterprise-cicd-pipeline.md)
- Lab: [Kurumsal teslimat pipeline'ını inceleme](../../labs/tr/51-review-an-enterprise-delivery-pipeline.md)
- Quiz: [Kurumsal CI/CD pipeline quizi](../../quizzes/tr/51-enterprise-cicd-pipeline-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
