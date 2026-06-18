---
chapter: 48
title: "Konteyner Registry'leri Quizi"
related_notebook: "Konteyner Registry'leri, Etiketler, Digest'ler ve Kimlik Doğrulama"
related_exercise: "Bir İmajı Konteyner Registry'sine Yayımlama"
related_lab: "Konteyner İmajını Push Edip Tarama"
level: Intermediate
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/48-container-registries.md) | [Alıştırma](../../exercises/tr/48-publish-an-image-to-a-container-registry.md) | [Lab](../../labs/tr/48-push-and-scan-a-container-image.md) | [Yol Haritası](../../ROADMAP.md)

# Konteyner Registry'leri Quizi

## Öğrenme Hedefleri

- Etiketleri, manifestleri ve digest'leri ayırt etmek.
- En az ayrıcalıklı registry kimlik doğrulamasını uygulamak.
- Taramayı, saklamayı ve dağıtım kimliğini ilişkilendirmek.

## Sorular

### Soru 1

Hangi referans tam imaj içeriğini tanımlar?

- A. `service:latest`
- B. `service:release`
- C. `service@sha256:...`
- D. `service:branch-main`

**Cevap:** C. Digest içerik adreslidir ve o manifest için değişmezdir.

### Soru 2

Etiket nedir?

**Beklenen Cevap:** İmaj manifestine insan tarafından okunabilir bir işaretçidir. Kullanışlıdır ancak registry ilkesi üzerine yazmayı engellemiyorsa taşınabilir.

### Soru 3

Doğru mu yanlış mı: Dağıtım kimliği genellikle yeni imajları push etme iznine ihtiyaç duyar.

**Cevap:** Yanlış. Dağıtım kimliği genellikle pull erişimine ihtiyaç duyar; yayımlama ayrı bir derleme kimliğine aittir.

### Soru 4

Registry kimlik bilgileri neden Dockerfile'a geçirilmemelidir?

**Cevap:** Dockerfile içeriği ve imaj katmanları saklanıp incelenebilir. Kimlik bilgileri korumalı kimlik doğrulama mekanizmalarıyla sağlanmalıdır.

### Soru 5

Eski imaj sürümlerini saklamak için iki neden söyleyin.

**Beklenen Cevap:** Rollback, felaket kurtarma, olay incelemesi, uyumluluk kanıtı ve tekrarlanabilirlik.

### Soru 6

Okunabilir sürüm etiketine ek olarak sürüm kaydı ne içermelidir?

**Beklenen Cevap:** İmaj digest'i, kaynak commit'i, tarama sonucu, derleme çalışması, onay ve dağıtım ortamı.

## Uygulamalı Senaryo

Production dağıtımı `registry.example.com/team/api:stable` kullanıyor; ikinci bir pipeline `stable` üzerine yazabiliyor. Bir düzeltme önerin.

**Beklenen Cevap:** Taranmış imajı digest'e çözümleyip `api@sha256:...` ile dağıtın. Yararlıysa `stable`'ı keşif etiketi olarak koruyun, ancak koruyup digest'i kaydedin. Üzerine yazabilen yayımlama erişimini yalnızca pull yapabilen dağıtım erişiminden ayırın.

## İnceleme Checklist'i

- [ ] Etiketlerin neden taşındığını açıklayabilirim.
- [ ] Digest ile dağıtabilirim.
- [ ] Push ve pull izinlerini ayırabilirim.
- [ ] Saklama gereksinimlerini tanımlayabilirim.
- [ ] Registry denetim kanıtını açıklayabilirim.

## İlgili Bağlantılar

- Notebook: [Konteyner Registry'leri](../../notebooks/tr/48-container-registries.md)
- Alıştırma: [Bir imajı konteyner registry'sine yayımlama](../../exercises/tr/48-publish-an-image-to-a-container-registry.md)
- Lab: [Konteyner imajını push edip tarama](../../labs/tr/48-push-and-scan-a-container-image.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
