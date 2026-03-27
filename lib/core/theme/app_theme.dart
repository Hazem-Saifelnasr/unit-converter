import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    return _theme(Brightness.light);
  }

  static ThemeData dark() {
    return _theme(Brightness.dark);
  }

  static ThemeData _theme(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F766E),
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? const Color(0xFFF4F7F5)
          : const Color(0xFF111715),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        filled: true,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
