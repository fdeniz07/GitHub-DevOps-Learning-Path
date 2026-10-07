---
chapter: 36
title: "Çok Platformlu Bir Matrisi Çalıştırma"
related_notebook: "GitHub Actions Matris Derlemeleri"
related_exercise: "Bir Matris İş Akışını Test Etme"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/35-composite-actions.md) | [Not Defteri](../../notebooks/tr/36-github-actions-matrix-builds.md) | [Alıştırma](../../exercises/tr/36-test-a-matrix-workflow.md) | [Kısa Sınav](../../quizzes/tr/36-matrix-builds-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Çok Platformlu Bir Matrisi Çalıştırma

## Amaç

Platformlar ve çalışma zamanı sürümleri arasındaki destek politikasını test eden bir matris iş akışı oluşturun.

## Öğrenme Çıktıları

- sınırlandırılmış bir matris uygulamak;
- açık metadata için `include` ve desteklenmeyen durumlar için `exclude` kullanmak;
- bağımsız matris sonuçlarını yorumlamak.

## Senaryo

Bir komut satırı aracı iki çalışma zamanı sürümünde Ubuntu ve Windows'u destekliyor. Bir Windows/çalışma zamanı birleşimi desteklenmiyor. Ekip, bir iş başarısız olsa bile diğer tüm sonuçları istiyor.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- Deterministik bir test komutu içeren depo.

## Ortam Kurulumu

| Gereksinim      | Değer                                                        |
| --------------- | ------------------------------------------------------------ |
| İşletim Sistemi | GitHub tarafından barındırılan Ubuntu ve Windows runner'ları |
| Yazılım         | GitHub Actions ve projenin çalışma zamanı                    |
| Sürüm           | Uygulama projesi tarafından tanımlanan sürümleri kullanın    |

## Görevler

### Görev 1 — Desteği modelleme

1. `os` ve `runtime` boyutlarını tanımlayın.
2. Desteklenmeyen çifti hariç tutun.
3. `fail-fast: false` ayarlayın ve tanılama nedenini kaydedin.

**Beklenen Sonuç:** İş akışı tam olarak desteklenen birleşimleri oluşturur.

### Görev 2 — Testleri çalıştırma ve etiketleme

1. Runner'ı `matrix.os` değerinden seçin.
2. `matrix.runtime` değerini kurun.
3. Testleri çalıştırmadan önce her iki değeri yazdırın.

**Beklenen Sonuç:** Günlükler her sonucu tahmine gerek bırakmadan tanımlar.

### Görev 3 — Bir istisna ekleme

1. Bir birleşime `coverage` bayrağı eklemek için `include` kullanın.
2. Coverage adımını yalnızca bayrak doğru olduğunda çalıştırın.
3. Genişletilmiş iş akışı özetini inceleyin.

**Beklenen Sonuç:** İstisna görünürdür ve ilgisiz birleşimleri sessizce değiştirmez.

## Doğrulama Kontrol Listesi

- [ ] Desteklenmeyen birleşimler hariç tutulmuştur.
- [ ] Matris değerleri runner ve kurulum adımlarında kullanılır.
- [ ] Günlükler her birleşimi tanımlar.
- [ ] Hata davranışı tanılama amacıyla eşleşir.

## Sorun Giderme

| Sorun                                 | Olası Neden                           | Çözüm                                     |
| ------------------------------------- | ------------------------------------- | ----------------------------------------- |
| Çok fazla iş                          | Kartezyen çarpım beklenenden büyüktür | Boyutları sayın ve `exclude` kullanın.    |
| Değer çözümlenemiyor                  | `matrix.` öneki eksik                 | `${{ matrix.name }}` kullanın.            |
| Bir hatadan sonra sonuçlar kayboluyor | Fail-fast etkin                       | Uygun olduğunda `false` olarak ayarlayın. |

## En İyi Uygulamalar

- Destek politikasını matrise yakın tutun.
- Deneysel birleşimlerin sessizce zorunlu hale gelmesini önleyin.
- Boyut ekledikten sonra süreyi ve runner maliyetini inceleyin.

## Özet

Laboratuvar, bir destek matrisini gözlemlenebilir ve bağımsız olarak tanılanabilir CI işlerine dönüştürür.

### İlgili İçerik

- Not Defteri: [GitHub Actions Matris Derlemeleri](../../notebooks/tr/36-github-actions-matrix-builds.md)
- Alıştırma: [Bir Matris İş Akışını Test Etme](../../exercises/tr/36-test-a-matrix-workflow.md)
- Kısa Sınav: [Matris Derlemeleri Kısa Sınavı](../../quizzes/tr/36-matrix-builds-quiz.md)
