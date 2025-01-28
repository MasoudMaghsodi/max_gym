import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  // برچسب فیلد ورودی
  final String label;
  // کلید فیلد ورودی برای شناسایی منحصر به فرد
  final String fieldKey;
  // نوع ورودی فیلد (مثلاً متن، عدد و غیره)
  final TextInputType keyboardType;
  // فیلترهای ورودی برای محدود کردن نوع کاراکترها
  final List<TextInputFormatter>? inputFormatters;
  // حداکثر خطوط ورودی فیلد
  final int maxLines;
  // مقدار اولیه فیلد
  final String initialValue;
  // آیکون فیلد ورودی
  final IconData icon;
  // تابعی که مقدار وارد شده را ذخیره می‌کند
  final Function(String) onSaved;

  const CustomTextField({
    super.key,
    required this.label,
    required this.fieldKey,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.maxLines = 1,
    required this.initialValue,
    required this.icon,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // فاصله عمودی بین فیلدها
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label, // تنظیم برچسب فیلد
          border: const OutlineInputBorder(), // تنظیم حاشیه فیلد
          prefixIcon: Icon(icon), // تنظیم آیکون فیلد
        ),
        keyboardType: keyboardType, // نوع ورودی فیلد
        inputFormatters: inputFormatters, // فیلترهای ورودی
        maxLines: maxLines, // حداکثر خطوط ورودی
        // اعتبارسنجی مقدار ورودی
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'لطفاً $label را وارد کنید';
          }
          return null;
        },
        // ذخیره مقدار ورودی
        onSaved: (value) {
          onSaved(value!);
        },
      ),
    );
  }
}
