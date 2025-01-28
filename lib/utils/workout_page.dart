import 'package:pdf/widgets.dart' as pw;
import '../models/workout_day.dart';

void addWorkoutPage(pw.Document pdf, pw.Font font, WorkoutDay workoutDay) {
  pdf.addPage(
    pw.Page(
      textDirection: pw.TextDirection.rtl, // تنظیم جهت متن به راست به چپ
      theme: pw.ThemeData.withFont(base: font), // تنظیم فونت تم
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start, // تنظیم تراز بندی ستون
        children: [
          pw.Header(
            text:
                'برنامه تمرین: ${workoutDay.dayName}', // عنوان صفحه تمرین برای روز
            level: 1,
            textStyle: pw.TextStyle(
              font: font,
            ),
          ),
          ...workoutDay.categories.map((category) {
            return pw.Column(
              crossAxisAlignment:
                  pw.CrossAxisAlignment.start, // تنظیم تراز بندی ستون
              children: [
                pw.Text(
                  category.name, // نام دسته‌بندی تمرین
                  style: pw.TextStyle(
                    font: font,
                    fontSize: 18,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                ...category.exercises.map((exercise) {
                  return pw.Text(
                    exercise, // نام تمرین
                    style: pw.TextStyle(
                      font: font,
                      fontSize: 14,
                    ),
                  );
                  // ignore: unnecessary_to_list_in_spreads
                }).toList(),
                pw.SizedBox(height: 10),
              ],
            );
            // ignore: unnecessary_to_list_in_spreads
          }).toList(),
        ],
      ),
    ),
  );
}
