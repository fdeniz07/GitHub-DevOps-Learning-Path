---
chapter: 39
title: "Sürekli Entegrasyon"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Beginner
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](38-github-actions-artifacts.md) | [Yol Haritası](../../ROADMAP.md) | [Sonraki Bölüm](40-continuous-delivery.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Sürekli entegrasyonun (CI) değişiklikleri sık aralıklarla nasıl doğruladığını açıklamak.
- Pull request'leri derleyen ve test eden bir GitHub Actions iş akışı tasarlamak.
- CI'yi güvenilir kılmak için izinleri, önbelleğe almayı ve zorunlu kontrolleri kullanmak.

## Giriş

Sürekli entegrasyon, küçük değişiklikleri sık sık birleştirme ve bunları otomatik olarak doğrulama uygulamasıdır. Bir CI iş akışı, değişiklik birleştirilmeden önce derleme, test, biçimlendirme ve diğer kalite kapıları hakkında ekibe hızlı geri bildirim verir.

## Bunun Önemi

CI olmadan hatalı değişiklikler acil bir sürüme kadar gizli kalabilir. Sık yapılan otomatik doğrulama geri bildirim döngülerini kısaltır, varsayılan dalı sağlıklı tutar ve iş birliğini daha güvenli hâle getirir. CI kod incelemesinin yerini almaz; inceleme için tekrarlanabilir kanıt sağlar.

## Temel Terimler

| Terim                  | Tanım                                                                 |
| ---------------------- | --------------------------------------------------------------------- |
| Sürekli entegrasyon    | Küçük değişikliklerin otomatik doğrulamayla sık sık entegre edilmesi. |
| Pull request kontrolü  | Bir pull request için otomatik iş akışının bildirdiği durum.          |
| Zorunlu durum kontrolü | Birleştirmeden önce başarılı olması gereken dal koruma kuralı.        |
| Geri bildirim döngüsü  | Değişiklik yapma ile çalışıp çalışmadığını öğrenme arasındaki süre.   |

## Teori

Yararlı bir CI hattı, `pull_request` ve varsayılan dala yapılan `push` gibi önerilen veya entegre edilen değişiklikleri temsil eden olaylarla tetiklenir. Projenin kullandığı bağımlılıkların aynısını kurmalı, belirlenebilir kontroller çalıştırmalı ve bir kontrol başarısız olduğunda bunu açıkça göstermelidir.

CI, her işin tek bir amacı olduğunda en iyi şekilde çalışır. Bir derleme işi projeyi derleyebilir, test işi test paketini çalıştırabilir ve lint işi biçimi kontrol edebilir. Birbirine bağlı olmayan işler paralel çalışabilir. İş akışı sonuçları hataları günlüklerde gizlemek yerine kontroller üzerinden yayınlamalıdır.

### Uygulamalı İş Akışı Örneği

```yaml
name: Continuous Integration

on:
  pull_request:
  push:
    branches: [main]

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: "3.12"
          cache: pip
      - name: Install dependencies
        run: python -m pip install -r requirements.txt
      - name: Run tests
        run: python -m pytest
```

`permissions` bloğu iş akışı belirtecini salt okunur depo erişimiyle sınırlar. `pull_request` tetikleyicisi önerilen değişiklikleri doğrularken `push` tetikleyicisi varsayılan dalın sağlıklı kalmasını doğrular.

## Kendiniz Deneyin

1. `.github/workflows/ci.yml` altında bir CI iş akışı ekleyin.
2. İş akışını pull request'ler ve `main` dalına yapılan push'lar için tetikleyin.
3. Dal korumada zorunlu bir `test` veya `validate` durum kontrolü ekleyin.
4. Bilerek başarısız bir test içeren pull request açın ve kontrolü gözlemleyin.

## En İyi Uygulamalar

- CI işlerini belirlenebilir ve her pull request'te çalışacak kadar hızlı tutun.
- Eylemlerin ana sürümlerini sabitleyin ve eylem güncellemelerini düzenli olarak inceleyin.
- En az ayrıcalıklı `permissions` kullanın ve pull request iş akışlarında gizli bilgileri kullanmaktan kaçının.
- Adımları açık adlandırarak hataları düzeltilebilir hâle getirin.
- `main` dalına birleştirmeden önce önemli kontrolleri zorunlu tutun.

## Yaygın Hatalar

| Hata                                         | Neden sorun oluşturur                         | Nasıl önlenir                                                          |
| -------------------------------------------- | --------------------------------------------- | ---------------------------------------------------------------------- |
| CI'yi yalnızca sürümden sonra çalıştırmak    | Hatalar çok geç bulunur.                      | Her pull request'i doğrulayın.                                         |
| Her işe yazma erişimi vermek                 | Ele geçirilmiş bir adımın yetkisi aşırı olur. | En az `permissions` tanımlayın.                                        |
| Yerelde ve CI'da farklı bağımlılıklar kurmak | Sonuçlar tutarsızlaşır.                       | Bir kilit dosyası kaydedin ve aynı kurulumu kullanın.                  |
| Kararsız testleri yok saymak                 | Sinyal güvenilmez hâle gelir.                 | Yeniden denemeleri kabul etmek yerine kararsızlığı inceleyip düzeltin. |

## Özet

- CI küçük değişiklikleri entegre eder ve bunları sık sık doğrular.
- GitHub Actions derleme, test ve zorunlu kontrolleri raporlayabilir.
- Hızlı geri bildirim, belirlenebilir bağımlılıklar ve en az ayrıcalık CI'yi yararlı kılar.

## İlgili Bağlantılar

- Önceki bölüm: [GitHub Actions yapıtları](38-github-actions-artifacts.md)
- Alıştırma: [Sürekli entegrasyon iş akışı tasarlama](../../exercises/tr/39-design-a-continuous-integration-workflow.md)
- Lab: [Sürekli entegrasyon hattı oluşturma](../../labs/tr/39-build-a-continuous-integration-pipeline.md)
- Quiz: [Sürekli entegrasyon quiz'i](../../quizzes/tr/39-continuous-integration-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
- Sonraki bölüm: [Sürekli teslimat](40-continuous-delivery.md)
