import 'package:flutter/material.dart';
import 'exercise_dropdown.dart';

class ExerciseRepsSets extends StatelessWidget {
  // توضیح فیلد کشویی
  final String hint;
  // مقدار اولیه فیلد کشویی
  final int? value;
  // تعداد گزینه‌ها در فیلد کشویی
  final int count;
  // افزایش گزینه‌ها در فیلد کشویی
  final int increment;
  // تابعی که مقدار انتخاب شده را ذخیره می‌کند
  final void Function(int?) onChanged;

  const ExerciseRepsSets({
    super.key,
    required this.hint,
    required this.value,
    required this.count,
    required this.increment,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ExerciseDropdown<int>(
      value: value,
      hint: hint, // تنظیم توضیح فیلد کشویی
      items: List.generate(
          count, (i) => (i + 1) * increment), // تولید لیست گزینه‌ها
      onChanged: onChanged, // ذخیره مقدار انتخاب شده
    );
  }
}
