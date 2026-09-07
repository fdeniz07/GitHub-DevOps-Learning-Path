---
chapter: 27
title: "DevSecOps İnceleme Akışı Tasarla"
related_notebook: "DevSecOps, Güvenlik Taramaları ve Uyumluluk"
related_exercise: "GitLab Güvenlik Bulgusunu Triage Et"
level: Başlangıç
estimated_time: 55 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk.md) | [Alıştırma](../../exercises/tr/27-gitlab-guvenlik-bulgusunu-triage-et.md) | [Quiz](../../quizzes/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# DevSecOps İnceleme Akışı Tasarla

## Amaç

Tarama sonuçlarını sahipli ve denetlenebilir aksiyonlara dönüştüren güvenli akış tasarlamak.

## Görevler

1. Secret detection, dependency, source ve container scanningi web servisi değişikliğine yerleştir.
2. Bulgu IDsi, geçerlilik, etki, owner, karar, doğrulama ve inceleme tarihi için triage alanları tanımla.
3. Secret escalationı ile onaylı, süreli istisna sürecini yaz.
4. Issue, merge request, pipeline ve release kayıtlarında hangi kanıtların bulunacağını belirt.

## Doğrulama Listesi

- [ ] Tarama sonucu otomatik hüküm değildir.
- [ ] Her bulgunun ownerı ve sonraki adımı vardır.
- [ ] Secret exposure iptal ve yenilemeyi önceliklendirir.
- [ ] İstisnalar gerekçeli ve süreli olur.

### İlgili İçerik

- Notebook: [DevSecOps, Güvenlik Taramaları ve Uyumluluk](../../notebooks/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk.md)
- Alıştırma: [GitLab Güvenlik Bulgusunu Triage Et](../../exercises/tr/27-gitlab-guvenlik-bulgusunu-triage-et.md)
- Quiz: [DevSecOps, Güvenlik Taramaları ve Uyumluluk Quiz'i](../../quizzes/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk-quiz.md)
