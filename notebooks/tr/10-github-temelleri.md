---
chapter: 10
title: "GitHub Temelleri"
part: "GitHub"
level: Başlangıç
estimated_time: 70 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Önceki: Bölüm 09](09-ileri-git-teknikleri.md) | [Yol Haritası](../../ROADMAP.md) | Sonraki: Bölüm 11 yakında
>
> **Seviye:** Başlangıç · **Önkoşullar:** [Bölüm 09: İleri Git Teknikleri](09-ileri-git-teknikleri.md)

## Öğrenme Hedefleri

- Git ile GitHub'ı ayırt etmek;
- GitHub deposunu açıklamak;
- remote, clone, fetch, pull ve push kavramlarını sınıflandırmak;
- yerel branchleri GitHub'a bağlamak;
- temel ekip işbirliği akışını açıklamak.

## Giriş

Git yerel sürüm kontrol sistemidir. GitHub ise Git depolarını barındıran ve inceleme, issue, proje planlama ve otomasyon özellikleri sağlayan platformdur. GitHub, Git'in yerine geçmez.

## Temel Kavramlar

| Kavram        | Açıklama                                           |
| ------------- | -------------------------------------------------- |
| GitHub deposu | Çevrimiçi barındırılan ve işbirliğine açılan depo. |
| Remote        | Başka bir depoya adlandırılmış bağlantı.           |
| Origin        | Klonlanan remote için yaygın varsayılan ad.        |
| Push          | Yerel commitleri remote'a göndermek.               |
| Fetch         | Remote bilgilerini entegrasyon yapmadan indirmek.  |
| Pull          | Fetch ve mevcut branche entegre etmek.             |

## Kuram

```bash
git remote -v
git fetch origin
git pull origin main
git push -u origin main
```

Depoya katkı vermeden önce README, lisans, issue, branch, release ve katkı kurallarını inceleyin.

## Uygulamalı Örnek

```bash
git clone https://github.com/example/project.git
cd project
git remote -v
git switch -c feature/add-docs
git push -u origin feature/add-docs
```

Bu işlem branchi GitHub'da görünür hale getirir ve ileride pull request açmanıza izin verir.

## En İyi Uygulamalar

- Push ve pull öncesinde remote'u kontrol edin.
- Tokenları kaynak koda yazmayın.
- Küçük ve odaklı branchler kullanın.
- Depo kurallarını katkıdan önce okuyun.

## Yaygın Hatalar

GitHub'ı Git sanmak, yanlış depoya push etmek, hedef branchi bilmeden pull yapmak ve herkese açık depoya özel veri göndermekten kaçının.

## Özet

Git yerel geçmişi yönetir; GitHub bu geçmişi barındırır ve ekip işbirliğini destekler. Remote, clone, fetch, pull ve push iki alanı birbirine bağlar.

## Sonraki Bölüm

Bölüm 11 clone, fork, origin ve upstream akışlarını ayrıntılandırır.

### İlgili İçerik

- Alıştırma: [GitHub Deposunu Keşfetme](../../exercises/tr/10-github-deposunu-kesfet.md)
- Laboratuvar: [Depoyu Klonlama ve Gönderme](../../labs/tr/10-depo-klonla-ve-gonder.md)
- Quiz: [GitHub Temelleri Quiz'i](../../quizzes/tr/10-github-temelleri-quiz.md)
