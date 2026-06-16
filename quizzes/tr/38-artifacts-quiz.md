---
chapter: 38
title: "Artifact'lar Quiz'i"
related_notebook: "GitHub Actions Artifact'ları"
related_exercise: "Workflow Artifact'larını Yayımla ve Tüket"
related_lab: "Job'lar Arasında Build Artifact'larını Paylaş"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/37-github-actions-dependency-caching.md) | [Notebook](../../notebooks/tr/38-github-actions-artifacts.md) | [Alıştırma](../../exercises/tr/38-publish-and-consume-workflow-artifacts.md) | [Laboratuvar](../../labs/tr/38-share-build-artifacts-between-jobs.md) | [Yol Haritası](../../ROADMAP.md)

# Artifact'lar Quiz'i

## Öğrenme Hedefleri

- job'lar arasında artifact aktarımını açıklamak;
- saklama ve adlandırma politikaları seçmek;
- bir job sınırında dosyaları doğrulamak.

## Sorular

### Soru 1

Bir workflow'un bir dosyayı bir job'dan diğerine taşımak için neden artifact'lara ihtiyacı vardır?

- A. Job'lar her zaman aynı runner'ı kullanır
- B. Job'lar yalıtılmış runner'lara ve çalışma alanlarına sahiptir
- C. Artifact'lar tüm output'ların yerini alır
- D. Artifact'lar testleri isteğe bağlı hale getirir

**Cevap:** B. Job'lar yalıtılmış runner'lara ve çalışma alanlarına sahiptir.

### Soru 2

`retention-days` neyi kontrol eder?

**Beklenen Cevap:** Yüklenen artifact'ın, depo veya kuruluş sınırlarına tabi olarak ne kadar süre kullanılabilir kalacağını.

### Soru 3

Doğru mu, yanlış mı: Kalıcı olarak kullanılabilir olması gereken bir release paketi için cache en iyi yerdir.

**Cevap:** Yanlış. Bilinçli saklama ve doğrulama ile bir artifact veya release mekanizması kullanın.

### Soru 4

Matrix job'ları artifact adlarının çakışmasını nasıl önleyebilir?

**Beklenen Cevap:** Artifact adına matrix değerlerini veya başka bir benzersiz çalıştırma kimliğini ekleyerek.

### Soru 5

Bir release job'u indirilen bir artifact'ı çalıştırmadan veya yayımlamadan önce ne yapmalıdır?

**Beklenen Cevap:** Beklenen dosyaları ve bütünlüğü doğrulamalı; uygun olduğunda checksum'lar veya imzalar kullanmalıdır.

## Uygulamalı Senaryo

Bir consumer job, bir shell script içeren artifact'ı indiriyor ve hemen çalıştırıyor. Daha güvenli workflow tasarımı nasıl olmalıdır?

**Beklenen Cevap:** Yükleme yolunu kısıtlayın, temiz bir dizine indirin, içeriği ve bütünlüğü doğrulayın ve doğrulamadan sonra yalnızca gereken izinleri verin.

## Gözden Geçirme Kontrol Listesi

- [ ] Artifact'ları, cache'leri ve output'ları ayırt edebilirim.
- [ ] Producer-consumer sınırını modelleyebilirim.
- [ ] Sorumlu bir saklama süresi seçebilirim.

### İlgili İçerik

- Önceki bölüm: [Dependency Cache'leme](../../notebooks/tr/37-github-actions-dependency-caching.md)
- Notebook: [GitHub Actions Artifact'ları](../../notebooks/tr/38-github-actions-artifacts.md)
- Alıştırma: [Workflow Artifact'larını Yayımla ve Tüket](../../exercises/tr/38-publish-and-consume-workflow-artifacts.md)
- Laboratuvar: [Job'lar Arasında Build Artifact'larını Paylaş](../../labs/tr/38-share-build-artifacts-between-jobs.md)
