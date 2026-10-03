---
chapter: 49
title: "Bulut Dağıtımı Planlama"
related_notebook: "Bulut Dağıtım Modelleri, Yapılandırma ve Geri Dönüş"
level: Intermediate
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/49-cloud-deployments.md) | [Lab](../../labs/tr/49-deploy-an-application-to-the-cloud.md) | [Yol Haritası](../../ROADMAP.md)

# Bulut Dağıtımı Planlama

## Amaç

Yapılandırma, health check'ler, rollout kapıları ve rollback içeren durum bilgisi taşımayan bir konteyner hizmeti için dağıtım planı oluşturun.

## Çıktılar

- Bir bulut dağıtım modeli seçip ödünleşimlerini açıklayın.
- Yapılandırma ve sırları doğru sınıflandırın.
- Readiness, liveness ve rollback koşullarını tanımlayın.

## Ön Koşullar

- [Bulut Dağıtım Modelleri](../../notebooks/tr/49-cloud-deployments.md) bölümünü okuyun.
- Konteyner imajlarını, registry'leri ve HTTP health endpoint'lerini anlayın.
- Bulut test aboneliğine erişim yararlıdır ancak zorunlu değildir.

## Senaryo

Bir checkout API imajı yeniden oluşturulmadan test ortamından production'a taşınmalıdır. Hizmet bir veritabanı parolası, upstream orders URL'si ve readiness endpoint'i kullanır.

## Görevler

### Görev 1 - Dağıtım modelini seçme

VM, yönetilen konteyner hizmeti ve orkestratörü karşılaştırın. Hizmet için birini seçip operasyonel sorumlulukları kaydedin.

**Beklenen Sonuç:** Karar ölçeklendirme, ağ, patch uygulama, ekip uzmanlığı ve kurtarmayı ele alır.

### Görev 2 - Çalışma zamanı sözleşmesini oluşturma

İmaj digest'ini, portu, genel yapılandırmayı, secret referanslarını, kaynak sınırlarını, readiness yolunu ve liveness yolunu listeleyin.

**Beklenen Sonuç:** Hiçbir sır imajda veya düz metin dağıtım manifestinde saklanmaz.

### Görev 3 - Yükseltme ve rollback tanımlama

Rollout gözlem penceresini, health ve SLO kapılarını, onay sınırını, önceki sürümü ve rollback komutunu veya operatör eylemini belirtin.

**Beklenen Sonuç:** Başka bir operatör olay sırasında adım uydurmadan dağıtabilir ve kurtarabilir.

## Meydan Okuma

Trafiğin %10'unu alan bir canary aşaması ekleyin ve %100'e geçmeden önce gereken kanıtı tanımlayın.

## Öz Değerlendirme

- [ ] Bulut dağıtım modellerini karşılaştırabilirim.
- [ ] Yapılandırmayı sırlarından ayırabilirim.
- [ ] Readiness ile liveness'ı ayırabilirim.
- [ ] Ölçülebilir rollback tetikleyicileri yazabilirim.

## Yaygın Hatalar

| Hata                                 | Çözüm                                                     |
| ------------------------------------ | --------------------------------------------------------- |
| Production için yeniden derlemek     | Test edilmiş digest'i yükseltin.                          |
| Parolayı sıradan yapılandırma sanmak | Secret manager üzerinden saklayıp referans verin.         |
| Önceki sürüm bulundurmamak           | Rollback adaylarını kullanılabilir ve test edilmiş tutun. |

## Özet

Bir dağıtım planı; yapıtı, çalışma zamanı yapılandırmasını, health kapılarını, sahipliği ve rollback yolunu açıkça belirlediğinde tamamdır.

## İlgili Bağlantılar

- Notebook: [Bulut Dağıtım Modelleri](../../notebooks/tr/49-cloud-deployments.md)
- Lab: [Bir uygulamayı buluta dağıtma](../../labs/tr/49-deploy-an-application-to-the-cloud.md)
- Quiz: [Bulut dağıtımları quizi](../../quizzes/tr/49-cloud-deployments-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
