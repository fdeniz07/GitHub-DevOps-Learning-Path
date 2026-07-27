---
chapter: 34
title: "Özel GitHub Action'ları Yazmak"
part: "GitHub Actions"
level: Intermediate
estimated_time: 100 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Notebook](33-github-marketplace-actions.md) | [Alıştırma](../../exercises/tr/34-design-a-custom-github-action.md) | [Laboratuvar](../../labs/tr/34-build-and-test-a-custom-action.md) | [Kısa Sınav](../../quizzes/tr/34-writing-custom-github-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- özel bir action'ın yeniden kullanılabilir workflow'dan veya shell step'inden ne zaman daha iyi olduğunu kararlaştırmak;
- `action.yml`, JavaScript action'ları, Docker action'ları, girdiler, çıktılar ve branding rollerini açıklamak;
- başka workflow'lar için özel bir action'ı sürümlemek, test etmek, belgelemek ve güvenli hale getirmek.

## Giriş

Özel action'lar tekrarlanan otomasyonu kararlı bir arayüzün arkasında paketler. Davranış depolar arasında yeniden kullanılacak ve tek bir ekip tarafından bakımı yapılacaksa değerlidir; ancak metadata, çalışma zamanı kodu, testler, release sürümleri ve güvenlik beklentileriyle birlikte bir ürün yüzeyi de oluştururlar.

## Temel Terimler

| Terim               | Tanım                                                                    |
| ------------------- | ------------------------------------------------------------------------ |
| `action.yml`        | Bir action'ın arayüzünü ve çalışma zamanını tanımlayan metadata dosyası. |
| JavaScript action   | Runner üzerinde Node.js çalışma zamanıyla yürütülen action.              |
| Docker action       | Bir container içinde paketlenen ve yürütülen action.                     |
| Composite action    | Workflow step'lerini YAML içinde gruplayan action.                       |
| Semantic versioning | Uyumlu ve uyumsuz değişiklikleri bildiren sürümleme kuralı.              |

## Teori

### Action Türünü Seçmek

Mevcut step'lerin açık bir dizisi için composite action kullanın. Runner API'lerine, yapılandırılmış mantığa veya container oluşturmadan hızlı başlatmaya ihtiyacınız varsa JavaScript kullanın. Kontrollü bir Linux userspace'i veya sistem bağımlılığı gerekliyse Docker kullanın. Yeniden kullanılabilir birim birden fazla job, izin, ortam veya matrix stratejisi gerektiriyorsa yeniden kullanılabilir workflow çoğu zaman daha iyidir.

### Metadata Sözleşmeyi Tanımlar

```yaml
name: "Collect build metadata"
description: "Creates a short build identifier"
inputs:
  source:
    description: "Text used to derive the identifier"
    required: true
outputs:
  build-id:
    description: "Short identifier for this build"
    value: ${{ steps.collect.outputs.build_id }}
runs:
  using: "node20"
  main: "dist/index.js"
```

Metadata, çağıranların ne sağladığını ve ne aldığını bildirir. Sözleşmeyi küçük tutun, girdileri doğrulayın, çıktıları desteklenen mekanizma üzerinden yazın ve hata davranışını belgeleyin.

### JavaScript ve Docker Çalışma Zamanları

Bir JavaScript action genellikle kaynağı okunabilir bir dizinde tutar ve runner'ın kullandığı paketlenmiş `dist` giriş noktasını commit eder. Docker action bir image veya Dockerfile bildirir; derleme süresini, Linux uyumluluğunu, izinleri ve image bakımını hesaba katmalıdır. Hiçbir çalışma zamanı test veya bağımlılık incelemesi gereksinimini ortadan kaldırmaz.

### Sürümleme ve Testler

`v1.2.0` gibi değişmez bir release etiketi yayımlayın, ardından `v1` gibi bir major etiketi yalnızca incelenmiş bir güncellemeyle ilerletin. Geçerli girdileri, geçersiz girdileri, çıktı değerlerini, hataları ve desteklenen runner üzerindeki davranışı test edin. Küçük bir entegrasyon workflow'u, yalnızca iç fonksiyonları unit-test etmekle kalmayıp action'ı `uses` üzerinden çalıştırmalıdır.

## En İyi Uygulamalar

- `action.yml` dosyasını açık, minimal ve belgelenmiş tutun.
- Girdileri doğrulayın ve secret'ları veya ham token'ları yazdırmaktan kaçının.
- Her desteklenen çalışma zamanı ve işletim sisteminde public arayüzü test edin.
- Action sözleşmesi gerektiriyorsa oluşturulan JavaScript paketlerini commit edin.
- Değişmez release'ler kullanın ve uyumsuz değişiklikleri major sürümlerle bildirin.
- Çağıran workflow'da en az ayrıcalıklı izinleri uygulayın.

## Yaygın Hatalar

| Hata                                            | Sonuç                                           | Daha iyi yaklaşım                                |
| ----------------------------------------------- | ----------------------------------------------- | ------------------------------------------------ |
| Tek bir yerel komut için özel action oluşturmak | Bakım maliyeti yeniden kullanım faydasını aşar. | Okunabilir bir workflow step'iyle başlayın.      |
| Paketlenmiş JavaScript'i güncellemeyi unutmak   | Çağıranlar eski kodu çalıştırır.                | Dağıtım artifact'ini derleyin ve test edin.      |
| Bildirilmemiş bir girdiyi okumak                | Public sözleşme belirsizdir.                    | Her girdiyi bildirin ve doğrulayın.              |
| Bir major etiketi geçiş notu olmadan taşımak    | Tüketiciler beklenmedik şekilde bozulabilir.    | Semantic versioning ve release notları kullanın. |

## Özet

Özel action'lar sürümlenen yazılım arayüzleridir. İhtiyaca uygun çalışma zamanını seçin, sözleşmeyi `action.yml` içinde tanımlayın, public davranışı test edin ve değişmez, incelenebilir sürümler yayımlayın.

### İlgili İçerik

- Önceki notebook: [GitHub Marketplace Action'ları](33-github-marketplace-actions.md)
- Alıştırma: [Özel Bir GitHub Action'ı Tasarla](../../exercises/tr/34-design-a-custom-github-action.md)
- Laboratuvar: [Özel Bir Action Oluştur ve Test Et](../../labs/tr/34-build-and-test-a-custom-action.md)
- Kısa Sınav: [Özel GitHub Action'ları Yazma Kısa Sınavı](../../quizzes/tr/34-writing-custom-github-actions-quiz.md)
