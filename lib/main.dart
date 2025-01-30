import 'package:flutter/material.dart';

void main() {
  runApp(const MaxGymApp());
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
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green[800],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: SimpleScreen(),
      ),
    );
  }
}

class SimpleScreen extends StatefulWidget {
  const SimpleScreen({super.key});

  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('صفحه ساده'),
        backgroundColor: Colors.green[800],
      ),
      body: const Center(
        child: Text(
          'این یک صفحه ساده است',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
