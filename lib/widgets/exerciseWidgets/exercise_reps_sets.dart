import 'package:flutter/material.dart';

class ExerciseRepsSets extends StatelessWidget {
  final String hint;
  final int? value;
  final int count;
  final int increment;
  final ValueChanged<int?> onChanged;
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
    return DropdownButtonFormField<int>(
      value: value,
      hint: Text(hint),
      items: List.generate(count, (index) {
        final itemValue = (index + 1) * increment;
        return DropdownMenuItem<int>(
          value: itemValue,
          child: Text('$itemValue'),
        );
      }).toList(),
      onChanged: onChanged,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }
}
