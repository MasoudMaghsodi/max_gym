import 'package:flutter/material.dart';

class ExerciseSectionTitle extends StatelessWidget {
  // عنوان بخش تمرین
  final String title;

  const ExerciseSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // فاصله عمودی بین بخش‌ها
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold, // ضخیم کردن فونت
            ),
      ),
    );
  }
}
