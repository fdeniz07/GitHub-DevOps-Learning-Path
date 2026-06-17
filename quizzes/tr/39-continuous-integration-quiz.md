---
chapter: 39
title: "Sürekli Entegrasyon Quiz'i"
related_notebook: "Sürekli Entegrasyon"
related_exercise: "Sürekli Entegrasyon İş Akışı Tasarlama"
related_lab: "Sürekli Entegrasyon Hattı Oluşturma"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/39-continuous-integration.md) | [Alıştırma](../../exercises/tr/39-design-a-continuous-integration-workflow.md) | [Lab](../../labs/tr/39-build-a-continuous-integration-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Entegrasyon Quiz'i

## Öğrenme Hedefleri

- Sık doğrulamayı ve zorunlu kontrolleri açıklamak.
- Temel GitHub Actions tetikleyicilerini ve izinlerini okumak.
- Başarısız teste güvenli CI yanıtı seçmek.

## Sorular

### Soru 1

CI'nin temel amacı nedir?

- A. Her commit'i üretime dağıtmak
- B. Entegre değişiklikleri sık sık doğrulamak
- C. Kod incelemesinin yerini almak
- D. Sürüm yapıtlarını sonsuza kadar saklamak

**Yanıt:** B. CI entegre değişiklikleri sık sık doğrular.

### Soru 2

Önerilen bir pull request'i hangi tetikleyici doğrular?

- A. `pull_request`
- B. Yalnızca `workflow_dispatch`
- C. Yalnızca `schedule`
- D. Yalnızca `release`

**Yanıt:** A. `pull_request`.

### Soru 3

Doğru mu yanlış mı: Yalnızca test yapan bir iş için `contents: read`, genellikle `write-all` değerinden daha güvenlidir.

**Yanıt:** Doğru. Yalnızca test yapan bir işin normalde depo yazma erişimine ihtiyacı yoktur.

### Soru 4

Kararsız testler neden yok sayılmak yerine düzeltilmelidir?

**Beklenen Yanıt:** Güvenilmez testler geri bildirim sinyaline olan güveni yok eder ve gerçek hataların gözden kaçmasına izin verir.

### Soru 5 — Uygulamalı Senaryo

Bir pull request uygulama kodunu değiştiriyor ve CI test işi başarısız oluyor. Değişiklik küçük olduğu için birleştirilmeli mi?

**Beklenen Yanıt:** Hayır. Hatanın nedeni incelenmeli, kod veya test uygunsa düzeltilmeli, CI yeniden çalıştırılmalı ve yalnızca zorunlu kontroller başarılı olduğunda birleştirilmelidir.

## İnceleme Kontrol Listesi

- [ ] CI'yi açıklayabiliyorum.
- [ ] `pull_request` ve `push` tetikleyicilerini anlıyorum.
- [ ] En az izinleri seçebiliyorum.
- [ ] Zorunlu kontrollerin `main` dalını nasıl koruduğunu biliyorum.

## İlgili Bağlantılar

- Notebook: [Sürekli Entegrasyon](../../notebooks/tr/39-continuous-integration.md)
- Alıştırma: [Sürekli Entegrasyon İş Akışı Tasarlama](../../exercises/tr/39-design-a-continuous-integration-workflow.md)
- Lab: [Sürekli Entegrasyon Hattı Oluşturma](../../labs/tr/39-build-a-continuous-integration-pipeline.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
