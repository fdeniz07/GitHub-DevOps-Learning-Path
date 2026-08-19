---
chapter: 05
title: "Odaklı Commitler Oluşturma"
related_notebook: "Commitlerle Çalışma"
level: Başlangıç
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/05-commitlerle-calisma.md) | [Laboratuvar](../../labs/tr/05-odakli-commitler-olusturma.md) | [Quiz](../../quizzes/tr/05-commit-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Odaklı Commitler Oluşturma

## Amaç

Küçük commitler oluşturun ve kaydetmeden önce staging diff'ini inceleyin.

## Görevler

1. Birbirinden bağımsız iki dosyayı değiştirin.
2. `git diff` çalıştırın.
3. Yalnızca ilk değişikliği stage edin.
4. `git diff --staged` ile kontrol edin.
5. Açıklayıcı bir mesajla commit edin.
6. İkinci değişikliği ayrı commit edin.

## Beklenen Sonuç

Her commit tek bir ilişkili değişikliği açıklar.

## Öz Kontrol

- [ ] Stage öncesi diff'i kontrol ediyorum.
- [ ] Açıklayıcı commit mesajları yazıyorum.
- [ ] Staged ve unstaged değişiklikleri ayırt edebiliyorum.
