# program sederhana peminjaman dan pendedaan buku perpuzzzz

**nama**: rafa fathur rohman (1124160130)

## problem statement (pernyataan masalah)
sistem perpus ini butuh fitur otomatis buat cek aturan peminjaman buku sama ngitung denda kalau telat sistem ni harus mastiin anggota ga boleh pinjem lebih dari 3 buku dan mencegah pinjem buku yang lagi dipinjem sama mahasiswa lain program ini langsung ngitung denda telat 1k per hari

## actor (pengguna)
aktor yang menggunakan sistem ini adalah **mahasiswa (peminjam buku)**

## input & output (masukan dan keluaran)
input :
* `jumlahdipinjam` (int) : jumlah buku yang sedang dipinjam saat ini
* `sedangdipinjam` (bool) : status ketersediaan buku (`true` jika dipinjam, `false` jika tersedia)
* `hariterlambat` (int) : jumlah hari keterlambatan pengembalian

output :
* status/pesan peminjaman (`string`)
* total denda keterlambatan (`int`)

## functional requirements (kebutuhan fungsional)
fungsi utama dalam sistem ini :
* dapat mengecek batas maksimal buku yang dipinjam
* dapat mengecek ketersediaan buku
* dapat memproses peminjaman dan mengembalikan pesan status
* dapat menghitung denda keterlambatan pengembalian

## business rule (aturan bisnis)

| kode | business rule (aturan bisnis) |
|---|---|
| br-01 | maksimal pinjam 3 buku |
| br-02 | buku yang sedang dipinjam tidak bisa dipinjam lagi |
| br-03 | denda keterlambatan adalah rp1.000 per hari |

## decomposition (pemecahan masalah)
    perpus
        ├── cekbataspinjam  → mengecek apakah jumlahdipinjam <= 3 (br-01)
        ├── cekketersediaan → mengecek ketersediaan buku !sedangdipinjam (br-02)
        ├── hitungdenda     → menghitung denda hariterlambat * 1000 (br-03)
        └── pinjambuku      → menggabungkan validasi br-01 dan br-02 untuk menentukan pesan status peminjaman

## pattern recognition (pengenalan pola)
dalam sistem perpus ini kemungkinan ada beberapa pola :
* **aturan kuota** : pola pembatasan jumlah maksimal peminjaman seperti batas item checkout pada aplikasi belanja
* **status availability** : pola perkondisian menggunakan boolean (`true`/`false`) seperti ketersediaan kursi di bioskop
* **perhitungan linear** : pola perhitungan denda harian menggunakan perkalian linear `(hari * tarif)`

## abstraction (penyederhanaan)
    perpus
        ├── jumlahdipinjam
        ├── sedangdipinjam
        └── hariterlambat

tipe data utama yang digunakan :
* `int` : untuk jumlah buku dipinjam dan hari keterlambatan
* `bool` : untuk status ketersediaan buku
* `string` : untuk pesan hasil peminjaman

## flowchart (diagram alur)
          [start]
             |
             ▼
    [panggil pinjambuku]
             |
             ▼
    [cekbataspinjam <= 3?] ────────────► [return "maksisaml cuma 3 buku abangkuh"]
       ya    |                 tidak
             ▼
    [cekketersediaan (false)?] ──────────► [return "buku ini sedang di pinjem"]
       ya    |                   tidak
             ▼
    [return "berhasil meminjam"]
             |
             ▼
          [selesai]

## pseudocode (kode semu)
    function cekbataspinjam(jumlahdipinjam)
        return jumlahdipinjam <= 3
    end function

    function cekketersediaan(sedangdipinjam)
        return not sedangdipinjam
    end function

    function hitungdenda(hariterlambat)
        if hariterlambat <= 0 then
            return 0
        end if
        return hariterlambat * 1000
    end function

    function pinjambuku(jumlahdipinjam, sedangdipinjam)
        if not cekbataspinjam(jumlahdipinjam) then
            return "maksisaml cuma 3 buku abangkuh"
        end if
        if not cekketersediaan(sedangdipinjam) then
            return "buku ini sedang di pinjem"
        end if
        return "berhasil meminjam"
    end function