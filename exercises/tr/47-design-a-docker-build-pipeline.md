---
chapter: 47
title: "Docker Derleme Pipeline'ı Tasarlama"
related_notebook: "Tekrarlanabilir Docker Derleme Pipeline'ları"
level: Intermediate
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/47-docker-build-pipelines.md) | [Lab](../../labs/tr/47-run-a-docker-build-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Docker Derleme Pipeline'ı Tasarlama

## Amaç

Tek bir tekrarlanabilir Docker imajını oluşturan, test eden, tarayan ve yayımlayan bir CI workflow'u tasarlayın.

## Çıktılar

- Derleme, test, tarama ve yayımlama aşamalarını güvenli sıraya koyun.
- Önbellek girdilerini ve değişmez imaj tanımlayıcılarını seçin.
- Güvenlik açığı ilkesi ve istisna kaydı tanımlayın.

## Ön Koşullar

- [Tekrarlanabilir Docker Derleme Pipeline'ları](../../notebooks/tr/47-docker-build-pipelines.md) bölümünü okuyun.
- Dockerfile'ları, lock file'ları, CI işlerini ve registry kimlik doğrulamasını anlayın.
- Bir CI platformuna veya YAML düzenleyicisine erişiminiz olsun.

## Senaryo

Bir ekip testler bitmeden imaj yayımlıyor ve dağıtımlar için `latest` kullanıyor. Son imajın yayımlanmadan önce test edilip taranacağı şekilde workflow'u yeniden tasarlayın.

## Görevler

### Görev 1 - Pipeline aşamalarını eşleme

Checkout, bağımlılık geri yükleme, birim testleri, imaj derleme, imaj testi, güvenlik açığı taraması, SBOM üretimi ve yayımlama aşamalarını çizin veya listeleyin.

**Beklenen Sonuç:** Her aşamanın bir gerekçesi ve önceki kanıta bağımlılığı vardır.

### Görev 2 - Tekrarlanabilir girdileri tanımlama

Lock file'ı, temel imaj ilkesini, commit etiketini, derleme bağlamını ve önbellek anahtarını belirtin. Hangi değişikliklerin bağımlılık önbelleğini geçersiz kıldığını yazın.

**Beklenen Sonuç:** Bir gözden geçiren iki derlemenin ne zaman farklı çıktı üretmesi gerektiğini belirleyebilir.

### Görev 3 - Kalite kapıları ekleme

Anlaşılan `HIGH` ve `CRITICAL` bulgularında başarısız olan ve yalnızca gözden geçirilmiş commit ile etiketlenmiş imajı yayımlayan bir workflow parçası yazın.

**Beklenen Sonuç:** Pull request kodu production yayımlama kimlik bilgilerini kullanamaz ve başarısız taramalar yükseltilemez.

## Meydan Okuma

Workflow'a provenance ve SBOM yapıtları ekleyin; bir sürüm gözden geçiricisinin bunları imaj digest'ine nasıl bağlayacağını açıklayın.

## Öz Değerlendirme

- [ ] Çok aşamalı derlemelerin çalışma zamanı içeriğini neden azalttığını açıklayabilirim.
- [ ] Önbellek optimizasyonunu güvenlik kapısından ayırabilirim.
- [ ] Son çalışma zamanı imajını tarayabilirim.
- [ ] Testler geçmeden yayımlamayı engelleyebilirim.

## Yaygın Hatalar

| Hata                                                      | Çözüm                                         |
| --------------------------------------------------------- | --------------------------------------------- |
| `latest`'i sürüm kimliği olarak yeniden kullanmak         | Commit ile etiketleyin ve digest ile dağıtın. |
| Yalnızca kaynak dosyaları taramak                         | Temel paketler dahil son imajı tarayın.       |
| Pull request'lerle yayımlama kimlik bilgilerini paylaşmak | Korumalı yayımlama işlerini ayırın.           |

## Özet

Bir Docker derleme pipeline'ı kanıtı sırayla oluşturmalı ve yalnızca test edilmiş, taranmış ve izlenebilir bir imajı yayımlamalıdır.

## İlgili Bağlantılar

- Notebook: [Tekrarlanabilir Docker Derleme Pipeline'ları](../../notebooks/tr/47-docker-build-pipelines.md)
- Lab: [Docker derleme pipeline'ı çalıştırma](../../labs/tr/47-run-a-docker-build-pipeline.md)
- Quiz: [Docker derleme pipeline'ları quizi](../../quizzes/tr/47-docker-build-pipelines-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
