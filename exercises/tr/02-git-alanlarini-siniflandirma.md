---
chapter: 02
title: "Git Alanlarını Sınıflandırma"
related_notebook: "Git Mimarisi"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/02-git-mimarisi.md) | [Laboratuvar](../../labs/tr/02-git-degisiklik-akisi-laboratuvari.md) | [Quiz](../../quizzes/tr/02-git-mimarisi-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git Alanlarını Sınıflandırma

## Amaç

Proje değişikliklerini Git alanlarına göre sınıflandırmak ve tek odaklı kayıt için hangi değişikliklerin seçileceğine karar vermek.

## Öğrenme Çıktıları

- Çalışma dizinini, sahneleme alanını ve yerel depoyu ayırt edersiniz.
- Dosyanın Git'in yerel alanları arasında nasıl ilerlediğini açıklarsınız.
- İlgili değişiklikleri seçerken ilgisiz veya geçici işi commit dışında bırakırsınız.

## Önkoşullar

- [Bölüm 02: Git Mimarisi](../../notebooks/tr/02-git-mimarisi.md) tamamlanmalı.
- Bu yazılı alıştırma için Git kurulumu gerekmez.

## Senaryo

Portfolyo sitesinde aynı öğleden sonra `README.md` içindeki bozuk kurulum bağlantısını düzelttiniz, `index.html` içinde tamamlanmamış menü tasarımına başladınız ve geçici fikirler için `notes.txt` oluşturdunuz.

## Görevler

### Görev 1 - Güncel Durumu Sınıflandırın

Henüz seçim yapmadan önce üç dosyanın en güncel sürümünün hangi Git alanında olduğunu ve nedenini yazın.

#### Beklenen Sonuç: Güncel Durum

Düzenlenen ve yeni oluşturulan dosyaların seçilene kadar çalışma dizininde olduğunu açıklarsınız.

### Görev 2 - Odaklı Değişikliği Hazırlayın

`docs: kurulum bağlantısını düzelt` mesajlı commit için hangi dosya sürümünün sahneleme alanına alınacağını belirleyin. Diğer dosyaların neden seçilmemesi gerektiğini açıklayın.

#### Beklenen Sonuç: Odaklı Seçim

Yalnızca README düzeltmesi seçilir; çünkü hedeflenen belge değişikliğini temsil eder.

### Görev 3 - Oluşan Geçmişi Açıklayın

Seçilmiş anlık görüntü kaydedildikten sonra `README.md`, `index.html` ve `notes.txt` dosyalarının durumunu açıklayın.

#### Beklenen Sonuç: Oluşan Geçmiş

Yerel depoda README anlık görüntüsü bulunur; tamamlanmamış menü işi ve geçici notlar odaklı kayıt dışında kalır.

## Öz Değerlendirme

- [ ] Git'in üç yerel alanını adlandırabiliyorum.
- [ ] Dosyayı kaydetmenin neden geçmiş oluşturmadığını açıklayabiliyorum.
- [ ] İlgisiz işi eklemeden odaklı değişiklik seçebiliyorum.
- [ ] `git status` komutunu ne zaman kullanacağımı biliyorum.

## Özet

- Çalışma dizini güncel proje dosyalarını içerir.
- Sahneleme alanı sonraki anlık görüntü için seçimi tutar.
- Commit, seçilmiş anlık görüntüyü yerel depoya kaydeder.

### İlgili İçerik

- Not defteri: [Git Mimarisi](../../notebooks/tr/02-git-mimarisi.md)
- Laboratuvar: [Git Değişiklik Akışı Laboratuvarı](../../labs/tr/02-git-degisiklik-akisi-laboratuvari.md)
- Quiz: [Git Mimarisi Quiz](../../quizzes/tr/02-git-mimarisi-quiz.md)
