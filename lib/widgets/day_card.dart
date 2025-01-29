import 'package:flutter/material.dart';
import '../../models/workout_day.dart';
import '../../models/exercise_category.dart';

class DayCard extends StatelessWidget {
  final WorkoutDay day;
  final List<ExerciseCategory> categories;
  final Function(ExerciseCategory) onCategoryAdded;
  final Function(ExerciseCategory) onCategoryRemoved;
  final Function(bool) onRestDayChanged;
  final Function() onAddExercise;

  const DayCard({
    super.key,
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
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  day.dayName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    onRestDayChanged(!day.isRestDay);
                  },
                  child: Text(day.isRestDay ? 'روز تعطیل' : 'فعال'),
                ),
              ],
            ),
            if (day.isRestDay)
              Text('امروز روز تعطیل است',
                  style: TextStyle(color: Colors.red, fontSize: 16)),
            if (!day.isRestDay)
              Wrap(
                spacing: 8,
                children: day.categories.map((category) {
                  return Chip(
                    label: Text(category.name),
                    onDeleted: () => onCategoryRemoved(category),
                  );
                }).toList(),
              ),
            if (!day.isRestDay)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: onAddExercise,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
