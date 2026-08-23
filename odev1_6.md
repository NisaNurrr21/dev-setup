# Ödev 1.6: Kontrol Soruları

**1. `pip install` ile `uv add` arasında bağımlılık çözümlemesi açısından fark nedir?**
`pip install` bir paketi ortama doğrudan kurar ancak projeye ait katı bir kilit dosyası (lock file) oluşturmaz. `uv add` ise paketi kurarken aynı zamanda projenin `pyproject.toml` (veya lock) dosyasını otomatik günceller, alt bağımlılıkların birbirleriyle çakışıp çakışmadığını saniyeler içinde çözümler (resolution) ve projeyi başka bir bilgisayarda doğrudan tekrarlanabilir hale getirir.

**2. `__pycache__` neden `.gitignore`'da olmalı?**
Git, klasördeki tüm dosyaları varsayılan olarak takip eder ve repoya dahil etmeye çalışır. `__pycache__`, Python'ın kodları daha hızlı çalıştırmak için lokalde kendi kendine ürettiği `.pyc` önbellek dosyalarıdır ve her bilgisayarda otomatik olarak yeniden oluşur. Bu gereksiz ve kalabalık sistem dosyalarının GitHub'a yüklenmesini engellemenin tek yolu, Git'e "bu klasörü görmezden gel" talimatını verdiğimiz `.gitignore` dosyasının içine eklemektir.

**3. Docker'da `COPY requirements.txt` ile `COPY .` sırasını neden ayırıyoruz?**
Bu işlem Docker'ın önbellek (cache) mimarisini doğru kullanmak içindir. Eğer `COPY .` ile tüm projeyi en başta kopyalarsak, kodda yaptığımız tek satırlık bir değişiklik bile Docker'ın önbelleğini bozacak ve ağır kütüphanelerin her defasında sıfırdan indirilmesine sebep olacaktır. Önce sadece kütüphane listesini kopyalayıp kurarsak, kodumuz değişse bile paketler tekrar yüklenmez, doğrudan hafızadan (cache) çekilir ve build süresi çok ciddi oranda kısalır.

**4. `git rebase` ile `git merge` arasındaki farkı ekip çalışması bağlamında anlat.**
Ekip çalışmasında farklı dallarda geliştirilen kodları ana projeye dahil ederken iki yöntem vardır:
* **git merge:** İki dalın geçmişini olduğu gibi korur. Proje geçmişi ağaç dalları gibi ayrılıp birleşen bir görüntüye (karmaşık bir elmas şekline) sahip olur.
* **git rebase:** Farklı kodların çakışmamasını sağlayıp, sizin yazdığınız commit'leri alır ve arkadaşınızın güncel kodunun en altına (sanki ondan sonra sırayla siz yazmışsınız gibi) tek bir düz çizgi halinde ekler. Proje geçmişi çok daha temiz ve okunabilir kalır.
