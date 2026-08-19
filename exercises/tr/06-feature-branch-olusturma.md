---
chapter: 06
title: "Feature Branch Oluşturma"
related_notebook: "Dallanma Stratejileri"
level: Başlangıç
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Notebook](../../notebooks/tr/06-dallanma-stratejileri.md) | [Laboratuvar](../../labs/tr/06-branch-olusturma-ve-inceleme.md) | [Quiz](../../quizzes/tr/06-dallanma-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Feature Branch Oluşturma

## Amaç

Küçük bir değişikliği anlamlı adlandırılmış bir feature branch içinde izole edin.

## Görevler

1. `git status` ile çalışma dizininin temiz olduğunu kontrol edin.
2. `git switch -c feature/update-readme` çalıştırın.
3. Bir dosyayı değiştirip commit edin.
4. `git branch` ve `git log --oneline --all` çıktısını inceleyin.
5. `main` branchine dönüp farkı açıklayın.

## Beklenen Sonuç

Hangi branchte çalıştığınızı anlayabilir ve tamamlanmamış işi `main`den ayrı tutabilirsiniz.

## Öz Kontrol

- [ ] Branch adı amacı açıklıyor.
- [ ] Değişiklik doğrudan `main`de yapılmadı.
- [ ] Mevcut branchi gösterebiliyorum.
