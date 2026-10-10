---
chapter: 47
title: "Docker Derleme Pipeline'ı Çalıştırma"
related_notebook: "Tekrarlanabilir Docker Derleme Pipeline'ları"
related_exercise: "Docker Derleme Pipeline'ı Tasarlama"
level: Intermediate
estimated_time: 100 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/47-docker-build-pipelines.md) | [Alıştırma](../../exercises/tr/47-design-a-docker-build-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Docker Derleme Pipeline'ı Çalıştırma

## Amaç

Tek bir değişmez konteyner yapıtını oluşturan, test eden, tarayan ve kaydeden yerel veya CI pipeline'ı uygulayın.

## Çıktılar

- Çok aşamalı Dockerfile ve bağımlılık lock file'ı kullanın.
- Testleri oluşturulmuş imaja karşı çalıştırın.
- Yayımdan önce tarama ve derleme kanıtı üretin.

## Ön Koşullar

- Notebook ve alıştırmayı tamamlamış olmak.
- Docker ve tekrarlanabilir bağımlılık kurulumu olan bir proje.
- Yerel kurulu veya CI'da kullanılabilir Trivy gibi bir güvenlik açığı tarayıcısı.

## Senaryo

Bir hizmet imajı büyümüş ve testlerden önce yayımlanıyor. Çalışma zamanı imajını küçültün ve test veya tarama başarısız olduğunda yayımlamayı engelleyin.

## Ortam

| Gereksinim      | Değer                                            |
| --------------- | ------------------------------------------------ |
| İşletim sistemi | Windows, Linux veya macOS                        |
| Yazılım         | Docker, proje test runner'ı, Trivy veya eşdeğeri |
| İmaj etiketi    | `service:${GIT_COMMIT}`                          |
| Kanıt           | Test günlüğü, tarama raporu, SBOM                |

## Görevler

### Görev 1 - Derleme ve çalışma zamanı aşamalarını oluşturma

Derleme ve test bağımlılıklarını derleme aşamasına taşıyın. Son aşamaya yalnızca çalışma zamanı çıktısını kopyalayın ve root olmayan kullanıcı ayarlayın.

**Beklenen Sonuç:** Çalışma zamanı imajı derleyicileri veya kaynak kontrol metadatasını içermez.

### Görev 2 - İmajı test etme

Commit tabanlı etiketle oluşturun, imajı başlatın, testlerini veya smoke check'lerini çalıştırın ve çıktıyı yapıt olarak kaydedin.

**Beklenen Sonuç:** Testler taranacak ve yayımlanacak aynı imajı çalıştırır.

### Görev 3 - Tarama ve kapı

`trivy image --severity HIGH,CRITICAL --exit-code 1 service:${GIT_COMMIT}` çalıştırın. SBOM üretin ve onaylanmış, süresi dolan istisnayı belgeleyin.

**Beklenen Sonuç:** Başarısız ilke yayımlamayı engeller ve başarılı çalışma kanıtı saklar.

## Doğrulama Checklist'i

- [ ] Derleme bağlamı sırları ve yerel yapıtları dışlıyor.
- [ ] Çok aşamalı çıktı yalnızca çalışma zamanı gereksinimlerini içeriyor.
- [ ] Testler son imaja karşı çalışıyor.
- [ ] Tarama tam commit etiketini hedefliyor.
- [ ] SBOM ve günlükler saklanıyor.

## Sorun Giderme

| Problem                                    | Olası neden                        | Çözüm                                                 |
| ------------------------------------------ | ---------------------------------- | ----------------------------------------------------- |
| Önbellek bağımlılık değişikliğini gizliyor | Lock file önbellek anahtarında yok | Anahtara lock file içeriğini ekleyin.                 |
| Tarayıcı temel açıkları bildiriyor         | Çalışma zamanı temel imajı eski    | Temel imajı güncelleyin veya süreli istisna kaydedin. |
| Yayımlama başarısızlıktan sonra çalışıyor  | İşler bağımlılıklarla bağlanmamış  | Yayımdan önce test ve tarama işlerini zorunlu kılın.  |

## En İyi Uygulamalar

- Yapıtı etkileyen girdileri sabitleyin ve kaynak commit'ini kaydedin.
- Tarama ilkesini imaj derleme kodundan ayrı tutun ancak pipeline'da zorlayın.
- İstisnaların sahibi, gerekçesi ve otomatik bitiş tarihi olsun.

## Özet

Güvenilir bir derleme pipeline'ı tek bir test edilmiş çalışma zamanı imajı üretir, onu tarar ve registry push'ından önce kanıtı korur.

## İlgili Bağlantılar

- Notebook: [Tekrarlanabilir Docker Derleme Pipeline'ları](../../notebooks/tr/47-docker-build-pipelines.md)
- Alıştırma: [Docker derleme pipeline'ı tasarlama](../../exercises/tr/47-design-a-docker-build-pipeline.md)
- Quiz: [Docker derleme pipeline'ları quizi](../../quizzes/tr/47-docker-build-pipelines-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
