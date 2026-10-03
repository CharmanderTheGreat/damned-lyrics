import 'package:flutter/material.dart';

class Palette {
  static const bg = Color(0xFF0D1117);
  static const surface = Color(0xFF161B22);
  static const border = Color(0xFF30363D);
  static const text = Color(0xFFE6EDF3);
  static const dim = Color(0xFF8B949E);
  static const green = Color(0xFF3FB950);
  static const danger = Color(0xFF3D1F1F);
}

ThemeData buildTheme() {
  final base = ThemeData.dark(useMaterial3: true);
  return base.copyWith(
    scaffoldBackgroundColor: Palette.bg,
    colorScheme: const ColorScheme.dark(
      primary: Palette.green,
      surface: Palette.surface,
    ),
    textTheme: base.textTheme.apply(
      fontFamily: 'JetBrainsMono',
      bodyColor: Palette.text,
      displayColor: Palette.text,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Palette.bg,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: 'JetBrainsMono',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Palette.green,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Palette.dim),
    ),
    dividerColor: Palette.border,
  );
}