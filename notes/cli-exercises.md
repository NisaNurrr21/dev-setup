# CLI Veri İşleme Egzersizi Raporu

## 1. Veri İndirme ve Satır Sayısı
* Kullanılan veri seti: Our World in Data (COVID-19)
* Dosyanın toplam satır sayısı `wc -l` komutu ile **429436** olarak bulunmuştur.

```bash
wc -l data/covid_data.csv
# Çıktı: 429436 data/covid_data.csv
```

## 2. Frekans Analizi
3. kolon incelendiğinde en çok geçen ilk 3 değeri bulmak için `cut`, `sort`, `uniq` ve `head` komutları boru hattı (pipeline) ve spesifik bayraklarla kullanılmıştır:

```bash
cut -d',' -f3 data/covid_data.csv | sort | uniq -c | sort -nr | head -n 3
# Çıktı:
# 3026 High-income countries
# 3024 European Union (27)
# 3013 Upper-middle-income countries
```

## 3. Veri Filtreleme
* `grep` komutu ile sadece Türkiye'ye ait veriler filtrelenmiş ve `>` operatörü ile `data/turkey_data.csv` dosyasına yazdırılmıştır.
* İşlem sonrası satır sayısı `wc -l` ile **1674** olarak doğrulanmıştır.

```bash
grep "Türkiye" data/covid_data.csv > data/turkey_data.csv
wc -l data/turkey_data.csv
# Çıktı: 1674 data/turkey_data.csv
```

## 4. Join İşlemi
* İki farklı dosya (`ulkeler.csv` ve `baskentler.csv`), `join` komutunun sessizce boş dosya üretmesini engellemek için önce sıralanmış, ardından ortak ülke kodları üzerinden birleştirilmiştir.
* Her işlemden önce ve sonra satır kayıplarını önlemek için `wc -l` ile kontroller sağlanmıştır.

```bash
# 1. Dosyaları ortak anahtara (1. sütun) göre sıralama
sort -t',' -k1,1 data/ulkeler.csv > data/ulkeler_sorted.csv
sort -t',' -k1,1 data/baskentler.csv > data/baskentler_sorted.csv

# 2. Girdi satır sayılarını kontrol etme (İşlem öncesi)
wc -l data/ulkeler_sorted.csv
wc -l data/baskentler_sorted.csv

# 3. Ortak sütun üzerinden birleştirme
join -t',' -1 1 -2 1 data/ulkeler_sorted.csv data/baskentler_sorted.csv > data/birlesik_veri.csv

# 4. Çıktı satır sayısını kontrol etme (İşlem sonrası kayıp testi)
wc -l data/birlesik_veri.csv
```
