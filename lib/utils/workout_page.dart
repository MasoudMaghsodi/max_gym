import 'package:pdf/widgets.dart' as pw;
import '../models/workout_day.dart';

void addWorkoutPage(pw.Document pdf, pw.Font font, WorkoutDay day) {
  pdf.addPage(
    pw.Page(
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            'تمرینات روز ${day.dayName}',
            style: pw.TextStyle(
                fontSize: 24, fontWeight: pw.FontWeight.bold, font: font),
          ),
          pw.SizedBox(height: 20),
          ...day.exercises.map((exercise) {
            return pw.Container(
              margin: const pw.EdgeInsets.only(bottom: 20),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    'تمرین اصلی: ${exercise.name}',
                    style: pw.TextStyle(
                        fontSize: 18,
                        fontWeight: pw.FontWeight.bold,
                        font: font),
                  ),
                  pw.Text('تکنیک: ${exercise.technique ?? 'ندارد'}',
                      style: pw.TextStyle(font: font)),
                  pw.Text('تعداد ست‌ها: ${exercise.sets}',
                      style: pw.TextStyle(font: font)),
                  pw.Text('تعداد تکرار‌ها: ${exercise.reps}',
                      style: pw.TextStyle(font: font)),
                  if (exercise.superSet != null)
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'سوپرست: ${exercise.superSet}',
                          style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                              font: font),
                        ),
                        pw.Text(
                            'تکنیک سوپرست: ${exercise.superSetTechnique ?? 'ندارد'}',
                            style: pw.TextStyle(font: font)),
                        pw.Text(
                            'تعداد ست‌های سوپرست: ${exercise.superSetSets ?? 0}',
                            style: pw.TextStyle(font: font)),
                        pw.Text(
                            'تعداد تکرار‌های سوپرست: ${exercise.superSetReps ?? 0}',
                            style: pw.TextStyle(font: font)),
                      ],
                    ),
                  if (exercise.triSet != null)
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(height: 10),
                        pw.Text(
                          'تریست: ${exercise.triSet}',
                          style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                              font: font),
                        ),
                        pw.Text(
                            'تکنیک تریست: ${exercise.triSetTechnique ?? 'ندارد'}',
                            style: pw.TextStyle(font: font)),
                        pw.Text(
                            'تعداد ست‌های تریست: ${exercise.triSetSets ?? 0}',
                            style: pw.TextStyle(font: font)),
                        pw.Text(
                            'تعداد تکرار‌های تریست: ${exercise.triSetReps ?? 0}',
                            style: pw.TextStyle(font: font)),
                      ],
                    ),
                ],
              ),
            );
            // ignore: unnecessary_to_list_in_spreads
          }).toList(),
        ],
      ),
    ),
  );
}
