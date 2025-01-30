import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/workout_exercise.dart';
import '../widgets/exerciseWidgets/exercise_row.dart';
import '../providers/workout_provider.dart';
import '../models/training_technique.dart';

class ExerciseDetailScreen extends ConsumerStatefulWidget {
  final String day;

  const ExerciseDetailScreen({super.key, required this.day});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends ConsumerState<ExerciseDetailScreen> {
  List<WorkoutExercise> _exercises =
      List.generate(8, (index) => WorkoutExercise('', 0, 0));

  @override
  void initState() {
    super.initState();
    _initializePreferences();
  }

  void _initializePreferences() {
    final workoutDay =
        ref.read(workoutProvider.notifier).getWorkoutDay(widget.day);
    setState(() {
      _exercises = workoutDay.getExercisesList();
    });
  }

  void _updateExercise(int index, WorkoutExercise updatedExercise) {
    setState(() {
      _exercises[index] = updatedExercise;
    });
    ref
        .read(workoutProvider.notifier)
        .updateWorkoutExercise(widget.day, _exercises);
  }

  @override
  Widget build(BuildContext context) {
    final availableExercises = ref
        .watch(workoutProvider)
        .expand(
            (day) => day.getExercisesList().map((exercise) => exercise.name))
        .toList();

    final availableTechniques =
        trainingTechniques.map((technique) => technique.name).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('تمرینات ${widget.day}'),
        backgroundColor: Colors.blue,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: _exercises.asMap().entries.map((entry) {
            final index = entry.key;
            final exercise = entry.value;

            return ExerciseRow(
              exercise: exercise,
              availableExercises: availableExercises,
              availableTechniques: availableTechniques,
              onExerciseChanged: (updatedExercise) =>
                  _updateExercise(index, updatedExercise),
              index: index + 1,
            );
          }).toList(),
        ),
      ),
    );
  }
}
