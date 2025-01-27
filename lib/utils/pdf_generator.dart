import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/workout_day.dart';

class PdfGenerator {
  static Future<void> generatePDF(BuildContext context,
      List<WorkoutDay> workoutDays, String athleteName) async {
    try {
      final pdf = pw.Document();
      final font = await _loadFont();

      _addHeaderPage(pdf, font, athleteName);

      for (var day in workoutDays) {
        if (!day.isRestDay) {
          _addWorkoutPage(pdf, font, day);
        }
      }

      await Printing.layoutPdf(
        onLayout: (format) => pdf.save(),
        name: 'برنامه_ورزشی_${_sanitizeFileName(athleteName)}',
      );
    } catch (e) {
      if (!context.mounted) return;
      _showErrorDialog(context, e);
    }
  }

  static Future<File> savePDF(
      List<WorkoutDay> workoutDays, String athleteName) async {
    final pdf = pw.Document();
    final font = await _loadFont();

    _addHeaderPage(pdf, font, athleteName);

    for (var day in workoutDays) {
      if (!day.isRestDay) {
        _addWorkoutPage(pdf, font, day);
      }
    }

    final dir = await getTemporaryDirectory();
    final safeFileName = _sanitizeFileName(athleteName);
    final file = File("${dir.path}/program_$safeFileName.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static Future<pw.Font> _loadFont() async {
    final ByteData bytes =
        await rootBundle.load('assets/fonts/Vazirmatn-Regular.ttf');
    final pw.Font ttf = pw.Font.ttf(bytes);
    return ttf;
  }

  static void _addHeaderPage(
      pw.Document pdf, pw.Font font, String athleteName) {
    pdf.addPage(
      pw.Page(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: font),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              alignment: pw.Alignment.center,
              child: pw.Header(
                text: 'MAX GYM - برنامه ورزشی',
                level: 1,
                textStyle: pw.TextStyle(
                  font: font,
                ),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Text('نام ورزشکار: $athleteName'),
            pw.SizedBox(height: 20),
            pw.Text(
                'آدرس باشگاه: آذربایجان غربی - میاندوآب - خیابان ۲۴ متری - جنب فروشگاه اسنوا'),
            pw.SizedBox(height: 20),
            pw.Text("مربی : استاد بهزاد بهزاد فر"),
          ],
        ),
      ),
    );
  }

  static void _addWorkoutPage(pw.Document pdf, pw.Font font, WorkoutDay day) {
    pdf.addPage(
      pw.Page(
        textDirection: pw.TextDirection.rtl,
        theme: pw.ThemeData.withFont(base: font),
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                day.dayName,
                style: pw.TextStyle(
                  font: font,
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              padding: const pw.EdgeInsets.all(8.0),
            ),
            pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: {
                0: const pw.FlexColumnWidth(),
                1: const pw.FlexColumnWidth(),
              },
              children: [
                pw.TableRow(
                  children: [
                    _tableHeaderCell('ست/تکرار', font),
                    _tableHeaderCell('تمرین', font),
                  ],
                ),
                ...day.exercises.map(
                  (exercise) => pw.TableRow(
                    children: [
                      _tableCell('${exercise.sets} x ${exercise.reps}', font),
                      _tableCell(
                        exercise.superSet?.isNotEmpty ?? false
                            ? '${exercise.name} + ${exercise.superSet}'
                            : exercise.name,
                        font,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static pw.Widget _tableHeaderCell(String text, pw.Font font) => pw.Padding(
        child: pw.Text(
          text,
          style: pw.TextStyle(
            font: font,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        padding: const pw.EdgeInsets.all(5),
      );

  static pw.Widget _tableCell(String text, pw.Font font) => pw.Padding(
        child: pw.Text(
          text,
          style: pw.TextStyle(
            font: font,
          ),
        ),
        padding: const pw.EdgeInsets.all(5),
      );

  static String _sanitizeFileName(String input) =>
      input.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');

  static void _showErrorDialog(BuildContext context, Object e) {
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
}
