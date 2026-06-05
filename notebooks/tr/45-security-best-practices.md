---
chapter: 45
title: "Teslimat İş Akışları için Güvenlik En İyi Uygulamaları"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](44-dependabot.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- CI/CD iş akışlarına ve depo ayarlarına derinlemesine savunma uygulamak.
- En az ayrıcalık, sabitleme, korumalı ortamlar ve dal korumasını birlikte kullanmak.
- İş akışı izinleri, bağımlılık değişiklikleri ve denetim günlükleri gibi güvenlik kanıtlarını denetlemek.

## Giriş

Güvenli teslimat; kaynak kodu, iş akışları, yapıtlar, ortamlar, bağımlılıklar ve insanlar etrafında bulunan bir kontroller sistemidir. Tek bir tarayıcı veya ayar tüm riski ortadan kaldıramaz. Derinlemesine savunma, bir kontrolün başarısız olabileceğini varsayar ve bağımsız ek önlemler koyar.

## Bunun Önemi

CI/CD iş akışları kaynak kodunu okuyabilir, kimlik bilgilerine erişebilir, yapıtları değiştirebilir ve üretim sistemlerini dağıtabilir. Kötü amaçlı bir değişiklik veya ele geçirilmiş bir eylem bu yetkiyi tedarik zinciri olayına dönüştürebilir. Güvenlik en iyi uygulamaları, ekiplerin ihtiyaç duyduğu teslimat hızını korurken etki alanını azaltır.

## Temel Terimler

| Terim                 | Tanım                                                                                |
| --------------------- | ------------------------------------------------------------------------------------ |
| Derinlemesine savunma | Aynı hedefi koruyan birden çok bağımsız kontrol.                                     |
| En az ayrıcalık       | Kullanıcıya, belirtece veya işe yalnızca ihtiyaç duyduğu erişimi verme.              |
| Sabitleme             | Denetimsiz hareketli hedef yerine bilinen eylem veya bağımlılık sürümünü belirtme.   |
| Dal koruması          | Değişikliklerin korumalı dala girmesinden önce inceleme ve kontrol isteyen kurallar. |
| Denetim günlüğü       | Güvenlikle ilgili yönetim ve depo olaylarının kaydı.                                 |

## Teori

Güvenli iş akışı en az `permissions`, güvenilir eylemler, korumalı dallar ve incelenmiş iş akışı değişiklikleriyle başlar. Kuruluş politikası gerektirdiğinde üçüncü taraf eylemlerini incelenmiş bir commit SHA'ya sabitleyin; en azından bilinçli sürüm güncellemeleri kullanın ve eylem sahipliğini inceleyin. Üretim gizli bilgilerini korumalı ortamlara kapsamlandırın ve güvenilmeyen pull request koduna açmaktan kaçının.

Bağımlılık bakımı kilit dosyalarını, CodeQL'yi, Dependabot'u, güvenlik açığı yanıtını ve kullanılmayan paketlerin kaldırılmasını içerir. Operasyonel kontroller ortam onaylarını, eşzamanlılığı, geri almayı, izlemeyi ve denetim günlüklerini kapsar. Bu kontroller birlikte çalışır: tarama sorunları bulur, dal koruması incelenmemiş değişiklikleri önler ve günlükler araştırmayı destekler.

### Uygulamalı Derinlemesine Savunma Örneği

```yaml
name: Secure delivery

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  verify:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run tests
        run: ./scripts/test.sh
      - name: Check dependencies
        run: ./scripts/audit-dependencies.sh

  deploy:
    needs: verify
    if: ${{ github.ref == 'refs/heads/main' }}
    permissions:
      contents: read
      deployments: write
    environment: production
    concurrency:
      group: production
      cancel-in-progress: false
    runs-on: ubuntu-latest
    steps:
      - name: Deploy reviewed artifact
        run: ./scripts/deploy.sh
```

İş akışı varsayılan olarak salt okunur izinler kullanır, dağıtım yetkisini yalnızca dağıtım işine verir ve üretim çalışmasını `main` ile sınırlar. Depo ayarları yine de dal korumasını ve ortam kurallarını uygulamalıdır.

## Kendiniz Deneyin

1. Bir iş akışını aşırı izinler ve güvenilmeyen girdiler açısından denetleyin.
2. Dal korumasının incelemeleri ve CI kontrollerini zorunlu kılıp kılmadığını kontrol edin.
3. Eylem başvurularını, bağımlılık güncelleme politikasını ve üretim ortamı kurallarını inceleyin.
4. Yakın tarihli bir iş akışı veya izin değişikliğini bulmak için denetim günlüğünü kullanın.

## En İyi Uygulamalar

- En az ayrıcalığı, dal korumasını, korumalı ortamları ve zorunlu kontrolleri birleştirin.
- Eylemleri sabitleyin veya bilinçli olarak sürümleyin; benimsemeden önce değişiklikleri inceleyin.
- Gizli bilgileri günlüklerden ve güvenilmeyen kod yollarından uzak tutun.
- CodeQL ve Dependabot çalıştırın, sonra bulguları ve güncellemeleri inceleyin.
- Denetim günlüklerini saklayın ve olay yanıtı ile geri alma prosedürlerini belgeleyin.

## Yaygın Hatalar

| Hata                                   | Neden sorun oluşturur                                      | Nasıl önlenir                                     |
| -------------------------------------- | ---------------------------------------------------------- | ------------------------------------------------- |
| Tek bir güvenlik tarayıcısına güvenmek | Kaçırılan riskler korunmasız kalır.                        | Derinlemesine savunma kullanın.                   |
| `write-all` izinleri vermek            | Ele geçirilmiş bir adım daha fazla kaynağı değiştirebilir. | İşe özel en az izinleri belirleyin.               |
| Kodu koruyup ortamları korumamak       | İncelenmiş bir değişiklik yine de güvensiz dağıtılabilir.  | Üretim ortamlarını ve kimlik bilgilerini koruyun. |
| Bağımlılıkları sabit saymak            | Sürümden sonra yeni güvenlik açıkları ortaya çıkar.        | Sürekli izleyin, güncelleyin ve denetleyin.       |

## Özet

- Güvenli teslimat teknik ve yönetişim kontrollerini birleştirir.
- En az ayrıcalık, sabitleme, korumalı ortamlar, dal koruması, denetim günlükleri ve bağımlılık bakımı birbirini güçlendirir.
- Güvenlik kontrolleri sürekli incelenmeli, test edilmeli ve iyileştirilmelidir.

## İlgili Bağlantılar

- Önceki bölüm: [Dependabot](44-dependabot.md)
- Alıştırma: [Güvenli teslimat iş akışını denetleme](../../exercises/tr/45-audit-a-secure-delivery-workflow.md)
- Lab: [Güvenlik kontrolleri incelemesi çalıştırma](../../labs/tr/45-run-a-security-controls-review.md)
- Quiz: [Güvenlik en iyi uygulamaları quiz'i](../../quizzes/tr/45-security-best-practices-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
