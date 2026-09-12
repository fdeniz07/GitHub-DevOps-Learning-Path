---
chapter: 27
title: "DevSecOps, Güvenlik Taramaları ve Uyumluluk"
part: "GitLab DevOps"
level: Başlangıç
estimated_time: 100 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Bölüm 26](26-gitlab-ortamlari-ve-deploymentlar.md) | [Alıştırma](../../exercises/tr/27-gitlab-guvenlik-bulgusunu-triage-et.md) | [Laboratuvar](../../labs/tr/27-devsecops-inceleme-akisi-tasarimla.md) | [Quiz](../../quizzes/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

- DevSecOpsu ortak ve sürekli güvenlik çalışması olarak açıklamak;
- temel tarama türlerini ayırt etmek ve bulguları sorumlu biçimde yorumlamak;
- riski kanıt, sahiplik ve belgelenmiş istisnalarla önceliklendirmek.

## Giriş

DevSecOps, güvenliği planlama, code review, CI/CD, deployment ve işletime dahil eder. Otomatik taramalar sinyal üretir; insanlar bağlamı değerlendirir, riski düzeltir ve kararları izlenebilir biçimde kaydeder.

## Temel Terimler

| Terim               | Tanım                                                              |
| ------------------- | ------------------------------------------------------------------ |
| SAST                | Kaynak kodun olası zafiyetler için statik analizi.                 |
| Dependency scanning | Bağımlılıkların bilinen zafiyetlere karşı kontrolü.                |
| Secret detection    | Depoda kimlik bilgisi benzeri değerlerin aranması.                 |
| Container scanning  | Image ve paketlerin bilinen risklere karşı taranması.              |
| Triage              | Bulgunun geçerlilik, etki, öncelik ve sahibinin değerlendirilmesi. |

## Kuram

Tarama; kod sorunu, zafiyetli bağımlılık, secret veya container paketi bulabilir. Bulgu otomatik hüküm değildir. Geçerli mi, erişilebilir mi, açıkta mı, etkisi ne ve sahibi kim sorularını sor.

Secret için önce credentialı iptal et veya yenile; sonra içeriği temizle ve incident sürecini izle. Bağımlılık bulgusunda sürümü, kullanımı ve maruziyeti incele, test edilmiş yamalı sürüme geç ve sonucu belgele. Belirsiz bulgular kanıt ile owner ister. İstisna gerekçe, gerekiyorsa onay ve sona erme tarihi içermelidir.

Uyumluluk tek bir yeşil job değildir. Korumalı branch, review, tarama sonucu, artifact saklama, erişim incelemesi ve deployment onayı gerekebilir. Issue, merge request, pipeline ve ortamlar kanıt saklamaya yardımcı olur.

## Triage Listesi

1. Bulgu ve kanıtı secretı kopyalamadan oku.
2. Bileşeni, sürümü, branchi veya imagei doğrula.
3. Geçerlilik, etki, erişilebilirlik ve aciliyeti değerlendir.
4. Düzelt ve doğrula veya süreli istisna belgele.
5. Issue, merge request, pipeline ve kararı bağla.

## En İyi Uygulamalar

- Kontrolleri teslim akışında erken ve tutarlı çalıştır.
- Her bulguya owner ve sonraki adım ata.
- Kabul edilen riskleri düzenli yeniden incele.
- Audit kanıtını iş akışı boyunca sakla.

## Özet

DevSecOps güvenliği sürekli ve ortak hale getirir. Taramalar sinyal üretir, triage bilinçli karar sağlar ve izlenebilir kanıt uyumluluğu destekler.

### İlgili İçerik

- Alıştırma: [GitLab Güvenlik Bulgusunu Triage Et](../../exercises/tr/27-gitlab-guvenlik-bulgusunu-triage-et.md)
- Laboratuvar: [DevSecOps İnceleme Akışı Tasarla](../../labs/tr/27-devsecops-inceleme-akisi-tasarimla.md)
- Quiz: [DevSecOps, Güvenlik Taramaları ve Uyumluluk Quiz'i](../../quizzes/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk-quiz.md)
