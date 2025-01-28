import 'package:flutter/material.dart';
import '../models/exercise_category.dart';

class CategoryDialog extends StatelessWidget {
  // لیست دسته‌بندی‌های تمرینات
  final List<ExerciseCategory> categories;
  // تابعی که دسته‌بندی انتخاب شده را پردازش می‌کند
  final Function(ExerciseCategory) onCategorySelected;

  const CategoryDialog({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("انتخاب دسته‌بندی"), // عنوان دیالوگ
      content: SingleChildScrollView(
        child: Column(
          children: categories
              .map((cat) => ListTile(
                    title: Text(cat.name), // نمایش نام دسته‌بندی
                    onTap: () {
                      onCategorySelected(cat); // فراخوانی تابع انتخاب دسته‌بندی
                      Navigator.pop(context); // بستن دیالوگ
                    },
                  ))
              .toList(), // تبدیل لیست دسته‌بندی‌ها به ویجت‌های ListTile
        ),
      ),
    );
  }
}
