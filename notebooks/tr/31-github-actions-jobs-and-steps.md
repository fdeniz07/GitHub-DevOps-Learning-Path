---
chapter: 31
title: "GitHub Actions Job'ları ve Step'leri"
part: "GitHub Actions"
level: Beginner
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Notebook](30-yaml-fundamentals.md) | [Alıştırma](../../exercises/tr/31-design-github-actions-jobs-and-steps.md) | [Laboratuvar](../../labs/tr/31-build-a-job-dependency-workflow.md) | [Kısa Sınav](../../quizzes/tr/31-github-actions-jobs-and-steps-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- workflow, job, step, action ve kabuk komutunu birbirinden ayırmak;
- açık bağımlılıklara, koşullara ve en az ayrıcalıklı çıktılara sahip job'lar tasarlamak;
- verileri job'lar arasında güvenli biçimde aktarmak ve doğru step sınırlarını seçmek.

## Giriş

GitHub Actions workflow'ları job'lardan, job'lar da step'lerden oluşur. Yararlı bir tasarım yürütme grafiğini görünür kılar: bağımsız işler paralel çalışabilir, bağımlı işler ise yalnızca ön koşulları başarılı olduktan sonra başlar.

## Temel Terimler

| Terim       | Tanım                                                                  |
| ----------- | ---------------------------------------------------------------------- |
| Workflow    | Bir event tarafından tetiklenen YAML tanımlı otomasyon süreci.         |
| Job         | Bir runner üzerinde yürütülen step grubu.                              |
| Step        | Bir job içindeki tek komut veya yeniden kullanılabilir action çağrısı. |
| `needs`     | Job sırasını ve başarı koşullarını kontrol eden bağımlılık.            |
| Job çıktısı | Bir job'un kendisine bağlı job'lara açtığı adlandırılmış veri.         |

## Teori

### Job'lar Yönlü Bir Grafik Oluşturur

`needs` içermeyen job'lar birlikte başlatılmaya uygundur. `needs: build` içeren bir job `build`'i bekler. Bir cleanup veya raporlama job'u başarısızlıktan sonra mutlaka çalışacaksa `if: ${{ always() }}` kullanın; aksi halde başarısız ön koşulların bağımlı işi durdurmasına izin verin.

### Step'ler Bir Runner'ı Paylaşır

Tek bir job içindeki step'ler workspace'i ve runner dosya sistemini paylaşır. Bu, checkout, kurulum, derleme ve testi doğal bir sıra haline getirir. Yeni bir job yalıtım ve yeni bir runner sağlar, ancak dosyaların artifact'ler, cache'ler veya açık çıktılar üzerinden taşınması gerekir.

### Çıktılar ve Bağımlılıklar

Step çıktıları runner'ın output dosyası üzerinden yazılır ve job çıktılarıyla eşlenir. Bağımlı bir job bunları `needs.<job-id>.outputs.<name>` üzerinden okur. Çıktılar sürüm veya dağıtım hedefi gibi küçük ve hassas olmayan değerler içermelidir. Çıktıları asla secret taşımak için kullanmayın.

## Uygulamalı Örnek

```yaml
name: Build and verify

on:
  push:
    branches: [main]

jobs:
  prepare:
    runs-on: ubuntu-latest
    outputs:
      image_tag: ${{ steps.version.outputs.image_tag }}
    steps:
      - id: version
        name: Create image tag
        run: echo "image_tag=${GITHUB_SHA::12}" >> "$GITHUB_OUTPUT"

  verify:
    needs: prepare
    runs-on: ubuntu-latest
    steps:
      - name: Show the selected tag
        run: echo "Testing ${{ needs.prepare.outputs.image_tag }}"

  publish:
    needs: [prepare, verify]
    runs-on: ubuntu-latest
    steps:
      - name: Publish only after verification
        run: echo "Publishing ${{ needs.prepare.outputs.image_tag }}"
```

`prepare` küçük bir çıktı oluşturur, `verify` onu tüketir ve `publish` her iki job'a bağlıdır. Grafik, release kapısını rastlantısal YAML sırasına güvenmek yerine belgeler.

## En İyi Uygulamalar

- Amaçlarını açıklayan job ve step adları verin.
- Gerçek bağımlılıklar için `needs` kullanın ve ilgisiz job'ları paralel tutun.
- Job çıktılarını küçük, bilinçli ve secret içermeyecek şekilde tutun.
- İzinleri workflow veya job düzeyinde sabitleyin ve yalnızca gerekenleri verin.
- Derleme, doğrulama ve yayımlama sorumluluklarını ayırın.

## Yaygın Hatalar

| Hata                                              | Soruna neden olma şekli                         | Kaçınma yolu                                                        |
| ------------------------------------------------- | ----------------------------------------------- | ------------------------------------------------------------------- |
| YAML sırasının bağımlılık oluşturduğunu varsaymak | Job'lar paralel çalışabilir.                    | `needs` ifadesini açıkça belirtin.                                  |
| Değeri yanlış output dosyasına yazmak             | Sonraki step'ler değeri okuyamaz.               | `$GITHUB_OUTPUT` kullanın ve step çıktısını eşleyin.                |
| Kimlik bilgilerini job çıktısı olarak geçirmek    | Çıktılar loglarda veya metadata'da görünebilir. | Desteklenen secret'ları ve kısa ömürlü kimlik bilgilerini kullanın. |
| Her job'u tek bir kurulum job'una bağlamak        | Paralellik ve geri bildirim yavaşlar.           | Yalnızca gerçek bağımlılıkları modelleyin.                          |

## Özet

- Workflow bir job grafiğidir; her job step dizisidir.
- `needs` sıralamayı ifade eder ve job çıktıları için veri yolunu oluşturur.
- İyi sınırlar okunabilirliği, yalıtımı, güvenliği ve paralelliği artırır.

### İlgili İçerik

- Alıştırma: [GitHub Actions Job'ları ve Step'leri Tasarla](../../exercises/tr/31-design-github-actions-jobs-and-steps.md)
- Laboratuvar: [Job Bağımlılığı Olan Bir Workflow Oluştur](../../labs/tr/31-build-a-job-dependency-workflow.md)
- Kısa Sınav: [GitHub Actions Job'ları ve Step'leri Kısa Sınavı](../../quizzes/tr/31-github-actions-jobs-and-steps-quiz.md)
