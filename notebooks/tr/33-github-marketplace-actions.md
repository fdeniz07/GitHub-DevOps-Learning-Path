---
chapter: 33
title: "GitHub Marketplace Action'ları"
part: "GitHub Actions"
level: Intermediate
estimated_time: 80 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Notebook](32-github-runners.md) | [Alıştırma](../../exercises/tr/33-review-a-marketplace-action.md) | [Laboratuvar](../../labs/tr/33-harden-a-marketplace-action.md) | [Kısa Sınav](../../quizzes/tr/33-github-marketplace-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- Marketplace action'larının girdileri nasıl aldığını ve çıktıları nasıl sunduğunu açıklamak;
- action referanslarını incelenebilir bir commit'e sabitlemek ve güncelleme ödünleşimlerini değerlendirmek;
- bir action'ın izinlerini, kaynağını, bakımını, bağımlılıklarını ve veri işleme biçimini incelemek.

## Giriş

Marketplace action'ları yeniden kullanılabilir otomasyonu paketler. Tekrarlanan kodu azaltabilirler, ancak bir action workflow ortamınızda kod çalıştırır. Bir action'ı zararsız YAML süslemesi değil, tedarik zinciri incelemesi gerektiren üçüncü taraf bağımlılığı olarak değerlendirin.

## Temel Terimler

| Terim              | Tanım                                                                |
| ------------------ | -------------------------------------------------------------------- |
| Action referansı   | `uses:` sonrasında kullanılan sahip, depo ve ref.                    |
| Commit sabitlemesi | Kesin bir revizyonu seçmek için kullanılan değişmez commit SHA'sı.   |
| Girdi              | `with` aracılığıyla action'a geçirilen değer.                        |
| Çıktı              | Bir action'ın sonraki step'lere sunduğu adlandırılmış değer.         |
| Tedarik zinciri    | Yazılımı üreten kişiler, kod, bağımlılıklar, release'ler ve altyapı. |

## Teori

### Girdiler ve Çıktılar

```yaml
- id: metadata
  uses: actions/checkout@v4
  with:
    fetch-depth: 0
```

Girdiler action'a özeldir; adları tahmin etmek yerine action metadata'sını ve belgelerini okuyun. Çıktılar da action'a özeldir ve genellikle bir `id` atandıktan sonra `steps.metadata.outputs.<name>` üzerinden tüketilir.

### Tekrarlanabilirlik için Sabitleme

`@v4` gibi bir major etiket uyumlu güncellemeler alır, ancak zaman içinde değişebilir. Tam commit SHA kesin bir revizyon seçer ve tekrarlanabilir incelemeyi destekler:

```yaml
- uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683
```

Bir sabitleme yalnızca SHA'nın amaçlanan upstream release'e ait olduğu doğrulanırsa faydalıdır. Güncelleme önerilerini otomatikleştirin ve sabitlemeleri sessizce değiştirmek yerine diff'lerini inceleyin.

### Tedarik Zinciri İncelemesi

Kullanmadan önce kaynağı ve `action.yml` dosyasını, release geçmişini, bakımcıları, izinleri, üçüncü taraf bağımlılıklarını, kurulum davranışını, ağ erişimini ve secret işleme biçimini inceleyin. Action yalnızca ihtiyaç duyduğu izinleri almalı ve workflow hassas değerleri güvenilmeyen action koduna açığa çıkarmamalıdır.

## En İyi Uygulamalar

- Kaynağı ve release geçmişi şeffaf, bakımı iyi yapılan action'ları tercih edin.
- Üretim action'larını doğrulanmış commit SHA'larına sabitleyin veya onaylı kuruluş politikası kullanın.
- Bir action'a neden güvenildiğini ve güncellemelerin nasıl incelendiğini belgeleyin.
- Yalnızca gerekli girdileri ve izinleri geçirin.
- Geniş kullanımdan önce küçük bir workflow'da çıktı davranışını ve hata yönetimini test edin.

## Yaygın Hatalar

| Hata                                            | Risk                                             | Daha iyi yaklaşım                                          |
| ----------------------------------------------- | ------------------------------------------------ | ---------------------------------------------------------- |
| Metadata'yı okumadan action'ı kopyalamak        | Girdiler veya izinler yanlış olabilir.           | Önce metadata'yı ve kaynağı inceleyin.                     |
| Kritik workflow'da değişebilir etikete güvenmek | Davranış yerel diff olmadan değişebilir.         | Sabitleyin ve güncellemeleri inceleyerek otomatikleştirin. |
| Action'a geniş `GITHUB_TOKEN` izinleri vermek   | Ele geçirmenin etki alanı büyür.                 | En az ayrıcalıklı izinleri ayarlayın.                      |
| Popülerliği güvenlik incelemesi sanmak          | Popüler kodun da riskli bağımlılıkları olabilir. | Provenance, kaynak ve davranışı inceleyin.                 |

## Özet

Marketplace action'ları çalıştırılabilir bağımlılıklardır. Girdiler ve çıktılar arayüzlerini tanımlar, commit sabitlemeleri tekrarlanabilirliği artırır ve tedarik zinciri incelemesi gizli riskleri sınırlar.

### İlgili İçerik

- Önceki notebook: [GitHub Actions Runner'ları](32-github-runners.md)
- Alıştırma: [Bir Marketplace Action'ını İncele](../../exercises/tr/33-review-a-marketplace-action.md)
- Laboratuvar: [Bir Marketplace Action'ını Güçlendir](../../labs/tr/33-harden-a-marketplace-action.md)
- Kısa Sınav: [GitHub Marketplace Action'ları Kısa Sınavı](../../quizzes/tr/33-github-marketplace-actions-quiz.md)
