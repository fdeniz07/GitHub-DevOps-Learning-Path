---
chapter: 44
title: "Dependabot Güncellemeleri"
part: "Sürekli Entegrasyon ve Sürekli Teslimat"
level: Intermediate
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](43-codeql.md) | [Yol Haritası](../../ROADMAP.md) | [Sonraki Bölüm](45-security-best-practices.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Dependabot'un eski bağımlılıkları nasıl bulduğunu ve güncellemeler önerdiğini açıklamak.
- Güncelleme zamanlamalarını, grupları ve pull request sınırlarını yapılandırmak.
- Bağımlılık güncellemesi pull request'lerini incelemek, test etmek ve güvenle birleştirmek.

## Giriş

Dependabot bağımlılık bildirimlerini ve kilit dosyalarını izler, sonra kullanılabilir sürüm güncellemeleri veya güvenlik düzeltmeleri için pull request açar. Unutulan bağımlılık eskimesini azaltır; ancak otomasyon her güncellemeyi güvenli yapmaz. Önerilen değişiklik yine inceleme, test ve sürüm değerlendirmesi gerektirir.

## Bunun Önemi

Bağımlılıklar işlevsellik ve risk taşır. Güncel tutmak güvenlik yamaları ve hata düzeltmeleri sağlayabilir; dikkatsiz yükseltmeler ise uyumsuz değişiklikler getirebilir. Tutarlı bir güncelleme süreci bağımlılık bakımını normal teslimat işinin parçası yapar.

## Temel Terimler

| Terim                     | Tanım                                                              |
| ------------------------- | ------------------------------------------------------------------ |
| Bağımlılık                | Bir proje için gereken harici paket veya eylem.                    |
| Bildirim                  | Bağımlılıkları ve sürüm kısıtlarını tanımlayan dosya.              |
| Kilit dosyası             | Çözümlenen bağımlılık sürümlerini kaydeden dosya.                  |
| Güncelleme pull request'i | Dependabot tarafından oluşturulan önerilen bağımlılık değişikliği. |
| Gruplanmış güncelleme     | Bir pull request'te birleştirilen birden çok uyumlu güncelleme.    |

## Teori

Dependabot yapılandırması `.github/dependabot.yml` içinde bulunur. Her güncelleme girdisi bir ekosistem, dizin ve zamanlama tanımlar. `open-pull-requests-limit`, `groups` ve yok sayma kuralları gürültüyü kontrol etmeye yardımcı olur; ancak önemli güvenlik güncellemelerini gizlememeleri için yok sayma kuralları incelenmelidir.

Her güncelleme CI'dan geçmeli ve riskiyle orantılı insan incelemesi almalıdır. Sürüm notlarını, uyumluluğu, kilit dosyası değişikliklerini, geçişli bağımlılıkları ve üretim davranışını kontrol edin. Eylem güncellemeleri de kitaplık güncellemeleri kadar dikkat gerektirir.

### Uygulamalı Yapılandırma Örneği

```yaml
version: 2
updates:
  - package-ecosystem: pip
    directory: "/"
    schedule:
      interval: weekly
    open-pull-requests-limit: 5
    groups:
      production-dependencies:
        dependency-type: production

  - package-ecosystem: github-actions
    directory: "/"
    schedule:
      interval: monthly
```

Bu yapılandırma Python bağımlılıklarını haftalık, GitHub Actions'ı aylık kontrol eder. Grup pull request sayısını azaltabilir; ancak birleştirmeden önce tüm farkı ve test sonucunu inceleyin.

## Kendiniz Deneyin

1. Proje ekosistemi için bir Dependabot girdisi ekleyin.
2. Bir zamanlama ve makul bir pull request sınırı seçin.
3. Doğrudan ve geçişli değişiklikler için bir güncellemeyi inceleyin.
4. Yalnızca CI, güvenlik kontrolleri ve uyumluluk incelemesi başarılı olduktan sonra birleştirin.

## En İyi Uygulamalar

- Güncellemeleri birleştirmeden önce sürüm notlarını ve değişiklik günlüklerini inceleyin.
- Kilit dosyalarını senkron tutun ve çözümlenen bağımlılık grafiğini test edin.
- Uygulama kitaplıklarının yanında GitHub Actions'ı da güncelleyin.
- Gruplamayı dikkatli kullanın ve geniş yok sayma kurallarından kaçının.
- Düzenli bakım ritmini korurken güvenlik güncellemelerine öncelik verin.

## Yaygın Hatalar

| Hata                                      | Neden sorun oluşturur                                   | Nasıl önlenir                                      |
| ----------------------------------------- | ------------------------------------------------------- | -------------------------------------------------- |
| Her PR'ı otomatik birleştirmek            | Uyumsuz bir güncelleme incelenmeden üretime ulaşabilir. | Test ve uygun inceleme isteyin.                    |
| Kilit dosyası değişikliklerini yok saymak | Gerçek çözümlenen grafik bildirimden farklı olabilir.   | Kilit dosyası güncellemelerini inceleyip kaydedin. |
| Eski yok sayma kurallarını bırakmak       | Güvenlik açığı bulunan paketler süresiz sabit kalır.    | Yok saymaları sahibi ve bitiş tarihiyle inceleyin. |

## Özet

- Dependabot bağımlılık güncellemesi önerilerini otomatikleştirir, son kararı değil.
- İnceleme, test, sürüm notları ve kilit dosyası kontrolü gereklidir.
- Zamanlanmış bakım ve makul gruplama bağımlılık riskini ve gürültüyü azaltır.

## İlgili Bağlantılar

- Önceki bölüm: [CodeQL](43-codeql.md)
- Alıştırma: [Dependabot güncellemelerini yapılandırma](../../exercises/tr/44-configure-dependabot-updates.md)
- Lab: [Bir Dependabot güncellemesini inceleme](../../labs/tr/44-review-a-dependabot-update.md)
- Quiz: [Dependabot quiz'i](../../quizzes/tr/44-dependabot-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
- Sonraki bölüm: [Güvenlik en iyi uygulamaları](45-security-best-practices.md)
