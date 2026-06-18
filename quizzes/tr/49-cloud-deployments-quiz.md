---
chapter: 49
title: "Bulut Dağıtımları Quizi"
related_notebook: "Bulut Dağıtım Modelleri, Yapılandırma ve Geri Dönüş"
related_exercise: "Bulut Dağıtımı Planlama"
related_lab: "Bir Uygulamayı Buluta Dağıtma"
level: Intermediate
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/49-cloud-deployments.md) | [Alıştırma](../../exercises/tr/49-plan-a-cloud-deployment.md) | [Lab](../../labs/tr/49-deploy-an-application-to-the-cloud.md) | [Yol Haritası](../../ROADMAP.md)

# Bulut Dağıtımları Quizi

## Öğrenme Hedefleri

- Bulut dağıtım modellerini karşılaştırmak.
- Yapılandırmayı ve sırları dışsallaştırmak.
- Health check, promotion kapısı ve rollback kullanmak.

## Sorular

### Soru 1

Readiness check ne içindir?

- A. Bir örneğin trafik alıp almayacağına karar vermek
- B. Veritabanı parolası saklamak
- C. İmaj oluşturmak
- D. Eski sürümleri silmek

**Cevap:** A. Readiness, örneğin güvenle trafik alabileceğini gösterir.

### Soru 2

Liveness readiness'ten nasıl farklıdır?

**Beklenen Cevap:** Liveness bir sürecin yeniden başlatılmasının gerekip gerekmediğini, readiness ise trafiği kontrol eder. Farklı operasyonel soruları yanıtlarlar.

### Soru 3

Doğru mu yanlış mı: Aynı imaj normalde staging ve production için ayrı ayrı yeniden oluşturulmalıdır.

**Cevap:** Yanlış. Aynı test edilmiş değişmez imajı yükseltin ve yalnızca gerektiği kadar harici yapılandırmayı değiştirin.

### Soru 4

Production veritabanı parolası nerede saklanmalıdır?

**Beklenen Cevap:** Yönetilen secret store'da veya korumalı secret mekanizmasında, çalışma zamanında en az ayrıcalıklı erişimle referanslanmalıdır.

### Soru 5

Üç yararlı rollback tetikleyicisi söyleyin.

**Beklenen Cevap:** Başarısız readiness, kalıcı hata oranı artışı, SLO ihlali, kabul edilemez gecikme veya başarısız bağımlılık kontrolü.

### Soru 6

Rollout neden bir gözlem penceresi içermelidir?

**Cevap:** Bazı hatalar yalnızca gerçek trafik altında ortaya çıkar. Gözlem, tam promotion'dan önce health ve kullanıcı sinyallerini karşılaştırmayı sağlar.

## Uygulamalı Senaryo

Yeni sürüm başarıyla başlıyor ancak production trafiği aldıktan sonra %20 hata döndürüyor. Ekip ne yapmalıdır?

**Beklenen Cevap:** Kapıya göre promotion'ı durdurun veya geri çevirin, kanıtı koruyun, trafiği önceki bilinen iyi sürüme yönlendirin, sağlığı doğrulayın ve günlük, metrik ve trace'lerle inceleyin. İzlenmemiş acil bir yapıtı yeniden oluşturmayın.

## İnceleme Checklist'i

- [ ] VM, yönetilen konteyner ve orkestratör modellerini karşılaştırabilirim.
- [ ] Sırları yapılandırmadan ayırabilirim.
- [ ] Readiness ve liveness'ı açıklayabilirim.
- [ ] Rollback tetikleyicileri tanımlayabilirim.
- [ ] Promotion kanıtını açıklayabilirim.

## İlgili Bağlantılar

- Notebook: [Bulut Dağıtım Modelleri](../../notebooks/tr/49-cloud-deployments.md)
- Alıştırma: [Bulut dağıtımı planlama](../../exercises/tr/49-plan-a-cloud-deployment.md)
- Lab: [Bir uygulamayı buluta dağıtma](../../labs/tr/49-deploy-an-application-to-the-cloud.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
