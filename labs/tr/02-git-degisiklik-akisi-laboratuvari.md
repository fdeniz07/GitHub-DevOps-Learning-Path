---
chapter: 02
title: "Git Değişiklik Akışı Laboratuvarı"
related_notebook: "Git Mimarisi"
related_exercise: "Git Alanlarını Sınıflandırma"
level: Beginner
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/02-git-mimarisi.md) | [Alıştırma](../../exercises/tr/02-git-alanlarini-siniflandirma.md) | [Quiz](../../quizzes/tr/02-git-mimarisi-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git Değişiklik Akışı Laboratuvarı

## Amaç

İlgisiz çalışma seçilmeden kalırken tek belge değişikliğinin çalışma dizini, sahneleme alanı ve yerel depodan nasıl geçtiğini gözlemlemek.

## Öğrenme Çıktıları

- Dosyanın durumunu `git status` ile incelersiniz.
- `git add` ile tek bir odaklı dosya sürümü seçersiniz.
- `git commit` ile seçilmiş anlık görüntüyü kaydedersiniz.
- İlgisiz çalışma dizini değişikliğinin commit dışında kaldığını doğrularsınız.

## Senaryo

Ekip bugün proje geçmişine küçük belge düzeltmesini eklemek istiyor, ancak menü tasarımı hazır değil. Tamamlanmamış tasarımı kazara eklemeden düzeltmeyi kaydetmeniz gerekiyor.

## Önkoşullar

- [Bölüm 02'yi](../../notebooks/tr/02-git-mimarisi.md) ve [alıştırmayı](../../exercises/tr/02-git-alanlarini-siniflandirma.md) tamamlayın.
- Git kurulu, kullanıcı adı ve e-posta ayarlı olsun. Kurulum tamam değilse komutları ön izleme olarak okuyun ve Bölüm 03'ten sonra laboratuvarı tamamlayın.
- Terminal ve metin düzenleyici kullanın.

## Ortam Kurulumu

```bash
mkdir git-degisiklik-akisi-lab
cd git-degisiklik-akisi-lab
git init
git add README.md index.html
git commit -m "chore: deneme projesini oluştur"
```

`README.md` içine `# Portfolyo sitesi`, `index.html` içine `<h1>Portfolyo</h1>` yazın ve sonra `git add` komutunu çalıştırın.

## Görevler

### Görev 1 - Ayrı Değişiklikler Oluşturun

1. `README.md` içine bir kurulum cümlesi ekleyin.
2. `index.html` başlığını tamamlanmamış menü notuna değiştirin.
3. `git status` çalıştırın ve değiştirilmiş dosyaları kaydedin.

#### Beklenen Sonuç: Çalışma Dizini

Her iki dosya çalışma dizininde değiştirilmiştir; hiçbiri sahnelenmemiştir.

### Görev 2 - Belge Düzeltmesini Seçin

1. `git add README.md` çalıştırın.
2. Yeniden `git status` çalıştırın.
3. README ve index dosyasının raporun hangi bölümünde olduğunu belirleyin.
4. Neden yalnızca bir dosyanın hedef commit için hazır olduğunu açıklayın.

#### Beklenen Sonuç: Sahneleme Alanı

README değişikliği sonraki commit için sahnelenir; HTML değişikliği sahnelenmeden kalır.

### Görev 3 - Odaklı Anlık Görüntüyü Kaydedin

1. `git commit -m "docs: kurulum yönergesini iyileştir"` çalıştırın.
2. `git status` ve `git log --oneline -1` çalıştırın.
3. Belge commitinin bulunduğunu, tamamlanmamış HTML değişikliğinin hâlâ raporlandığını doğrulayın.

#### Beklenen Sonuç: Yerel Depo

Yerel depoda README anlık görüntüsü vardır; çalışma dizini hâlâ tamamlanmamış `index.html` değişikliğini gösterir.

## Doğrulama Listesi

- [ ] `git status` ile değiştirilmiş dosyayı gözlemledim.
- [ ] Yalnızca `README.md` sahneledim.
- [ ] Odaklı belge commitini oluşturdum.
- [ ] `index.html` bu commitin dışında kaldı.

## Sorun Giderme

| Sorun                                         | Olası Neden                                           | Çözüm                                                                                                      |
| --------------------------------------------- | ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| Git kimlik bilinmiyor diyerek commit reddeder | Kullanıcı adı veya e-posta ayarlı değildir.           | `git config --global user.name "Adınız"` ve `git config --global user.email "siz@example.com"` çalıştırın. |
| İki dosya da sahnelenmiştir                   | `git add .` gibi geniş komut kullanılmıştır.          | `git restore --staged index.html` çalıştırın; sonra yalnızca README'yi sahneleyin.                         |
| Committen sonra `git status` temizdir         | HTML değişikliği yapılmamış veya commite eklenmiştir. | `index.html` dosyasını yeniden değiştirip gözlemi tekrarlayın.                                             |

## En İyi Uygulamalar

- Durum değiştiren komutlardan önce ve sonra `git status` çalıştırın.
- Tek anlaşılır commit amacını destekleyen dosyaları sahneleyin.
- Tamamlanmamış işi kayda hazır olana kadar çalışma dizininde bırakın.

## Sonraki Adım

[Git Mimarisi Quiz](../../quizzes/tr/02-git-mimarisi-quiz.md) ile anlayışınızı değerlendirin.

### İlgili İçerik

- Not defteri: [Git Mimarisi](../../notebooks/tr/02-git-mimarisi.md)
- Alıştırma: [Git Alanlarını Sınıflandırma](../../exercises/tr/02-git-alanlarini-siniflandirma.md)
- Quiz: [Git Mimarisi Quiz](../../quizzes/tr/02-git-mimarisi-quiz.md)
