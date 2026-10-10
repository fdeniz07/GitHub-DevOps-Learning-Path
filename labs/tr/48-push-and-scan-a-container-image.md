---
chapter: 48
title: "Konteyner İmajını Push Edip Tarama"
related_notebook: "Konteyner Registry'leri, Etiketler, Digest'ler ve Kimlik Doğrulama"
related_exercise: "Bir İmajı Konteyner Registry'sine Yayımlama"
level: Intermediate
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/48-container-registries.md) | [Alıştırma](../../exercises/tr/48-publish-an-image-to-a-container-registry.md) | [Yol Haritası](../../ROADMAP.md)

# Konteyner İmajını Push Edip Tarama

## Amaç

Sürümlenmiş bir imajı özel registry'ye yayımlayın, tarayın ve dağıtımda kullanılacak digest'i kaydedin.

## Çıktılar

- Kapsamlı registry token'ı ile kimlik doğrulayın.
- Sürüm ve commit etiketlerini değişmez kimlikle karıştırmadan uygulayın.
- Tarama sonuçlarını doğrulayın ve imajı digest ile çekin.

## Ön Koşullar

- Notebook ve alıştırmayı tamamlamış olmak.
- Özel test registry'si ve yönetici olmayan token.
- Docker ve Trivy gibi bir tarayıcı.

## Senaryo

Bir sürüm adayı dağıtım sistemine sunulmalı, güvenlik gözden geçiricisi içeriği doğrulamalıdır. Gözden geçirici kararlı bir digest ve tarama ilkesinin kanıtını ister.

## Ortam

| Gereksinim      | Değer                                          |
| --------------- | ---------------------------------------------- |
| İşletim sistemi | Windows, Linux veya macOS                      |
| Registry        | `registry.example.com/platform`                |
| Sürüm imajı     | `service:1.4.2`                                |
| Tarama ilkesi   | `HIGH` ve `CRITICAL` bulgularında başarısız ol |

## Görevler

### Görev 1 - Güvenli kimlik doğrulama

Korumalı token ile `docker login registry.example.com` kullanın. Kimliğin yalnızca test repository'sine push edebildiğini ve kimlik bilgilerinin yankılanmadığını doğrulayın.

**Beklenen Sonuç:** Kimlik doğrulama sır açığa çıkmadan ve ilgisiz yazma erişimi vermeden başarılı olur.

### Görev 2 - Push ve tarama

`registry.example.com/platform/service:1.4.2` ve `registry.example.com/platform/service:git-a1b2c3d` etiketleyip push edin. Push edilen imajı tarayıp raporu kaydedin.

**Beklenen Sonuç:** İki etiket vardır, tarama sonucu saklanır ve ilke başarısızlıkları sürüm onayını engeller.

### Görev 3 - Digest ile çekmeyi doğrulama

Registry'den digest'i kaydedin, `service@sha256:...` ile çekin ve yerel imaj kimliğini registry yanıtıyla karşılaştırın.

**Beklenen Sonuç:** Dağıtım referansı taranan tam byte'ları tanımlar.

## Doğrulama Checklist'i

- [ ] Push kimlik bilgileri kapsamlı ve korumalı.
- [ ] Sürüm ve commit etiketleri mevcut.
- [ ] Son imaj tarandı.
- [ ] Tarama kanıtı saklandı.
- [ ] Digest ile çekme başarılı.

## Sorun Giderme

| Problem                    | Olası neden                           | Çözüm                                                     |
| -------------------------- | ------------------------------------- | --------------------------------------------------------- |
| `denied: requested access` | Token repository iznine sahip değil   | Test repository'sine kapsamlı push erişimi isteyin.       |
| Etiket üzerine yazılamıyor | Registry değişmezliği zorluyor        | Yeni sürüm veya commit etiketi kullanın.                  |
| Digest yerelde farklı      | Farklı manifest veya platform çekildi | Platformu kaydedin ve registry manifestini karşılaştırın. |

## En İyi Uygulamalar

- CI'da kısa ömürlü kimlik bilgileri veya workload identity kullanın.
- Push'tan sonra ve dağıtım onayından önce tarayın.
- Sürüm etiketlerini okunabilir tutun ancak digest ile dağıtın.

## Özet

Registry işlemleri ancak kimlik doğrulama, tarama, saklama ve digest kanıtı aynı yapıt üzerinde uyuştuğunda tamamdır.

## İlgili Bağlantılar

- Notebook: [Konteyner Registry'leri](../../notebooks/tr/48-container-registries.md)
- Alıştırma: [Bir imajı konteyner registry'sine yayımlama](../../exercises/tr/48-publish-an-image-to-a-container-registry.md)
- Quiz: [Konteyner registry'leri quizi](../../quizzes/tr/48-container-registries-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
