---
chapter: 38
title: "GitHub Actions Artifact'leri"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki bölüm](37-github-actions-dependency-caching.md) | [Alıştırma](../../exercises/tr/38-publish-and-consume-workflow-artifacts.md) | [Laboratuvar](../../labs/tr/38-share-build-artifacts-between-jobs.md) | [Kısa Sınav](../../quizzes/tr/38-artifacts-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- artifact'leri cache'lerden ve job çıktılarından ayırmak;
- bir job'dan dosya yüklemek ve başka bir job'da indirmek;
- saklama ve adlandırma politikalarını bilinçli seçmek;
- job sınırlarında artifact içeriğini ve izinleri korumak.

## Giriş

Artifact'ler bir workflow tarafından üretilen ve workflow çalışmasıyla saklanan dosyalardır. Test raporları, binary'ler, coverage çıktısı ve release paketleri için kullanışlıdır. Ayrı job'lar ayrı runner'larda çalıştığı için artifact'ler dosyaları job sınırları arasında taşımak için açık bir yol sağlar.

## Temel Terimler

| Terim      | Anlam                                                                |
| ---------- | -------------------------------------------------------------------- |
| Artifact   | Bir workflow çalışmasından yüklenen adlandırılmış dosya koleksiyonu. |
| Saklama    | Bir artifact'in ne kadar süre kullanılabilir kaldığı.                |
| Yükleme    | Dosyaları çalışmayla saklayan işlem.                                 |
| İndirme    | Bir sonraki job'da artifact'i alan işlem.                            |
| Job sınırı | Job'lar ve runner'ları arasındaki yalıtılmış geçiş.                  |

## Teori

### Yükleme ve İndirme

Bir yükleme step'i artifact'i adlandırır ve dosyaları seçer. Sonraki job `needs` ile bağımlılık bildirir ve adlandırılmış artifact'i indirir:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: mkdir -p dist && printf 'build output\n' > dist/app.txt
      - uses: actions/upload-artifact@v4
        with:
          name: app-${{ github.sha }}
          path: dist/
          retention-days: 7

  inspect:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: app-${{ github.sha }}
          path: received/
      - run: cat received/app.txt
```

`needs` ilişkisi, tüketici başlamadan önce üreticinin tamamlanmasını sağlar. Artifact adı içeriği tanımlamalı ve matrix job'ları arasında kazara çakışmaları önlemelidir.

### Saklama ve Yaşam Döngüsü

Saklama süresi artifact'in amacına uygun olmalıdır. Kısa ömürlü test raporları release paketlerinden daha kısa saklama gerektirir; ancak uzun saklama depolama ve açığa çıkma riskini artırır. Depo veya kuruluş politikası değeri sınırlayabilir. Bir artifact'in değişmez arşiv sistemi olduğunu varsaymayın; release kayıtlarını projenin gerçek release politikasına göre koruyun.

### Artifact'ler, Cache'ler ve Çıktılar

Artifact'ler daha sonra incelenmesi veya tüketilmesi gereken dosyalar içindir. Cache'ler güvenli, yeniden kullanılabilir bağımlılıklar içindir ve silinebilir. Job çıktıları workflow mantığını kontrol etmek için küçük adlandırılmış değerlerdir. Yanlış mekanizmayı seçmek veri akışını anlamayı zorlaştırır ve güvenlik veya güvenilirlik sorunları oluşturabilir.

### Job Sınırlarında Güvenlik

İndirilen artifact'leri doğrulanana kadar güvenilmeyen girdi olarak ele alın. İzinleri kısıtlayın, release için kritik dosyaların checksum veya imzalarını doğrulayın ve rastgele indirilen script'leri çalıştırmayın. Secret, kimlik bilgisi veya eksiksiz workspace yüklemekten kaçının. Release yayımlayabilen bir job yalnızca ihtiyaç duyduğu izinleri ve dosyaları almalıdır.

## En İyi Uygulamalar

- Artifact'lere açıklayıcı ve çakışmaya dayanıklı adlar verin.
- Yalnızca inceleyenlerin veya sonraki job'ların ihtiyaç duyduğu dosyaları yükleyin.
- Saklama süresini değer, hassasiyet ve politikaya göre ayarlayın.
- İndirilen içeriği çalıştırmadan veya yayımlamadan önce doğrulayın.
- Üretici ve tüketici job'larında en az ayrıcalıklı izinleri kullanın.

## Yaygın Hatalar

| Hata                                             | Etki                                               | Düzeltme                                     |
| ------------------------------------------------ | -------------------------------------------------- | -------------------------------------------- |
| Dosyaların job'lar arasında kalmasını beklemek   | Sonraki runner dosyalar olmadan başlar.            | Artifact'i yükleyin ve açıkça indirin.       |
| Release paketleri için cache kullanmak           | Veri silinebilir veya eski olabilir.               | Doğrulama ve saklamayla artifact kullanın.   |
| Loglarla birlikte secret yüklemek                | Hassas veri çalışma üzerinden erişilebilir olur.   | Secret'ları dışlayın ve path'leri inceleyin. |
| Matrix job'larında tek bir adı yeniden kullanmak | Dosyalar çakışabilir veya belirsiz hale gelebilir. | Adlara matrix değerlerini ekleyin.           |

## Özet

Artifact'ler yalıtılmış job'lar arasında dosya aktarımını açık hale getirir. Bunları raporlar ve derleme çıktıları için kullanın, saklamayı bilinçli seçin ve bir job sınırında tüketilen her şeyi doğrulayın.

### İlgili İçerik

- Önceki bölüm: [Bağımlılık Önbellekleme](37-github-actions-dependency-caching.md)
- Alıştırma: [Workflow Artifact'lerini Yayımla ve Tüket](../../exercises/tr/38-publish-and-consume-workflow-artifacts.md)
- Laboratuvar: [Derleme Artifact'lerini Job'lar Arasında Paylaş](../../labs/tr/38-share-build-artifacts-between-jobs.md)
- Kısa Sınav: [Artifact'ler Kısa Sınavı](../../quizzes/tr/38-artifacts-quiz.md)
