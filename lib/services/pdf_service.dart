import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart' show rootBundle;

import '../data/models/workout_model.dart';

class PdfService {
  static Future<pw.Document> generateWorkoutPlanPdf(
      String athleteName, List<WorkoutPlan> plans) async {
    final pdf = pw.Document();

    final font = await rootBundle.load("assets/fonts/iran_sans.ttf");
    final ttf = pw.Font.ttf(font);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('برنامه تمرینی $athleteName',
                  style: pw.TextStyle(font: ttf, fontSize: 24)),
              pw.SizedBox(height: 20),
              ...plans.map((plan) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(plan.day,
                        style: pw.TextStyle(font: ttf, fontSize: 18)),
                    ...plan.exercises.map((exercise) {
                      return pw.Text(
                          '- ${exercise.exerciseName} (${exercise.sets} ست، ${exercise.reps} تکرار)',
                          style: pw.TextStyle(font: ttf, fontSize: 14));
                      // ignore: unnecessary_to_list_in_spreads
                    }).toList(),
                    pw.SizedBox(height: 10),
                  ],
                );
                // ignore: unnecessary_to_list_in_spreads
              }).toList(),
            ],
          );
        },
      ),
    );

    return pdf;
  }
}
