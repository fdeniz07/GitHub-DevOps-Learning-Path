---
chapter: 43
title: "CodeQL Analizi"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Intermediate
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](42-secrets-and-variables.md) | [Yol Haritası](../../ROADMAP.md) | [Sonraki Bölüm](44-dependabot.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- CodeQL'nin anlamsal analizle güvenlik sorunlarını nasıl bulduğunu açıklamak.
- Uygun izinler ve tetikleyicilerle CodeQL iş akışı yapılandırmak.
- Önem derecesi, veri akışı, erişilebilirlik ve düzeltme kanıtını kullanarak bulguları incelemek.

## Giriş

CodeQL kodu veri olarak ele alır ve güvenlik açıklarıyla ilişkili örüntüler için sorgular. GitHub Advanced Security, GitHub Actions içinde CodeQL analizi çalıştırabilir ve bulguları kod tarama uyarıları olarak raporlayabilir. Bir uyarı araştırma için ipucudur; açığın kullanılabildiğinin otomatik kanıtı değildir.

## Bunun Önemi

Statik analiz, dağıtımdan önce güvensiz veri akışlarını belirleyebilir ve pull request'ler ile varsayılan dal gibi yaygın yolları koruyabilir. Değer zamanında incelemeden gelir: ekip her bulguyu anlamalı, düzeltmeli, gerekçeyle reddetmeli veya izlemelidir.

## Temel Terimler

| Terim              | Tanım                                                               |
| ------------------ | ------------------------------------------------------------------- |
| CodeQL             | Anlamsal kod analiz motoru ve sorgu dili.                           |
| Kod tarama uyarısı | Bir güvenlik analiz aracından bildirilen sonuç.                     |
| İnceleme           | Bir bulguyu gözden geçirip nasıl ele alınacağına karar verme.       |
| Veri akışı         | Verinin bir kaynaktan hassas bir hedefe giden yolu.                 |
| SARIF              | Statik analiz sonuçlarını paylaşmak için kullanılan standart biçim. |

## Teori

CodeQL iş akışları dilleri, derleme kiplerini, sorgu paketlerini ve tetikleyicileri seçer. Pull request analizi geliştiricilere erken geri bildirim verir; zamanlanmış analiz yeni yayımlanan sorgu iyileştirmelerini veya varsayılan daldaki değişiklikleri bulabilir. İş akışı izinleri çoğunlukla sonuçların yüklenebilmesi için `security-events: write` içerir.

İnceleme; etkilenen kodu, kaynağı, hedefi, temizlemeyi, kullanılabilirliği ve test kapsamını kontrol etmelidir. Mümkünse kök nedeni düzeltin. Reddetme anlamlı bir neden içermeli ve rahatsız edici uyarıları susturmak için kullanılmamalıdır.

### Uygulamalı İş Akışı Örneği

```yaml
name: CodeQL

on:
  push:
    branches: [main]
  pull_request:
  schedule:
    - cron: "30 2 * * 1"

permissions:
  contents: read
  security-events: write

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    strategy:
      fail-fast: false
      matrix:
        language: [python]
    steps:
      - uses: actions/checkout@v4
      - name: Initialize CodeQL
        uses: github/codeql-action/init@v3
        with:
          languages: ${{ matrix.language }}
      - name: Perform CodeQL analysis
        uses: github/codeql-action/analyze@v3
        with:
          category: /language:${{ matrix.language }}
```

İş akışı sonuçları `security-events: write` izniyle yükler. Kesin derleme adımları dile ve derleme kipine bağlıdır. İzinleri değiştirmeden önce eylem belgelerini ve depo politikasını inceleyin.

## Kendiniz Deneyin

1. Desteklenen bir dil için CodeQL'yi etkinleştirin.
2. Bir uyarıyı kaynaktan hedefe kadar inceleyin.
3. Düzeltme, izleme veya reddetme kararını verin ve gerekçeyi kaydedin.
4. CodeQL sonuçlarını pull request incelemesine ve zamanlanmış analize ekleyin.

## En İyi Uygulamalar

- CodeQL eylemlerini güncel tutun ve iş akışı izinlerini inceleyin.
- Uygun olduğunda pull request'lerde, varsayılan dalda ve zamanlamayla analiz çalıştırın.
- Bulguları yalnızca önem derecesiyle değil, kanıtla inceleyin.
- Güvenlik düzeltmelerini test edin ve kabul edilen riski belgeleyin.
- İş akışı dosyalarını inceleme ve dal korumasıyla koruyun.

## Yaygın Hatalar

| Hata                                                | Neden sorun oluşturur                      | Nasıl önlenir                                      |
| --------------------------------------------------- | ------------------------------------------ | -------------------------------------------------- |
| Sonuçları `security-events: write` olmadan yüklemek | Bulgular kod taramaya ulaşamaz.            | Gerekli en az izni tanımlayın.                     |
| Her uyarıyı yanlış pozitif olarak reddetmek         | Gerçek kusurlar çözülmeden kalır.          | Veri akışını inceleyin ve kanıt kaydedin.          |
| Analizi yalnızca bir kez çalıştırmak                | Yeni kod ve sorgu güncellemeleri görülmez. | Pull request, push ve zamanlanmış analiz kullanın. |

## Özet

- CodeQL, riskli kod örüntülerini ve akışlarını anlamsal sorgularla bulur.
- Bulgular insan incelemesi ve belgelenmiş kararlar gerektirir.
- Doğru tetikleyiciler, izinler ve düzenli analiz kapsamı iyileştirir.

## İlgili Bağlantılar

- Önceki bölüm: [Gizli bilgiler ve değişkenler](42-secrets-and-variables.md)
- Alıştırma: [CodeQL analizini tanıtma](../../exercises/tr/43-introduce-codeql-analysis.md)
- Lab: [Bir CodeQL bulgusunu inceleme](../../labs/tr/43-triage-a-codeql-finding.md)
- Quiz: [CodeQL quiz'i](../../quizzes/tr/43-codeql-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
- Sonraki bölüm: [Dependabot](44-dependabot.md)
