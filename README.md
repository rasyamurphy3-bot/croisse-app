# CROISSE — Premium Croissant Ordering App

Aplikasi pemesanan croissant berbasis Flutter untuk Android.

## Fitur
- Beranda dan katalog empat croissant.
- Detail produk dan keranjang belanja.
- Checkout Delivery/Pickup.
- Konfirmasi pesanan melalui WhatsApp.
- Riwayat pesanan tersimpan lokal di perangkat.

## Data toko
Ubah nomor WhatsApp, nama, alamat, dan jam operasional di `lib/config/app_config.dart` sebelum aplikasi dipakai pelanggan. Pastikan nomor WhatsApp menggunakan format internasional tanpa tanda `+`, spasi, atau strip.

## Build APK melalui GitHub Actions
1. Unggah seluruh isi folder proyek ini ke root repository GitHub (jangan unggah folder pembungkusnya).
2. Pastikan branch bernama `main` atau `master`.
3. Buka tab **Actions**. Workflow **Build CROISSE APK** berjalan otomatis setelah push, atau jalankan melalui **Run workflow**.
4. Setelah selesai, buka hasil workflow dan unduh artifact **croisse-release-apk**.
5. Ekstrak ZIP artifact untuk mendapatkan `app-release.apk`.

Build cloud menggunakan Flutter 3.27.4, Java 17, dan Gradle 8.10.2. APK memakai debug signing jika belum dikonfigurasi keystore; ini cukup untuk pengujian dan instalasi langsung, tetapi bukan konfigurasi ideal untuk publikasi Play Store.

## Menjalankan secara lokal
Instal Flutter SDK, lalu dari root proyek jalankan:

```bash
flutter pub get
flutter run
flutter build apk --release
```
