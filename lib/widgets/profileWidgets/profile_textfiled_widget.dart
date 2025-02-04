import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final Color iconColor;
  final int maxLines;
  final bool isRequired;
  final String? Function(String?)? customValidator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final String requiredErrorText;
  final String patternErrorText;

  const ProfileTextFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.iconColor,
    this.maxLines = 1,
    this.isRequired = false,
    this.customValidator,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.requiredErrorText = 'لطفاً این فیلد را پر کنید',
    this.patternErrorText = 'فقط حروف فارسی مجاز است',
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: iconColor, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            prefixIcon: Icon(icon, color: iconColor),
            filled: true,
            fillColor: Colors.white.withAlpha(204),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          ),
          inputFormatters: inputFormatters ??
              [
                FilteringTextInputFormatter.allow(
                  RegExp(
                      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF\s]'),
                ),
              ],
          keyboardType: maxLines > 1 ? TextInputType.multiline : keyboardType,
          maxLines: maxLines,
          textInputAction:
              maxLines > 1 ? TextInputAction.newline : TextInputAction.next,
          validator: (value) {
            if (customValidator != null) {
              return customValidator!(value);
            }
            if (isRequired && (value == null || value.isEmpty)) {
              return requiredErrorText;
            }
            if (value != null &&
                value.isNotEmpty &&
                !RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(value)) {
              return patternErrorText;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
    );
  }
}
