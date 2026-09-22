---
chapter: 23
title: "GitLab CI/CD Temelleri Quiz"
related_notebook: "GitLab CI/CD Temelleri"
related_exercise: "GitLab Pipeline Sonuclarini Tanila"
related_lab: "GitLab Pipeline Hatasini Incele"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/tr/23-gitlab-cicd-temelleri.md) | [Alistirma](../../exercises/tr/23-gitlab-pipeline-sonuclarini-tanila.md) | [Laboratuvar](../../labs/tr/23-gitlab-pipeline-hatasini-incele.md) | [Roadmap](../../ROADMAP.md)

## GitLab CI/CD Temelleri Quiz

## Bolum A - Coktan Secmeli

### Soru 1

GitLab runner'in kavramsal rolu nedir?

- A. Repository gecmisini saklar.
- B. Job'lari alir ve calistirir.
- C. Merge request'leri onaylar.
- D. Pipeline yapilandirmasini yazar.

**Cevap:** B

**Aciklama:** Runner, kuyruktaki job'lar icin calisma ortamini saglar.

### Soru 2

Olusturulmus ancak uygun runner bekleyen bir job'u hangi durum tanimlar?

- A. `pending`
- B. `passed`
- C. `canceled`
- D. `skipped`

**Cevap:** A

**Aciklama:** `pending`, calisma baslamadan onceki bekleme durumudur.

## Bolum B - Dogru veya Yanlis

### Soru 3

Basarisiz test assertion'i basarili olana kadar normalde yeniden denenmelidir.

**Cevap:** Yanlis

**Aciklama:** Tekrarlanabilir test hatasi duzeltilmesi veya incelenmesi gereken bir kanittir.

### Soru 4

Proje kurallarina bagli olarak push veya merge request bir pipeline tetikleyebilir.

**Cevap:** Dogru

**Aciklama:** Pipeline'lar yapilandirilmis olaylara tepki verir; zamanlama veya manuel eylem de kullanabilir.

## Bolum C - Kisa Yanit

### Soru 5

Job ve stage arasindaki fark nedir?

**Beklenen Yanit:** Job calistirilabilir tek bir is birimidir; stage job'lari pipeline yasam dongusunde sirali bir noktada gruplar.

### Soru 6

Basarisiz bir job'dan iki kanit ornegi verin.

**Beklenen Yanit:** Basarisiz komut, ilk anlamli hata, tetikleyici, commit, runner veya kuyruk durumu ve yakin log baglami kullanilabilir.

## Pratik Senaryo

Bir job, onaylanmis harici servis kesintisinde basarisiz oldu ve kesinti bitti. Guvenli eylem nedir?

**Beklenen Yanit:** Gecici nedeni kaydederek bir kez yeniden deneyin ve yeni sonucu inceleyin. Tekrar basarisiz olursa sonsuz retry yerine eskale edin.

## Ilgili Icerik

- Notebook: [GitLab CI/CD Temelleri](../../notebooks/tr/23-gitlab-cicd-temelleri.md)
- Alistirma: [GitLab Pipeline Sonuclarini Tanila](../../exercises/tr/23-gitlab-pipeline-sonuclarini-tanila.md)
- Laboratuvar: [GitLab Pipeline Hatasini Incele](../../labs/tr/23-gitlab-pipeline-hatasini-incele.md)
