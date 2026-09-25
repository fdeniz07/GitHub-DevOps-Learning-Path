---
chapter: 30
title: "GitHub Actions için YAML Temelleri"
part: "GitHub Actions"
level: Beginner
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](27-gitlab-devsecops-security-scans-and-compliance.md) | [Alıştırma](../../exercises/tr/30-practice-github-actions-yaml.md) | [Laboratuvar](../../labs/tr/30-build-a-valid-actions-workflow.md) | [Kısa Sınav](../../quizzes/tr/30-yaml-fundamentals-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- YAML haritalarını, listelerini, skalerlerini ve yorumlarını birbirinden ayırmak;
- iç içe GitHub Actions yapılandırmasını ifade etmek için girinti kullanmak;
- yaygın YAML hatalarını workflow çalışmasına ulaşmadan önce tanımak;
- temel GitHub Actions ifadelerini okumak ve onları YAML yapısından ayrı tutmak.

## Giriş

YAML, insan tarafından okunabilir bir veri serileştirme biçimidir. GitHub Actions workflow'ları açıklamak için YAML kullanır; bu nedenle boşluklar ve noktalama işaretleri yapılandırmanın anlamının parçasıdır. Bir dosya görsel olarak makul görünebilir, ancak amaçlanandan farklı bir yapıya ayrıştırılabilir.

## Temel Terimler

| Terim   | Anlam                                                  |
| ------- | ------------------------------------------------------ |
| Map     | `key: value` biçiminde yazılan anahtar-değer çiftleri. |
| Liste   | Girdileri `-` ile başlayan sıralı koleksiyon.          |
| Skaler  | String, sayı veya boolean gibi tek bir değer.          |
| Girinti | Ebeveyn-çocuk yapısını ifade eden baştaki boşluklar.   |
| İfade   | `${{ ... }}` ile yazılan bir Actions değeri.           |

## Teori

### Haritalar ve Listeler

Haritalar adlandırılmış özellikleri açıklar:

```yaml
job:
  runs-on: ubuntu-latest
  timeout-minutes: 10
```

Listeler sıralı girdileri açıklar:

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v4
  - name: Test
    run: ./scripts/test.sh
```

İki step liste öğesidir. Her öğe kendi özellik haritasını içerir. Girinti, `name`, `uses` ve `run` ifadelerinin belge köküne değil öğeye ait olduğunu gösterir.

### Girinti

Boşlukları tutarlı kullanın. YAML iç içe yapıyı göstermek için süslü parantez kullanmaz; standart YAML'da tab karakterleri geçerli girinti değildir. Aşağıdaki örnekte `branches`, `push` öğesine aittir:

```yaml
on:
  push:
    branches:
      - main
```

Girintiyi değiştirmek `branches` öğesini farklı bir ebeveyne taşıyabilir veya parser hatası oluşturabilir.

### Skalerler, Tırnaklar ve Yorumlar

String'ler düz veya tırnak içinde olabilir. Noktalama işaretleri ya da YAML anahtar kelimeleri amaçlanan türü belirsizleştirebilecekse değerleri tırnak içine alın. Tırnak içindeki bir string'in içinde değilse `#` bir yorum başlatır:

```yaml
name: "Build #1"
timeout-minutes: 10
# This comment explains the validation boundary.
```

Gerekli workflow yapılandırmasını yorumlarda gizlemeyin. Yorumlar inceleyene yardımcı olur; Actions'ı yapılandırmaz.

### İfadeler

GitHub Actions ifadeleri YAML değerlerine gömülür:

```yaml
if: ${{ github.ref == 'refs/heads/main' }}
```

Map anahtarı `if`; ifade onun skaler değeridir. İfadeler context'leri ve fonksiyonları okuyabilir, ancak YAML girintisinin yerini tutmaz. `run` komutları yazarken kabuk interpolasyonu ile Actions ifadelerini birbirinden ayırın.

## Uygulamalı Örnek

Bu geçerli workflow map'leri, listeleri, bir yorumu ve bir ifadeyi birleştirir:

```yaml
name: YAML practice
on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout source
        uses: actions/checkout@v4
      - name: Run validation on the default branch
        if: ${{ github.ref == 'refs/heads/main' }}
        run: echo "Validation branch is main"
```

Workflow map'i liste benzeri bir `on` yapılandırması ve bir `jobs` map'i içerir. `steps` listesi iki map içerir. İkinci step, ref `main` olmadığında atlanır; workflow yine de yapılandırılmış diğer olaylar için başlayabilir.

## Kendiniz Deneyin

1. Satır içi `branches: [main]` listesini blok listesine dönüştürün.
2. Ebeveyn girintisini değiştirmeden ikinci bir branch ekleyin.
3. Hem `uses` hem de `run` içeren bir step ekleyin ve bir step'in neden normalde tek bir yürütme mekanizması seçmesi gerektiğini açıklayın.
4. Her girinti seviyesini iki boşlukla işaretleyin ve ortaya çıkan hiyerarşiyi karşılaştırın.

## En İyi Uygulamalar

- Seviye başına iki boşluk kullanın ve girinti için asla tab kullanmayın.
- İnceleyenlerin sahipliği görebilmesi için map ve listeleri görsel olarak hizalı tutun.
- Belirsiz string'leri tırnak içine alın ve yorumları kısa ve yararlı tutun.
- Bir Actions çalışma zamanı hatasını araştırmadan önce YAML yapısını doğrulayın.

## Yaygın Hatalar

| Hata                                                   | Soruna neden olma şekli                             | Kaçınma yolu                                             |
| ------------------------------------------------------ | --------------------------------------------------- | -------------------------------------------------------- |
| Girinti için tab kullanmak                             | YAML parser'ları dosyayı reddedebilir.              | Editörü boşluk ekleyecek şekilde yapılandırın.           |
| Liste öğesini yanlış hizalamak                         | Step veya tetikleyici yanlış anahtarın çocuğu olur. | Her `-` işaretini ebeveyn anahtarıyla karşılaştırın.     |
| İfade sözdizimi olmadan `if: github.ref == ...` yazmak | Değer amaçlandığı gibi değerlendirilmeyebilir.      | İfadeler için belgelenen `${{ ... }}` biçimini kullanın. |
| Tırnak dışında `#` işaretini veri sanmak               | Kalan metin yorum olur.                             | Değişmez `#` içeren değerleri tırnak içine alın.         |
| Satır içi ve blok stillerini dikkatsizce karıştırmak   | Ortaya çıkan yapıyı incelemek zorlaşır.             | Her küçük koleksiyon için en açık stili seçin.           |

## Özet

YAML, Actions yapılandırmasını girintiye dayalı map ve listelerle temsil eder. İfadeler bu yapı içindeki değerlerdir. Tutarlı boşluklar, açık iç içelik ve bilinçli tırnak kullanımı, workflow başlamadan önce birçok hatayı önler.

### İlgili İçerik

- Alıştırma: [GitHub Actions YAML'ını Uygula](../../exercises/tr/30-practice-github-actions-yaml.md)
- Laboratuvar: [Geçerli Bir Actions Workflow'u Oluştur](../../labs/tr/30-build-a-valid-actions-workflow.md)
- Kısa Sınav: [YAML Temelleri Kısa Sınavı](../../quizzes/tr/30-yaml-fundamentals-quiz.md)
