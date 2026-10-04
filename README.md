# program sederhana peminjaman dan pendedaan buku perpuzzzz

**nama**: rafa fathur rohman(1124160130) 

## bagian a — dokumen analisis

### 1. problem statement
sistem perpus ini butuh fitur otomatis buat cek aturan peminjaman buku sama ngitung denda kalau telat sistem ni harus mastiin anggota ga boleh pinjem lebih dari 3 buku dan mencegah pinjem buku yang lagi dipinjem sama mahasiswa lain program ini langsung ngitung denda telat 1k per hari

### 2. aktor
* **mahasiswa**: melakukan peminjaman dan pengembalian buku

### 3. input dan output
* **input**:
  * `jumlahdipinjam` (int): jumlah buku yang sedang dipinjam saat ini
  * `sedangdipinjam` (bool): status ketersediaan buku (`true` jika dipinjam, `false` jika tersedia)
  * `hariterlambat` (int): jumlah hari keterlambatan pengembalian
* **output**:
  * status/pesan peminjaman (`string`)
  * total denda keterlambatan (`int`)

### 4. functional requirement
* sistem dapat mengecek batas maksimal buku yang dipinjam
* sistem dapat mengecek ketersediaan buku
* sistem dapat memproses peminjaman dan mengembalikan pesan status
* sistem dapat menghitung denda keterlambatan pengembalian

### 5. bisnis rule
* maksimal pinjam **3 buku**
* buku yang **sedang dipinjam** tidak bisa dipinjam lagi
* denda keterlambatan adalah **1k per hari**

### 6. decomposition
* `cekbataspinjam(jumlahdipinjam)`: mengecek apakah `jumlahdipinjam <= 3` 
* `cekketersediaan(sedangdipinjam)`: mengecek ketersediaan buku `!sedangdipinjam`
* `hitungdenda(hariterlambat)`: menghitung denda `hariterlambat * 1000`
* `pinjambuku(jumlahdipinjam, sedangdipinjam)`: gabungin validasi br-01 dan br-02 untuk menentukan pesan status peminjaman

### 7. pattern recognition
* **aturan kuota**: pola pembatasan jumlah maksimal peminjaman seperti batas item checkout pada aplikasi belanja
* **status availability**: pola perkondisian menggunakan boolean (`true`/`false`) seperti ketersediaan kursi di bioskop
* **perhitungan linear**: pola perhitungan denda harian menggunakan perkalian linear `(hari * tarif)`

### 8. abstraction
* **tipe data utama**:
  * `int`: untuk jumlah buku yg dipinjam dan terlambat bayar
  * `bool`: buat status ketersediaan buku
  * `string`: pesan hasil peminjaman

#### pseudocode
```text
function cekbataspinjam(jumlahdipinjam)
    return jumlahdipinjam <= 3
end function

function cekketersediaan(sedangdipinjam)
    return not sedangdipinjam
end function

function hitungdenda(hariterlambat)
    if hariterlambat <= 0 then
        return 0
    endif
    return hariterlambat * 1000
end function

function pinjambuku(jumlahdipinjam, sedangdipinjam)
    if not cekbataspinjam(jumlahdipinjam) then
        return "maksisaml cuma 3 buku abangkuh"
    endif
    if not cekketersediaan(sedangdipinjam) then
        return "buku ini sedang di pinjem"
    endif
    return "berhasil meminjam"
end function