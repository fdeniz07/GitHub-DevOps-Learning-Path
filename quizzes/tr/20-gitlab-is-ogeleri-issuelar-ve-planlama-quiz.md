---
chapter: 20
title: "GitLab İş Ögeleri, Issue'lar ve Planlama Quiz'i"
related_notebook: "GitLab İş Ögeleri, Issue'lar ve Planlama"
related_exercise: "GitLab İş Ögelerini Önceliklendir"
related_lab: "Küçük Bir GitLab Teslimatını Planla"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md) | [Alıştırma](../../exercises/tr/20-gitlab-is-ogelerini-onceliklendir.md) | [Laboratuvar](../../labs/tr/20-kucuk-bir-gitlab-teslimatini-planla.md) | [Yol Haritası](../../ROADMAP.md)

## GitLab İş Ögeleri, Issue'lar ve Planlama Quiz'i

## Amaç

GitLab'da işi oluşturup triage edebildiğinizi ve teslime kadar takip edebildiğinizi kontrol edin.

## Bölüm A - Çoktan Seçmeli

### Soru 1

Hangi kabul kriteri daha kullanışlıdır?

- A. Login'i iyileştir.
- B. Özellik doğru çalışır.
- C. Geçersiz bilgiler nötr mesaj gösterir ve otomatik testler bu yolu kapsar.
- D. En yeni framework'ü kullan.

**Cevap:** C

**Açıklama:** Gereksiz uygulama ayrıntısı vermeden gözlemlenebilir davranış ve kanıt tanımlar.

### Soru 2

Triage'ın ana amacı nedir?

- A. Her talebi hemen merge etmek.
- B. Gelen işi anlaşılır, sınıflandırılmış ve işlem için sıralı yapmak.
- C. Code review yerine geçmek.
- D. Düşük öncelikli tüm işleri silmek.

**Cevap:** B

**Açıklama:** Triage güvenilir bir kuyruk oluşturur; planlama veya incelemenin yerini almaz.

## Bölüm B - Doğru veya Yanlış

### Soru 3

Label, assignee ve milestone aynı amaca hizmet eder.

**Cevap:** Yanlış

**Açıklama:** Label sınıflandırır, assignee sorumluluğu gösterir, milestone ise işi zaman veya hedef için gruplar.

### Soru 4

Bir planlama board'u her GitLab proje yapılandırmasında bulunmayabilir.

**Cevap:** Doğru

**Açıklama:** Özellikler ve izinler değişebilir. Kullanılabilir görünümleri kullanın ve verileri güncel tutun.

## Bölüm C - Kısa Yanıt

### Soru 5

Branch ve merge request neden work item veya issue'ya referans vermelidir?

**Beklenen Cevap:** Bağlantılar istenen sonuç, uygulama, inceleme, otomatik kontroller ve kapanış kararı arasındaki izlenebilirliği korur.

### Soru 6

Yüksek önceliği haklı çıkarabilecek iki etken yazın.

**Beklenen Cevap:** Kullanıcı etkisi, güvenlik veya güvenilirlik riski, sabit tarih, başka teslimatı engelleme ya da etkilenen kullanıcı sayısı örnek olabilir.

## Uygulama Senaryosu

Bir rapor `dokümantasyon bozuk` diyor. Branch oluşturmadan önce ilk triage adımlarını açıklayın.

**Beklenen Cevap:** Etkilenen sayfa ve kullanıcı etkisini netleştirmek, başlık ve açıklamayı düzeltmek, kriter eklemek, tekrarları kontrol etmek, label seçmek, öncelik vermek ve hazır olduğunda sorumlu atamak veya planlamaktır.

## İlgili İçerik

- Notebook: [GitLab İş Ögeleri, Issue'lar ve Planlama](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md)
- Alıştırma: [GitLab İş Ögelerini Önceliklendir](../../exercises/tr/20-gitlab-is-ogelerini-onceliklendir.md)
- Laboratuvar: [Küçük Bir GitLab Teslimatını Planla](../../labs/tr/20-kucuk-bir-gitlab-teslimatini-planla.md)
