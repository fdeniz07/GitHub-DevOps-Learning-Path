---
chapter: 47
title: "Tekrarlanabilir Docker Derleme Pipeline'ları"
part: "DevOps"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](46-docker-fundamentals.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- Tekrarlanabilir, önbelleklenebilir ve denetlenmesi kolay bir Docker derlemesi tasarlamak.
- Bağımlılık, test ve çalışma zamanı aşamalarını çok aşamalı Dockerfile ile ayırmak.
- CI derleme pipeline'ına imaj taraması ve provenance kontrolleri eklemek.

## Giriş

Bir Docker derleme pipeline'ı kaynak kodunu sürümlenmiş bir imaja ve bu imajın nasıl üretildiğine dair kanıta dönüştürür. Tekrarlanabilirlik, aynı gözden geçirilmiş girdilerin eşdeğer çıktı üretmesi; izlenebilirlik ise imajı commit'e, bağımlılık kümesine ve derleme çalışmasına bağlamasıdır.

## Bu Neden Önemli?

Değişken temel etiketlere, değiştirilebilir indirmelere veya geliştiricinin yerel dosyalarına bağlı bir derleme, kaynak değişmeden farklılaşabilir. CI temiz bir checkout'tan derlemeli, girdileri kontrol etmeli, yayımlamadan önce testleri çalıştırmalı ve dağıtılacak tam imajı taramalıdır.

## Temel Terimler

| Terim                   | Tanım                                                                       |
| ----------------------- | --------------------------------------------------------------------------- |
| Çok aşamalı derleme     | Ayrı derleme ve çalışma zamanı aşamalarına sahip Dockerfile.                |
| Derleme bağlamı         | Docker daemon'una veya derleyiciye gönderilen dosyalar.                     |
| Önbellek anahtarı       | Önceki derleme sonucunu güvenle yeniden kullanmak için kullanılan girdiler. |
| SBOM                    | İmaj bileşenlerini listeleyen yazılım malzeme listesi.                      |
| Güvenlik açığı taraması | Bileşenleri güvenlik duyurularıyla karşılaştıran analiz.                    |
| Provenance              | Bir yapıtın nereden ve nasıl oluşturulduğunu açıklayan kanıt.               |

## Teori

Tekrarlanabilirlik önemli olduğunda lock file ve sabitlenmiş veya digest ile belirtilmiş temel imaj kullanın. Çok aşamalı derleme, derleyicileri ve paket yöneticilerini çalışma zamanı imajının dışında tutar. Her aşama için yalnızca gerekli dosyaları `COPY` edin ve sırların ve ilgisiz dosyaların bağlama girmesini önlemek için `.dockerignore` kullanın.

Sağlıklı bir pipeline şu sırayı izler: checkout, bağımlılıkları geri yükleme, derleme, birim testi, imajı oluşturma, imajı tarama ve ilke kapıları geçtikten sonra yayımlama. Kaynak ağacını taramak, son imajı taramanın yerini tutmaz; çünkü imaj temel işletim sistemi paketlerini de içerir.

Önbellekleme yalnızca girdileri doğruysa yararlıdır. Bağımlılık indirmelerini lock file hash'iyle önbelleğe alın, ancak lock file değiştiğinde önbelleği geçersiz kılın. Etiketler insan dostu bir sürümü tanımlar, değişmez digest'ler ise tam byte'ları tanımlar.

## Uygulamalı Örnekler

### Çok aşamalı Dockerfile

```dockerfile
FROM node:22-bookworm-slim AS build
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm test && npm run build

FROM nginx:1.27-alpine AS runtime
COPY --from=build /src/dist /usr/share/nginx/html
USER 101
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
```

Çalışma zamanı aşaması oluşturulmuş siteyi ve web sunucusunu içerir, ancak Node.js araç zincirini veya test bağımlılıklarını içermez.

### Tarama kapılı CI taslağı

```yaml
name: Build container
on:
  pull_request:
  push:
    branches: [main]
permissions:
  contents: read
  packages: write
jobs:
  build-test-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build image
        run: docker build --tag app:${{ github.sha }} .
      - name: Test image
        run: docker run --rm app:${{ github.sha }} npm test
      - name: Scan image
        uses: aquasecurity/trivy-action@0.28.0
        with:
          image-ref: app:${{ github.sha }}
          severity: CRITICAL,HIGH
          exit-code: "1"
```

Tarama aynı işte oluşturulan değişmez commit etiketini hedefler. Üretimde üçüncü taraf action'ları kuruluş ilkenize göre sabitleyin ve yalnızca kapı başarıyla geçtikten sonra yayımlayın.

## Kendiniz Deneyin

1. Tek aşamalı bir Dockerfile'ı derleme ve çalışma zamanı aşamalarına dönüştürün.
2. Bir lock file ekleyin ve bağımlılık kurulumunun deterministik olduğunu doğrulayın.
3. Commit tabanlı bir etiketle derleyin, güvenlik açığı taraması çalıştırın ve raporu CI yapıtı olarak kaydedin.
4. Lock file'ı değiştirip bağımlılık önbelleğinin geçersiz kılındığını gözlemleyin.

## En İyi Uygulamalar

- Temiz, gözden geçirilmiş kaynaktan derleyin ve imaj etiketlerinde commit SHA'sını kaydedin.
- Çok aşamalı derlemeler, `.dockerignore` ve root olmayan çalışma zamanı kullanıcıları kullanın.
- Son imajı güvenlik açıkları için tarayın ve SBOM üretin.
- Üzerinde anlaşılan önem eşiklerinde başarısız olun; istisnaları ve bitiş tarihlerini belgeleyin.
- Pull request doğrulamasını korumalı yayımlama kimlik bilgilerinden ayırın.

## Yaygın Hatalar

| Hata                                      | Neden sorun çıkarır                               | Nasıl önlenir                                               |
| ----------------------------------------- | ------------------------------------------------- | ----------------------------------------------------------- |
| Dağıtım girdisi olarak `latest` kullanmak | Aynı etiket farklı byte'lara işaret edebilir.     | Değişmez bir digest dağıtın.                                |
| Yalnızca kaynak bağımlılıklarını taramak  | Temel imaj açıkları gizli kalır.                  | Oluşturulmuş çalışma zamanı imajını tarayın.                |
| Tüm repository'yi erkenden kopyalamak     | Önbellek sık geçersizleşir ve sırlar sızabilir.   | Önce lock file'ları kopyalayın ve `.dockerignore` kullanın. |
| Test ve taramalardan önce yayımlamak      | Hatalı veya riskli yapıtlar güvenilir hale gelir. | Sıralı kalite kapılarını zorunlu kılın.                     |

## Özet

- Tekrarlanabilir derlemeler kontrollü girdiler, temiz bağlamlar ve lock file'lar gerektirir.
- Çok aşamalı Dockerfile'lar çalışma zamanı boyutunu ve saldırı yüzeyini azaltır.
- Derleme, test, tarama ve yayımlama kapıları aynı değişmez imaj referansı üzerinde çalışmalıdır.

## İlgili Bağlantılar

- Önceki bölüm: [Docker temelleri](46-docker-fundamentals.md)
- Alıştırma: [Docker derleme pipeline'ı tasarlama](../../exercises/tr/47-design-a-docker-build-pipeline.md)
- Lab: [Docker derleme pipeline'ı çalıştırma](../../labs/tr/47-run-a-docker-build-pipeline.md)
- Quiz: [Docker derleme pipeline'ları quizi](../../quizzes/tr/47-docker-build-pipelines-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
