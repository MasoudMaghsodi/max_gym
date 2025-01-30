import 'package:flutter/material.dart';
import '../../models/workout_day.dart';

class ExerciseCard extends StatelessWidget {
  final WorkoutDay day;
  final Map<String, String> profileData;

  const ExerciseCard({
    super.key,
    required this.day,
    required this.profileData,
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
            Text('تعداد تمرینات: ${day.exercises.length}'),
            // سایر نمایش داده‌ها و ویجت‌ها
          ],
        ),
      ),
    );
  }
}
