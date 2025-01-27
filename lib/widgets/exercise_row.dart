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
  _ExerciseRowState createState() => _ExerciseRowState();
}

class _ExerciseRowState extends State<ExerciseRow> {
  String? selectedExercise;
  String? optionalExercise;
  int? selectedSets;
  int? selectedReps;

  @override
  void initState() {
    super.initState();
    selectedExercise =
        widget.exercise.name.isNotEmpty ? widget.exercise.name : null;
    selectedSets = widget.exercise.sets > 0 ? widget.exercise.sets : null;
    selectedReps = widget.exercise.reps > 0 ? widget.exercise.reps : null;
    optionalExercise = widget.exercise.superSet?.isNotEmpty ?? false
        ? widget.exercise.superSet
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildDropdown<String>(
              value: selectedExercise,
              hint: 'انتخاب تمرین',
              items: widget.availableExercises,
              onChanged: (value) {
                setState(() {
                  selectedExercise = value;
                  widget.exercise.name = value!;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: _buildDropdown<String>(
              value: optionalExercise,
              hint: 'سوپرست',
              items: widget.availableExercises,
              onChanged: (value) {
                setState(() {
                  optionalExercise = value;
                  widget.exercise.superSet = value;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
          ),
          Expanded(
            child: _buildDropdown<int>(
              value: selectedSets,
              hint: 'ست',
              items: List.generate(10, (i) => i + 1),
              onChanged: (value) {
                setState(() {
                  selectedSets = value;
                  widget.exercise.sets = value!;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
          ),
          Expanded(
            child: _buildDropdown<int>(
              value: selectedReps,
              hint: 'تکرار',
              items: List.generate(15, (i) => (i + 1) * 2),
              onChanged: (value) {
                setState(() {
                  selectedReps = value;
                  widget.exercise.reps = value!;
                  widget.onExerciseChanged(widget.exercise);
                });
              },
            ),
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
