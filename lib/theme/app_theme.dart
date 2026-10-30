import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Tema Material 3 untuk CROISSE.
class AppTheme {
  AppTheme._();

  static const double radiusSmall = 12;
  static const double radiusMedium = 20;
  static const double radiusLarge = 28;

  static ThemeData light() {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: AppColors.green,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.green,
      onPrimary: AppColors.cream,
      secondary: AppColors.yellow,
      onSecondary: AppColors.dark,
      surface: AppColors.paper,
      onSurface: AppColors.dark,
      error: AppColors.red,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.paper,
      fontFamily: AppTextStyles.fontBody,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.cream,
        elevation: 0,
        centerTitle: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          foregroundColor: AppColors.cream,
          elevation: 0,
          minimumSize: const Size.fromHeight(52),
          textStyle: AppTextStyles.button,
          shape: const StadiumBorder(),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.fade(AppColors.cream, 0.5),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        hintStyle: TextStyle(color: AppColors.fade(AppColors.green, 0.55)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
          borderSide: BorderSide(color: AppColors.fade(AppColors.green, 0.5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
          borderSide: BorderSide(color: AppColors.fade(AppColors.green, 0.5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
          borderSide: const BorderSide(color: AppColors.green, width: 2),
        ),
      ),
    );
  }
}
