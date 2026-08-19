# Dev-Setup Şablonu

Bu repo, makine öğrenmesi ve veri odaklı yazılım mühendisliği projeleri için standart, üretime hazır (production-ready) bir başlangıç şablonudur.

## Kullanılan Teknolojiler
* **uv:** Paket ve sanal ortam yönetimi
* **ruff & mypy:** Kod kalite ve tip kontrolü
* **pytest:** Birim testleri ve kod kapsamı
* **pre-commit:** Git kancaları ile otomatik denetim
* **Docker:** Multi-stage build ile izolasyon

## Nasıl Çalıştırılır?
Projeyi bilgisayarınıza klonladıktan sonra:

```bash
# Kurulum
make install

# Testleri çalıştırma
make test

# Kodu denetleme
make lint

## Ödev 1.3: Git Kriz Yönetimi Senaryoları
Bu görev kapsamında ayrı bir test reposu oluşturulmuş ve aşağıdaki senaryolar başarıyla simüle edilerek çözülmüştür:

* **Yanlış Dala Commit Atma:** `git reset --hard` ve `git cherry-pick` ile commit doğru dala taşındı.
* **Commit Birleştirme (Squash):** `git rebase -i` kullanılarak 3 farklı WIP commit'i tek bir profesyonel commit'te birleştirildi.
* **Hassas Veri Temizliği:** Yanlışlıkla commit'lenen `.env` dosyası `git filter-branch` ile Git geçmişinden tamamen silindi.
* **Merge Conflict (Çakışma):** İki farklı dalda aynı satır değiştirilerek kasten conflict yaratıldı ve manuel olarak çözüldü.
* **Hata Avı (Bisect):** `git bisect` ile 5 commit'lik bir geçmişte arama yapılarak sistemi bozan "bad commit" tespit edildi.
