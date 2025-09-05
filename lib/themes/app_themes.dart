import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData _baseFromSeed({
    required Color seed,
    Brightness brightness = Brightness.light,
  }) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        centerTitle: false,
      ),
      cardColor: scheme.surfaceContainerHighest,
      dividerColor: scheme.outlineVariant,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  static ThemeData defaultTheme = _baseFromSeed(seed: Colors.blue);

  static ThemeData darkTheme = _baseFromSeed(
    seed: Colors.blueGrey,
    brightness: Brightness.dark,
  );

  static ThemeData neonTheme = _baseFromSeed(
    seed: Colors.pinkAccent,
    brightness: Brightness.dark,
  );

  static ThemeData pastelTheme = _baseFromSeed(
    seed: const Color(0xFFE1BEE7),
    brightness: Brightness.light,
  );

  static Map<String, ThemeData> themes = {
    'default': defaultTheme,
    'dark': darkTheme,
    'neon': neonTheme,
    'pastel': pastelTheme,
  };

  static Map<String, String> themeNames = {
    'default': 'Classique',
    'dark': 'Sombre',
    'neon': 'Néon',
    'pastel': 'Pastel',
  };
}
