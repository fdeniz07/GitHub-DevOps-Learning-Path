---
chapter: 29
title: "GitHub Actions Workflow Anatomisi"
part: "GitHub Actions"
level: Beginner
estimated_time: 85 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](27-gitlab-devsecops-security-scans-and-compliance.md) | [Alıştırma](../../exercises/tr/29-trace-a-github-actions-workflow.md) | [Laboratuvar](../../labs/tr/29-review-workflow-execution.md) | [Kısa Sınav](../../quizzes/tr/29-workflow-anatomy-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- bir GitHub Actions workflow'unun üst düzey yapısını okumak;
- tetikleyicilerin, izinlerin, job'ların ve step'lerin ilişkisini açıklamak;
- bir workflow'u event'ten job'a ve tek tek step'lerine kadar izlemek;
- sonraki bölümlerin runner, action ve job ayrıntılarını nereye ekleyeceğini belirlemek.

## Giriş

Bir workflow, ilgisiz komutlar listesi değil, yapılandırılmış bir belgedir. Üst düzey anahtarları workflow'un kimliğini, başlangıç koşullarını, erişimini ve işini açıklar. Bu yapıyı dıştan içe okumak, hataların yerini bulmayı kolaylaştırır.

## Temel Terimler

| Terim             | Anlam                                                                        |
| ----------------- | ---------------------------------------------------------------------------- |
| Üst düzey anahtar | `name` veya `jobs` gibi doğrudan workflow belgesinin kökü altındaki anahtar. |
| Tetikleyici       | Olayları ve isteğe bağlı filtreleri seçen `on` tanımı.                       |
| Job tanımlayıcısı | `jobs` altındaki bir iş birimini adlandıran benzersiz anahtar.               |
| Runner etiketi    | Yürütme ortamını seçen `runs-on` değeri.                                     |
| Bağımlılık        | Bir job'u `needs` ile diğerini bekleten ilişki.                              |

## Teori

### Workflow Şekli

```yaml
name: Validate application
on:
  pull_request:
permissions:
  contents: read
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: ./scripts/test.sh
```

`name`, Actions arayüzünde workflow'u etiketler. `on` olayları seçer. `permissions` token erişimini belirler. `jobs`, bir veya daha fazla job haritası içerir. Her job bir runner seçer ve sıralı bir `steps` listesi tanımlar.

### Tetikleyiciler ve Filtreler

Tetikleyiciler `workflow_dispatch` gibi basit olabilir veya filtreli haritalar olabilir:

```yaml
on:
  push:
    branches: [main]
    paths:
      - "src/**"
  pull_request:
    branches: [main]
```

Filtreler gereksiz çalışmaları azaltır, ancak geri bildirimin ne zaman görüneceğini de değiştirir. Bir yapılandırma dosyasını dışlayan path filtresi, ilgili bir değişikliğin doğrulamadan kaçmasına izin verebilir. Bir filtrenin oluşturduğu sınırı her zaman açıklayın.

### Job ve Step'lere Genel Bakış

Job'lar ayrı yürütme birimleridir. Bağımlılık olmadığında job'lar paralel çalışabilir. `needs: build`, sonraki job'un `build` job'unu beklemesini sağlar. Bir job içindeki step'ler sırayla çalışır ve job workspace'ini paylaşır. Bir step action kullanabilir veya komut çalıştırabilir; ayrıca ortam değişkenleri, çalışma dizini ya da koşul tanımlayabilir.

### İfadeler ve Bağlamlar

İfadeler, event verileri gibi değerleri okumak için `${{ ... }}` biçimini kullanır:

```yaml
if: ${{ github.event_name == 'pull_request' }}
```

İfadeler Actions tarafından değerlendirilir, YAML ise çevredeki yapıyı sağlar. İfadeleri okunabilir tutun ve güvenilmeyen event metnini doğrudan kabuk komutlarına yerleştirmekten kaçının.

## Uygulamalı Örnek

Açıklamayı okumadan önce bu workflow'u kağıt üzerinde izleyin:

```yaml
name: Review gate
on:
  pull_request:
    branches: [main]
permissions:
  contents: read
jobs:
  inspect:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      - name: Inspect files
        run: git ls-files
  report:
    needs: inspect
    runs-on: ubuntu-latest
    steps:
      - name: Report completion
        run: echo "Inspection completed"
```

Yalnızca `main` hedefine yönelen pull request'ler workflow'u başlatır. `inspect` önce başlar. `report`, `inspect` başarılı olana kadar bekler ve sonra ayrı bir job runner'ında çalışır. Checkout step'i `report` ile otomatik olarak paylaşılmaz; ayrı job'lar depo dosyalarına ihtiyaç duyduğunda kendi kurulumlarına sahip olmalıdır.

## Kendiniz Deneyin

Workflow'un üst düzey anahtarlarını listeleyin ve şu soruları yanıtlayın: Hangi event onu başlatır, hangi izin verilir, hangi job önce çalışır ve ikinci job neden bekler? Son olarak her satırı YAML yapısı, action referansı, kabuk komutu veya ifade olarak işaretleyin.

## En İyi Uygulamalar

- Workflow'ları üst düzey amaçtan tek tek komutlara doğru okuyun.
- Tesadüfi zamanlamaya güvenmek yerine job sırasını açıkça belirtmek için `needs` kullanın.
- Job'lar yalıtılmış yürütme ortamlarına sahip olduğundan gereken kurulumu her job'da tekrarlayın.
- Depo yolları veya branch politikası değiştiğinde tetikleyici filtrelerini inceleyin.

## Yaygın Hatalar

| Hata                                                   | Soruna neden olma şekli                                    | Kaçınma yolu                                                               |
| ------------------------------------------------------ | ---------------------------------------------------------- | -------------------------------------------------------------------------- |
| Job'ların dosyaları otomatik paylaştığını varsaymak    | Job'lar normalde ayrı runner'larda çalışır.                | Gerekli veriyi her job'da checkout edin veya aktarın.                      |
| `needs` ifadesini step bağımlılığı sanmak              | `needs` job'ları bağlar, step'leri değil.                  | Step sırasını `steps` içinde, job sırasını `needs` altında tutun.          |
| Kısa bir dosyanın arkasında geniş tetikleyici saklamak | İnceleyenler otomasyonun ne zaman çalıştığını kaçırabilir. | Filtreleri açık adlar ve odaklı yapıyla belgeleyin.                        |
| YAML ile ifade sözdizimini karıştırmak                 | Parser veya Actions değerlendiricisi yanlış değer alır.    | Girintiyi doğrulayın ve `${{ }}` ifadesini yalnızca gerektiğinde kullanın. |

## Özet

Workflow anatomisini anlamanın en kolay yolu şudur: `on`, `jobs`'ı başlatır; her job `runs-on` seçer; sıralı `steps` action veya komutları yürütür. İzinler ve ifadeler, bu temel şekli değiştirmeden denetim ekler.

### İlgili İçerik

- Alıştırma: [Bir GitHub Actions Workflow'unu İzle](../../exercises/tr/29-trace-a-github-actions-workflow.md)
- Laboratuvar: [Workflow Yürütmesini İncele](../../labs/tr/29-review-workflow-execution.md)
- Kısa Sınav: [Workflow Anatomisi Kısa Sınavı](../../quizzes/tr/29-workflow-anatomy-quiz.md)
