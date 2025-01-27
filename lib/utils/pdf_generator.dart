import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/workout_day.dart';
import 'header_page.dart';
import 'workout_page.dart';
import 'pdf_utils.dart';

class PdfGenerator {
  static Future<void> generatePDF(
      BuildContext context,
      List<WorkoutDay> workoutDays,
      String athleteName,
      Map<String, String> profileData) async {
    try {
      final pdf = pw.Document();
      final font = await loadFont();
      final date = profileData['date'] ?? ''; // گرفتن تاریخ از پروفایل

      addHeaderPage(pdf, font, athleteName, profileData,
          date); // اضافه کردن اطلاعات پروفایل و تاریخ

      for (var day in workoutDays) {
        if (!day.isRestDay) {
          addWorkoutPage(pdf, font, day);
        }
      }

      await Printing.layoutPdf(
        onLayout: (format) => pdf.save(),
        name: 'برنامه_ورزشی_${_sanitizeFileName(athleteName)}',
      );
    } catch (e) {
      if (!context.mounted) return;
      showErrorDialog(context, e);
    }
  }

  static Future<File> savePDF(List<WorkoutDay> workoutDays, String athleteName,
      Map<String, String> profileData) async {
    final pdf = pw.Document();
    final font = await loadFont();
    final date = profileData['date'] ?? ''; // گرفتن تاریخ از پروفایل

    addHeaderPage(pdf, font, athleteName, profileData,
        date); // اضافه کردن اطلاعات پروفایل و تاریخ

    for (var day in workoutDays) {
      if (!day.isRestDay) {
        addWorkoutPage(pdf, font, day);
      }
    }

    final dir = await getTemporaryDirectory();
    final safeFileName = _sanitizeFileName(athleteName);
    final file = File("${dir.path}/program_$safeFileName.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  static String _sanitizeFileName(String input) =>
      input.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
}
