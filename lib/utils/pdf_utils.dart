import 'package:pdf/widgets.dart' as pw;

class PdfUtils {
  static pw.Text createText(String text,
      {double fontSize = 12, pw.FontWeight fontWeight = pw.FontWeight.normal}) {
    return pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  static pw.SizedBox createSpacer(double height) {
    return pw.SizedBox(height: height);
  }

  static pw.Divider createDivider({double thickness = 1.0}) {
    return pw.Divider(thickness: thickness);
  }
}
