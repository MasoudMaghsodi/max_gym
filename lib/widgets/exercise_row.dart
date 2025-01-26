import 'package:flutter/material.dart';
import '../models/workout_exercise.dart';

class ExerciseRow extends StatefulWidget {
  final WorkoutExercise exercise;
  final List<String> availableExercises;
  final Function(WorkoutExercise) onExerciseChanged;

  const ExerciseRow({
    super.key,
    required this.exercise,
    required this.availableExercises,
    required this.onExerciseChanged,
  });

  @override
  State<ExerciseRow> createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<ExerciseRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildDropdown<String>(
              value:
                  widget.exercise.name.isNotEmpty ? widget.exercise.name : null,
              hint: 'انتخاب تمرین',
              items: widget.availableExercises,
              onChanged: (value) {
                setState(() {
                  widget.exercise.name = value!;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
          ),
          Expanded(
            child: _buildDropdown<int>(
              value: widget.exercise.sets > 0 ? widget.exercise.sets : null,
              hint: 'ست',
              items: List.generate(10, (i) => i + 1),
              onChanged: (value) {
                setState(() {
                  widget.exercise.sets = value!;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
          ),
          Expanded(
            child: _buildDropdown<int>(
              value: widget.exercise.reps > 0 ? widget.exercise.reps : null,
              hint: 'تکرار',
              items: List.generate(15, (i) => (i + 1) * 2),
              onChanged: (value) {
                setState(() {
                  widget.exercise.reps = value!;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
          ),
          Checkbox(
            value: widget.exercise.isSuperset,
            onChanged: (value) {
              setState(() {
                widget.exercise.isSuperset = value!;
                widget.onExerciseChanged(widget.exercise);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>({
    required T? value,
    required String hint,
    required List<T> items,
    required void Function(T?) onChanged,
  }) {
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
