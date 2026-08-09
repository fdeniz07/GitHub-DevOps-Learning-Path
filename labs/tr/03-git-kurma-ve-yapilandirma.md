---
chapter: 03
title: "Git'i Kurma ve Yapılandırma"
related_notebook: "Git Kurulumu"
related_exercise: "Git Kurulumunu Doğrulama"
level: Başlangıç
estimated_time: 40 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/03-git-kurulumu.md) | [Alıştırma](../../exercises/tr/03-git-kurulumunu-dogrulama.md) | [Quiz](../../quizzes/tr/03-git-kurulumu-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git'i Kurma ve Yapılandırma

## Amaç

Onaylı işletim sistemi yöntemiyle Git'i kurmak, yeni terminalde doğrulamak ve bilinçli commit kimliği ayarlamak.

## Gereksinimler

- Yazılım kurma yetkisi olan hesap veya onaylı destek süreci.
- Git Bash, PowerShell, Windows Terminal ya da sistem terminali.
- Commit geçmişinde kullanılmaya uygun ad ve e-posta adresi.

## Görevler

### Görev 1 - Git'i Kurun

1. Resmi [Git Downloads](https://git-scm.com/downloads) sayfasını açın.
2. İşletim sisteminize uygun desteklenen yöntemi seçin.
3. Kurulumu veya kuruluşunuzun onaylı kurulum sürecini tamamlayın.
4. Kurulum sırasında açık olan bütün terminalleri kapatın.

#### Beklenen Sonuç: Git Kuruldu

Git kuruludur ve yeni terminal gerekli PATH güncellemelerini yükleyebilir.

### Görev 2 - Terminali Doğrulayın

Yeni terminal açın ve şu komutu çalıştırın:

```bash
git --version
```

Sürüm yazdırılmazsa burada durun; devam etmeden önce kurulum veya PATH sorununu çözün.

#### Beklenen Sonuç: Git Kullanılabilir

Komut, kullanacağınız terminalde bir Git sürümü yazdırır.

### Görev 3 - Kimliği Yapılandırın ve Kontrol Edin

Yer tutucuları kendi bilinçli değerlerinizle değiştirin:

```bash
git config --global user.name "Adınız Soyadınız"
git config --global user.email "siz@example.com"
git config --global --get user.name
git config --global --get user.email
```

#### Beklenen Sonuç: Kimlik Doğrulandı

Son iki komut Git'in gelecekteki commitlerde kullanacağı kesin ad ve e-posta değerlerini yazdırır.

## Doğrulama Listesi

- [ ] `git --version` bir sürüm yazdırıyor.
- [ ] Kurulumdan sonra yeni terminal açtım.
- [ ] `user.name` amaçladığım commit adını yazdırıyor.
- [ ] `user.email` uygun commit e-postasını yazdırıyor.

## Sorun Giderme

| Sorun                                             | Olası neden                                          | Çözüm                                                 |
| ------------------------------------------------- | ---------------------------------------------------- | ----------------------------------------------------- |
| `git` tanınmıyor                                  | Git kurulu değil veya terminal eski PATH kullanıyor. | Terminali yeniden açın; gerekirse kurulumu inceleyin. |
| Commit daha sonra bilinmeyen yazar hatası veriyor | Ad veya e-posta ayarlanmamıştır.                     | İki değeri ayarlayıp yeniden okuyun.                  |
| E-posta ortak depo için uygun değil               | Kimlik eski örnekten kopyalanmıştır.                 | Commit oluşturmadan önce onaylı kimliği ayarlayın.    |

## Sonraki Adım

[Git Kurulumu Quiz](../../quizzes/tr/03-git-kurulumu-quiz.md) ile anlayışınızı kontrol edin, ardından Bölüm 04'te ilk deponuzu oluşturun.

### İlgili İçerik

- Not defteri: [Git Kurulumu](../../notebooks/tr/03-git-kurulumu.md)
- Alıştırma: [Git Kurulumunu Doğrulama](../../exercises/tr/03-git-kurulumunu-dogrulama.md)
- Quiz: [Git Kurulumu Quiz](../../quizzes/tr/03-git-kurulumu-quiz.md)
