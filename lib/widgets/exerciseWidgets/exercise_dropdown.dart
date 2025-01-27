import 'package:flutter/material.dart';

class ExerciseDropdown<T> extends StatelessWidget {
  final T? value;
  final String hint;
  final List<T> items;
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
      hint: Text(hint, style: const TextStyle(fontSize: 14)),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text('$item')))
          .toList(),
      onChanged: onChanged,
      isExpanded: true,
    );
  }
}
