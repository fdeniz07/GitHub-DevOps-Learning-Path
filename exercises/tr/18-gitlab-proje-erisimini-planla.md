---
chapter: 18
title: "GitLab Proje Erişimini Planla"
related_notebook: "GitLab Gruplar, Projeler, Üyeler ve İzinler"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md) | [Laboratuvar](../../labs/tr/18-gitlab-proje-erisimini-yapilandir.md) | [Quiz](../../quizzes/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Proje Erişimini Planla

## Amaç

Bir GitLab grubu ve projeleri için en az ayrıcalık ilkesine dayalı erişim planı tasarlamak.

## Öğrenme Çıktıları

- group ve project üyeliği kararlarını ayırmak;
- belgelenmiş göreve göre rol seçmek;
- erişim incelemesi ve korunan branch kuralı eklemek.

## Ön Koşullar

- [Bölüm 18 notebooku](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md) tamamlandı.
- Bir GitLab projesini veya örnek hiyerarşiyi görüntüleyebiliyorsun.

## Senaryo

`acme/platform` grubu `storefront` ve `payments` projelerini içerir. Dana iki projeyi de destekler, Lee yalnızca storefront dokümantasyonunu günceller ve bir yüklenici iki hafta payments için salt-okunur erişim ister. `main` branchleri yalnızca review sonrasında merge edilmelidir.

## Görevler

### Görev 1 - Üyelik modelleme

Kimin group üyeliği, kimin yalnızca project üyeliği alması gerektiğine karar ver. Her kararı gerekçelendir.

**Beklenen Sonuç:** Dananın proje-ötesi sorumluluğu karşılanır; dar ihtiyaçlar varsayılan olarak genişletilmez.

### Görev 2 - En az ayrıcalığı uygulama

Dana, Lee ve yüklenici için yapılandırılmış en düşük uygun rolü seç. Her kişinin yapabilmesi ve yönetememesi gereken işleri yaz.

**Beklenen Sonuç:** Her rol yalnızca unvana değil, göreve dayanır.

### Görev 3 - Kontrol tanımlama

Erişim incelemesi için üç soru ve korunan `main` branchi için kısa bir kural yaz.

**Beklenen Sonuç:** İnceleme kalıtımlı erişim ile süresi biten yüklenici erişimini kapsar; normal doğrudan pushlar engellenir.

## Ek Görev (İsteğe Bağlı)

`acme/platform/payments` gibi bir alt grubun, düz bir gruba göre sahipliği ne zaman daha açık gösterdiğini açıkla.

## Öz Değerlendirme

- [ ] Görünürlük ile üyeliği ayırdım.
- [ ] Rolleri en az ayrıcalıkla seçtim.
- [ ] Erişim incelemesi ve branch kuralı ekledim.

## Yaygın Hatalar

| Hata                                         | Çözüm                                                           |
| -------------------------------------------- | --------------------------------------------------------------- |
| Tek project görevi için group erişimi vermek | Ortak erişim gerekçeli değilse doğrudan project üyeliği kullan. |
| Geçici erişimi kalıcı kabul etmek            | İnceleme veya kaldırma tarihi belirle.                          |

## Özet

- Group üyeliği ortak erişimi ölçekler; project üyeliği dar istisnaları çözer.
- Roller ve korunan branchler bilinçli seçilmeli ve incelenmelidir.

### İlgili İçerik

- Notebook: [GitLab Gruplar, Projeler, Üyeler ve İzinler](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md)
- Laboratuvar: [GitLab Proje Erişimini Yapılandır](../../labs/tr/18-gitlab-proje-erisimini-yapilandir.md)
- Quiz: [GitLab Gruplar, Projeler, Üyeler ve İzinler Quiz'i](../../quizzes/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler-quiz.md)
- [Yol Haritası](../../ROADMAP.md)
