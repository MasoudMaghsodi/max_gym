import 'package:pdf/widgets.dart' as pw;

class AddHeaderPage {
  static pw.Page createPage(String title) {
    return pw.Page(
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text(
            title,
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
          ),
        );
      },
    );
  }
}
