<div align="center">

# 📱 Ponsel Mart

**Marketplace jual beli HP baru dan bekas, dibuat dengan Flutter.**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase Hosting](https://img.shields.io/badge/Firebase_Hosting-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/products/hosting)

### 🔗 [Buka Demo](https://ponsel-mart-19896.firebaseapp.com)

</div>

---

## ✨ Tentang Proyek

Ponsel Mart adalah aplikasi web marketplace penjualan HP. Pengguna bisa menelusuri produk, memasukkannya ke keranjang, melakukan checkout, memantau status pesanan, lalu memberi ulasan setelah barang diterima. Proyek ini dibuat sebagai tugas kuliah untuk mempelajari Flutter dan deployment ke Firebase Hosting.

## 🚀 Fitur

| Fitur | Keterangan |
| --- | --- |
| 🏠 **Beranda** | Banner, merek populer, promo hari ini, dan testimoni pembeli |
| 📱 **Produk** | Pencarian, filter merek, harga coret, rating, dan jumlah terjual |
| 🛒 **Keranjang** | Tambah, kurangi, dan hitung total otomatis |
| 💳 **Checkout** | Alamat pengiriman, voucher, metode pembayaran, dan ringkasan harga |
| 📦 **Status Pesanan** | Menunggu pembayaran → Diproses → Berhasil, lengkap dengan filter |
| 🧾 **Detail Transaksi** | Garis waktu status, rincian produk, dan total pembayaran |
| ⭐ **Rating & Review** | Bintang, teks ulasan, foto bukti, dan jumlah pembelian |
| 👤 **About Me, Tentang Kami, Kontak** | Profil, visi misi, tim, form kontak, dan FAQ |
| 🎨 **Tampilan** | Transisi halaman, mode terang dan gelap otomatis, responsif di HP dan komputer |

## 🖼️ Tampilan

<!--
Tambahkan screenshot ke folder docs/screenshots/, lalu hapus tanda komentar di bawah ini.

<p align="center">
  <img src="docs/screenshots/beranda.png" width="30%" alt="Beranda" />
  <img src="docs/screenshots/produk.png" width="30%" alt="Produk" />
  <img src="docs/screenshots/checkout.png" width="30%" alt="Checkout" />
</p>
-->

## 🧪 Coba Fitur Checkout

Gunakan kode voucher berikut saat checkout:

| Voucher | Efek |
| --- | --- |
| `HEMAT10` | Diskon 10% dari subtotal |
| `ONGKIRGRATIS` | Ongkir menjadi Rp0 |

Alur singkat untuk demo:

1. Tambahkan HP ke keranjang, lalu tekan **Checkout**.
2. Isi alamat, pilih pembayaran, lalu **Buat pesanan**.
3. Di halaman **Pesanan**, tekan **Bayar sekarang** lalu **Pesanan diterima**.
4. Buka **Detail transaksi**, lalu beri ulasan.

> Pembayaran dan data pesanan di versi ini hanya simulasi dan tersimpan sementara di browser. Data hilang saat halaman dimuat ulang.

## 🛠️ Teknologi

- [Flutter](https://flutter.dev) dan Dart (Material 3)
- [image_picker](https://pub.dev/packages/image_picker) untuk foto bukti ulasan
- [Firebase Hosting](https://firebase.google.com/products/hosting) untuk deployment

## 📁 Struktur Folder

```
ponsel_mart/
├── assets/
│   └── images/        # foto produk (nama file = nama produk, huruf kecil, spasi jadi _)
├── lib/
│   └── main.dart      # seluruh kode aplikasi dan data contoh
├── web/               # konfigurasi web Flutter
├── firebase.json      # konfigurasi Firebase Hosting
└── pubspec.yaml       # dependensi dan daftar aset
```

## ▶️ Menjalankan di Komputer

Prasyarat: [Flutter SDK](https://docs.flutter.dev/get-started/install) sudah terpasang dan Chrome atau Edge tersedia.

```bash
# 1. Clone repository
git clone https://github.com/Shevaaa22/ponsel_mart.git
cd ponsel_mart

# 2. Unduh dependensi
flutter pub get

# 3. Jalankan di browser
flutter run -d chrome
```

## 🌐 Build dan Deploy

```bash
flutter build web --release
firebase deploy --only hosting
```

## ➕ Menambah Produk

Buka `lib/main.dart`, lalu tambahkan satu baris di daftar `products`:

```dart
Product('Nama', 'Merek', 'Spesifikasi', harga, hargaCoret, rating, terjual, 'Baru', 'Kota', warna1, warna2),
```

Simpan foto produknya di `assets/images/` dengan nama yang sama seperti nama produk, misalnya `Galaxy S24` menjadi `galaxy_s24.png`.

## 🗺️ Rencana Pengembangan

- [ ] Login dan registrasi pengguna
- [ ] Menyimpan produk dan pesanan di database (Firestore)
- [ ] Halaman detail produk
- [ ] Fitur penjual untuk menambah produk sendiri
- [ ] Integrasi pembayaran sungguhan

## 👨‍💻 Pembuat

Dibuat oleh [Shevaaa22](https://github.com/Shevaaa22).