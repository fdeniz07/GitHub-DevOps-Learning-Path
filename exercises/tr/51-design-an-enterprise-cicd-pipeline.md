---
chapter: 51
title: "Kurumsal CI/CD Pipeline'ı Tasarlama"
related_notebook: "Kurumsal CI/CD Pipeline'ları ve Platform Yönetişimi"
level: Advanced
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/51-enterprise-cicd-pipeline.md) | [Lab](../../labs/tr/51-review-an-enterprise-delivery-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Kurumsal CI/CD Pipeline'ı Tasarlama

## Amaç

Ekip özerkliğini korurken güvenlik, kalite ve denetim kontrollerini zorunlu kılan yönetilen bir teslimat yolu tasarlayın.

## Çıktılar

- Ortamları, onayları ve promotion kapılarını uygun risk sınırlarına yerleştirin.
- Platform ve ürün ekibi sahipliğini tanımlayın.
- Denetlenebilir dağıtım kaydı ve yeniden kullanılabilir şablon arayüzü belirtin.

## Ön Koşullar

- [Kurumsal CI/CD Pipeline'ları](../../notebooks/tr/51-enterprise-cicd-pipeline.md) bölümünü okuyun.
- Korumalı ortamları, yapıt promotion'ını ve CI workflow yeniden kullanımını anlayın.
- Operasyonel sahipliği ve eskalasyonu nasıl açıklayacağınızı bilin.

## Senaryo

Bir kuruluşta kopyalanmış workflow'lara sahip 40 hizmet var. Production sürümlerinin denetimi zor ve her ekibin farklı onay süreci bulunuyor. Güvenli, hizmete özel parametreleri destekleyen bir döşeli yol önerin.

## Görevler

### Görev 1 - Teslimat akışını modelleme

Pull request doğrulamasını, yapıt oluşturmayı, tarama ve imzalamayı, staging dağıtımını, doğrulamayı, production onayını, promotion'ı ve rollback'i çizin.

**Beklenen Sonuç:** Pipeline bir kez derler ve aynı digest'i ortamlar arasında yükseltir.

### Görev 2 - Sahipliği tanımlama

Platform, ürün, güvenlik ve sürüm rollerine sorumluluk verin. Şablonun, hizmet SLO'sunun, ilke istisnasının ve olay yanıtının sahibini ekleyin.

**Beklenen Sonuç:** Kritik hiçbir adım adı belirtilmemiş bir ekibe bağlı değildir.

### Görev 3 - Denetim kanıtını tanımlama

Commit, workflow çalışması, yapıt digest'i, test ve tarama sonuçları, onaylayan, ortam, dağıtım zamanı ve sonucu listeleyin.

**Beklenen Sonuç:** Denetçi, saklanan kanıtlardan bir production dağıtımını yeniden oluşturabilir.

## Meydan Okuma

Ekiplerin yeni güvenlik kontrollerini eski şablonlarla aşmadan güvenli biçimde yükselmesini sağlayan şablon sürümleme ve kullanımdan kaldırma ilkesi tasarlayın.

## Öz Değerlendirme

- [ ] Platform sahipliğini hizmet sahipliğinden ayırabilirim.
- [ ] Bir kez derleme ve promotion tasarlayabilirim.
- [ ] Onayları risk sınırlarına yerleştirebilirim.
- [ ] Yararlı denetim kanıtı tanımlayabilirim.

## Yaygın Hatalar

| Hata                                 | Çözüm                                                       |
| ------------------------------------ | ----------------------------------------------------------- |
| Her ortamda yeniden derlemek         | Tek bir değişmez yapıtı yükseltin.                          |
| Her hizmet kararını merkezileştirmek | Hizmet davranışı ve SLO sahipliğini ürün ekiplerinde tutun. |
| Workflow tanımlarını kopyalamak      | Sürümlü yeniden kullanılabilir şablonlar kullanın.          |

## Özet

Kurumsal teslimat; ortak kontroller yeniden kullanılabilir, sorumluluklar görünür ve kanıt commit'ten production'a kadar yapıtı izlediğinde işler.

## İlgili Bağlantılar

- Notebook: [Kurumsal CI/CD Pipeline'ları](../../notebooks/tr/51-enterprise-cicd-pipeline.md)
- Lab: [Kurumsal teslimat pipeline'ını inceleme](../../labs/tr/51-review-an-enterprise-delivery-pipeline.md)
- Quiz: [Kurumsal CI/CD pipeline quizi](../../quizzes/tr/51-enterprise-cicd-pipeline-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
