---
chapter: 13
title: "GitHub Projeleri"
part: "GitHub"
level: Başlangıç
estimated_time: 70 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Önceki: Bölüm 12](12-pull-requestler.md) | [Yol Haritası](../../ROADMAP.md) | Sonraki: Bölüm 14 yakında

## Öğrenme Hedefleri

- GitHub Projects'i planlama aracı olarak açıklamak;
- issue ve pull requestleri projeye eklemek;
- anlamlı workflow sütunları oluşturmak;
- durum, sorumluluk ve ilerlemeyi görünür kılmak;
- basit otomasyonu anlamak.

## Giriş

GitHub Projects, işleri bir board üzerinde görünür hale getirir. Görevler Backlog, Yapılacak, Devam Ediyor, Review ve Tamamlandı gibi durumlar arasında ilerler. Project, issue ve pull requestlerin yerine geçmez; onları ortak planlama görünümünde birleştirir.

## Görsel Öğrenme

```mermaid
flowchart LR
    A[Backlog] --> B[Yapılacak]
    B --> C[Devam Ediyor]
    C --> D[Review]
    D --> E[Tamamlandı]
```

## Kuram

Issue görev veya hata kaydıdır; pull request kod değişikliğini temsil eder. Her ikisi de Project içinde takip edilebilir. Sütunlar gerçek iş durumlarını anlatmalı ve board düzenli güncellenmelidir.

```text
Backlog → Yapılacak → Devam Ediyor → Review → Tamamlandı
```

Label, sorumlu kişi, milestone ve otomasyonlar takip işini kolaylaştırır.

## Uygulamalı Örnek

1. Dokümantasyon projesi için board oluşturun.
2. Üç issue ekleyin.
3. Bir görevi **Devam Ediyor** sütununa taşıyın.
4. PR'yi **Review** durumuna alın.
5. Doğrulama sonrasında **Tamamlandı** yapın.

## En İyi Uygulamalar

Az ve anlaşılır sütun kullanın, her işe sorumlu atayın, blokajları görünür yapın ve boardu güncel tutun.

## Özet

GitHub Projects, issue ve pull requestleri görünür bir iş akışına bağlar. Basit ve güncel bir board ekip planlamasını kolaylaştırır.

## Sonraki Bölüm

Bölüm 14 issue ve discussion araçlarını ele alır.

### İlgili İçerik

- Alıştırma: [Project Board Planlama](../../exercises/tr/13-proje-panosu-planlama.md)
- Laboratuvar: [GitHub Project Board Oluşturma](../../labs/tr/13-github-proje-panosu-olustur.md)
- Quiz: [GitHub Projeleri Quiz'i](../../quizzes/tr/13-github-projeleri-quiz.md)
