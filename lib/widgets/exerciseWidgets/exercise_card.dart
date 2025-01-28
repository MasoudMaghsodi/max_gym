import 'package:flutter/material.dart';
import '../../screens/exercise_detail_screen.dart';

class ExerciseCard extends StatelessWidget {
  // روز تمرین
  final String day;
  // تمرینات روز
  final String exercises;

  const ExerciseCard({super.key, required this.day, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin:
          const EdgeInsets.symmetric(vertical: 8.0), // فاصله عمودی بین کارت‌ها
      child: ListTile(
        title: Text(
          day,
          style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold), // تنظیم استایل عنوان
        ),
        subtitle: Text(
          exercises.isEmpty
              ? 'تمرینی انتخاب نشده است'
              : exercises, // تنظیم توضیح تمرینات
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseDetailScreen(day: day),
            ),
          ).then((_) {
            // بازنشانی صفحه اصلی پس از بازگشت
            (context as Element)
                .reassemble(); // ignore: invalid_use_of_protected_member
          });
        },
      ),
    );
  }
}
