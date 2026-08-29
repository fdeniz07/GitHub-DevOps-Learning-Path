---
chapter: 17
title: "GitLab Değişikliği Oluştur ve İncele"
related_notebook: "GitLab Temelleri"
related_exercise: "GitLab Proje Temellerini Keşfet"
level: Başlangıç
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Gezinme:** [Notebook](../../notebooks/tr/17-gitlab-temelleri.md) | [Alıştırma](../../exercises/tr/17-gitlab-proje-temellerini-kesfet.md) | [Quiz](../../quizzes/tr/17-gitlab-temelleri-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Değişikliği Oluştur ve İncele

## Amaç

Küçük bir dokümantasyon değişikliğini issue, branch, merge request ve pipeline kontrolü üzerinden güvenli biçimde tamamlamak.

## Öğrenme Çıktıları

- issue ve tek amaçlı branch oluşturmak;
- bağlamı ve doğrulamayı açıklayan merge request açmak;
- merge öncesinde review ve pipeline geri bildirimlerini işlemek.

## Senaryo

Projenin README dosyasında yerel kurulum komutu eksik. Ekip bu notu varsayılan branche doğrudan yazmadan eklemek istiyor.

## Ön Koşullar

- [Notebooku](../../notebooks/tr/17-gitlab-temelleri.md) ve [alıştırmayı](../../exercises/tr/17-gitlab-proje-temellerini-kesfet.md) tamamla.
- Git yapılandırılmış olmalı ve bir GitLab eğitim projesine erişimin olmalı.

## Ortam Kurulumu

| Gereksinim      | Değer                                  |
| --------------- | -------------------------------------- |
| İşletim sistemi | Windows, Linux veya macOS              |
| Yazılım         | Git ve güncel web tarayıcısı           |
| GitLab erişimi  | Branch ve merge request için uygun rol |

## Görevler

### Görev 1 - Issue ve branch oluştur

**Adımlar**

1. Eksik komutu ve beklenen metni açıklayan issue oluştur.
2. Projeyi klonla veya yerel kopyanı güncelle.
3. `docs/kurulum-komutu` branchini oluştur.

**Beklenen Sonuç:** Issue ile branch aynı, sınırları belli işi açıklar.

### Görev 2 - Değişikliği commit et ve pushla

**Adımlar**

1. README'ye komutu ve kısa açıklamayı ekle.
2. Diffi incele, odaklı bir commit oluştur.
3. `git push -u origin docs/kurulum-komutu` komutuyla branchi GitLab'a gönder.

**Beklenen Sonuç:** Uzak branch yalnızca amaçlanan README değişikliğini içerir.

### Görev 3 - Merge requesti incele

**Adımlar**

1. Doğru target branch için merge request aç ve issueyu bağla.
2. Diffi, yorumları, çakışmaları ve pipelineı incele.
3. İstenen değişiklikleri veya pipeline hatasını aynı branchte düzelt; koşullar sağlanmadan merge etme.

**Beklenen Sonuç:** Merge request değişikliği, incelemeyi ve teknik doğrulamayı belgeliyor.

## Doğrulama Listesi

- [ ] Issue ve merge request amaç ile doğrulamayı açıklar.
- [ ] Source ve target branchler doğru seçilmiştir.
- [ ] Diff yalnızca README değişikliğini içerir.
- [ ] Zorunlu review ve pipeline jobları başarılıdır.

## Sorun Giderme

| Sorun                                     | Olası Neden                         | Çözüm                                               |
| ----------------------------------------- | ----------------------------------- | --------------------------------------------------- |
| Branch merge request formunda görünmüyor. | Branch uzağa pushlanmadı.           | Push komutunu çalıştır ve sayfayı yenile.           |
| Beklenmeyen commitler var.                | Başlangıç veya hedef branch yanlış. | Branchleri kontrol et, ilgisiz değişiklikleri ayır. |
| Bir job başarısız.                        | Kontrol bir sorun bildirdi.         | Job logunu oku, sorunu düzelt ve yeniden pushla.    |

## En İyi Uygulamalar

- İş bağlamını issue ile uygula.
- Branch, commit ve merge requesti tek değişiklikle sınırla.
- Zorunlu kontroller başarısızken bunları atlama.

## Ek Görev (İsteğe Bağlı)

Başka birinden review iste. Dosyayı, gözlemi ve istenen sonucu içeren bir review yorumu yaz.

## Özet

- GitLab planlama, branch, review ve otomasyonu bağlar.
- Küçük değişiklikler bile açık bir merge requestten yararlanır.
- Merge, geri bildirim ve kontroller çözüldükten sonra yapılır.

## Sonraki Adım

GitLab temel kavramlarını pekiştirmek için quizi tamamla.

### İlgili İçerik

- Notebook: [GitLab Temelleri](../../notebooks/tr/17-gitlab-temelleri.md)
- Alıştırma: [GitLab Proje Temellerini Keşfet](../../exercises/tr/17-gitlab-proje-temellerini-kesfet.md)
- Quiz: [GitLab Temelleri Quiz'i](../../quizzes/tr/17-gitlab-temelleri-quiz.md)
