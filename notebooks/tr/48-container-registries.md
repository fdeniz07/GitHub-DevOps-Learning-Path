---
chapter: 48
title: "Konteyner Registry'leri, Etiketler, Digest'ler ve Kimlik Doğrulama"
part: "DevOps"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](47-docker-build-pipelines.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Değiştirilebilir etiketleri değişmez imaj digest'lerinden ayırmak.
- Branch'ler, sürümler ve geri dönüşler için yararlı bir etiket ilkesi tasarlamak.
- Registry kimlik bilgilerini kaynak koduna koymadan CI ve geliştiricilerin kimliğini doğrulamak.

## Giriş

Bir konteyner registry'si imajları depolar ve derleme ve dağıtım sistemlerine sunar. Genel ve özel registry'ler aynı temel imaj referans biçimini kullanır; ancak üretim süreçlerine erişim denetimi, saklama, imzalama, tarama ve denetim gereksinimleri eklenir.

## Bu Neden Önemli?

Bir imaj referansı dağıtım sözleşmesinin parçasıdır. Değişken bir etiket üretimde çalışanın sessizce değişmesine neden olabilirken digest tam içeriği tanımlar. Açık etiketler insanların sürümleri bulmasına yardım eder; güvenli kimlik doğrulama ise yayımlama ve çekme izinlerini ayrı tutar.

## Temel Terimler

| Terim             | Tanım                                                                             |
| ----------------- | --------------------------------------------------------------------------------- |
| Repository        | Registry'deki ilgili imaj sürümlerinden oluşan adlandırılmış koleksiyon.          |
| Etiket            | `v1.4.2` gibi değiştirilebilir, insan tarafından okunabilir işaretçi.             |
| Digest            | `sha256:...` gibi içerik adresli değişmez tanımlayıcı.                            |
| Pull              | Registry'den imaj indirme.                                                        |
| Push              | Registry'ye imaj yükleme.                                                         |
| Credential helper | Registry kimlik bilgilerini shell geçmişine koymadan saklayan veya sağlayan araç. |

## Teori

Tam nitelikli bir imaj referansı registry host'u, repository ve etiket veya digest içerir: `registry.example.com/team/service:v1.4.2`. Etiketler kullanışlı takma adlardır ve taşınabilir. Digest belirli bir manifest için sabittir ve tekrarlanabilirlik önemli olduğunda doğru dağıtım girdisidir.

Pull ve push için ayrı kimlikler kullanın. CI yayımlama token'ı tek bir repository ve ortama sınırlandırılmalıdır. Dağıtım agent'larının çoğu yalnızca pull erişimine ihtiyaç duyar. Kimlik bilgilerini secret manager'da veya CI platformunun korumalı secret store'unda saklayın; mümkünse kısa ömürlü federation kullanın.

Uygun olduğunda sürümleri semantic version ve commit tanımlayıcısıyla etiketleyin. Sürüm etiketini ilke açıkça izin vermedikçe üzerine yazmayın. Saklamayı dikkatle yapılandırın: eski imajları silmek geri dönüşü veya felaket kurtarmayı bozabilir.

## Uygulamalı Örnekler

### Giriş yapma, etiketleme ve push

```bash
docker login registry.example.com
docker build --tag registry.example.com/platform/service:1.4.2 .
docker tag registry.example.com/platform/service:1.4.2 registry.example.com/platform/service:git-a1b2c3d
docker push registry.example.com/platform/service:1.4.2
docker push registry.example.com/platform/service:git-a1b2c3d
docker image inspect registry.example.com/platform/service:1.4.2 --format '{{index .RepoDigests 0}}'
```

Dönen repository digest'i push edilen tam manifesti tanımlar. Dağıtım `registry.example.com/platform/service@sha256:...` kullanabilir.

### Korumalı CI yayımlaması

```yaml
- name: Log in to registry
  uses: docker/login-action@v3
  with:
    registry: registry.example.com
    username: ${{ secrets.REGISTRY_USER }}
    password: ${{ secrets.REGISTRY_TOKEN }}
- name: Push immutable image
  run: docker push registry.example.com/platform/service:${{ github.sha }}
```

Token gerekli repository ile sınırlandırılmalı ve güvenilmeyen pull request işlerinden korunmalıdır. Token'ı yazdırmayın veya loglarda görünebilecek komut satırı argümanı olarak geçirmeyin.

## Kendiniz Deneyin

1. Bir yerel imajı semantic version etiketi ve commit etiketiyle oluşturun.
2. En az ayrıcalıklı token kullanarak özel bir test repository'sine push edin.
3. Digest'i kaydedin ve başka bir makinede imajı digest ile çekin.
4. Sürüm imajlarını ve son beş geri dönüş adayını koruyan bir saklama kuralı yazın.

## En İyi Uygulamalar

- Keşif için okunabilir sürüm etiketlerini koruyun, digest ile dağıtın.
- En küçük kapsamla ayrı push ve pull kimlikleri kullanın.
- Registry'leri TLS, denetim günlükleri, tarama ve saklama ilkeleriyle koruyun.
- Kimlik bilgilerini Dockerfile'larda, Git geçmişinde veya korumasız workflow çıktısında saklamayın.
- Her sürümle digest'i, kaynak commit'ini, tarama sonucunu ve onayı kaydedin.

## Yaygın Hatalar

| Hata                                    | Neden sorun çıkarır                               | Nasıl önlenir                                  |
| --------------------------------------- | ------------------------------------------------- | ---------------------------------------------- |
| Etiketi değişmez sanmak                 | Sonraki push dağıtılan byte'ları değiştirebilir.  | Digest'i çözümleyip dağıtın.                   |
| Tek yönetici token'ını paylaşmak        | Sızıntı gereksiz yazma erişimi verir.             | Kapsamlı kimlikler ve federation kullanın.     |
| Tüm eski imajları silmek                | Geri dönüş ve olay incelemesi zorlaşır.           | Kurtarma gereksinimleriyle saklama tanımlayın. |
| Her güvenilmeyen derlemede giriş yapmak | Pull request kodu yayımlama sırlarına erişebilir. | Doğrulama ve yayımlama işlerini ayırın.        |

## Özet

- Etiketler gezilebilir takma adlardır; digest'ler tam imaj içeriğini tanımlar.
- Registry erişimi eylem, repository ve ortama göre sınırlandırılmalıdır.
- Güvenli yayımlama; kimlik doğrulama, tarama, saklama, denetlenebilirlik ve değişmez dağıtım referanslarını birleştirir.

## İlgili Bağlantılar

- Önceki bölüm: [Tekrarlanabilir Docker derleme pipeline'ları](47-docker-build-pipelines.md)
- Alıştırma: [Bir imajı konteyner registry'sine yayımlama](../../exercises/tr/48-publish-an-image-to-a-container-registry.md)
- Lab: [Bir konteyner imajını push edip tarama](../../labs/tr/48-push-and-scan-a-container-image.md)
- Quiz: [Konteyner registry'leri quizi](../../quizzes/tr/48-container-registries-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
