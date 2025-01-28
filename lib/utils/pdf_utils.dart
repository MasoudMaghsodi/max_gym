import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

Future<pw.Font> loadFont() async {
  final ByteData data = await rootBundle
      .load('assets/fonts/IranSans.ttf'); // بارگذاری فونت سفارشی
  return pw.Font.ttf(
      data.buffer.asByteData()); // تبدیل داده‌های بایت به فونت PDF
}

// نمایش دیالوگ خطا در صورت بروز خطا در تولید PDF
void showErrorDialog(BuildContext context, dynamic error) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('خطا'), // عنوان دیالوگ
        content: Text(error.toString()), // نمایش پیام خطا
        actions: [
          TextButton(
            child: const Text('باشه'),
            onPressed: () {
              Navigator.of(context).pop(); // بستن دیالوگ
            },
          ),
        ],
      );
    },
  );
}
