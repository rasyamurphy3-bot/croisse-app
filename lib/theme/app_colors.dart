import 'package:flutter/material.dart';

/// Palet warna CROISSE, diambil dari website referensi.
class AppColors {
  AppColors._();

  static const Color green = Color(0xFF2F5D3F); // hijau utama
  static const Color dark = Color(0xFF1D4129); // hijau tua (teks & garis)
  static const Color cream = Color(0xFFF1E5BF); // krim
  static const Color paper = Color(0xFFF7EEDA); // latar halaman
  static const Color yellow = Color(0xFFF2B33D); // aksen utama
  static const Color red = Color(0xFFD8373B); // aksen kecil
  static const Color brown = Color(0xFF7B4326); // aksen kecil
  static const Color whatsapp = Color(0xFF25D366);

  /// Warna [c] dengan tingkat transparansi [opacity] (0.0 - 1.0).
  static Color fade(Color c, double opacity) => c.withOpacity(opacity);
}
