---
chapter: 37
title: "GitHub Actions Bağımlılık Önbellekleme"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki bölüm](36-github-actions-matrix-builds.md) | [Alıştırma](../../exercises/tr/37-design-a-safe-dependency-cache.md) | [Laboratuvar](../../labs/tr/37-optimize-a-safe-cache-strategy.md) | [Kısa Sınav](../../quizzes/tr/37-dependency-caching-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- bağımlılık önbelleklemenin ne yaptığını ve neyi garanti etmediğini açıklamak;
- yararlı restore key'lerle kararlı cache key'leri tasarlamak;
- eski, branch'ler arası veya güvenilmeyen cache verilerinden kaçınmak;
- cache'in workflow'u iyileştirip iyileştirmediğini ölçmek.

## Giriş

Bağımlılık kurulumu CI süresinin çoğunu tüketebilir. Bir cache, yeniden kullanılabilir package-manager verilerini workflow çalışmaları arasında saklar; böylece sonraki çalışma değişmemiş bağımlılıkları indirmekten kaçınabilir. Cache bir optimizasyondur, doğruluk kaynağı değildir: lockfile ve package manager bağımlılık kümesini yine doğrulamalıdır.

## Temel Terimler

| Terim           | Anlam                                                                                   |
| --------------- | --------------------------------------------------------------------------------------- |
| Cache key       | Kaydedilmiş bir cache'i bulmak için kullanılan kesin tanımlayıcı.                       |
| Restore key     | Kesin key bulunamadığında eski uyumlu cache'i aramak için kullanılan prefix.            |
| Cache path      | Yeniden kullanılabilecek verileri içeren dizin.                                         |
| Cache hit       | Eşleşen bir cache'in geri yüklenmesi.                                                   |
| Cache poisoning | Güvenilmeyen verinin cache'e eklenmesi ve daha sonra güvenilir veri olarak tüketilmesi. |

## Teori

### Key Tasarımı

Yararlı bir key işletim sistemini, çalışma zamanını, bağımlılık yöneticisini ve lockfile hash'ini içerir. Matrix job için cache içeriğini değiştiren matrix boyutlarını ekleyin. Örnek:

```yaml
key: ${{ runner.os }}-npm-${{ hashFiles('**/package-lock.json') }}
restore-keys: |
  ${{ runner.os }}-npm-
```

Kesin key net bir hit sağlar. Restore prefix'i daha eski bir cache döndürebilir; bu zaman kazandırabilir, ancak yeni kurulumu veya lockfile doğrulamasını atlamamalıdır.

### Güvenli Cache İçeriği

Mümkünse package-manager indirme verilerini cache'leyin. Kimlik bilgilerini, oluşturulan secret'ları, dağıtım çıktılarını veya rastgele workspace durumunu cache'lemekten kaçının. Bir job'dan diğerine veri geçirmek için cache kullanmayın; job sınırlarında artifact veya açık çıktılar kullanılmalıdır.

### Setup Action ile Örnek

Birçok setup action package-manager cache seçeneği sunar:

```yaml
- uses: actions/setup-node@v4
  with:
    node-version: 22
    cache: npm
- run: npm ci
```

Setup action, package manager için cache path'i ve lockfile key'ini türetir. Kurulum komutu yetkili kaynak olmaya devam eder ve `npm ci` gibi lockfile'ı zorlayan bir mod kullanmalıdır.

Açık denetim için cache action'ını kullanın:

```yaml
- uses: actions/cache@v4
  with:
    path: ~/.cache/pip
    key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.lock') }}
    restore-keys: |
      ${{ runner.os }}-pip-
- run: python -m pip install -r requirements.lock
```

### Cache Güvenliği ve Kapsamı

Cache'ler platform kurallarına ve key kapsamına göre paylaşılır. Güvenilmeyen bir fork'tan gelen pull request, ayrıcalıklı bir workflow'un daha sonra güveneceği veriyi yazamamalıdır. Bir cache'i çalıştırılabilir kaynağı, action kodunu veya kimlik bilgilerini geçersiz kılabilecek bir konuma asla geri yüklemeyin. Hassas workflow'lar için dar key'ler, güvenilir branch'ler veya hiç cache kullanmama seçeneğini tercih edin.

## En İyi Uygulamalar

- Cache'lenen bağımlılık kümesini kontrol eden her lockfile'ı hash'leyin.
- Etkiliyorsa matrix boyutlarını ekleyin.
- Herhangi bir cache'i geri yükledikten sonra lockfile'dan kurulum yapın.
- Risk anlaşılmadıkça secret veya derleme çıktısı yerine indirmeleri cache'leyin.
- Bir cache'i sürdürmeden önce hit oranlarını ve süreyi karşılaştırın.

## Yaygın Hatalar

| Hata                                       | Risk                                          | Düzeltme                                                          |
| ------------------------------------------ | --------------------------------------------- | ----------------------------------------------------------------- |
| Yalnızca işletim sistemiyle key oluşturmak | Uyumsuz bağımlılıklar yeniden kullanılabilir. | Lockfile'ları hash'leyin ve çalışma zamanı ayrıntılarını ekleyin. |
| Restore-key verisini güncel sanmak         | Eski paketlerin tamamlandığı varsayılabilir.  | Normal lockfile kurulumunu çalıştırın.                            |
| `.env` veya kimlik bilgilerini cache'lemek | Secret'lar paylaşılan depolamada kalabilir.   | Hassas path'leri dışlayın.                                        |
| Job sınırını geçmek için cache kullanmak   | Veri akışı belirsiz ve güvensiz olur.         | Artifact veya job çıktıları kullanın.                             |

## Özet

Cache'leme tekrar eden indirmeleri azaltır, ancak paket kurulumu ve lockfile doğrulaması doğruluğun kaynağı olmaya devam eder. Kesin key'ler doğruluk, restore key'ler kontrollü geri dönüş sağlar. Yalnızca yeniden kullanılması güvenli verileri cache'leyin.

### İlgili İçerik

- Önceki bölüm: [Matrix Derlemeleri](36-github-actions-matrix-builds.md)
- Alıştırma: [Güvenli Bir Bağımlılık Cache'i Tasarla](../../exercises/tr/37-design-a-safe-dependency-cache.md)
- Laboratuvar: [Güvenli Bir Cache Stratejisini İyileştir](../../labs/tr/37-optimize-a-safe-cache-strategy.md)
- Kısa Sınav: [Bağımlılık Önbellekleme Kısa Sınavı](../../quizzes/tr/37-dependency-caching-quiz.md)
