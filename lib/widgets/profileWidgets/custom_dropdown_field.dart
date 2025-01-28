import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  // برچسب فیلد کشویی
  final String label;
  // کلید فیلد کشویی برای شناسایی منحصر به فرد
  final String fieldKey;
  // مقدار اولیه فیلد کشویی
  final String initialValue;
  // گزینه‌های موجود در فیلد کشویی
  final List<String> options;
  // آیکون فیلد کشویی
  final IconData icon;
  // تابعی که مقدار انتخاب شده را ذخیره می‌کند
  final Function(String) onSaved;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.fieldKey,
    required this.initialValue,
    required this.options,
    required this.icon,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // فاصله عمودی بین فیلدها
      child: DropdownButtonFormField<String>(
        value: initialValue.isEmpty ? null : initialValue,
        decoration: InputDecoration(
          labelText: label, // تنظیم برچسب فیلد
          border: const OutlineInputBorder(), // تنظیم حاشیه فیلد
          prefixIcon: Icon(icon), // تنظیم آیکون فیلد
        ),
        items: options.map((option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option), // نمایش متن گزینه‌ها
          );
        }).toList(), // تبدیل لیست گزینه‌ها به DropdownMenuItem
        // اعتبارسنجی مقدار انتخاب شده
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'لطفاً $label را انتخاب کنید';
          }
          return null;
        },
        onChanged: (value) {
          // انجام هیچ کاری در تغییر مقدار انتخاب شده
        },
        // ذخیره مقدار انتخاب شده
        onSaved: (value) {
          onSaved(value!);
        },
      ),
    );
  }
}
