import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../themes/app_themes.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppThemes.defaultTheme;
  String _currentThemeName = 'default';

  ThemeData get currentTheme => _currentTheme;
  String get currentThemeName => _currentThemeName;

  Map<String, ThemeData> get availableThemes => AppThemes.themes;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('selected_theme');

    if (savedTheme != null && AppThemes.themes.containsKey(savedTheme)) {
      _currentThemeName = savedTheme;
      _currentTheme = AppThemes.themes[savedTheme]!;
      notifyListeners();
    }
  }

  void setTheme(String themeName) async {
    if (AppThemes.themes.containsKey(themeName)) {
      _currentThemeName = themeName;
      _currentTheme = AppThemes.themes[themeName]!;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('selected_theme', themeName);

      notifyListeners();
    }
  }
}
