import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfGenerator {
  final pw.Document _document;

  PdfGenerator() : _document = pw.Document();

  void addHeaderPage(String title) {
    _document.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text(
              title,
              style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
            ),
          );
        },
      ),
    );
  }

  void addWorkoutPage(String dayName, List<String> exercises) {
    _document.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                dayName,
                style:
                    pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 10),
              pw.Column(
                children:
                    exercises.map((exercise) => pw.Text(exercise)).toList(),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> savePdf(String fileName) async {
    await Printing.sharePdf(bytes: await _document.save(), filename: fileName);
  }
}
