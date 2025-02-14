import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTheme { light, dark, system }

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(_lightTheme);

  static final _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
  );

  static final _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.grey[900],
  );

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        state = _lightTheme;
        break;
      case AppTheme.dark:
        state = _darkTheme;
        break;
      case AppTheme.system:
        state = _lightTheme; // یا منطق تشخیص سیستم
        break;
    }
  }
}
