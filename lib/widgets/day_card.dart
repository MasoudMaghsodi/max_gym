import 'package:flutter/material.dart';
import '../models/workout_day.dart';
import '../models/exercise_category.dart';

class DayCard extends StatelessWidget {
  final WorkoutDay day;
  final List<ExerciseCategory> categories;
  final Function(ExerciseCategory) onCategoryAdded;
  final Function(ExerciseCategory) onCategoryRemoved;
  final Function(bool) onRestDayChanged;
  final Function() onAddExercise;

  const DayCard({
    required this.day,
    required this.categories,
    required this.onCategoryAdded,
    required this.onCategoryRemoved,
    required this.onRestDayChanged,
    required this.onAddExercise,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان روز هفته
            Text(
              day.dayName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),

            // متن حرکات (دسته‌بندی‌ها)
            Text(
              categories.map((e) => e.name).join(', '),
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),

            // دکمه روز تمرین/روز تعطیل
            Row(
              children: [
                Text(day.isRestDay ? 'روز تعطیل' : 'روز تمرین'),
                const SizedBox(width: 8.0),
                Switch(
                  value: !day.isRestDay,
                  onChanged: (value) {
                    onRestDayChanged(!value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8.0),

            // دکمه افزودن تمرین
            TextButton(
              onPressed: onAddExercise,
              child: const Text('افزودن تمرین'),
            ),
          ],
        ),
      ),
    );
  }
}
