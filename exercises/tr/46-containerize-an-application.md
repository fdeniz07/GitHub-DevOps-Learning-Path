---
chapter: 46
title: "Bir Uygulamayı Konteynerleştirme"
related_notebook: "Docker Temelleri: İmajlar, Konteynerler ve Ağlar"
level: Beginner
estimated_time: 40 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/46-docker-fundamentals.md) | [Lab](../../labs/tr/46-build-and-run-a-container.md) | [Yol Haritası](../../ROADMAP.md)

# Bir Uygulamayı Konteynerleştirme

## Amaç

Küçük bir HTTP uygulamasını root olmayan Docker imajı olarak paketleyin ve açık port, ağ ve depolama tercihleriyle çalıştırın.

## Çıktılar

- Odaklı bir Dockerfile ve `.dockerignore` yazın.
- Öngörülebilir etiket ve yayınlanmış port ile imaj oluşturup çalıştırın.
- Hangi verinin volume'a ait olduğunu açıklayın ve konteyner kullanıcısını doğrulayın.

## Ön Koşullar

- [Docker Temelleri](../../notebooks/tr/46-docker-fundamentals.md) bölümünü okuyun.
- Docker Desktop veya Docker Engine kurulu olmalı.
- Belgelenmiş başlangıç komutuna sahip küçük bir uygulamanız olmalı.

## Senaryo

Bir ekibin bir geliştirici makinesinde çalışan ancak yeniden üretilmesi zor bir yerel hizmeti var. Başka bir geliştiricinin uygulama çalışma zamanını kurmadan oluşturup çalıştırabileceği bir konteyner sözleşmesi oluşturun.

## Görevler

### Görev 1 - Derleme bağlamını oluşturma

Bir Dockerfile, `.dockerignore` ve health endpoint ekleyin. `.git`, yerel sırları, önbellekleri ve test çıktısını derleme bağlamından çıkarın.

**Beklenen Sonuç:** Derleme bağlamı hizmeti oluşturmak ve çalıştırmak için gereken dosyaları içerir.

### Görev 2 - Oluşturma ve çalıştırma

`demo-service:1.0` oluşturun ve `--publish 8080:8080` ile çalıştırın. Endpoint'i tarayıcı veya HTTP istemcisiyle doğrulayın.

**Beklenen Sonuç:** Hizmet 8080 portunda yanıt verir ve kaynak dosyalar silinmeden konteyner kaldırılabilir.

### Görev 3 - Yalıtım tercihlerini doğrulama

`docker exec <container> id` çalıştırın, port eşlemesini inceleyin ve durum gerekiyorsa uygulama veri dizinine adlandırılmış bir volume bağlayın.

**Beklenen Sonuç:** Süreç root değildir, yayınlanan port bilinçli seçilmiştir ve kalıcı veri yazılabilir konteyner katmanının dışında tutulur.

## Meydan Okuma

Kullanıcı tanımlı bir ağ ve ikinci bir test konteyneri ekleyin. Hizmete konteyner adıyla bağlanın; ardından production'da hizmetin iç portunu neden ana makineye yayınlamaması gerektiğini açıklayın.

## Öz Değerlendirme

- [ ] İmaj ile konteyner arasındaki farkı açıklayabilirim.
- [ ] Açık bir etiketle imaj oluşturup çalıştırabilirim.
- [ ] Root olmayan çalışmayı doğrulayabilirim.
- [ ] Volume ile geçici konteyner depolaması arasında seçim yapabilirim.

## Yaygın Hatalar

| Hata                          | Çözüm                                                        |
| ----------------------------- | ------------------------------------------------------------ |
| Sırları imaja kopyalamak      | `.dockerignore` ve çalışma zamanı secret injection kullanın. |
| Root olarak çalıştırmak       | Özel kullanıcı oluşturup `USER` ayarlayın.                   |
| `EXPOSE` port yayınlar sanmak | Ana makine erişimi gerektiğinde `--publish` kullanın.        |

## Özet

İyi bir konteyner alıştırması çalışma zamanı sözleşmesini görünür kılar: küçük derleme bağlamı, açık port eşlemesi, root olmayan çalışma ve bilinçli kalıcılık.

## İlgili Bağlantılar

- Notebook: [Docker Temelleri](../../notebooks/tr/46-docker-fundamentals.md)
- Lab: [Konteyner oluşturma ve çalıştırma](../../labs/tr/46-build-and-run-a-container.md)
- Quiz: [Docker temelleri quizi](../../quizzes/tr/46-docker-fundamentals-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
