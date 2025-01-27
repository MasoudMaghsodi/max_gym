import 'package:pdf/widgets.dart' as pw;
import '../models/workout_day.dart';
import 'pdf_utils.dart';

void addWorkoutPage(pw.Document pdf, pw.Font font, WorkoutDay day) {
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
              2: const pw.FlexColumnWidth(),
              3: const pw.FlexColumnWidth(),
              4: const pw.FlexColumnWidth(),
              5: const pw.FlexColumnWidth(),
              6: const pw.FlexColumnWidth(),
              7: const pw.FlexColumnWidth(),
              8: const pw.FlexColumnWidth(),
            },
            children: [
              pw.TableRow(
                children: [
                  tableHeaderCell('تکنیک تمرینی تریست', font, 8),
                  tableHeaderCell('تکرار تریست', font, 8),
                  tableHeaderCell('تریست', font, 8),
                  tableHeaderCell('تکنیک تمرینی سوپرست', font, 8),
                  tableHeaderCell('تکرار سوپرست', font, 8),
                  tableHeaderCell('سوپرست', font, 8),
                  tableHeaderCell('تکنیک تمرینی', font, 8),
                  tableHeaderCell('ست/تکرار', font, 8),
                  tableHeaderCell('تمرین', font, 8),
                ],
              ),
              ...day.exercises.map(
                (exercise) => pw.TableRow(
                  children: [
                    tableCell(exercise.triSetTechnique ?? '-', font, 8),
                    tableCell(
                        exercise.triSetReps != null
                            ? exercise.triSetReps.toString()
                            : '-',
                        font,
                        8),
                    tableCell(
                        exercise.triSet?.isNotEmpty ?? false
                            ? exercise.triSet!
                            : '-',
                        font,
                        8),
                    tableCell(exercise.superSetTechnique ?? '-', font, 8),
                    tableCell(
                        exercise.superSetReps != null
                            ? exercise.superSetReps.toString()
                            : '-',
                        font,
                        8),
                    tableCell(
                        exercise.superSet?.isNotEmpty ?? false
                            ? exercise.superSet!
                            : '-',
                        font,
                        8),
                    tableCell(exercise.technique ?? '-', font, 8),
                    tableCell('${exercise.sets} x ${exercise.reps}', font, 8),
                    tableCell(exercise.name, font, 8),
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
