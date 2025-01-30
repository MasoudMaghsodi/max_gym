import 'package:flutter/material.dart';
import '../models/workout_day.dart';
import '../models/exercise_category.dart';

class DayCard extends StatelessWidget {
  final WorkoutDay day;
  final List<ExerciseCategory> categories;
  final Function(ExerciseCategory) onCategoryAdded;
  final Function(ExerciseCategory) onCategoryRemoved;
  final Function(bool) onRestDayChanged;
  final VoidCallback onAddExercise;

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
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day.dayName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SwitchListTile(
              title: const Text('روز استراحت'),
              value: day.isRestDay,
              onChanged: onRestDayChanged,
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: categories.map((category) {
                return ListTile(
                  title: Text(category.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => onCategoryRemoved(category),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: onAddExercise,
              child: const Text('افزودن تمرین'),
            ),
          ],
        ),
      ),
    );
  }
}
