import 'package:flutter/material.dart';

class ExerciseDropdown<T> extends StatelessWidget {
  // مقدار انتخاب شده فعلی در فیلد کشویی
  final T? value;
  // توضیح فیلد کشویی
  final String hint;
  // لیست گزینه‌های موجود در فیلد کشویی
  final List<T> items;
  // تابعی که مقدار انتخاب شده را ذخیره می‌کند
  final void Function(T?) onChanged;

  const ExerciseDropdown({
    super.key,
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: value,
      hint: Text(hint,
          style: const TextStyle(fontSize: 14)), // تنظیم توضیح فیلد کشویی
      items: items
          .map((item) => DropdownMenuItem(
              value: item,
              child: Text('$item'))) // تبدیل لیست گزینه‌ها به DropdownMenuItem
          .toList(),
      onChanged: onChanged, // ذخیره مقدار انتخاب شده
      isExpanded: true, // تنظیم فیلد کشویی به حالت گسترده
    );
  }
}
