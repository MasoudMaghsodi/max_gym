import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFFFFA726), // نارنجی ملایم و انگیزشی
        primary: const Color(0xFFFFA726),
        secondary: const Color(0xFFFFD54F), // زرد روشن و شاداب
        // ignore: deprecated_member_use
        background: const Color(0xFFFFF3E0), // پس‌زمینه گرم و روشن
        surface: const Color(0xFFFFE0B2), // سطح‌های ملایم
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        // ignore: deprecated_member_use
        onBackground: Colors.black,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: const Color(0xFFFFF3E0),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
          fontFamily: 'Vazirmatn',
        ),
        bodyLarge: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF424242),
          fontFamily: 'Vazirmatn',
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFFA726),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFA726),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Vazirmatn',
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFFA726),
        foregroundColor: Colors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(
            0xFF37474F), // خاکستری متمایل به آبی برای حس حرفه‌ای بودن
        primary: const Color(0xFF37474F),
        secondary: const Color(0xFFFFD54F),
        // ignore: deprecated_member_use
        background: const Color(0xFF263238),
        surface: const Color(0xFF455A64),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        // ignore: deprecated_member_use
        onBackground: Colors.white,
        onSurface: Colors.white70,
      ),
      scaffoldBackgroundColor: const Color(0xFF263238),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Vazirmatn',
        ),
        bodyLarge: TextStyle(
          fontSize: 18.0,
          color: Colors.white70,
          fontFamily: 'Vazirmatn',
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF37474F),
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFA726),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Vazirmatn',
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFFFA726),
        foregroundColor: Colors.white,
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/max.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
