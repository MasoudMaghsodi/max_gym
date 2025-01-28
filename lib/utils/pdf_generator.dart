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
  // تولید PDF و نمایش آن در حالت چاپ
  static Future<void> generatePDF(
      BuildContext context,
      List<WorkoutDay> workoutDays,
      String athleteName,
      Map<String, String> profileData) async {
    try {
      final pdf = pw.Document(); // ایجاد سند PDF جدید
      final font = await loadFont(); // بارگذاری فونت سفارشی
      final date = profileData['date'] ?? ''; // گرفتن تاریخ از پروفایل

      addHeaderPage(pdf, font, athleteName, profileData,
          date); // اضافه کردن اطلاعات پروفایل و تاریخ

      for (var day in workoutDays) {
        if (!day.isRestDay) {
          addWorkoutPage(pdf, font, day); // اضافه کردن صفحه تمرین برای هر روز
        }
      }

      await Printing.layoutPdf(
        onLayout: (format) => pdf.save(), // ذخیره و نمایش PDF
        name: 'برنامه_ورزشی_${_sanitizeFileName(athleteName)}',
      );
    } catch (e) {
      if (!context.mounted) return;
      showErrorDialog(context, e); // نمایش دیالوگ خطا در صورت بروز خطا
    }
  }

  // ذخیره PDF در فایل موقت
  static Future<File> savePDF(List<WorkoutDay> workoutDays, String athleteName,
      Map<String, String> profileData) async {
    final pdf = pw.Document(); // ایجاد سند PDF جدید
    final font = await loadFont(); // بارگذاری فونت سفارشی
    final date = profileData['date'] ?? ''; // گرفتن تاریخ از پروفایل

    addHeaderPage(pdf, font, athleteName, profileData,
        date); // اضافه کردن اطلاعات پروفایل و تاریخ

    for (var day in workoutDays) {
      if (!day.isRestDay) {
        addWorkoutPage(pdf, font, day); // اضافه کردن صفحه تمرین برای هر روز
      }
    }

    final dir = await getTemporaryDirectory(); // دریافت مسیر دایرکتوری موقت
    final safeFileName = _sanitizeFileName(athleteName);
    final file =
        File("${dir.path}/program_$safeFileName.pdf"); // ایجاد فایل PDF
    await file.writeAsBytes(await pdf.save()); // نوشتن و ذخیره PDF در فایل
    return file;
  }

  // پاکسازی نام فایل از کاراکترهای غیرمجاز
  static String _sanitizeFileName(String input) =>
      input.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
}
