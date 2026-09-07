---
chapter: 19
title: "GitLab Projesini Klonla, Katkıda Bulun ve Eşitle"
related_notebook: "GitLab Depo Erişimi, Klonlama ve Remote İş Akışları"
related_exercise: "GitLab Remote'unu İncele"
level: Başlangıç
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/19-gitlab-depo-erisimi-klonlama-ve-remote-is-akislari.md) | [Alıştırma](../../exercises/tr/19-gitlab-remoteunu-incele.md) | [Quiz](../../quizzes/tr/19-gitlab-depo-erisimi-klonlama-ve-remote-is-akislari-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## GitLab Projesini Klonla, Katkıda Bulun ve Eşitle

## Amaç

Onaylı bir GitLab projesinde küçük ve incelenebilir bir dokümantasyon katkısı hazırla; remote'u kontrol ederek bilinçli biçimde eşitle.

## Öğrenme Çıktıları

- izinli bir projeyi klonlamak ve remote'unu doğrulamak;
- branchi yalnızca fast-forward ile güncellemek;
- odaklanmış bir branchi inceleme için yayımlamak.

## Senaryo

Ekibin README için kısa bir açıklama istiyor. Varsayılan branch korumalı olduğu için değişikliği feature branchte hazırlamalı ve proje inceleme süreciyle önermelisin.

## Ön Koşullar

- [Notebook](../../notebooks/tr/19-gitlab-depo-erisimi-klonlama-ve-remote-is-akislari.md) ve [alıştırma](../../exercises/tr/19-gitlab-remoteunu-incele.md) tamamlandı.
- Uygun katkı akışına izin veren GitLab projesine erişim.
- Git ve kuruluş tarafından onaylanmış erişim yöntemi.

## Ortam Kurulumu

| Gereksinim      | Değer                                  |
| --------------- | -------------------------------------- |
| İşletim sistemi | Windows, Linux veya macOS              |
| Yazılım         | Git ve web tarayıcısı                  |
| Depo            | İzinli GitLab eğitim projesi veya fork |

## Görevler

### Görev 1 - Klonla ve doğrula

1. Onaylanmış proje URL'sini GitLab'ın **Code** alanından kopyala.
2. Projeyi klonla ve dizine gir.
3. `git remote -v` çalıştır, GitLab'da varsayılan branchi belirle.

**Beklenen Sonuç:** Klon doğru projeye bağlıdır ve merge hedefini bilirsin.

### Görev 2 - Odaklanmış branch hazırla

1. Temel branchi `git pull --ff-only` ile güncelle.
2. `docs/remote-is-akisi-notu` oluştur.
3. README'ye küçük bir açıklama ekle, diffi incele ve commit oluştur.

**Beklenen Sonuç:** Yerel branchte tek, anlaşılır dokümantasyon değişikliği vardır.

### Görev 3 - Yayımla ve eşitle

1. Branchi `git push -u origin docs/remote-is-akisi-notu` ile push et.
2. Varsayılan branche merge request aç veya gerekli fork akışını kullan.
3. Daha sonraki çalışma oturumundan önce `git fetch origin` çalıştır ve pull kararından önce değişiklikleri incele.

**Beklenen Sonuç:** Remote branch incelenebilir durumdadır; eşitleme kararı incelenmiş remote durumuna dayanır.

## Doğrulama Listesi

- [ ] Klon URL'si ve `origin` doğru projeyi gösteriyor.
- [ ] Varsayılan branch varsayılmadı, kontrol edildi.
- [ ] Değişiklik feature branchte yapıldı.
- [ ] Komutlarda, dosyalarda veya commit mesajlarında sır yok.
- [ ] Merge request veya fork katkısı proje kurallarına uyuyor.

## Sorun Giderme

| Sorun                     | Olası Neden                          | Çözüm                                           |
| ------------------------- | ------------------------------------ | ----------------------------------------------- |
| Remote erişimi reddedildi | Rolün veya erişim yöntemin yetersiz. | Dur ve onaylı erişim destek sürecini kullan.    |
| `pull --ff-only` duruyor  | Yerel ve remote geçmiş incelenmeli.  | Durumu ve geçmişi incele; entegrasyonu zorlama. |

## En İyi Uygulamalar

- Klondan ilk push öncesinde hedefi doğrula.
- Varsayılan branchi temiz tut, incelemeye uygun feature branchler kullan.
- Remote değişikliklerini entegre etmeden önce fetch yap.

## Özet

İzinli projeyi klonladın, remote ve varsayılan branchi doğruladın, odaklanmış değişikliği yayımladın ve fetch-first eşitlemeyi kullandın.

## Sonraki Adım

[Quizi](../../quizzes/tr/19-gitlab-depo-erisimi-klonlama-ve-remote-is-akislari-quiz.md) tamamla.
