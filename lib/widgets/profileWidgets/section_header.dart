import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  // عنوان بخش که قرار است نمایش داده شود
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 16.0), // فاصله عمودی بین بخش‌ها
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18, // اندازه فونت
          fontWeight: FontWeight.bold, // ضخیم کردن فونت
          color: Colors.blueAccent, // رنگ فونت
        ),
      ),
    );
  }
}
