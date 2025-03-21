import 'dart:io';
import 'package:flutter/services.dart';
import 'package:max_gym/data/models/athlete_model.dart';
import 'package:max_gym/data/models/workout_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PdfService {
  static Future<String> generateWorkoutPdf(
      List<WorkoutPlan> plans, Athlete athlete) async {
    final pdf = pw.Document();
    final fontData =
        await rootBundle.load('assets/fonts/Vazirmatn-Regular.ttf');
    final ttf = pw.Font.ttf(fontData);
    final logo = pw.MemoryImage(
        (await rootBundle.load('assets/images/max.png')).buffer.asUint8List());

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        textDirection: pw.TextDirection.rtl,
        header: (context) => pw.Container(
          alignment: pw.Alignment.center,
          margin: const pw.EdgeInsets.only(bottom: 20),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(logo, width: 50, height: 50),
              pw.Text('Max Gym',
                  style: pw.TextStyle(
                      font: ttf, fontSize: 20, color: PdfColors.green)),
            ],
          ),
        ),
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text(
                'برنامه تمرینی ${athlete.firstName} ${athlete.lastName}',
                style: pw.TextStyle(font: ttf, fontSize: 24)),
          ),
          // ignore: deprecated_member_use
          pw.Table.fromTextArray(
            headers: ['روز', 'نوع', 'عضلات هدف', 'تمرینات'],
            headerStyle: pw.TextStyle(
                font: ttf,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.white),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.green),
            cellStyle: pw.TextStyle(font: ttf),
            data: plans.map((plan) {
              return [
                _getDayName(plan.dayOfWeek),
                _getTypeText(plan.type),
                plan.targetMuscles.join(', '),
                plan.exerciseIds
                    .map((id) =>
                        'تمرین $id') // Placeholder, replace with actual exercise data if available
                    .join('\n'),
              ];
            }).toList(),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
              'تهیه شده توسط Max Gym - تاریخ: ${DateTime.now().toString().substring(0, 10)}',
              style: pw.TextStyle(font: ttf, fontSize: 12)),
        ],
      ),
    );

    final dir = await getExternalStorageDirectory();
    final file = File(
        '${dir?.path}/workout_${athlete.id}_${DateTime.now().millisecondsSinceEpoch}.pdf');
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }

  static String _getDayName(int day) {
    const days = [
      'شنبه',
      'یک‌شنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنج‌شنبه',
      'جمعه'
    ];
    return days[day];
  }

  static String _getTypeText(String type) {
    switch (type) {
      case 'training':
        return 'تمرین';
      case 'rest':
        return 'استراحت';
      case 'off':
        return 'تعطیل';
      default:
        return 'نامشخص';
    }
  }
}
