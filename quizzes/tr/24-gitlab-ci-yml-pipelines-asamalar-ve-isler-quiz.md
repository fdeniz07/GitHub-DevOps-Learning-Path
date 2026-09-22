---
chapter: 24
title: ".gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler Quiz"
related_notebook: ".gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler"
related_exercise: "Bir GitLab CI Pipeline'i Yazın"
related_lab: "Bir GitLab CI Pipeline'ini Inceleyin"
level: Beginner
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Bolum 23](../../notebooks/tr/23-gitlab-cicd-temelleri.md) | [Notebook](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md) | [Alistirma](../../exercises/tr/24-bir-gitlab-ci-pipeline-yazin.md) | [Laboratuvar](../../labs/tr/24-bir-gitlab-ci-pipeline-inceleyin.md) | [Roadmap](../../ROADMAP.md)

## .gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler Quiz

## Coktan Secmeli

### Soru 1

GitLab pipeline yapilandirma dosyasini normalde nerede arar?

- A. `pipelines` adli herhangi bir alt klasorde
- B. Repository kokunde `.gitlab-ci.yml` olarak
- C. Runner'in ana dizininde
- D. Yalnizca varsayilan branch'in wiki sayfasinda

**Cevap:** B

**Aciklama:** GitLab, ilgili commit'teki repository kokundan `.gitlab-ci.yml` dosyasini okur.

### Soru 2

Ayni asamadaki iki basarili is icin ne olabilir?

- A. Mutlaka alfabetik calisirlar.
- B. Runner uygunsa paralel calisabilirler.
- C. Dosyalari otomatik paylasirlar.
- D. Ayrı pipeline olustururlar.

**Cevap:** B

**Aciklama:** Asama, sonraki asamalar icin siralama siniridir; kendi isleri icin sirali kuyruk degildir.

### Soru 3

GitLab'in hic pipeline olusturup olusturmayacagina hangi yapi karar verir?

- A. `workflow: rules`
- B. `after_script`
- C. `needs`
- D. `image`

**Cevap:** A

**Aciklama:** `workflow: rules` pipeline olusumunu, job `rules` ise tek tek islerin eklenmesini denetler.

## Dogru veya Yanlis

### Soru 4

YAML girintisinde bosluk yerine tab kullanilabilir.

**Cevap:** Yanlis

**Aciklama:** Tutarlı bosluk kullanin; tab YAML'i gecersiz yapabilir.

### Soru 5

`needs: [test]`, `test`ten bu bildirimi yapan ise dogru bir bagimlilik anlatir.

**Cevap:** Dogru

**Aciklama:** Bildirimi yapan is, basarili test kanitina gereksinim duyar.

## Kisa Yanit

### Soru 6

`before_script`, `script` ve `after_script` ne icindir?

**Beklenen Cevap:** `before_script` hazirlik yapar, `script` ana isi calistirir, `after_script` ise hatayi gizlemeden guvenli tani veya temizlik icin sonrasinda calisir.

### Soru 7

Bir is basarisiz oldugunda ilk olarak neyi incelemelisiniz?

**Beklenen Cevap:** Ilk basarisiz komutu, hata iletisini ve yakindaki log baglamini; gerekirse sonra grafik ve kurallari.

## Pratik Senaryo

Merge request pipeline'i lint ve test calistirmali, fakat ilgisiz bir kaynak icin olusmamalidir. Merge request olayini tanimlayan kural ifadesini yazin ve tek bir isi denetleyen ikinci kural seviyesini adlandirin.

**Beklenen Cevap:** `if: '$CI_PIPELINE_SOURCE == "merge_request_event"'`; job duzeyindeki `rules` tek bir isin eklenmesini denetler.

## Ilgili Icerik

- Notebook: [.gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md)
- Alistirma: [Bir GitLab CI Pipeline'i Yazın](../../exercises/tr/24-bir-gitlab-ci-pipeline-yazin.md)
- Laboratuvar: [Bir GitLab CI Pipeline'ini Inceleyin](../../labs/tr/24-bir-gitlab-ci-pipeline-inceleyin.md)
