import 'package:pdf/widgets.dart' as pw;

void addHeaderPage(pw.Document pdf, pw.Font font, String athleteName,
    Map<String, String> profileData, String date) {
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
          pw.Text(
              'نام ورزشکار: ${profileData['firstName']} ${profileData['lastName']}'),
          pw.Text('سن: ${profileData['age']}'),
          pw.Text('جنسیت: ${profileData['gender']}'),
          pw.Text('قد: ${profileData['height']} سانتی‌متر'),
          pw.Text('وزن: ${profileData['weight']} کیلوگرم'),
          pw.Text('هدف کوتاه‌مدت: ${profileData['shortTermGoal']}'),
          pw.Text('هدف بلند‌مدت: ${profileData['longTermGoal']}'),
          pw.Text('یادداشت‌های مربی: ${profileData['coachNotes']}'),
          pw.SizedBox(height: 20),
          pw.Text('تاریخ: $date'), // اضافه کردن تاریخ
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
