---
chapter: 36
title: "GitHub Actions Matrix Derlemeleri"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](35-composite-actions.md) | [Alıştırma](../../exercises/tr/36-test-a-matrix-workflow.md) | [Laboratuvar](../../labs/tr/36-run-a-multi-platform-matrix.md) | [Kısa Sınav](../../quizzes/tr/36-matrix-builds-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- bir matrix'in tek bir job'u çeşitli kombinasyonlara nasıl genişlettiğini açıklamak;
- desteklenen kombinasyonları modellemek için `include` ve `exclude` kullanmak;
- uygun bir `fail-fast` politikası seçmek;
- step'lerde matrix değerlerini okumak ve sonuçları anlaşılır tutmak.

## Giriş

Matrix job'ları aynı workflow mantığını tanımlı sürümler, işletim sistemleri veya yapılandırmalar üzerinde test eder. Tekrarlanan YAML'ı azaltırlar, ancak her kombinasyon kendi logları, maliyeti, izinleri ve olası hatası olan gerçek bir job'dur.

## Temel Terimler

| Terim       | Anlam                                                                                                         |
| ----------- | ------------------------------------------------------------------------------------------------------------- |
| Matrix      | Job kombinasyonları oluşturmak için kullanılan boyutlar kümesi.                                               |
| Kombinasyon | Bir job olarak yürütülen somut matrix değerleri kümesi.                                                       |
| `include`   | Bir matrix'e değerler veya özel kombinasyonlar ekler.                                                         |
| `exclude`   | Desteklenmeyen veya gereksiz kombinasyonları kaldırır.                                                        |
| `fail-fast` | Bir hata sonrasında kuyruğa alınmış veya çalışan matrix job'larının iptal edilip edilmeyeceğini kontrol eder. |

## Teori

### Kartezyen Çarpım

Bir matrix'te üç işletim sistemi ve iki çalışma zamanı sürümü varsa başlangıçta altı kombinasyon üretir. Bu bir Kartezyen çarpımdır: bir boyuttaki her değer diğer boyuttaki her değerle eşleştirilir. Boyutları yalnızca anlamlı ve desteklenen kombinasyonlar olduğunda kullanın.

```yaml
strategy:
  fail-fast: false
  matrix:
    os: [ubuntu-latest, windows-latest]
    python: ["3.11", "3.12"]
    exclude:
      - os: windows-latest
        python: "3.11"
```

Değerlere `${{ matrix.os }}` ve `${{ matrix.python }}` gibi ifadelerle erişin. Bir job `runs-on` için `matrix.os` kullanabilir; bir step ise kurulum için çalışma zamanı değerini kullanabilir.

### Include ve Özel Durumlar

`include`, eşleşen kombinasyonlara metadata ekleyebilir veya yeni bir kombinasyon ekleyebilir:

```yaml
matrix:
  os: [ubuntu-latest, windows-latest]
  node: [20, 22]
  include:
    - os: ubuntu-latest
      node: 22
      coverage: true
  exclude:
    - os: windows-latest
      node: 20
```

Eklenen değer, kazara oluşan bir uyumsuzluğu gizlemek yerine desteklenen bir istisnayı açıklamalıdır. Genişletilmiş kombinasyonları workflow çalışmasında inceleyin.

### Fail-Fast Seçimi

Varsayılan `fail-fast: true`, bir kombinasyon bütün testi geçersiz kıldığında runner zamanından tasarruf sağlayabilir. Her işletim sistemi veya çalışma zamanı sonucu tanılama için değerliyse `false` olarak ayarlayın. Deneysel bir kombinasyonu eklenen bir değer üzerinden `continue-on-error` ile de işaretleyebilirsiniz; bunu görünür yapın ve neden engelleyici olmadığını açıklayın.

## Uygulamalı Örnek

```yaml
jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      fail-fast: false
      matrix:
        os: [ubuntu-latest, windows-latest]
        version: ["3.11", "3.12"]
        exclude:
          - os: windows-latest
            version: "3.11"
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: ${{ matrix.version }}
      - run: python --version
```

Bu workflow üç job oluşturur. Her job işletim sistemini ve Python sürümünü ayrı ayrı raporlar.

## En İyi Uygulamalar

- Matrix'i desteklenen kombinasyonlarla sınırlı tutun.
- Platformlar arası kanıt önemliyse `fail-fast: false` kullanın.
- Karışıklığı önlemek için log ve artifact'leri matrix değerleriyle etiketleyin.
- Açık istisnalar için `include` kullanın ve neden var olduklarını belgeleyin.
- Boyut eklemeden önce runner maliyetini ve kuyruk süresini değerlendirin.

## Yaygın Hatalar

| Hata                              | Etki                                       | Düzeltme                                     |
| --------------------------------- | ------------------------------------------ | -------------------------------------------- |
| Mümkün olan her sürümü eklemek    | Yavaş, pahalı ve gürültülü çalışmalar.     | Gerekçeli bir destek politikasını test edin. |
| Bir ifadede `matrix.` unutmak     | Değer çözümlenmez.                         | `${{ matrix.dimension }}` kullanın.          |
| Fail-fast'i körü körüne kullanmak | Yararlı tanılama job'ları iptal edilir.    | Politikayı bilinçli seçin.                   |
| Yanlış kombinasyonu dışlamak      | Desteklenen bir platform hiç test edilmez. | Genişletilmiş matrix'i inceleyin.            |

## Özet

Matrix derlemeleri tek bir job tanımını kontrollü kombinasyonlara dönüştürür. `include` ve `exclude` istisnaları ifade eder; `fail-fast` ise hız ile tanılama kapsamını dengeler.

### İlgili İçerik

- Önceki bölüm: [Composite Action'lar](35-composite-actions.md)
- Alıştırma: [Bir Matrix Workflow'unu Test Et](../../exercises/tr/36-test-a-matrix-workflow.md)
- Laboratuvar: [Çok Platformlu Bir Matrix Çalıştır](../../labs/tr/36-run-a-multi-platform-matrix.md)
- Kısa Sınav: [Matrix Derlemeleri Kısa Sınavı](../../quizzes/tr/36-matrix-builds-quiz.md)
