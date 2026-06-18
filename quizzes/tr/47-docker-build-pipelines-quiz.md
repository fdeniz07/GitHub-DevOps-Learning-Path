---
chapter: 47
title: "Docker Derleme Pipeline'ları Quizi"
related_notebook: "Tekrarlanabilir Docker Derleme Pipeline'ları"
related_exercise: "Docker Derleme Pipeline'ı Tasarlama"
related_lab: "Docker Derleme Pipeline'ı Çalıştırma"
level: Intermediate
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/47-docker-build-pipelines.md) | [Alıştırma](../../exercises/tr/47-design-a-docker-build-pipeline.md) | [Lab](../../labs/tr/47-run-a-docker-build-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Docker Derleme Pipeline'ları Quizi

## Öğrenme Hedefleri

- Tekrarlanabilir ve önbelleklenebilir Docker derlemeleri tasarlamak.
- Çok aşamalı derleme kullanmak ve son imajı taramak.
- Yayımlamayı test ve güvenlik kanıtına bağlamak.

## Sorular

### Soru 1

Çok aşamalı Dockerfile'ın ana yararı nedir?

- A. Hiç güvenlik açığı olmadığını garanti eder
- B. Derleme araçlarını çalışma zamanı imajının dışında tutar
- C. Test ihtiyacını ortadan kaldırır
- D. Etiketleri değişmez yapar

**Cevap:** B. Derleme ve çalışma zamanı sorumlulukları ayrılır.

### Soru 2

Bağımlılık lock file'ı neden önbellek anahtarını etkilemelidir?

**Cevap:** Bağımlılık değişikliği önbelleğe alınmış geri yükleme adımını geçersiz kılmalı, böylece imaj bildirilen sürümleri kullanmalıdır.

### Soru 3

Doğru mu yanlış mı: Yalnızca kaynak bağımlılıklarını taramak son konteynerin güvenli olduğunu kanıtlar.

**Cevap:** Yanlış. Son imaj temel işletim sistemi paketlerini ve çalışma zamanı dosyalarını da içerir.

### Soru 4

İki yararlı derleme kanıtı yapıtı adlandırın.

**Beklenen Cevap:** Test günlükleri, güvenlik açığı tarama raporu, SBOM, provenance metadatası ve kaynak commit tanımlayıcısı örneklerdir.

### Soru 5

Korumalı registry yayımlama işi ne zaman çalışmalıdır?

**Cevap:** Testler, imaj kontrolleri ve tarama ilke kapıları geçtikten sonra ve yalnızca yayımlama kimlik bilgilerine güvenle erişebilen bağlamda.

### Soru 6

`latest` neden kötü bir dağıtım kimliğidir?

**Beklenen Cevap:** Değişebilirdir ve zaman içinde farklı byte'lara işaret edebilir. İzlenebilirlik için commit etiketi, dağıtım için digest kullanın.

## Uygulamalı Senaryo

Bir pipeline değişken temel etiketten imaj oluşturuyor, kaynak kodda test çalıştırıyor, yalnızca repository'yi tarıyor ve tarama işinden önce push ediyor. En önemli dört değişikliği belirleyin.

**Beklenen Cevap:** Temel girdiyi kontrol edin veya sabitleyin, son imajı test edin, son çalışma zamanı imajını tarayın ve yayımlamayı başarılı test ve tarama ilkesine bağlayın. Commit ve imaj digest'ini kaydedin.

## İnceleme Checklist'i

- [ ] Çok aşamalı derlemeleri anlıyorum.
- [ ] Önbellek geçersizleştirmesini açıklayabilirim.
- [ ] Son imajı tarayabilirim.
- [ ] Yayımlamayı kalite kapılarından sonra yerleştirebilirim.
- [ ] Tekrarlanabilirlik kanıtını adlandırabilirim.

## İlgili Bağlantılar

- Notebook: [Tekrarlanabilir Docker Derleme Pipeline'ları](../../notebooks/tr/47-docker-build-pipelines.md)
- Alıştırma: [Docker derleme pipeline'ı tasarlama](../../exercises/tr/47-design-a-docker-build-pipeline.md)
- Lab: [Docker derleme pipeline'ı çalıştırma](../../labs/tr/47-run-a-docker-build-pipeline.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
