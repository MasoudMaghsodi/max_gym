import 'package:flutter/material.dart';
import 'package:max_gym/data/models/workout_model.dart'; // استفاده از پیشوند model

class WorkoutCard extends StatelessWidget {
  final WorkoutPlan workout; // استفاده از پیشوند model برای مدل

  const WorkoutCard({required this.workout, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ExpansionTile(
        title: Text(workout.day),
        subtitle: Text('تعداد تمرینات: ${workout.exercises.length}'),
        children: workout.exercises
            .map((exercise) => _buildExerciseCard(exercise))
            .toList(),
      ),
    );
  }

  Widget _buildExerciseCard(WorkoutExercise exercise) {
    return ListTile(
      title: Text(exercise.exerciseName ?? ''),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (exercise.sets != null) Text('ست‌ها: ${exercise.sets}'),
          if (exercise.reps != null) Text('تکرارها: ${exercise.reps}'),
          if (exercise.technique != null) Text('تکنیک: ${exercise.technique}'),
        ],
      ),
    );
  }
}
