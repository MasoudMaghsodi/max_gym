import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MaxGymApp()));
}

class MaxGymApp extends StatelessWidget {
  const MaxGymApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green[800],
        secondaryHeaderColor: Colors.black,
        fontFamily: "Vazirmatn",
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1B5E20),
          titleTextStyle: TextStyle(
            fontSize: 20.0, // تنظیم اندازه مناسب متن
            fontWeight: FontWeight.bold,
            fontFamily: "Vazirmatn",
            color: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[800],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MainScreen(),
      ),
    );
  }
}
