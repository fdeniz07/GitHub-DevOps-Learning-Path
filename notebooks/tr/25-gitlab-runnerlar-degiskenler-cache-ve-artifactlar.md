---
chapter: 25
title: "Runnerlar, Değişkenler, Cache ve Artifactlar"
part: "GitLab DevOps"
level: Başlangıç
estimated_time: 100 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Bölüm 24](24-gitlab-ci-yml-pipelines-asamalar-ve-isler.md) | [Alıştırma](../../exercises/tr/25-gitlab-ci-kaynaklarini-sec.md) | [Laboratuvar](../../labs/tr/25-gitlab-ci-pipelineini-iyilestir.md) | [Quiz](../../quizzes/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- runnerı yetenek ve güven sınırına göre seçmek;
- CI/CD değişkenlerini hassas değerleri açığa çıkarmadan kullanmak;
- cache ile artifactı amaçlarına göre ayırt etmek;
- runner, değişken, cache ve artifact hatalarını teşhis etmek.

## Giriş

Pipeline dosyası yapılacak işi tanımlar, runner işi çalıştırır. Değişkenler yapılandırma sağlar, cache tekrarlanabilir girdileri hızlandırır, artifact ise belirli bir jobın çıktısını saklar. Bu dört sorumluluğu karıştırmamak güvenilir DevOps çalışmasının temelidir.

## Temel Terimler

| Terim                | Tanım                                                          |
| -------------------- | -------------------------------------------------------------- |
| Runner               | CI/CD joblarını alan ve çalıştıran ajan.                       |
| Runner etiketi       | Gerekli yetenekteki runnerı seçen işaret.                      |
| Değişken             | Pipeline veya job için yapılandırma değeri.                    |
| Korumalı değişken    | Yalnızca korumalı ref pipelineında kullanılabilir.             |
| Maskelenmiş değişken | GitLab'ın loglarda gizlemeye çalıştığı hassas değer.           |
| Cache                | Hız için yeniden kullanılabilen, tekrar üretilebilir dosyalar. |
| Artifact             | Saklanan belirli job çıktısı.                                  |

## Runner ve Güven Sınırı

Runner, pipeline kodunu çalıştırdığı için güven sınırıdır. Shared runner birçok projeye, group runner bir gruba, project runner tek projeye hizmet edebilir. Etiketler Linux veya Docker gibi yetenekleri seçer. Hassas veya üretim erişimli işler yalnızca güvenilen, korumalı runnerlarda ve korumalı branchlerde çalışmalıdır.

## Değişkenleri Güvenli Kullanmak

Değişkenler UI, group, project veya YAML düzeyinde tanımlanabilir. Geçerli değer scope ve örnek yapılandırmasına bağlıdır; aynı isimleri çoğaltmaktan kaçının. Token, parola ve anahtarları korumalı-maskelenmiş değişkenlerde veya onaylı secret sisteminde saklayın.

`echo $TOKEN` kullanmayın, tüm environmentı yazdırmayın. Dosya türü değişkenler, örneğin sertifika gibi bir aracın dosya beklediği durumlarda yararlıdır.

## Cache ve Artifact Farkı

| Soru    | Cache                                           | Artifact                       |
| ------- | ----------------------------------------------- | ------------------------------ |
| Amaç    | Tekrar üretilebilen bağımlılıkları hızlandırmak | Belirli job çıktısını saklamak |
| Örnek   | `.npm/`                                         | `dist/`                        |
| Eksikse | Yeniden indirilir                               | Sonraki job çıktıyı kullanamaz |
| Saklama | Key ile yeniden kullanım                        | Tanımlı süre boyunca           |

Cache keyi `package-lock.json` değiştiğinde değişmelidir. Cache miss çoğunlukla performans olayıdır. Artifact yolu build bittikten sonra var olmalı ve proje dizinine göre yazılmalıdır.

## Örnek: Node.js Pipeline

```yaml
default:
  image: node:22-alpine

cache:
  key:
    files:
      - package-lock.json
  paths:
    - .npm/

build:
  script:
    - npm ci --cache .npm --prefer-offline
    - npm run build
  artifacts:
    paths:
      - dist/
    expire_in: 7 days
```

`.npm/` yeniden indirilebildiği için cachedir. `dist/` belirli build sonucunu taşıdığı için artifacttır. `expire_in` depolamayı sınırsız büyümeden korur.

## Sorun Giderme

| Sorun                | Olası Neden                    | Güvenli Yanıt                                    |
| -------------------- | ------------------------------ | ------------------------------------------------ |
| Job bekliyor         | Uygun runner veya etiket yok   | Runner uygunluğunu ve tagleri incele.            |
| Değişken boş         | Yanlış scope veya korumalı ref | İsmi ve izinli refi kontrol et, değeri yazdırma. |
| Cache miss           | Key değişti veya cache silindi | Kuruluma devam et; sürekli olursa keyi incele.   |
| Artifact yüklenmiyor | Yol build sonrası yok          | Üretilen dosyayı ve göreli yolu düzelt.          |

## En İyi Uygulamalar

- Hassas işleri güvenilen korumalı runnerlara yönlendir.
- Secretları YAML ve loglardan uzak tut.
- Bağımlılıkları cachele, build çıktısını artifact olarak sakla.
- Artifact için dar yol ve sona erme süresi belirle.

## Özet

- Runner jobları çalıştırır ve bir güven sınırıdır.
- Değişkenler yapılandırma sağlar, secretları açığa çıkarmamalıdır.
- Cache girdi hızlandırır; artifact çıktı saklar.

### İlgili İçerik

- Alıştırma: [GitLab CI Kaynaklarını Seç](../../exercises/tr/25-gitlab-ci-kaynaklarini-sec.md)
- Laboratuvar: [GitLab CI Pipelineını İyileştir](../../labs/tr/25-gitlab-ci-pipelineini-iyilestir.md)
- Quiz: [Runnerlar, Değişkenler, Cache ve Artifactlar Quiz'i](../../quizzes/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar-quiz.md)
