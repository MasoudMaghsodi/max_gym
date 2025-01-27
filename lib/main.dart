import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // تغییر دادن import برای استفاده از MainScreen

void main() => runApp(const MaxGymApp());

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
        ),
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: MainScreen(), // استفاده از MainScreen به عنوان صفحه اصلی
      ),
    );
  }
}
