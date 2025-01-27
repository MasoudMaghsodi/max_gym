import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';

Future<pw.Font> loadFont() async {
  final ByteData bytes =
      await rootBundle.load('assets/fonts/Vazirmatn-Regular.ttf');
  final pw.Font ttf = pw.Font.ttf(bytes);
  return ttf;
}

pw.Widget tableHeaderCell(String text, pw.Font font, double fontSize) =>
    pw.Padding(
      child: pw.Text(
        text,
        style: pw.TextStyle(
          font: font,
          fontWeight: pw.FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
      padding: const pw.EdgeInsets.all(2),
    );

pw.Widget tableCell(String text, pw.Font font, double fontSize) => pw.Padding(
      child: pw.Text(
        text,
        style: pw.TextStyle(
          font: font,
          fontSize: fontSize,
        ),
      ),
      padding: const pw.EdgeInsets.all(2),
    );

void showErrorDialog(BuildContext context, Object e) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('خطا'),
      content: Text('خطا در تولید PDF:\n${e.toString()}'),
      actions: [
        TextButton(
          child: const Text('باشه'),
          onPressed: () => Navigator.pop(ctx),
        ),
      ],
    ),
  );
}
