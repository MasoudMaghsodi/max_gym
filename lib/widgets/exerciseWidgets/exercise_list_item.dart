import 'package:flutter/material.dart';

class ExerciseListItem extends StatelessWidget {
  // نام تمرین
  final String exercise;
  // تابعی برای حذف تمرین
  final VoidCallback onDelete;

  const ExerciseListItem({
    super.key,
    required this.exercise,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(
          vertical: 4.0, horizontal: 8.0), // فاصله عمودی و افقی بین آیتم‌ها
      child: ListTile(
        title: Text(
          exercise,
          style: const TextStyle(fontSize: 16.0), // تنظیم اندازه فونت
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red), // تنظیم آیکون حذف
          onPressed: onDelete, // فراخوانی تابع حذف
          tooltip: 'حذف تمرین', // توضیح ابزار
        ),
      ),
    );
  }
}
