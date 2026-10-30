/// ============================================================
/// KONFIGURASI TOKO CROISSE
/// Semua data toko ada di sini. Ubah di file ini saja.
/// ============================================================
class AppConfig {
  AppConfig._();

  /// Nomor WhatsApp toko, format internasional TANPA tanda "+",
  /// spasi, atau strip. Contoh: 6281234567890 (62 menggantikan 0 di depan).
  static const String whatsappNumber = '6281934028032';

  static const String storeName = 'CROISSE';
  static const String tagline = 'Fresh Croissants';
  static const String address = 'Jl. Gandaria Raya No. 67';
  static const String phoneDisplay = '+62 819-3402-8032';
  static const String instagramUrl =
      'https://www.instagram.com/abafa.shop?rpxt=ZTNteDB6bDIzZ2pj';

  static const String hoursWeekday = '08.00 - 22.00';
  static const String hoursWeekend = '08.00 - 23.00';

  /// Kunci penyimpanan lokal (jangan diubah setelah aplikasi dipakai).
  static const String historyStorageKey = 'croisse_order_history_v1';
}
