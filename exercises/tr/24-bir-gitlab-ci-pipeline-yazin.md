---
chapter: 24
title: "Bir GitLab CI Pipeline'i Yazın"
related_notebook: ".gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler"
level: Beginner
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Bolum 23](../../notebooks/tr/23-gitlab-cicd-temelleri.md) | [Notebook](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md) | [Laboratuvar](../../labs/tr/24-bir-gitlab-ci-pipeline-inceleyin.md) | [Quiz](../../quizzes/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler-quiz.md) | [Roadmap](../../ROADMAP.md)

## Bir GitLab CI Pipeline'i Yazın

## Amac

Kucuk bir Node.js projesi icin okunabilir bir `.gitlab-ci.yml` olusturun ve aciklayin.

## Senaryo

Projede `npm run lint`, `npm test` ve `npm run build` komutlari var. Lint ve testler degisikligi build baslamadan once dogrulamalidir. Deployment, cache kurulumu ve gizli bilgiler bu alistirmanin disindadir.

## Gorevler

### Gorev 1 - YAML yapisini kurun

Kok dizinde `verify` ve `build` iceren bir `stages` listesi yazin. `verify` icine `lint` ve `test` map'lerini ekleyin; her birinde `script` listesi olsun.

**Beklenen Sonuc:** Girintiler tutarlidir, her anahtarda iki nokta vardir ve her liste ogesi `-` ile baslar.

### Gorev 2 - Ortak calisma ortamini ekleyin

`default` altina `image: node:22-alpine` ve `npm ci` iceren `before_script` ekleyin. Ana komutlarin neden kendi job'larinin `script` alaninda kaldigini aciklayin.

**Beklenen Sonuc:** Ortak ortam paylasilirken lint ve test amaclari ayri gorunur.

### Gorev 3 - Kural ve bagimlilik ekleyin

Merge request olayi ve push icin `workflow: rules` kullanin, diger kaynaklari reddedin. `build` job'una `needs: [test]` ekleyin. `'$CI_PIPELINE_SOURCE == "merge_request_event"'` ifadesini aciklayin ve `test -> build` cizin.

**Beklenen Sonuc:** Pipeline olusturma ile is calisma sirasi arasindaki farki aciklarsiniz.

### Gorev 4 - Guvenli inceleyin

CI Lint kullanin; kucuk ve gizli bilgi icermeyen bir degisiklikten sonra grafigi inceleyin. Is basarisizsa tekrar tekrar denemek yerine ilk basarisiz komutu ve hatayi kaydedin.

**Beklenen Sonuc:** Inceleme kanita dayanir ve dosya ya da log gizli deger icermez.

## Oz Degerlendirme

- [ ] YAML map ile YAML listeyi ayirt edebilirim.
- [ ] Lint ve testin neden paralel calisabildigini aciklayabilirim.
- [ ] `workflow: rules`, job `rules` ve `needs` farkini bilirim.

## Ilgili Icerik

- Notebook: [.gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md)
- Laboratuvar: [Bir GitLab CI Pipeline'ini Inceleyin](../../labs/tr/24-bir-gitlab-ci-pipeline-inceleyin.md)
- Quiz: [Bolum 24 Quiz](../../quizzes/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler-quiz.md)
