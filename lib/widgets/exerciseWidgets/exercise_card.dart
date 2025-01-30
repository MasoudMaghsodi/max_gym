import 'package:flutter/material.dart';
import '../../models/exercise_category.dart';
import '../../models/workout_day.dart';

class ExerciseCard extends StatelessWidget {
  final WorkoutDay day;
  final Map<String, String> profileData;
  final List<ExerciseCategory> categories;
  final Function(ExerciseCategory) onCategoryAdded;
  final Function(ExerciseCategory) onCategoryRemoved;
  final Function(bool) onRestDayChanged;
  final Function() onAddExercise;

  const ExerciseCard({
    required this.day,
    required this.profileData,
    required this.categories,
    required this.onCategoryAdded,
    required this.onCategoryRemoved,
    required this.onRestDayChanged,
    required this.onAddExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(day.dayName),
          // سایر ویجت‌ها و اجزا مرتبط با کارت تمرینات
        ],
      ),
    );
  }
}
