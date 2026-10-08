---
chapter: 39
title: "Sürekli Entegrasyon Hattı Oluşturma"
related_notebook: "Sürekli Entegrasyon"
related_exercise: "Sürekli Entegrasyon İş Akışı Tasarlama"
related_quiz: "Sürekli Entegrasyon Quiz'i"
level: Beginner
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/39-continuous-integration.md) | [Alıştırma](../../exercises/tr/39-design-a-continuous-integration-workflow.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Entegrasyon Hattı Oluşturma

## Amaç

Küçük bir Python projesi için GitHub Actions CI iş akışı oluşturun ve doğrulayın.

## Sonuçlar

- Doğrulamayı pull request'lerde ve `main` push'larında tetiklemek.
- Bağımlılıkları tekrarlanabilir bir çalıştırıcıda kurmak ve testleri çalıştırmak.
- Başarısız zorunlu bir kontrolü gözlemlemek ve düzeltmek.

## Ön Koşullar

- Notebook'u ve alıştırmayı tamamlayın.
- GitHub depo erişimi ve çalışan bir Python test komutu.
- Git ve metin düzenleyici.

## Senaryo

Ekibiniz her önerilen değişikliğin birleştirilmeden önce kontrol edilmesini istiyor. Bir iş akışı ekleyecek, test değişikliği açacak ve ortaya çıkan kontrolü inceleyeceksiniz.

## Ortam

| Gereksinim      | Değer                                      |
| --------------- | ------------------------------------------ |
| İşletim Sistemi | Windows, Linux veya macOS                  |
| Yazılım         | Git, GitHub hesabı, Python 3.12            |
| Depo            | `requirements.txt` ve testler içeren proje |

## Görevler

### Görev 1 — İş akışını ekleyin

`pull_request`, `main` için `push`, `permissions: contents: read`, checkout, Python kurulumu, bağımlılık kurulumu ve `python -m pytest` içeren `.github/workflows/ci.yml` oluşturun.

**Beklenen Sonuç:** GitHub iş akışını tanır ve pull request için başlatır.

### Görev 2 — Geri bildirimi tetikleyin

Bir dal açın, testleri bozmayan küçük bir değişiklik yapın ve pull request oluşturun. İş akışı çalışmasını ve kontrol özetini inceleyin.

**Beklenen Sonuç:** Doğrulama kontrolü pull request'te başarılı raporlanır.

### Görev 3 — Test başarısızlığını inceleyin

Geçici bir dalda başarısız test oluşturun, başarısız kontrolü gözlemleyin ve sonra düzeltin.

**Beklenen Sonuç:** Hata görünür olur ve düzeltilen commit kontrolü başarıya döndürür.

## Doğrulama Kontrol Listesi

- [ ] İş akışı dosyası `.github/workflows` altında.
- [ ] Her iki zorunlu tetikleyici mevcut.
- [ ] İzinler salt okunur.
- [ ] Bağımlılıklar başarıyla kuruluyor.
- [ ] Testler çalışıyor ve durumu bildiriyor.
- [ ] Başarısız test zorunlu kontrolü engelliyor.

## Sorun Giderme

| Sorun                       | Olası Neden                         | Çözüm                                                  |
| --------------------------- | ----------------------------------- | ------------------------------------------------------ |
| İş akışı başlamıyor         | YAML konumu veya tetikleyici yanlış | `.github/workflows` ve `on` değerini kontrol edin.     |
| İçeri aktarma hataları      | Bağımlılıklar kurulmadı             | `requirements.txt` ve kurulum adımını doğrulayın.      |
| Test kontrolü zorunlu değil | Dal koruması eksik                  | Tam kontrol adını zorunlu durum kontrollerine ekleyin. |

## En İyi Uygulamalar

- İş akışını tekrarlanabilir ve odaklı tutun.
- Açık adlar kullanın ve yararlı günlükleri koruyun.
- Kararsız testleri yeniden denemelerle gizlemek yerine düzeltin.

## Özet

Birleştirmeden önce değişiklikleri doğrulayan ve `main` dalını gözlemlenebilir tutan bir CI geri bildirim döngüsü oluşturdunuz.

## İlgili Bağlantılar

- Notebook: [Sürekli Entegrasyon](../../notebooks/tr/39-continuous-integration.md)
- Alıştırma: [Sürekli Entegrasyon İş Akışı Tasarlama](../../exercises/tr/39-design-a-continuous-integration-workflow.md)
- Quiz: [Sürekli Entegrasyon Quiz'i](../../quizzes/tr/39-continuous-integration-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
