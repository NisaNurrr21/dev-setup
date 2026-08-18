# CLI Veri İşleme Egzersizi Raporu

## 1. Veri İndirme ve Satır Sayısı
* Kullanılan veri seti: Our World in Data (COVID-19)
* Dosyanın toplam satır sayısı `wc -l` komutu ile **429436** olarak bulunmuştur.

## 2. Frekans Analizi
`cut`, `sort`, `uniq` ve `head` komutları kullanılarak 3. kolon incelendiğinde en çok geçen ilk 3 değer:
1. High-income countries (3026)
2. European Union (27) (3024)
3. Upper-middle-income countries (3013)

## 3. Veri Filtreleme
* `grep` komutu ile sadece Türkiye'ye ait veriler `turkey_data.csv` dosyasına filtrelenmiştir.
* Türkiye'ye ait toplam satır sayısı **1674** olarak bulunmuştur.

## 4. Join İşlemi
* İki farklı dosya (`ulkeler.csv` ve `baskentler.csv`), `join` komutu kullanılarak ortak ülke kodları üzerinden başarıyla birleştirilmiştir.
