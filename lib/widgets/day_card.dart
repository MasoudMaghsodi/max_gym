import 'package:flutter/material.dart';
import '../models/exercise_category.dart';
import '../models/workout_day.dart';
import 'exercise_row.dart';
import 'category_dialog.dart';

class DayCard extends StatelessWidget {
  final WorkoutDay day;
  final List<ExerciseCategory> categories;
  final Function(ExerciseCategory) onCategoryAdded;
  final Function(ExerciseCategory) onCategoryRemoved;
  final Function(bool) onRestDayChanged;

  const DayCard({
    super.key,
    required this.day,
    required this.categories,
    required this.onCategoryAdded,
    required this.onCategoryRemoved,
    required this.onRestDayChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(day.dayName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Switch(
                value: day.isRestDay,
                onChanged: onRestDayChanged,
              ),
            ),
            if (!day.isRestDay) ...[
              Wrap(
                spacing: 8,
                children: [
                  ...day.categories.map((cat) => Chip(
                        label: Text(cat.name),
                        onDeleted: () => onCategoryRemoved(cat),
                      )),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => CategoryDialog(
                        categories: categories
                            .where((c) => !day.categories.contains(c))
                            .toList(),
                        onCategorySelected: onCategoryAdded,
                      ),
                    ),
                  ),
                ],
              ),
              ...List.generate(
                  8,
                  (index) => ExerciseRow(
                        exercise: day.exercises[index],
                        availableExercises: day.categories
                            .expand((cat) => cat.exercises)
                            .toList(),
                        onExerciseChanged: (exercise) {
                          day.exercises[index] = exercise;
                        },
                      )),
            ],
          ],
        ),
      ),
    );
  }
}
