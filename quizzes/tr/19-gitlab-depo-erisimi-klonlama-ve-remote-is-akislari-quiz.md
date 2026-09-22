---
chapter: 19
title: "GitLab Depo Erişimi, Klonlama ve Remote İş Akışları Quiz'i"
related_notebook: "GitLab Depo Erişimi, Klonlama ve Remote İş Akışları"
related_exercise: "GitLab Remote'unu İncele"
related_lab: "GitLab Projesini Klonla, Katkıda Bulun ve Eşitle"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/19-gitlab-depo-erisimi-klonlama-ve-remote-is-akislari.md) | [Alıştırma](../../exercises/tr/19-gitlab-remoteunu-incele.md) | [Laboratuvar](../../labs/tr/19-gitlab-projesini-klonla-katkida-bulun-ve-esitle.md) | [Yol Haritası](../../ROADMAP.md)

## GitLab Depo Erişimi, Klonlama ve Remote İş Akışları Quiz'i

## Amaç

Etkilerine göre güvenli GitLab remote işlemlerini seçip seçemediğini kontrol et.

## Bölüm A - Çoktan Seçmeli

### Soru 1

Bir klon için fetch ve push adreslerini hangi komut gösterir?

- A. `git remote -v`
- B. `git pull --ff-only`
- C. `git commit`
- D. `git switch`

**Cevap:** A

**Açıklama:** `git remote -v`, klonlamayla oluşturulan `origin` dahil adlandırılmış remote URL'lerini gösterir.

### Soru 2

Mevcut dosyalarını değiştirmeden remote değişikliklerini öğrenmek için en güvenli ilk komut hangisidir?

- A. `git push`
- B. `git fetch origin`
- C. `git pull`
- D. `git clone`

**Cevap:** B

**Açıklama:** Fetch, remote bilgisini indirir ve remote-tracking referanslarını günceller; mevcut branche entegre etmez.

## Bölüm B - Doğru veya Yanlış

### Soru 3

HTTPS ve SSH, GitLab'a bağlanmak için iki taşıma seçeneğidir; kimlik bilgileri asla commit veya dokümantasyona eklenmemelidir.

**Cevap:** Doğru

**Açıklama:** Onaylı erişim yöntemini kullan, ancak sırları depodan ve öğrenme materyalinden uzak tut.

### Soru 4

Her GitLab projesinin varsayılan branchi `main`dir ve fork kullanır.

**Cevap:** Yanlış

**Açıklama:** Varsayılan branch adı ve fork kullanılabilirliği proje bazında yapılandırılır.

## Bölüm C - Kısa Yanıt

### Soru 5

`fetch` ve `pull` arasındaki fark nedir?

**Beklenen Cevap:** Fetch, remote bilgisini mevcut branche entegre etmeden alır. Pull, değişiklikleri alır ve yapılandırma veya seçeneklere göre mevcut branche entegre eder.

### Soru 6

İlk pushtan önce neden `origin`i kontrol etmelisin?

**Beklenen Cevap:** Branchin yanlış hedefe değil, amaçlanan proje veya forka yayımlanacağını doğrulamak için.

## Bölüm D - Pratik Senaryo

### Senaryo

`docs/remote-notu` branchini oluşturdun ve korunan varsayılan branchte yeni commitler olduğunu gördün.

### Soru

Değişikliğini önermeden önce ne yapmalısın?

**Beklenen Cevap:** Remoteleri doğrulamalı, remote durumunu fetch etmeli, varsayılan branchteki değişiklikleri incelemeli, temel branchi bilinçli biçimde güncellemeli ve yalnızca feature branchi push etmelisin. Korunan varsayılan branche doğrudan push yerine proje kurallarına göre merge request açmalısın.

## Sonraki Adım

Gerekirse [notebooku](../../notebooks/tr/19-gitlab-depo-erisimi-klonlama-ve-remote-is-akislari.md), [alıştırmayı](../../exercises/tr/19-gitlab-remoteunu-incele.md) ve [laboratuvarı](../../labs/tr/19-gitlab-projesini-klonla-katkida-bulun-ve-esitle.md) tekrar et; sonra [yol haritasından](../../ROADMAP.md) devam et.
