import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Gaya teks CROISSE.
/// Jika file font belum dipasang, Flutter otomatis memakai font bawaan
/// sehingga aplikasi tetap berjalan.
class AppTextStyles {
  AppTextStyles._();

  static const String fontHero = 'TitanOne'; // logo & judul besar
  static const String fontHead = 'Archivo'; // judul
  static const String fontBody = 'Outfit'; // teks isi

  // Logo "croisse"
  static const TextStyle logo = TextStyle(
    fontFamily: fontHero,
    fontSize: 28,
    color: AppColors.cream,
    letterSpacing: 0.5,
  );

  // Judul besar (splash / banner)
  static const TextStyle display = TextStyle(
    fontFamily: fontHero,
    fontSize: 44,
    height: 0.95,
    color: AppColors.cream,
  );

  // Judul section
  static const TextStyle title = TextStyle(
    fontFamily: fontHead,
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: AppColors.green,
    letterSpacing: -0.2,
  );

  // Judul kecil / nama produk
  static const TextStyle heading = TextStyle(
    fontFamily: fontHead,
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
    letterSpacing: 0.2,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontBody,
    fontSize: 14,
    height: 1.45,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontBody,
    fontSize: 12,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.dark,
  );

  static const TextStyle price = TextStyle(
    fontFamily: fontHead,
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: AppColors.dark,
  );

  static const TextStyle button = TextStyle(
    fontFamily: fontHead,
    fontSize: 13,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.0,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontBody,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.8,
    color: AppColors.dark,
  );
}
