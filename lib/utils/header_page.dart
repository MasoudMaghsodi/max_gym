import 'package:pdf/widgets.dart' as pw;

void addHeaderPage(pw.Document pdf, pw.Font font, String athleteName) {
  pdf.addPage(
    pw.Page(
      textDirection: pw.TextDirection.rtl,
      theme: pw.ThemeData.withFont(base: font),
      build: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Container(
            alignment: pw.Alignment.center,
            child: pw.Header(
              text: 'MAX GYM - برنامه ورزشی',
              level: 1,
              textStyle: pw.TextStyle(
                font: font,
              ),
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text('نام ورزشکار: $athleteName'),
          pw.SizedBox(height: 20),
          pw.Text(
              'آدرس باشگاه: آذربایجان غربی - میاندوآب - خیابان ۲۴ متری - جنب فروشگاه اسنوا'),
          pw.SizedBox(height: 20),
          pw.Text("مربی : استاد بهزاد بهزاد فر"),
        ],
      ),
    ),
  );
}
