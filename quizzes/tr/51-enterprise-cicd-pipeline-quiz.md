---
chapter: 51
title: "Kurumsal CI/CD Pipeline Quizi"
related_notebook: "Kurumsal CI/CD Pipeline'ları ve Platform Yönetişimi"
related_exercise: "Kurumsal CI/CD Pipeline'ı Tasarlama"
related_lab: "Kurumsal Teslimat Pipeline'ını İnceleme"
level: Advanced
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/51-enterprise-cicd-pipeline.md) | [Alıştırma](../../exercises/tr/51-design-an-enterprise-cicd-pipeline.md) | [Lab](../../labs/tr/51-review-an-enterprise-delivery-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Kurumsal CI/CD Pipeline Quizi

## Öğrenme Hedefleri

- Yönetilen ortamları, promotion'ı ve görev ayrılığını açıklamak.
- Platform sahipliğini ürün ekibi sahipliğinden ayırmak.
- Yeniden kullanılabilir şablonları ve denetlenebilir dağıtım kanıtını tanımlamak.

## Sorular

### Soru 1

Bir kez derleme promotion'ı ne demektir?

- A. Her ortamda yapıtı yeniden oluşturmak
- B. Aynı değişmez yapıtı ortamlar arasında yükseltmek
- C. Staging'i atlamak
- D. Her ekibin ilkeyi değiştirmesine izin vermek

**Cevap:** B. Test edilen yapıt daha sonra dağıtılan yapıt olarak kalır.

### Soru 2

Yeniden kullanılabilir şablonlar neden değerlidir?

**Beklenen Cevap:** Test edilmiş ortak kontroller sağlar, workflow sapmasını azaltır ve meşru hizmet farklılıkları için güvenli parametreler sunar.

### Soru 3

Doğru mu yanlış mı: Platform ekibi her hizmetin iş mantığına ve SLO'suna sahip olmalıdır.

**Cevap:** Yanlış. Platform ekibi paylaşılan teslimat yeteneklerine; ürün ekipleri hizmet davranışına ve operasyonel hedeflere sahiptir.

### Soru 4

Denetlenebilir dağıtım kaydındaki dört alanı adlandırın.

**Beklenen Cevap:** Commit SHA'sı, workflow çalışması, yapıt digest'i, test ve tarama sonuçları, onaylayan, ortam, dağıtım zamanı ve sonuç.

### Soru 5

Production onayları nerede gerçekleşmelidir?

**Beklenen Cevap:** Denetlenebilir kimlik ve gerekli kanıtla korumalı ortamda veya başka bir açık risk sınırında.

### Soru 6

Görev ayrılığı neyi azaltmayı amaçlar?

**Cevap:** Tek bir kişinin veya sürecin riskli bir production değişikliğini bağımsız kontrol olmadan değiştirip onaylayıp dağıtabilmesi olasılığını.

## Uygulamalı Senaryo

Bir ekip imajını production'da yeniden oluşturuyor, başka bir ekip eski bir workflow şablonunu kopyalıyor ve üçüncü ekip sohbet içinde kaydedilen manuel onayları kullanıyor. Yönetişim yanıtını belirleyin.

**Beklenen Cevap:** Bir kez derleme ve digest promotion'ı zorunlu kılın, ekipleri güvenli parametreli sürümlü yeniden kullanılabilir şablona taşıyın ve onayları korumalı denetlenebilir ortamlara alın. Sahipleri, kanıt saklamayı, istisna yönetimini ve rollback'i tanımlayın.

## İnceleme Checklist'i

- [ ] Bir kez derleme promotion'ını açıklayabilirim.
- [ ] Platform ve ürün sorumluluklarını tanımlayabilirim.
- [ ] Bir onayı risk sınırına yerleştirebilirim.
- [ ] Dağıtım kanıtını listeleyebilirim.
- [ ] Şablon sürümleme ve istisnaları anlıyorum.

## İlgili Bağlantılar

- Notebook: [Kurumsal CI/CD Pipeline'ları](../../notebooks/tr/51-enterprise-cicd-pipeline.md)
- Alıştırma: [Kurumsal CI/CD pipeline'ı tasarlama](../../exercises/tr/51-design-an-enterprise-cicd-pipeline.md)
- Lab: [Kurumsal teslimat pipeline'ını inceleme](../../labs/tr/51-review-an-enterprise-delivery-pipeline.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
