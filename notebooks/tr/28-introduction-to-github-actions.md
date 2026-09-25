---
chapter: 28
title: "GitHub Actions'a Giriş"
part: "GitHub Actions"
level: Beginner
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](27-gitlab-devsecops-security-scans-and-compliance.md) | [Alıştırma](../../exercises/tr/28-create-your-first-github-actions-workflow.md) | [Laboratuvar](../../labs/tr/28-run-a-github-actions-workflow.md) | [Kısa Sınav](../../quizzes/tr/28-introduction-to-github-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- GitHub Actions'ın neleri otomatikleştirdiğini ve ne zaman çalıştığını açıklamak;
- event, workflow, job, step ve action kavramlarını birbirinden ayırmak;
- beklenen `.github/workflows` dizinini oluşturmak ve geçerli bir workflow dosyasını tanımak;
- odaklanmış bir tetikleyici seçmek ve en az ayrıcalıklı izinlerin neden önemli olduğunu açıklamak.

## Giriş

GitHub Actions, GitHub'ın otomasyon platformudur. Depo olaylarına veya manuel bir isteğe yanıt olarak yazılım derleyebilir, test çalıştırabilir, kodu tarayabilir, paket yayımlayabilir ve uygulamaları dağıtabilir. Otomasyon, hizmet ettiği kodun yanında tekrarlanabilir bir süreci görünür kılar.

## Bunun Önemi

Bir workflow, “her pull request testleri geçmelidir” gibi bir ekip kuralını çalıştırılabilir ve incelenebilir bir tanıma dönüştürür. Workflow dosyası depoda bulunduğundan otomasyon değişiklikleri incelenebilir, sürümlenebilir ve uygulamayla birlikte yeniden üretilebilir.

## Temel Terimler

| Terim    | Anlam                                                                                   |
| -------- | --------------------------------------------------------------------------------------- |
| Action   | GitHub, topluluk veya depo tarafından sağlanan yeniden kullanılabilir otomasyon birimi. |
| Event    | `push`, `pull_request` veya `workflow_dispatch` gibi bir workflow'u başlatan olay.      |
| Workflow | Otomatik bir süreci açıklayan YAML dosyası.                                             |
| Job      | Bir runner üzerinde birlikte yürütülen step grubudur.                                   |
| Step     | Bir job içindeki tek komut veya action çağrısıdır.                                      |
| Runner   | Bir job'u çalıştıran makinedir.                                                         |

## Teori

### Olaylar Workflow'ları Başlatır

Bir event, depo etkinliği ile otomasyon arasındaki sınırdır. `push` tetikleyicisi, commit edilmiş değişiklikleri doğrulamak için kullanışlıdır. `pull_request` tetikleyicisi, değişiklik birleştirilmeden önce inceleyenlere geri bildirim verir. `workflow_dispatch`, kontrollü işlemler için açık bir manuel düğme ekler.

### Workflow'lar Bilinen Bir Dizinde Yaşar

GitHub workflow tanımlarını `.github/workflows` içinde arar. Başka bir dizindeki dosyalar geçerli YAML olabilir, ancak Actions workflow'u olarak keşfedilmez. `.yml` veya `.yaml` ile biten açıklayıcı bir dosya adı kullanın.

### İzinler Tasarımın Bir Parçasıdır

`permissions` anahtarı, workflow'un `GITHUB_TOKEN` erişimini kontrol eder. Gereken en küçük erişimle başlayın. Yalnızca test yapan bir workflow için çoğu zaman `contents: read` yeterlidir. Release yayımlayan bir job, genel bir yazma izni yerine dikkatle incelenmiş belirli bir izne ihtiyaç duyar.

## Uygulamalı Örnek

`.github/workflows/ci.yml` oluşturun:

```yaml
name: Continuous Integration

on:
  push:
    branches: [main]
  pull_request:
  workflow_dispatch:

permissions:
  contents: read

jobs:
  check:
    runs-on: ubuntu-latest
    steps:
      - name: Check out the repository
        uses: actions/checkout@v4
      - name: Show the changed workspace
        run: git status --short
```

`on` haritası workflow'u başlatmanın üç yolunu tanımlar. `check` job'u GitHub tarafından barındırılan bir runner üzerinde çalışır. İlk step yeniden kullanılabilir bir action kullanır; ikinci step bir kabuk komutu çalıştırır. Salt okunur izin, amaçlanan erişimi açıkça belirtir.

## Kendiniz Deneyin

1. Bir alıştırma deposunda `.github/workflows` dizinini oluşturun.
2. Örneği `introduction.yml` olarak ekleyin.
3. Branch filtresini değiştirin ve hangi push işlemlerinin workflow'u başlatacağını açıklayın.
4. Hangi step'in action çağrısı, hangisinin kabuk komutu olduğunu belirleyin.

## En İyi Uygulamalar

- Doğrulama veya dağıtım gibi tek bir amaca odaklanan workflow'lar kullanın.
- Action referanslarını incelenmiş bir major sürüme veya daha güçlü, değişmez bir referansa sabitleyin.
- İzinleri açıkça tanımlayın ve yalnızca workflow'un ihtiyaç duyduğu izinleri verin.
- Workflow ve step adlarını gözlemlenebilir amaçlarını açıklayacak şekilde yazın.

## Yaygın Hatalar

| Hata                                          | Soruna neden olma şekli                                                     | Kaçınma yolu                                                      |
| --------------------------------------------- | --------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| Dosyayı `.github/workflows` dışında saklamak  | GitHub dosyayı workflow olarak keşfetmez.                                   | Kesin dizini ve dosya uzantısını kontrol edin.                    |
| Testler için `write-all` izinlerini kullanmak | Ele geçirilmiş bir step gereksiz erişim elde eder.                          | `contents: read` ile başlayın, yalnızca gereken izinleri ekleyin. |
| `run` ile `uses` ifadelerini karıştırmak      | Kabuk komutu ile yeniden kullanılabilir action farklı sözdizimine sahiptir. | Komutlar için `run`, action'lar için `uses` kullanın.             |
| İstemeden her branch'i tetiklemek             | Workflow zaman tüketir ve gürültülü geri bildirim üretebilir.               | Olayları ve branch filtrelerini bilinçli seçin.                   |

## Özet

- GitHub Actions, depo olaylarını tekrarlanabilir otomasyona bağlar.
- Workflow YAML dosyaları `.github/workflows` içinde bulunmalıdır.
- Workflow'lar job'lardan, job'lar step'lerden oluşur; step'ler komut veya action çalıştırır.
- Açıkça belirtilen en az ayrıcalıklı izinler, hataların veya ele geçirmenin etkisini azaltır.

### İlgili İçerik

- Alıştırma: [İlk GitHub Actions Workflow'unu Oluştur](../../exercises/tr/28-create-your-first-github-actions-workflow.md)
- Laboratuvar: [Bir GitHub Actions Workflow'u Çalıştır](../../labs/tr/28-run-a-github-actions-workflow.md)
- Kısa Sınav: [GitHub Actions'a Giriş Kısa Sınavı](../../quizzes/tr/28-introduction-to-github-actions-quiz.md)
