---
chapter: 32
title: "GitHub Actions Runner'ları"
part: "GitHub Actions"
level: Beginner
estimated_time: 70 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Notebook](31-github-actions-jobs-and-steps.md) | [Alıştırma](../../exercises/tr/32-select-github-runners.md) | [Laboratuvar](../../labs/tr/32-configure-runner-selection.md) | [Kısa Sınav](../../quizzes/tr/32-github-runners-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- GitHub-hosted ve self-hosted runner'ları karşılaştırmak;
- runner'ları etiketlerle seçmek ve runner gruplarını anlamak;
- runner kullanmadan önce güveni, yalıtımı, bakımı ve secret açığa çıkmasını değerlendirmek.

## Giriş

Runner, bir job'u çalıştıran makinedir. Runner seçimi işletim sistemi uyumluluğunu, kullanılabilir araçları, başlatma süresini, maliyeti, ağ erişimini ve güvenilmeyen workflow kodunun etki alanını etkiler.

## Temel Terimler

| Terim                | Tanım                                                                      |
| -------------------- | -------------------------------------------------------------------------- |
| GitHub-hosted runner | GitHub tarafından bir job için yönetilen geçici sanal makine.              |
| Self-hosted runner   | Bir kuruluş veya depo tarafından kaydedilen ve bakımı yapılan makine.      |
| Etiket               | `runs-on` tarafından kullanılan yetenek veya yönlendirme etiketi.          |
| Runner grubu         | Hangi depoların runner'ları kullanabileceğini kontrol eden yönetim sınırı. |
| Güven sınırı         | Kod veya kimliklerin başka bir ortama erişim kazandığı nokta.              |

## Teori

### Barındırılan Runner'lar

Barındırılan runner'lar temiz, geçici makineler ve belgelenmiş image setleri sağlar. Genel araçlar ve sıradan derleme job'ları için kullanışlıdır. Workflow kodu kendisine verilen izinlerle çalıştığı için job yine de depo içeriğini ve pull request kodunu dikkatle ele almalıdır.

### Self-hosted Runner'lar

Self-hosted runner'lar özel ağlar, uzman donanım, özel araçlar veya öngörülebilir ortamlar için kullanışlıdır. Patch uygulama, erişim kontrolü, izleme, temizlik ve kapasite yönetimi gerektirir. Kalıcı bir runner job sonrasında dosya veya kimlik bilgilerini saklayabilir; bu nedenle yalıtım görsel bir tercih değil, güvenlik gereğidir.

### Etiketler ve Gruplar

```yaml
jobs:
  integration:
    runs-on: [self-hosted, linux, integration]
    steps:
      - uses: actions/checkout@v4
      - run: ./scripts/run-integration-tests.sh
```

Dizideki her etiket seçilen runner ile eşleşmelidir. Etiketler yetkilendirmeyi değil yeteneği açıklar. Hassas makinelerde job'ları kimin çalıştırabileceğine runner grupları ve depo politikasıyla karar verin.

### Güven Kararları

Fork pull request'lerini veya incelenmemiş dış kodu üretim ağlarına ya da uzun ömürlü secret'lara erişen self-hosted runner'a göndermeyin. Güvenilmeyen girdiler için barındırılan runner'ları, yalıtılmış geçici makineleri veya onay kapısını tercih edin.

## En İyi Uygulamalar

- Açık bir gereksinim self-hosting'i haklı çıkarmadıkça barındırılan runner'larla başlayın.
- Self-hosted runner'ları mümkün olduğunca patch'li, gözlemlenebilir ve kullanılabilir durumda tutun.
- Test edilmiş yetenekleri açıklayan belirli etiketler kullanın.
- Güvenilir dağıtım runner'larını genel derleme runner'larından ayırın.
- Workflow tetikleyicilerini ve izinlerini runner yerleşimiyle birlikte inceleyin.

## Yaygın Hatalar

| Hata                                                 | Etki                                                    | Daha iyi yaklaşım                                    |
| ---------------------------------------------------- | ------------------------------------------------------- | ---------------------------------------------------- |
| `self-hosted`'ı zararsız bir etiket sanmak           | Hassas job'lar kalıcı bir makineye ulaşabilir.          | Özel gruplar ve etiketler kullanın.                  |
| Araçları kayıt olmadan elle kurmak                   | Derlemelerin yeniden üretilmesi zorlaşır.               | Runner hazırlamasını otomatikleştirin ve belgeleyin. |
| Güvenilmeyen koddan sonra runner'ı yeniden kullanmak | Dosya veya kimlik bilgileri job'lar arasında sızabilir. | Yalıtım ve temizlik ya da geçici runner kullanın.    |

## Özet

Runner seçimi hem yürütme hem güvenlik kararıdır. Etiketler işi yönlendirir, gruplar erişimi kısıtlar ve güven analizi job'un barındırılan, yalıtılmış veya self-hosted bir runner'a ait olup olmadığını belirler.

### İlgili İçerik

- Önceki notebook: [GitHub Actions Job'ları ve Step'leri](31-github-actions-jobs-and-steps.md)
- Alıştırma: [GitHub Runner'larını Seç](../../exercises/tr/32-select-github-runners.md)
- Laboratuvar: [Runner Seçimini Yapılandır](../../labs/tr/32-configure-runner-selection.md)
- Kısa Sınav: [GitHub Actions Runner'ları Kısa Sınavı](../../quizzes/tr/32-github-runners-quiz.md)
