import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget profileTextFieldWidgeet({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  int maxLines = 1,
  bool required = false,
  required Color iconColor, // استفاده از iconColor به جای color
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
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'[ا-ی\s]')),
    ],
    keyboardType: TextInputType.multiline,
    maxLines: maxLines,
    validator: required
        ? (value) {
            if (value == null || value.isEmpty) {
              return 'لطفاً $label خود را وارد کنید';
            }
            if (!RegExp(r'^[ا-ی\s]+$').hasMatch(value)) {
              return 'لطفاً فقط حروف فارسی وارد کنید';
            }
            return null;
          }
        : null,
  );
}
