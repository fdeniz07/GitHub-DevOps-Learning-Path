---
chapter: 30
title: "GitHub Actions YAML'ı Uygulayın"
related_notebook: "GitHub Actions için YAML Temelleri"
level: Başlangıç
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/30-yaml-fundamentals.md) | [Lab](../../labs/tr/30-build-a-valid-actions-workflow.md) | [Kısa Sınav](../../quizzes/tr/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Amaç

YAML map'lerini, listelerini, girintiyi ve ifadeleri uygulayarak bir iş akışını düzeltin ve genişletin.

## Öğrenme Kazanımları

- YAML değerlerini map, list veya scalar olarak sınıflandırmak;
- amaçlanan hiyerarşiyi değiştirmeden girintiyi düzeltmek;
- okunabilir bir Actions ifadesi eklemek.

## Ön Koşullar

- Bölüm 30 not defterini okuyun.
- Boşlukları ve tab karakterlerini görüntüleyebilen bir editör kullanın.

## Senaryo

Şu amaçlanan yapıyla başlayın ve bunu geçerli iş akışı YAML'ı olarak yazın: `YAML practice` adında bir iş akışı, manuel tetikleyici, yalnızca okuma amaçlı contents izni ve checkout adımı ile bir komut adımı içeren `validate` job'ı.

## Görevler

### Görev 1

Girinti seviyesinde iki boşluk kullanarak iş akışını yazın. `steps` için blok listesi ve job için map kullanın.

### Beklenen Sonuç: YAML Hiyerarşisi

Yapı, `runs-on` ve `steps` ifadelerinin `validate` alt öğeleri, step özelliklerinin ise liste öğelerinin alt öğeleri olduğunu açıkça gösterir.

### Görev 2

Bir raporlama adımına `if: ${{ github.ref == 'refs/heads/main' }}` ekleyin. İfadeyi `if` anahtarının scalar değeri olarak koruyun.

### Beklenen Sonuç: Koşullu Değer

Adım, yeni bir YAML hiyerarşisi olarak ele alınmak yerine Actions tarafından koşullu olarak değerlendirilir.

### Görev 3

Dosyayı tab karakterleri, tutarsız girinti, tırnak içine alınmamış `#` verisi ve yanlış seviyedeki bir liste öğesi açısından inceleyin.

### Beklenen Sonuç: İnceleme Bulguları

Olası her ayrıştırıcı veya davranış sorununu adlandırabilir ve çalıştırmadan önce düzeltebilirsiniz.

## Zorluk

Satır içi branch listesini blok listesine dönüştürün ve tetikleyicinin üst öğesini koruyarak ikinci bir branch ekleyin.

## Öz Değerlendirme

- [ ] Map ve listeleri görsel olarak belirleyebilirim.
- [ ] Boşlukları tutarlı biçimde kullanıyorum.
- [ ] İfadenin nerede değerlendirildiğini açıklayabilirim.

## Yaygın Hatalar

| Hata                                           | Çözüm                                       |
| ---------------------------------------------- | ------------------------------------------- |
| Bir adımı yanlış anahtarın altına girintilemek | Her liste öğesini kardeşiyle hizalayın.     |
| Tab kullanmak                                  | Tab karakterlerini boşluklarla değiştirin.  |
| İfade sınırlayıcılarını unutmak                | Actions ifadesi için `${{ ... }}` kullanın. |

## Özet

Okunabilir YAML doğru hiyerarşiye bağlıdır. Küçük girinti hataları, dosya neredeyse doğru görünse bile iş akışının anlamını değiştirebilir.

### İlgili İçerik

- Not Defteri: [GitHub Actions için YAML Temelleri](../../notebooks/tr/30-yaml-fundamentals.md)
- Lab: [Geçerli bir Actions İş Akışı Oluşturma](../../labs/tr/30-build-a-valid-actions-workflow.md)
- Kısa Sınav: [YAML Temelleri Kısa Sınavı](../../quizzes/tr/30-yaml-fundamentals-quiz.md)
