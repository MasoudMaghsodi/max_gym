import 'package:flutter/material.dart';
import '../models/exercise_category.dart';
import '../models/workout_day.dart';
import '../models/training_technique.dart';
import 'exerciseWidgets/exercise_row.dart';
import 'category_dialog.dart';

class DayCard extends StatelessWidget {
  // مدل روز تمرین شامل اطلاعات تمرینات و دسته‌بندی‌ها
  final WorkoutDay day;
  // لیست دسته‌بندی‌های تمرینات
  final List<ExerciseCategory> categories;
  // تابعی برای اضافه کردن دسته‌بندی جدید
  final Function(ExerciseCategory) onCategoryAdded;
  // تابعی برای حذف دسته‌بندی
  final Function(ExerciseCategory) onCategoryRemoved;
  // تابعی برای تغییر وضعیت روز استراحت
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
    // دریافت لیست تکنیک‌های تمرینی از مدل‌ها
    final List<String> techniques =
        trainingTechniques.map((technique) => technique.name).toList();

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // نمایش نام روز و وضعیت روز استراحت
            ListTile(
              title: Text(
                day.dayName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Switch(
                value: day.isRestDay,
                onChanged: onRestDayChanged,
              ),
            ),
            // اگر روز استراحت نباشد، نمایش دسته‌بندی‌ها و تمرینات
            if (!day.isRestDay) ...[
              Wrap(
                spacing: 8,
                children: [
                  ...day.categories.map(
                    (cat) => Chip(
                      label: Text(cat.name),
                      onDeleted: () => onCategoryRemoved(cat),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
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
              // نمایش تمرینات و تکنیک‌های تمرینی
              ...List.generate(
                8,
                (index) => ExerciseRow(
                  exercise: day.exercises[index],
                  availableExercises:
                      day.categories.expand((cat) => cat.exercises).toList(),
                  availableTechniques: techniques,
                  onExerciseChanged: (exercise) {
                    day.exercises[index] = exercise;
                  },
                  index: index + 1, // اضافه کردن شماره تمرین که از ۱ شروع شود
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
