import 'package:flutter/material.dart';

Widget profileDropdownWidget({
  required String label,
  required IconData icon,
  required List<String> items,
  Color color = Colors.black,
  bool required = false,
  required String? selectedItem,
  required Function(String?) onChanged,
}) {
  return StatefulBuilder(builder: (context, setState) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(icon, color: color),
        filled: true,
        fillColor: Colors.white.withAlpha(204), // (0.8 * 255).toInt()
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedItem,
          hint: Text(label),
          isDense: true,
          onChanged: (newValue) {
            setState(() {
              selectedItem = newValue;
            });
            onChanged(newValue);
          },
          items: items.map((value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  });
}
