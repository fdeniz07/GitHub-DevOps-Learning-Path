---
chapter: 41
title: "Sürekli Dağıtım Quiz'i"
related_notebook: "Sürekli Dağıtım"
related_exercise: "Denetimli Dağıtım Tasarlama"
related_lab: "Denetimli Dağıtım Çalıştırma"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/41-continuous-deployment.md) | [Alıştırma](../../exercises/tr/41-design-a-controlled-deployment.md) | [Lab](../../labs/tr/41-run-a-controlled-deployment.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Dağıtım Quiz'i

## Öğrenme Hedefleri

- Otomatik üretim ilerletmeyi açıklamak.
- Kullanıma alma, sağlık ve geri alma kontrollerini seçmek.
- Üretimi korumak için eşzamanlılık kullanmak.

## Sorular

### Soru 1

Sürekli dağıtımı sürekli teslimattan ayıran nedir?

**Beklenen Yanıt:** Başarılı değişiklikler ayrı bir sürüm kararı beklemek yerine otomatik olarak üretime ilerletilir.

### Soru 2

Canary dağıtımı nedir?

- A. Testsiz dağıtım
- B. Sınırlı trafik miktarına kademeli sürüm
- C. Kalıcı yedek
- D. Bağımlılık güncellemesi

**Yanıt:** B.

### Soru 3

Doğru mu yanlış mı: `concurrency`, çakışan üretim dağıtımlarını önleyebilir.

**Yanıt:** Doğru. Paylaşılan üretim eşzamanlılık grubu dağıtımları sıraya koyar.

### Soru 4

İlerletmeyi durdurabilecek iki sinyal belirtin.

**Beklenen Yanıt:** Artan hata oranı, başarısız sağlık kontrolleri, gecikme eşiğinin aşılması veya başarısız smoke test örneklerdir.

### Soru 5 — Uygulamalı Senaryo

%10 canary'nin hata oranı yükseliyor. Kalan trafik ilerletilmeli mi?

**Beklenen Yanıt:** Hayır. İlerletmeyi durdurun, kanıtı koruyun, ekibi uyarın ve bilinen iyi yapıta test edilmiş geri almayı çalıştırın.

## İnceleme Kontrol Listesi

- [ ] Otomatik ilerletmeyi anlıyorum.
- [ ] Canary'yi açıklayabiliyorum.
- [ ] Sağlık sinyalleri seçebiliyorum.
- [ ] Geri almanın neden test edilmesi gerektiğini biliyorum.

## İlgili Bağlantılar

- Notebook: [Sürekli Dağıtım](../../notebooks/tr/41-continuous-deployment.md)
- Alıştırma: [Denetimli Dağıtım Tasarlama](../../exercises/tr/41-design-a-controlled-deployment.md)
- Lab: [Denetimli Dağıtım Çalıştırma](../../labs/tr/41-run-a-controlled-deployment.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
