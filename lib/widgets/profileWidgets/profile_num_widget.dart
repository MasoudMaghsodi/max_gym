import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget profileNumWidget({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  Color? iconColor, // تغییر نام پارامتر به iconColor
  bool required = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      prefixIcon: Icon(icon, color: iconColor), // استفاده از iconColor
      filled: true,
      fillColor: Colors.white.withAlpha(204), // (0.8 * 255).toInt()
    ),
    keyboardType: TextInputType.number,
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly,
    ],
    validator: required
        ? (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً $label خود را وارد کنید';
            }
            if (!RegExp(r'^\d+$').hasMatch(value)) {
              return 'لطفاً فقط عدد وارد کنید';
            }
            return null;
          }
        : null,
  );
}
