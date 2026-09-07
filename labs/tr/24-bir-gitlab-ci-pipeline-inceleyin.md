---
chapter: 24
title: "Bir GitLab CI Pipeline'ini Inceleyin"
related_notebook: ".gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler"
related_exercise: "Bir GitLab CI Pipeline'i Yazın"
level: Beginner
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Bolum 23](../../notebooks/tr/23-gitlab-cicd-temelleri.md) | [Notebook](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md) | [Alistirma](../../exercises/tr/24-bir-gitlab-ci-pipeline-yazin.md) | [Quiz](../../quizzes/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler-quiz.md) | [Roadmap](../../ROADMAP.md)

## Bir GitLab CI Pipeline'ini Inceleyin

## Amac

Onerilen bir Node.js pipeline'indaki yapilandirma ve calisma sorunlarini bulun, sonra guvenli duzeltilmis surumunu olusturun.

## Senaryo

Bir ekip arkadasiniz inceleme icin su dosyayi gonderiyor:

```yaml
stages:
  - verify
    - build

lint:
  stage: verify
  image: node:22-alpine
  script: npm run lint

test:
  stage: verify
  script:
    - npm test

build:
  stage: build
  needs: test
  script:
    - npm run build
```

## On Kosullar

- [Notebook](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md) tamamlandi.
- GitLab CI Lint veya ekip tarafindan verilen bir dogrulama ortami var.

## Gorevler

### Gorev 1 - Yapinin incelenmesi

`stages` altindaki girinti hatasini bulun. Hangi degerlerin YAML listesi, hangilerinin map oldugunu belirtin. `script: npm run lint` gecerli YAML olsa bile is buyudugunde listenin neden daha acik oldugunu aciklayin.

**Beklenen Sonuc:** Sozdizimi hatasini stil ve bakim kaygisindan ayirirsiniz.

### Gorev 2 - Is modelini duzeltin

Acik `verify` ve `build` asamalari, ortak Node imaji, `npm ci`, ayri lint, test ve build komutlariyla duzeltilmis dosya yazin. Build'in test bagimliligini liste biciminde ifade edin.

**Beklenen Sonuc:** Lint ve test paralel calisabilir; build icin gerekli kanit nettir.

### Gorev 3 - Olusturmayi denetleyin

Merge request olayi ve push icin `workflow: rules`, ardindan `when: never` ekleyin. Bu kararın job `rules` degerlendirilmeden once verildigini aciklayin.

**Beklenen Sonuc:** Uygun olmayan kaynaklar pipeline olusturmaz.

### Gorev 4 - Dogrulama ve tani

CI Lint calistirin, grafigi okuyun ve yalnizca zararsiz bir dogrulama pipeline'i baslatin. Hata olursa komutu ve ilk hata iletisini kaydedin. Kimlik bilgisi, deployment komutu veya cache yapilandirmasi eklemeyin.

**Beklenen Sonuc:** Gecerli yapilandirma, grafik kaniti ve belgelenmis hata yaniti olusur.

## Dogrulama Listesi

- [ ] Tum YAML liste ogeleri hizalidir.
- [ ] Kok dosyanin adi `.gitlab-ci.yml`dir.
- [ ] Pipeline kurallari ve is bagimliliklari aciklanmistir.
- [ ] Yeniden denemeden once loglar okunmustur.

## Ilgili Icerik

- Notebook: [.gitlab-ci.yml, Pipeline'lar, Asamalar ve Isler](../../notebooks/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md)
- Alistirma: [Bir GitLab CI Pipeline'i Yazın](../../exercises/tr/24-bir-gitlab-ci-pipeline-yazin.md)
- Quiz: [Bolum 24 Quiz](../../quizzes/tr/24-gitlab-ci-yml-pipelines-asamalar-ve-isler-quiz.md)
