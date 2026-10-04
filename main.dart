bool cekBatasPinjam(int jumlahDipinjam) { //pnjam buku cuma mentok 3
  return jumlahDipinjam <= 3;
}

bool cekKetersediaan(bool sedangDipinjam) { //digunain pas buku yg sedang di pnjam gbisa di pinjam lagi
  return !sedangDipinjam;
}

int hitungDenda(int hariTerlambat) { //ini buat menghitung denda 1k per hari
  if (hariTerlambat <= 0) return 0;
  return hariTerlambat * 1000;
}

String pinjamBuku(int jumlahDipinjam, bool sedangDipinjam) {
  if (!cekBatasPinjam(jumlahDipinjam)) {
    return 'maksisaml cuma 3 buku abangkuh';
  }
  if (!cekKetersediaan(sedangDipinjam)) {
    return 'buku ini sedang di pinjem';
  }
  return 'berhasil meminjam';
}
void main() {         
  print(pinjamBuku(2, false));
  print(pinjamBuku(4, false));
  print(pinjamBuku(1, true));
  print('rp ${hitungDenda(4)}');
}