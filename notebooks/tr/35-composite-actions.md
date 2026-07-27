---
chapter: 35
title: "GitHub Actions Composite Action'ları"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](34-writing-custom-github-actions.md) | [Alıştırma](../../exercises/tr/35-build-a-reusable-composite-action.md) | [Laboratuvar](../../labs/tr/35-package-a-composite-action.md) | [Kısa Sınav](../../quizzes/tr/35-composite-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- bir composite action'ın ne zaman yararlı olduğunu açıklamak;
- action girdilerini, çıktılarını, metadata'sını ve shell step'lerini tanımlamak;
- yerel bir composite action'ı workflow'dan çağırmak;
- yeniden kullanılabilir ve güvenli action sınırları tasarlamak.

## Giriş

Bir composite action, birkaç sıradan workflow step'ini tek bir yeniden kullanılabilir arayüzün arkasında paketler. Birden fazla workflow aynı kurulum, doğrulama veya raporlama dizisini tekrarladığında kullanışlıdır. Action workflow'u okunabilir tutarken `action.yml` dosyası girdileri ve çıktıları belgeler.

## Temel Terimler

| Terim            | Anlam                                                       |
| ---------------- | ----------------------------------------------------------- |
| Composite action | Workflow step'leri dizisi olarak uygulanan action.          |
| Girdi            | Action'ı çağıran workflow'un sağladığı değer.               |
| Çıktı            | Action'ın sonraki step'lere döndürdüğü adlandırılmış değer. |
| Metadata dosyası | Action'ı açıklayan `action.yml` veya `action.yaml`.         |
| Yerel action     | Aynı depoda saklanan ve path ile referans verilen action.   |

## Teori

### Action Yapısı

Yerel bir action normalde kendi dizinine ve bir `action.yml` dosyasına sahiptir:

```text
.github/actions/report-context/
  action.yml
```

Metadata action adını, açıklamasını, girdilerini, çıktılarını ve `runs` yapılandırmasını bildirir. Composite action `runs.using: composite` kullanır ve her step'e açık bir `shell` verir.

### Girdiler ve Çıktılar

Girdiler, uygulamasını kopyalamadan tekrarlanan workflow dizisini yapılandırılabilir hale getirir. Girdilere yararlı açıklamalar ve güvenli varsayılan varsa varsayılan değerler verin. Çıktılar yalnızca kararlı ve bilinçli sonuçları açığa çıkarmalıdır. Bir step çıktıyı runner'ın `GITHUB_OUTPUT` dosyasına yazar; action bu step çıktısını public çıktı adıyla eşler.

### Örnek: Yerel Composite Action

```yaml
name: Report context
description: Show the selected runtime and expose a normalized label
inputs:
  runtime:
    description: Runtime name to report
    required: true
outputs:
  label:
    description: Normalized runtime label
    value: ${{ steps.label.outputs.value }}
runs:
  using: composite
  steps:
    - id: label
      shell: bash
      env:
        RUNTIME: ${{ inputs.runtime }}
      run: echo "value=${RUNTIME,,}" >> "$GITHUB_OUTPUT"
    - shell: bash
      env:
        RUNTIME: ${{ inputs.runtime }}
      run: echo "Using runtime: $RUNTIME"
```

Workflow action'ı göreli bir path ile çağırabilir ve çıktısını tüketebilir:

```yaml
- id: context
  uses: ./.github/actions/report-context
  with:
    runtime: python
- run: echo "Label: ${{ steps.context.outputs.label }}"
```

Daha sonraki ifadelerin çıktılara erişebilmesi için çağıran step'te `id` gereklidir.

### Sınırlar ve Güvenlik

Bir action'ı tek bir tekrarlanabilir sorumluluğa odaklayın. Değerleri güvenilmeyen string'lerden shell komutları oluşturarak geçirmek yerine `with` ve `env` üzerinden geçirin. Token'ları yazdırmaktan kaçının, çağıran workflow'da en az ayrıcalıklı izinleri kullanın ve üçüncü taraf action'larını incelenmiş referanslara sabitleyin. Composite action çağıranın izinlerini ve runner context'ini devralır; güvenlik sınırı oluşturmaz.

## Kendiniz Deneyin

1. Bir dizin girdisi kabul eden yerel bir action oluşturun.
2. Bu dizindeki dosyaları listeleyen ve dosya sayısını çıktı olarak sunan bir step ekleyin.
3. Action'ı bir workflow'dan çağırın ve çıktıyı yazdırın.

## En İyi Uygulamalar

- `action.yml` dosyasını küçük tutun ve her girdi ile çıktıyı belgeleyin.
- Shell verileri için ortam değişkenleri kullanın ve path'leri tırnak içine alın.
- İşe başlamadan önce gerekli girdileri doğrulayın.
- Action'ı kullanacağı runner türlerinde bir workflow'dan test edin.
- Yerel action'ları kod olarak değerlendirin: inceleyin, sürümleyin ve bilinçli değiştirin.

## Yaygın Hatalar

| Hata                                        | Soruna neden olma şekli                              | Kaçınma yolu                                              |
| ------------------------------------------- | ---------------------------------------------------- | --------------------------------------------------------- |
| `shell` belirtmemek                         | Composite step'leri açık bir shell gerektirir.       | Her `run` step'i için `shell` ayarlayın.                  |
| Çıktıyı yanlış dosyaya yazmak               | Sonraki step'ler boş çıktı alır.                     | `GITHUB_OUTPUT` dosyasına `name=value` ekleyin.           |
| Girdiyi doğrudan komuta gömmek              | Güvenilmeyen metin shell sözdizimini değiştirebilir. | Girdiyi tırnaklı bir ortam değişkeninden geçirin.         |
| Action'ın secret'ları yalıttığını varsaymak | Action çağıranın context'iyle çalışır.               | En az ayrıcalığı uygulayın ve secret çıktısından kaçının. |

## Özet

- Composite action'lar yeniden kullanılabilir workflow step'lerini paketler.
- Girdiler action'ı yapılandırır; çıktılar bilinçli sonuçları açığa çıkarır.
- `action.yml`, action'ın public sözleşmesidir.
- Yeniden kullanım tutarlılığı artırır, ancak workflow güvenlik kontrollerinin yerini tutmaz.

### İlgili İçerik

- Alıştırma: [Yeniden Kullanılabilir Bir Composite Action Oluştur](../../exercises/tr/35-build-a-reusable-composite-action.md)
- Laboratuvar: [Bir Composite Action Paketle](../../labs/tr/35-package-a-composite-action.md)
- Kısa Sınav: [Composite Action'lar Kısa Sınavı](../../quizzes/tr/35-composite-actions-quiz.md)
