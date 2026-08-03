import 'package:flutter/material.dart';

/// Centralized theme so colors/typography stay consistent
/// across the whole app instead of being hardcoded per widget.
class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF5B4FE9);
  static const Color secondary = Color(0xFF2ED3B7);
  static const Color background = Color(0xFFF6F7FB);
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF1F2333);
  static const Color textMuted = Color(0xFF6B7280);

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        secondary: secondary,
        surface: surface,
      ),
      scaffoldBackgroundColor: background,
      fontFamily: 'Roboto',
    );

    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 3,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      textTheme: base.textTheme.apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
    );
  }
}
