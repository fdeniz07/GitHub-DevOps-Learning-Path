---
chapter: 22
title: "Sürümlü bir package yayınla ve kullan"
related_notebook: "Release'ler, Package'ler ve Container Registry"
related_exercise: "Sürümlü bir release planla"
level: Başlangıç
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/22-releaseler-packageler-ve-container-registry.md) | [Alıştırma](../../exercises/tr/22-surumlu-bir-release-planla.md) | [Quiz](../../quizzes/tr/22-releaseler-packageler-ve-container-registry-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Sürümlü bir package yayınla ve kullan

## Amaç

Bir değişmez package veya container image sürümünü yayınlama ve tüketme adımlarını planlayıp doğrulamak.

## Gereksinimler

- Package veya container registry etkin bir eğitim projesi.
- Test artefaktı yayınlama ve ayrı bir consumer çalışma alanından okuma izni.
- Platform tarafından yönetilen CI kimlik doğrulaması. Token veya parola dosyalara, komutlara ya da notlara yazılmamalıdır.

## Görevler

### Görev 1 - Release'i hazırla

1. Test edilmiş commit'i seçin ve `1.0.0` gibi semantik sürüm belirleyin.
2. Uygun tag'i oluşturun; kullanıcı etkisini ve doğrulamayı anlatan release notes hazırlayın.
3. Ad alanını ve yayınlama yetkisi olan kişi veya otomasyonu doğrulayın.

### Görev 2 - Bir kez yayınla

1. Onaylı CI yayınlama yöntemini kaynak kontrolünün dışında yapılandırın.
2. Package veya image oluşturup `1.0.0` sürümünü yayınlayın.
3. Registry'de ad, sürüm veya tag, sahip ve oluşturma zamanını doğrulayın.

### Görev 3 - Açıkça tüket

1. Consumer içinde `latest` yerine tam olarak `1.0.0` isteyin.
2. Consumer'ın ilgili doğrulama adımını çalıştırın.
3. `1.0.0` sürümünü değiştirmeden, düzeltmeyi yeni patch sürümü olarak planlayın.

## Beklenen Sonuç

Consumer release'e bağlı tam artefaktı kullanır ve ilk yayımlanan sürüm değişmeden kalır.

## Doğrulama Listesi

- [ ] Tag, release ve registry sürümü eşleşiyor.
- [ ] Release notes anlamlı kullanıcı etkisi içeriyor.
- [ ] Yayınlama izni onaylı kişi veya otomasyonla sınırlı.
- [ ] Tüketim sabit sürüm veya digest ile yapılıyor.
- [ ] Depoda kimlik bilgisi bulunmuyor.

## İlgili İçerik

- [Notebook](../../notebooks/tr/22-releaseler-packageler-ve-container-registry.md)
- [Alıştırma](../../exercises/tr/22-surumlu-bir-release-planla.md)
- [Quiz](../../quizzes/tr/22-releaseler-packageler-ve-container-registry-quiz.md)
