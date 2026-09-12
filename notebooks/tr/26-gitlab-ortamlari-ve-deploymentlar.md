---
chapter: 26
title: "Ortamlar ve Deploymentlar"
part: "GitLab DevOps"
level: Başlangıç
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Bölüm 25](25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md) | [Alıştırma](../../exercises/tr/26-gitlab-ortamlarini-planla.md) | [Laboratuvar](../../labs/tr/26-kontrollu-gitlab-deploymenti-planla.md) | [Quiz](../../quizzes/tr/26-gitlab-ortamlari-ve-deploymentlar-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- ortam ile deploymentı ayırt etmek;
- testten productiona kontrollü terfiyi açıklamak;
- doğrulama, onay ve rollbacki release öncesinde planlamak.

## Giriş

Ortam, `review`, `staging` veya `production` gibi adı olan dağıtım hedefidir. Deployment, belirli sürümün bu hedefe teslim edilmesidir. GitLab bu ilişkiyi kaydederek hangi sürümün nerede çalıştığını görünür kılar.

## Temel Terimler

| Terim      | Tanım                                        |
| ---------- | -------------------------------------------- |
| Ortam      | Adlandırılmış deployment hedefi.             |
| Deployment | Bir sürümün ortama teslim kaydı.             |
| Review app | Branch veya merge request için geçici ortam. |
| Staging    | Doğrulama için productiona benzer ortam.     |
| Rollback   | Bilinen güvenli sürüme dönüş.                |

## Kuram

Artifactı bir kez oluştur, test et ve aynı artifactı terfi ettir. Akış review -> staging -> production olabilir. Her ortamın amacı, sahibi ve erişim kuralı olmalıdır.

```yaml
deploy_staging:
  stage: deploy
  environment:
    name: staging
  script:
    - ./scripts/deploy.sh staging

deploy_production:
  stage: deploy
  environment:
    name: production
  when: manual
  script:
    - ./scripts/deploy.sh production
```

Komut projeye özeldir; secretı dosyaya yazma. Production, stagingden daha güçlü koruma, dar yetki ve uygun olduğunda manuel onay ister. Terfi öncesinde artifact kimliği, pipeline ve onayı; sonrasında health endpointi, hata oranı ve kritik akışı kontrol et. Rollback planı son iyi sürümü ve doğrulamasını belirtir.

## En İyi Uygulamalar

- Her ortam için amaç, sorumlu ve erişim kuralı tanımla.
- Test edilmiş artifactı terfi ettir.
- Doğrulama ve rollbacki release öncesinde belirle.

## Özet

Ortamlar hedefleri görünür yapar. Kontrollü terfi, korumalı production ve planlı rollback teslim riskini azaltır.

### İlgili İçerik

- Alıştırma: [GitLab Ortamlarını Planla](../../exercises/tr/26-gitlab-ortamlarini-planla.md)
- Laboratuvar: [Kontrollü GitLab Deploymentı Planla](../../labs/tr/26-kontrollu-gitlab-deploymenti-planla.md)
- Quiz: [Ortamlar ve Deploymentlar Quiz'i](../../quizzes/tr/26-gitlab-ortamlari-ve-deploymentlar-quiz.md)
