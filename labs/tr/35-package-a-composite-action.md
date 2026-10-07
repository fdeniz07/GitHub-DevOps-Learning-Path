---
chapter: 35
title: "Bileşik Bir Eylemi Paketleme"
related_notebook: "GitHub Actions Bileşik Eylemleri"
related_exercise: "Yeniden Kullanılabilir Bir Bileşik Eylem Oluşturma"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/35-composite-actions.md) | [Alıştırma](../../exercises/tr/35-build-a-reusable-composite-action.md) | [Kısa Sınav](../../quizzes/tr/35-composite-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Bileşik Bir Eylemi Paketleme

## Amaç

Tekrarlanan depo doğrulama adımlarını belgelenmiş bir sözleşmeye sahip yerel bir bileşik eyleme dönüştürün.

## Öğrenme Çıktıları

- eylem metadata'sını ve uygulamasını düzenlemek;
- zorunlu girdiyi doğrulamak ve çıktı sunmak;
- eylemi uygun izinlerle bir iş akışından çağırmak.

## Senaryo

İki iş akışı checkout'tan bağımsız kontrolleri tekrar ediyor: bir klasörü doğruluyor, dosyaları sayıyor ve sonucu raporluyor. Bir klasörü kabul edip sayıyı döndüren tek bir eylem oluşturun.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- Bir uygulama deposunda GitHub Actions etkinleştirilmiş olmalı.
- Güvenle kontrol edilebilecek bir klasör.

## Ortam Kurulumu

| Gereksinim      | Değer                                            |
| --------------- | ------------------------------------------------ |
| İşletim Sistemi | Desteklenen herhangi bir GitHub Actions runner'ı |
| Yazılım         | Git, bir metin düzenleyici ve bir GitHub deposu  |
| Sürüm           | Geçerli depo tarafından desteklenen sürümler     |

## Görevler

### Görev 1 — Sözleşmeyi Tanımlama

1. `.github/actions/count-files/action.yml` dosyasını oluşturun.
2. Zorunlu bir `directory` girdisi ve bir `count` çıktısı bildirin.
3. Bir iş akışı yazarına her iki değeri nasıl kullanacağını anlatan açıklamalar ekleyin.

**Beklenen Sonuç:** Metadata, uygulamayı okumadan anlaşılabilir.

### Görev 2 — Güvenli Adımları Uygulama

1. Klasörün var olduğunu doğrulayın.
2. Dosyaları tırnak içine alınmış bir ortam değişkeni kullanarak sayın.
3. Sonucu `GITHUB_OUTPUT` dosyasına yazın.

**Beklenen Sonuç:** Geçersiz girdi açıkça başarısız olur ve geçerli girdi sayısal bir çıktı üretir.

### Görev 3 — Entegre Etme ve İnceleme

1. Eylemi bir iş akışından çağırın.
2. Çıktıyı sonraki bir adımda yazdırın.
3. İzinleri ve günlükleri gereksiz açığa çıkma açısından inceleyin.

**Beklenen Sonuç:** Eylem bir çağırandan çalışır ve hassas veri yazdırmaz.

## Doğrulama Kontrol Listesi

- [ ] Her `run` adımı bir shell bildirir.
- [ ] Eylem zorunlu bir girdi ve genel bir çıktı kullanır.
- [ ] İş akışı çıktıyı çağıran adım kimliği üzerinden okur.
- [ ] Geçersiz klasörler yararlı bir iletiyle başarısız olur.

## Sorun Giderme

| Sorun             | Olası Neden                            | Çözüm                                                               |
| ----------------- | -------------------------------------- | ------------------------------------------------------------------- |
| Çıktı boş         | Yanlış adım kimliği veya çıktı dosyası | Çıktı eşlemesini ve `GITHUB_OUTPUT` dosyasını kontrol edin.         |
| Eylem bulunamıyor | Hatalı göreli yol                      | Tam `.github/actions/...` yolunu çağırın.                           |
| Shell hatası      | Tırnaksız girdi veya yol               | Girdiyi tırnak içine alınmış bir ortam değişkeni üzerinden geçirin. |

## En İyi Uygulamalar

- Her eylem için tek ve net bir sorumluluk tutun.
- Eylem değişikliklerini iş akışı kodu gibi inceleyin.
- Çıktılarda ve günlüklerde gizli bilgilerden kaçının.

## Özet

Eylem artık depo doğrulaması için yeniden kullanılabilir ve test edilebilir bir arayüz sağlar.

### İlgili İçerik

- Not Defteri: [GitHub Actions Bileşik Eylemleri](../../notebooks/tr/35-composite-actions.md)
- Alıştırma: [Yeniden Kullanılabilir Bir Bileşik Eylem Oluşturma](../../exercises/tr/35-build-a-reusable-composite-action.md)
- Kısa Sınav: [Bileşik Eylemler Kısa Sınavı](../../quizzes/tr/35-composite-actions-quiz.md)
