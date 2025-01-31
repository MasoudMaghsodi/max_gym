import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../model/athleteModel/athlete_model.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> generatePdf(List<Athlete> athletes) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Column(
        children: athletes.map((athlete) {
          return pw.Text(
              "${athlete.firstName} ${athlete.lastName} - سن: ${athlete.age}");
        }).toList(),
      ),
    ),
  );

  final output = await getExternalStorageDirectory();
  final file = File("${output!.path}/athletes.pdf");
  await file.writeAsBytes(await pdf.save());
}
