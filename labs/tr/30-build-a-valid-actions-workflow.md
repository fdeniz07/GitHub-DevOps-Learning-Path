---
chapter: 30
title: "Geçerli Bir Actions İş Akışı Oluşturma"
related_notebook: "GitHub Actions için YAML Temelleri"
related_exercise: "GitHub Actions YAML Uygulaması"
level: Beginner
estimated_time: 55 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/30-yaml-fundamentals.md) | [Alıştırma](../../exercises/tr/30-practice-github-actions-yaml.md) | [Kısa Sınav](../../quizzes/tr/30-yaml-fundamentals-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Amaç

YAML yapısını, izinleri, listeleri ve bir ifadeyi gösteren geçerli bir GitHub Actions iş akışı oluşturun ve inceleyin.

## Öğrenme Çıktıları

- iç içe haritaları ve listeleri tutarlı girintilerle oluşturmak;
- bir iş akışının yapısını hiyerarşisini okuyarak doğrulamak;
- bir ifadenin bir adımı ne zaman kontrol ettiğini açıklamak.

## Senaryo

Bir uygulama deposu için doğrulama iş akışı oluşturun. İş akışı `main` dalına yapılan push'lar ve manuel gönderim için çalışmalı, salt okunur contents izni kullanmalı ve ref `main` olduğunda koşullu olarak bir ileti yazdırmalıdır.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- Bir uygulama GitHub deposu.
- Boşluk ekleyecek şekilde yapılandırılmış bir düzenleyici.

## Ortam Kurulumu

| Gereksinim      | Değer                                                            |
| --------------- | ---------------------------------------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS                                        |
| Yazılım         | GitHub deposu ve YAML uyumlu düzenleyici                         |
| Sürüm           | Güncel olarak desteklenen herhangi bir tarayıcı ve Git istemcisi |

## Görevler

### Görev 1 - Belgeyi oluşturma

#### Adımlar: Belgeyi Oluşturma

1. `.github/workflows/yaml-validation.yml` dosyasını oluşturun.
2. `name`, bir `on` haritası, `permissions` ve bir `jobs` haritası ekleyin.
3. checkout ve koşullu komut için blok listesi kullanın.

#### Beklenen Sonuç: İş Akışı Hiyerarşisi

Girinti, bir işin içinde sıralı iki adım haritasından oluşan bir listeyi gösterir.

### Görev 2 - Hiyerarşiyi inceleme

#### Adımlar: Hiyerarşiyi İnceleme

1. Dosyadaki her harita üst öğesini ve liste üst öğesini işaretleyin.
2. Sekmeleri ve yanlışlıkla eklenmiş sondaki girintileri arayın.
3. İfadenin ayrı bir YAML anahtarı değil, `if` değerinin kendisi olduğunu doğrulayın.

#### Beklenen Sonuç: Belirsiz Olmayan Yapı

Belge okunabilirdir ve amaçlanan hiyerarşisi belirsiz değildir.

### Görev 3 - Çalıştırma ve inceleme

#### Adımlar: Çalıştırma ve İnceleme

1. İş akışını commit edin ve yapılandırılmış bir olayla başlatın.
2. İş günlüğünü ve koşullu adımın sonucunu inceleyin.
3. Olayı veya ref'i kontrollü bir dalda değiştirin ve davranışı karşılaştırın.

#### Beklenen Sonuç: Koşullu Davranış

İş akışı çalışır ve koşullu adımın davranışı ifadeyle eşleşir.

## Doğrulama Kontrol Listesi

- [ ] Girinti için sekme kullanılmamıştır.
- [ ] `steps`, işin altında bir listedir.
- [ ] İzinler açıkça belirtilmiş ve asgari düzeydedir.
- [ ] İfade `${{ ... }}` kullanır.
- [ ] Commit edilmiş iş akışı başarıyla çalışır.

## Sorun Giderme

| Sorun                     | Olası Neden                         | Çözüm                                                                         |
| ------------------------- | ----------------------------------- | ----------------------------------------------------------------------------- |
| İş akışı ayrıştırılamıyor | Girinti veya noktalama geçersizdir. | Her alt öğeyi üst öğesiyle karşılaştırın ve YAML uyumlu düzenleyici kullanın. |
| Koşullu adım atlanıyor    | Geçerli ref `main` değil.           | İfadeyi değiştirmeden önce olay bağlamını doğrulayın.                         |
| Değişmez `#` kayboluyor   | Yorum başlangıcı olarak algılandı.  | Değişmez karakteri içeren skaları tırnak içine alın.                          |

## En İyi Uygulamalar

- Çalışma zamanı komutlarını değiştirmeden önce yapıyı doğrulayın.
- Koleksiyonun boyutuna uygun en anlaşılır liste biçimini tercih edin.
- Koşulları, gözden geçiren kişinin açıklayabileceği kadar kısa tutun.

## Özet

Bu laboratuvar YAML sözdizimini gerçek Actions davranışına bağlar: girinti yapı oluşturur, ifadeler değerleri kontrol eder ve geçerli bir iş akışı yapıyı bir çalıştırmada gözlemlenebilir kılar.

### İlgili İçerik

- Not Defteri: [GitHub Actions için YAML Temelleri](../../notebooks/tr/30-yaml-fundamentals.md)
- Alıştırma: [GitHub Actions YAML Uygulaması](../../exercises/tr/30-practice-github-actions-yaml.md)
- Kısa Sınav: [YAML Temelleri Kısa Sınavı](../../quizzes/tr/30-yaml-fundamentals-quiz.md)
