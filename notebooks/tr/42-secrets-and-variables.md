---
chapter: 42
title: "Gizli Bilgiler ve Değişkenler"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Intermediate
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](41-continuous-deployment.md) | [Yol Haritası](../../ROADMAP.md) | [Sonraki Bölüm](43-codeql.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- GitHub Actions gizli bilgilerini sıradan değişkenlerden ayırt etmek.
- Kimlik bilgilerini günlüklerde açığa çıkarmadan gizli bilgileri ve değişkenleri kullanmak.
- İş akışı yapılandırması için döndürme, kapsam ve izin uygulamaları tasarlamak.

## Giriş

İş akışları dağıtım URL'leri, özellik anahtarları, belirteçler ve bulut kimlik bilgileri gibi yapılandırmalara ihtiyaç duyar. GitHub Actions hassas değerler için `secrets`, hassas olmayan yapılandırma için `vars` sağlar. Bir değişken yalnızca depo ayarlarında tutulduğu için otomatik olarak gizli değildir.

## Bunun Önemi

Sızan kimlik bilgileri, iş akışı tamamlandıktan çok sonra yetkisiz erişim sağlayabilir. Açık ayrım, en az ayrıcalık, maskeleme ve döndürme hataların etkisini azaltır. Güvenlik yalnızca bir değerin nerede saklandığına değil, nasıl kullanıldığına bağlıdır.

## Temel Terimler

| Terim               | Tanım                                                                         |
| ------------------- | ----------------------------------------------------------------------------- |
| Gizli bilgi         | GitHub tarafından korunan ve kontrollü kullanım için tasarlanan hassas değer. |
| Değişken            | `vars` bağlamı üzerinden sunulan hassas olmayan yapılandırma.                 |
| Ortam gizli bilgisi | `production` gibi bir ortama kapsamlandırılmış gizli bilgi.                   |
| Döndürme            | Bir kimlik bilgisini yeni değerle değiştirme ve eskisini iptal etme.          |
| Maskeleme           | Günlük çıktısında hassas değeri `***` ile değiştirme.                         |

## Teori

Gizli bilgiler `${{ secrets.NAME }}`, değişkenler `${{ vars.NAME }}` üzerinden kullanılır. Bir kimlik bilgisi yalnızca tek dağıtım hedefine aitse ortam kapsamı kullanın. Gizli bilgileri kaynak dosyalarına, yankılanan komut bağımsız değişkenlerine, yapıtlara, issue metnine veya hata ayıklama çıktısına koymayın.

Bir gizli bilgi yine de kazara açığa çıkabilir: bir betik onu yazdırabilir, bir araç hataya ekleyebilir veya saldırgan bir iş akışını değiştirerek dışarı çıkarabilir. Fork'lardan gelen pull request iş akışları genellikle depo gizli bilgilerine erişemez; bu önemli bir güvenlik sınırıdır.

### Uygulamalı İş Akışı Örneği

```yaml
name: Deploy

on:
  workflow_dispatch:

env:
  LOG_LEVEL: ${{ vars.LOG_LEVEL }}

permissions:
  contents: read

jobs:
  deploy:
    environment: production
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy application
        env:
          CLOUD_TOKEN: ${{ secrets.CLOUD_TOKEN }}
          DEPLOYMENT_URL: ${{ vars.DEPLOYMENT_URL }}
        run: ./scripts/deploy.sh
```

Belirteç komut satırına yazılmak yerine adım ortamından geçirilir. Betik `CLOUD_TOKEN` değerini asla yazdırmamalıdır. `DEPLOYMENT_URL` bir değişkendir ve ayrıca hassas değilse herkese açık yapılandırma olarak ele alınmalıdır.

## Kendiniz Deneyin

1. Her yapılandırma değerini gizli bilgi veya değişken olarak sınıflandırın.
2. Bir üretim kimlik bilgisini `production` ortamına kapsamlandırın.
3. Bir iş akışında değerleri açığa çıkarabilecek `echo`, kabuk izleme ve yapıt yüklemelerini arayın.
4. Eski kimlik bilgisini iptal eden bir döndürme prosedürü yazın.

## En İyi Uygulamalar

- Kimlik bilgilerini GitHub Actions gizli bilgileri veya harici bir gizli bilgi yöneticisinde saklayın.
- Ortam kapsamlı gizli bilgiler ve en az iş akışı izinleri kullanın.
- Gizli bilgileri asla günlüklemeyin, kaydetmeyin veya yüklemeyin.
- Şüpheli açığa çıkmadan sonra ve tanımlı bir takvimde kimlik bilgilerini döndürün.
- Tüm `vars` değerlerini gizli olmayan yapılandırma olarak ele alın.

## Yaygın Hatalar

| Hata                                                | Neden sorun oluşturur                                             | Nasıl önlenir                                                  |
| --------------------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------------- |
| Değişkenlerin gizli olduğunu varsaymak              | Değişkenler iş akışı kullanıcılarına ve günlüklerine görünebilir. | Hassas değerleri `secrets` içine koyun.                        |
| Kapsamda kimlik bilgileri varken `set -x` kullanmak | Kabuk izleme komutları ve değerleri yazdırabilir.                 | Hassas komutların çevresinde izlemeyi kapatın.                 |
| Tek bir geniş üretim belirtecini yeniden kullanmak  | Sızıntı her iş akışını ve hizmeti etkiler.                        | Kimlik bilgilerini kapsamlandırın ve en az ayrıcalık kullanın. |

## Özet

- Gizli bilgiler hassas değerleri korur; değişkenler sıradan yapılandırma sağlar.
- Gizli bilgiler günlüklenmemeli, kaydedilmemeli veya yüklenmemelidir.
- Kapsam, en az ayrıcalık ve döndürme temel kontrollerdir.

## İlgili Bağlantılar

- Önceki bölüm: [Sürekli dağıtım](41-continuous-deployment.md)
- Alıştırma: [Gizli bilgileri ve değişkenleri yönetme](../../exercises/tr/42-manage-secrets-and-variables.md)
- Lab: [Gizli bilgileri döndürme ve değişkenleri inceleme](../../labs/tr/42-rotate-secrets-and-review-variables.md)
- Quiz: [Gizli bilgiler ve değişkenler quiz'i](../../quizzes/tr/42-secrets-and-variables-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
- Sonraki bölüm: [CodeQL](43-codeql.md)
