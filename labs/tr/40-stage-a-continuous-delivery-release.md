---
chapter: 40
title: "Sürekli Teslimat Sürümünü Hazırlama"
related_notebook: "Sürekli Teslimat"
related_exercise: "Sürekli Teslimat Sürümü Planlama"
related_quiz: "Sürekli Teslimat Quiz'i"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/40-continuous-delivery.md) | [Alıştırma](../../exercises/tr/40-plan-a-continuous-delivery-release.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Teslimat Sürümünü Hazırlama

## Amaç

Tek bir sürüm yapıtı oluşturun, hazırlamada test edin ve üretimi otomatik dağıtmadan üretime hazır olmayı belgeleyin.

## Sonuçlar

- package, staging ve production işlerini ayırmak.
- İşler arasında tek bir değişmez yapıt aktarmak.
- Bir onay sınırını ve geri alma planını göstermek.

## Ön Koşullar

- Notebook'u ve alıştırmayı tamamlayın.
- `needs`, `upload-artifact` ve `download-artifact` değerlerini anlayın.
- Bir proje derleme komutuna sahip olun.

## Senaryo

Bir hizmet tekrarlanabilir bir sürüm adayına ihtiyaç duyuyor. Bir kez paketleyen, hazırlamada doğrulayan ve üretimi korumalı bir ortamın arkasında bırakan iş akışı oluşturacaksınız.

## Ortam

| Gereksinim      | Değer                                    |
| --------------- | ---------------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS                |
| Yazılım         | GitHub Actions, Git, proje derleme aracı |
| Erişim          | `staging` ortamı oluşturma izni          |

## Görevler

### Görev 1 — Bir kez paketleyin

Uygulamayı derleyen, test eden, arşivleyen ve `release-candidate` olarak yükleyen bir `package` işi oluşturun.

**Beklenen Sonuç:** Başarılı derlemeden sonra adlandırılmış tek yapıt kullanılabilir.

### Görev 2 — Hazırlamayı doğrulayın

`needs: package` içeren bir `staging` işi oluşturun, yapıtı indirin, sağlama toplamını doğrulayın ve smoke test çalıştırın.

**Beklenen Sonuç:** Hazırlama, sürüm için hedeflenen paketin aynısını test eder.

### Görev 3 — Üretime hazır olmayı belgeleyin

Korumalı bir `production` ortamı oluşturun ve onay, kanıt ve geri alma adımlarını yazın. Otomatik ilerletme yapılandırmayın.

**Beklenen Sonuç:** Hat isteğe bağlı olarak sürümlenebilir ancak üretimi sessizce dağıtmaz.

## Doğrulama Kontrol Listesi

- [ ] Yapıt bir kez oluşturuldu.
- [ ] Hazırlama yüklenen yapıtı indiriyor.
- [ ] Bir sağlama toplamı veya sürüm kaydedildi.
- [ ] Üretimde onay sınırı var.
- [ ] Geri alma bilinen iyi bir yapıtı kullanıyor.

## Sorun Giderme

| Sorun                             | Olası Neden                          | Çözüm                                       |
| --------------------------------- | ------------------------------------ | ------------------------------------------- |
| Yapıt kullanılamıyor              | İş bağımlılığı veya yapıt adı farklı | `needs` ve `name` değerlerini kontrol edin. |
| Hazırlama yeni derleme kullanıyor | Hazırlamada derleme komutları var    | Yeniden derlemeyi kaldırıp yapıtı indirin.  |
| Onay atlanıyor                    | Ortam kuralları eksik                | `production` korumasını yapılandırın.       |

## En İyi Uygulamalar

- Yapıtları değişmez ve izlenebilir tutun.
- Test ve sağlama toplamı kanıtını kaydedin.
- Gerçek sürümden önce geri almayı test edin.

## Özet

Bu lab teknik sürüme hazır olmayı bilinçli üretim sürümü kararından ayırır.

## İlgili Bağlantılar

- Notebook: [Sürekli Teslimat](../../notebooks/tr/40-continuous-delivery.md)
- Alıştırma: [Sürekli Teslimat Sürümü Planlama](../../exercises/tr/40-plan-a-continuous-delivery-release.md)
- Quiz: [Sürekli Teslimat Quiz'i](../../quizzes/tr/40-continuous-delivery-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
