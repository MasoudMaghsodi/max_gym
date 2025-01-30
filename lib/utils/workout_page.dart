import 'package:pdf/widgets.dart' as pw;

class AddWorkoutPage {
  static pw.Page createPage(String dayName, List<String> exercises) {
    return pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              dayName,
              style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
            ),
            pw.SizedBox(height: 10),
            pw.Column(
              children: exercises.map((exercise) => pw.Text(exercise)).toList(),
            ),
          ],
        );
      },
    );
  }
}
