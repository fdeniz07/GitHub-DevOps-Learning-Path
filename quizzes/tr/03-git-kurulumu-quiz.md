---
chapter: 03
title: "Git Kurulumu Quiz"
related_notebook: "Git Kurulumu"
related_exercise: "Git Kurulumunu Doğrulama"
related_lab: "Git'i Kurma ve Yapılandırma"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/03-git-kurulumu.md) | [Alıştırma](../../exercises/tr/03-git-kurulumunu-dogrulama.md) | [Laboratuvar](../../labs/tr/03-git-kurma-ve-yapilandirma.md) | [Yol Haritası](../../ROADMAP.md)

# Git Kurulumu Quiz

## Amaç

Yerel Git kurulumu, terminal doğrulaması ve commit kimliği hakkındaki bilginizi kontrol etmek.

## Çoktan Seçmeli

### Soru 1

Mevcut terminalin Git'i çalıştırabildiğini hangi komut doğrular?

- A. `git init`
- B. `git --version`
- C. `git commit`
- D. `git push`

#### Cevap ve Açıklama: Soru 1

**B.** `git --version`, terminalden Git'i çalıştırmasını ve kurulu sürümü yazdırmasını ister.

### Soru 2

Windows'ta Git kurulumundan sonra neden yeni terminal açmalısınız?

- A. Git her terminalde yalnızca bir kez çalışır.
- B. Yeni terminal güncellenmiş PATH değerini yükleyebilir.
- C. Terminal otomatik depo oluşturur.
- D. Kurulumu GitHub'a gönderir.

#### Cevap ve Açıklama: Soru 2

**B.** Açık terminaller kurulum programının eklediği Git konumunu henüz bilmeyebilir.

## Doğru / Yanlış

### Soru 3

GitHub hesabı oluşturmak bilgisayarınıza Git kurar.

#### Cevap ve Açıklama: Soru 3

**Yanlış.** GitHub barındırma platformudur; `git` komutu için Git'in bilgisayara kurulması gerekir.

### Soru 4

`user.name` ve `user.email` değerleri commit oluşturmadan önce kontrol edilebilir.

#### Cevap ve Açıklama: Soru 4

**Doğru.** `git config --global --get` mevcut genel yapılandırmayı okur.

## Kısa Cevap

### Soru 5

Git temel genel commit kimliği olarak hangi iki bilgiyi kullanır?

#### Beklenen Cevap: Soru 5

Ad ve e-posta adresi.

### Soru 6

Kurulumdan hemen sonra `git --version`, Git'in bulunamadığını bildirirse önce ne yapmalısınız?

#### Beklenen Cevap: Soru 6

Terminali kapatıp yeni terminal açın ve komutu tekrar çalıştırın. Sorun sürerse kurulumu veya PATH ayarını inceleyin.

## Uygulamalı Senaryo

Git kuruldu, ancak `git config --global --get user.email` hiçbir değer yazdırmıyor. Depo oluşturmadan önce en küçük güvenli sonraki adım nedir?

### Beklenen Cevap: Uygulamalı Senaryo

`git config --global user.email "siz@example.com"` ile uygun e-posta ayarlayın, ardından aynı `--get` komutuyla tekrar okuyun.

### İlgili İçerik

- Not defteri: [Git Kurulumu](../../notebooks/tr/03-git-kurulumu.md)
- Alıştırma: [Git Kurulumunu Doğrulama](../../exercises/tr/03-git-kurulumunu-dogrulama.md)
- Laboratuvar: [Git'i Kurma ve Yapılandırma](../../labs/tr/03-git-kurma-ve-yapilandirma.md)
