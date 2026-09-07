---
chapter: 18
title: "GitLab Proje Erişimini Yapılandır"
related_notebook: "GitLab Gruplar, Projeler, Üyeler ve İzinler"
related_exercise: "GitLab Proje Erişimini Planla"
level: Başlangıç
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md) | [Alıştırma](../../exercises/tr/18-gitlab-proje-erisimini-planla.md) | [Quiz](../../quizzes/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Proje Erişimini Yapılandır

## Amaç

Gereksiz yönetim yetkileri vermeden küçük bir GitLab proje erişim modelini yapılandırmak ve doğrulamak.

## Öğrenme Çıktıları

- doğrudan ve kalıtımlı üyeliği incelemek;
- deneme projesindeki üyeye en az ayrıcalıklı rolü vermek;
- varsayılan branchi merge-request akışı için korumak.

## Senaryo

Bir ekip grubunda izinli bir eğitim projesi yönetiyorsun. Dokümantasyon katkıcısı değişiklik önerebilmeli, varsayılan branch ise normal doğrudan pushlara kapalı kalmalıdır.

## Ön Koşullar

- [Bölüm 18 notebooku](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md) ve [alıştırma](../../exercises/tr/18-gitlab-proje-erisimini-planla.md) tamamlandı.
- Bir GitLab eğitim projesinde erişim ve branch kuralı yönetme iznin var.

## Ortam Kurulumu

| Gereksinim | Değer                                                  |
| ---------- | ------------------------------------------------------ |
| Platform   | GitLab web arayüzü                                     |
| Erişim     | Seçili eğitim projesini yönetme izni                   |
| Güvenlik   | Üretim üyeliklerini veya branch kurallarını değiştirme |

## Görevler

### Görev 1 - Mevcut modeli inceleme

1. Project yolunu, görünürlüğü ve varsayılan branchi kaydet.
2. GitLab'ın gösterdiği doğrudan ve kalıtımlı üyeleri listele.
3. Her katkıcının hangi üyeliğe ihtiyacı olduğunu belirle.

**Beklenen Sonuç:** Her kişinin erişimi nasıl aldığını açıklayabilirsin.

### Görev 2 - Katkıcıyı yapılandırma

1. Eğitim kullanıcısını en dar uygun kapsama ekle.
2. Branch ve merge request çalışmasına izin veren en düşük rolü seç.
3. Erişim için görevi, sorumluyu ve inceleme tarihini kaydet.

**Beklenen Sonuç:** Katkıcı iş birliği yapabilir ancak project ayarlarını yönetemez.

### Görev 3 - Varsayılan branchi koruma

1. Eğitim projesinin branch koruma ayarlarını aç.
2. `main` branchini merge request ve ekipte gereken onaylar veya kontroller için yapılandır.
3. Görünen push ve merge izinlerini doğrula; üye listesini yeniden incele.

**Beklenen Sonuç:** Branch kuralı ve üyelik modeli incelenebilir bir akışı destekler.

## Doğrulama Listesi

- [ ] Eğitim projesinin görünürlüğü bilinçli seçildi.
- [ ] Hiçbir üyeye gerekenden geniş rol verilmedi.
- [ ] Doğrudan ve kalıtımlı erişim incelendi.
- [ ] Varsayılan branchin uygun koruma kuralı var.

## Sorun Giderme

| Sorun                              | Olası Neden                             | Çözüm                                                          |
| ---------------------------------- | --------------------------------------- | -------------------------------------------------------------- |
| Bir üyenin beklenmeyen erişimi var | Üyelik üst gruptan kalıtılmış olabilir. | Project rolünü değiştirmeden önce group üyeliğini incele.      |
| Branch ayarı değiştirilemiyor      | Rolün gerekli yönetim iznini içermiyor. | Onaylı eğitim projesi sahibini kullan; gereksiz yetki artırma. |

## En İyi Uygulamalar

- Erişim değişikliklerini önce eğitim projesinde dene.
- Geçici erişim için sorumlu ve inceleme tarihi kaydet.
- Üyelik veya kural değişiminden sonra branch korumasını doğrula.

## Özet

- Etkin erişim group veya doğrudan project üyeliğinden gelebilir.
- Branch koruması önemli değişiklikleri review sürecinde tutar.

### İlgili İçerik

- Notebook: [GitLab Gruplar, Projeler, Üyeler ve İzinler](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md)
- Alıştırma: [GitLab Proje Erişimini Planla](../../exercises/tr/18-gitlab-proje-erisimini-planla.md)
- Quiz: [GitLab Gruplar, Projeler, Üyeler ve İzinler Quiz'i](../../quizzes/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler-quiz.md)
- [Yol Haritası](../../ROADMAP.md)
