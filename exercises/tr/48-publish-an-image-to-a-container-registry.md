---
chapter: 48
title: "Bir İmajı Konteyner Registry'sine Yayımlama"
related_notebook: "Konteyner Registry'leri, Etiketler, Digest'ler ve Kimlik Doğrulama"
level: Intermediate
estimated_time: 40 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/48-container-registries.md) | [Lab](../../labs/tr/48-push-and-scan-a-container-image.md) | [Yol Haritası](../../ROADMAP.md)

# Bir İmajı Konteyner Registry'sine Yayımlama

## Amaç

En az ayrıcalıklı kimlik doğrulamayla sürümlenmiş bir imaj yayımlayın ve değişmez digest'ini kaydedin.

## Çıktılar

- Tam nitelikli bir registry imaj referansı oluşturun.
- Ayrı push ve pull izinleri kullanın.
- Dağıtımda değişken etiket yerine neden digest kullanılması gerektiğini açıklayın.

## Ön Koşullar

- [Konteyner Registry'leri](../../notebooks/tr/48-container-registries.md) bölümünü okuyun.
- Özel bir test registry'sine erişiminiz olsun.
- Docker kurulu ve bu registry için güvenli bir token'ınız olsun.

## Senaryo

Bir hizmet ekibi araştırma ve geri dönüş için commit etiketini korurken `1.4.2` sürümünü yayımlamalıdır. Sürüm izlenebilir olmalı ve kimlik bilgileri günlüklerde görünmemelidir.

## Görevler

### Görev 1 - Referansları tanımlama

`registry.example.com/platform/service:1.4.2` ve `git-a1b2c3d` gibi bir commit etiketi seçin. Hangi etiketin insanlar, hangi tanımlayıcının otomasyon için olduğunu belgeleyin.

**Beklenen Sonuç:** Sürüm ilkesi keşif etiketlerini değişmez dağıtım referanslarından açıkça ayırır.

### Görev 2 - Kimlik doğrulama ve push

Korumalı token ile `docker login registry.example.com` kullanın, yerel imajı etiketleyin ve iki etiketi push edin. Token'ı Dockerfile'a veya shell geçmişine koymayın.

**Beklenen Sonuç:** Registry iki etiketi içerir ve push kimliğinin ilgisiz yönetici erişimi yoktur.

### Görev 3 - Digest'i kaydetme

Push edilen imajı inceleyin, repository digest'ini kaydedin ve `registry.example.com/platform/service@sha256:...` ile çekin.

**Beklenen Sonuç:** İkinci ortam, sürüm kanıtıyla ilişkili tam manifesti alır.

## Meydan Okuma

Her production sürümünü, son beş rollback adayını ve tarama kanıtını tutup referanssız geliştirme etiketlerini silen bir saklama kuralı tasarlayın.

## Öz Değerlendirme

- [ ] Etiketleri ve digest'leri açıklayabilirim.
- [ ] Registry token'ını gerekli repository ile sınırlandırabilirim.
- [ ] Digest'i kaydedip digest ile dağıtabilirim.
- [ ] Bir rollback saklama gereksinimini açıklayabilirim.

## Yaygın Hatalar

| Hata                                     | Çözüm                                               |
| ---------------------------------------- | --------------------------------------------------- |
| Sürüm etiketlerinin üzerine yazmak       | İlkeyle sürüm etiketlerini değişmez yapın.          |
| Yönetici token'ını paylaşmak             | Repository kapsamlı push kimlik bilgileri kullanın. |
| Rollback analizi olmadan imajları silmek | Referanslı sürümleri ve adayları saklayın.          |

## Özet

Registry yayımlaması bir yapıt kontrol problemidir: açık etiketler, kapsamlı kimlik doğrulama, değişmez digest'ler, saklama ve denetim kanıtı kullanın.

## İlgili Bağlantılar

- Notebook: [Konteyner Registry'leri](../../notebooks/tr/48-container-registries.md)
- Lab: [Konteyner imajını push edip tarama](../../labs/tr/48-push-and-scan-a-container-image.md)
- Quiz: [Konteyner registry'leri quizi](../../quizzes/tr/48-container-registries-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
