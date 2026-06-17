---
chapter: 40
title: "Sürekli Teslimat Quiz'i"
related_notebook: "Sürekli Teslimat"
related_exercise: "Sürekli Teslimat Sürümü Planlama"
related_lab: "Sürekli Teslimat Sürümünü Hazırlama"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/40-continuous-delivery.md) | [Alıştırma](../../exercises/tr/40-plan-a-continuous-delivery-release.md) | [Lab](../../labs/tr/40-stage-a-continuous-delivery-release.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Teslimat Quiz'i

## Öğrenme Hedefleri

- CI, sürekli teslimat ve sürekli dağıtımı ayırt etmek.
- Değişmez yapıt ilerletmeyi ve onay kapılarını açıklamak.
- Sürüm kanıtı ve geri alma planlamak.

## Sorular

### Soru 1

Sürekli teslimat neyi garanti eder?

- A. Her değişiklik otomatik olarak üretime ulaşır
- B. Kabul edilen her değişiklik sürümlenebilir tutulur
- C. Hiçbir zaman onay gerekmez
- D. Üretim asla test edilmez

**Yanıt:** B. Yazılım isteğe bağlı sürüm için hazırdır.

### Soru 2

Üretim neden hazırlama yapıtını ilerletmelidir?

**Beklenen Yanıt:** İzlenebilirliği korur ve hazırlamada test edilen yapıtın sürümlenen yapıt olmasını sağlar.

### Soru 3

Doğru mu yanlış mı: Sürekli teslimat ve sürekli dağıtım aynıdır.

**Yanıt:** Yanlış. Sürekli dağıtım üretime otomatik ilerletir; teslimat bilinçli bir onayı koruyabilir.

### Soru 4

İki yararlı sürüm kanıtı belirtin.

**Beklenen Yanıt:** Commit SHA, sağlama toplamı, test sonuçları, yapıt sürümü ve onay kaydı örneklerdir.

### Soru 5 — Uygulamalı Senaryo

Paket işi başarılı, hazırlama testleri geçti ve üretim onay isteyen korumalı bir ortam. Sürekli teslimatta sırada ne var?

**Beklenen Yanıt:** Sürüm adayı hazırdır; yetkili kişi veya politika üretime ilerletmeyi onaylamalıdır. Geri alma kanıtı kullanılabilir olmalıdır.

## İnceleme Kontrol Listesi

- [ ] Sürüme hazır olmayı açıklayabiliyorum.
- [ ] Bir kez derleme ve ilerletmeyi anlıyorum.
- [ ] Onay sınırı belirleyebiliyorum.
- [ ] Geri alma kanıtı adlandırabiliyorum.

## İlgili Bağlantılar

- Notebook: [Sürekli Teslimat](../../notebooks/tr/40-continuous-delivery.md)
- Alıştırma: [Sürekli Teslimat Sürümü Planlama](../../exercises/tr/40-plan-a-continuous-delivery-release.md)
- Lab: [Sürekli Teslimat Sürümünü Hazırlama](../../labs/tr/40-stage-a-continuous-delivery-release.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
