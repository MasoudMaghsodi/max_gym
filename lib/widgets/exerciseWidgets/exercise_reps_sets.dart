import 'package:flutter/material.dart';
import 'exercise_dropdown.dart';

class ExerciseRepsSets extends StatelessWidget {
  final String hint;
  final int? value;
  final int count;
  final int increment;
  final void Function(int?) onChanged;

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
    return ExerciseDropdown<int>(
      value: value,
      hint: hint,
      items: List.generate(count, (i) => (i + 1) * increment),
      onChanged: onChanged,
    );
  }
}
