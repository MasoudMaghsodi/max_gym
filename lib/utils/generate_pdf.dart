import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/athleteModel/athlete_model.dart';
import 'package:pdf/widgets.dart' as pw;

// Function to generate a PDF file containing athlete profiles
Future<void> generatePdf(List<Athlete> athletes) async {
  try {
    // Create a new PDF document
    final pdf = pw.Document();

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "لیست ورزشکاران",
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 10), // Add spacing
            ...athletes.map((athlete) {
              return pw.Text(
                "${athlete.firstName} ${athlete.lastName} - سن: ${athlete.age} - وزن: ${athlete.weight} کیلوگرم - قد: ${athlete.height} سانتی‌متر",
                style: pw.TextStyle(fontSize: 14),
              );
            }).toList(),
          ],
        ),
      ),
    );

    // Get the external storage directory
    final outputDir = await getExternalStorageDirectory();
    if (outputDir == null) {
      throw Exception('⚠️ دایرکتوری ذخیره‌سازی در دسترس نیست');
    }

    // Define the file path
    final filePath = "${outputDir.path}/athletes.pdf";

    // Save the PDF file
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    print("PDF با موفقیت ایجاد شد: $filePath");
  } catch (e) {
    throw Exception('⚠️ خطا در ایجاد فایل PDF: ${e.toString()}');
  }
}
