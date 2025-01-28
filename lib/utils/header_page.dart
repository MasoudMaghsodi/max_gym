import 'package:pdf/widgets.dart' as pw;

// تابعی برای اضافه کردن صفحه اطلاعات پروفایل ورزشکار به سند PDF
void addHeaderPage(pw.Document pdf, pw.Font font, String athleteName,
    Map<String, String> profileData, String date) {
  pdf.addPage(
    pw.Page(
      textDirection: pw.TextDirection.rtl, // تنظیم جهت متن به راست به چپ
      theme: pw.ThemeData.withFont(base: font), // تنظیم فونت تم
      build: (context) => pw.Column(
        crossAxisAlignment:
            pw.CrossAxisAlignment.center, // تنظیم تراز بندی ستون
        children: [
          pw.Container(
            alignment: pw.Alignment.center, // تنظیم تراز متن به وسط
            child: pw.Header(
              text: 'MAX GYM - برنامه ورزشی', // عنوان صفحه
              level: 1,
              textStyle: pw.TextStyle(
                font: font,
              ),
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Text(
              'نام ورزشکار: ${profileData['firstName']} ${profileData['lastName']}'), // نمایش نام ورزشکار
          pw.Text('سن: ${profileData['age']}'), // نمایش سن
          pw.Text('جنسیت: ${profileData['gender']}'), // نمایش جنسیت
          pw.Text('قد: ${profileData['height']} سانتی‌متر'), // نمایش قد
          pw.Text('وزن: ${profileData['weight']} کیلوگرم'), // نمایش وزن
          pw.Text(
              'هدف کوتاه‌مدت: ${profileData['shortTermGoal']}'), // نمایش هدف کوتاه‌مدت
          pw.Text(
              'هدف بلند‌مدت: ${profileData['longTermGoal']}'), // نمایش هدف بلند‌مدت
          pw.Text(
              'یادداشت‌های مربی: ${profileData['coachNotes']}'), // نمایش یادداشت‌های مربی
          pw.SizedBox(height: 20),
          pw.Text('تاریخ: $date'), // اضافه کردن تاریخ
          pw.SizedBox(height: 20),
          pw.Text(
              'آدرس باشگاه: آذربایجان غربی - میاندوآب - خیابان ۲۴ متری - جنب فروشگاه اسنوا'), // نمایش آدرس باشگاه
          pw.SizedBox(height: 20),
          pw.Text("مربی : استاد بهزاد بهزاد فر"), // نمایش نام مربی
        ],
      ),
    ),
  );
}
