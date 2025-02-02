import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileNumWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Color? iconColor;
  final bool required;
  final String? Function(String?)? validator;

  const ProfileNumWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    this.iconColor,
    this.required = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(icon, color: iconColor),
          filled: true,
          fillColor: Colors.white.withAlpha(204),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          if (required && (value == null || value.isEmpty)) {
            return 'لطفاً $label خود را وارد کنید';
          }
          if (!RegExp(r'^\d+$').hasMatch(value!)) {
            return 'لطفاً فقط عدد وارد کنید';
          }
          return null;
        },
      ),
    );
  }
}
